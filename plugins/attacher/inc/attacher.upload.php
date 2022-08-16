<?php
/**
 * Attacher plugin: upload files
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL');

header('Pragma: no-cache');
header('Cache-Control: no-store, no-cache, must-revalidate');
header('Content-Disposition: inline; filename="files.json"');
header('X-Content-Type-Options: nosniff');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: OPTIONS, HEAD, GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: X-File-Name, X-File-Type, X-File-Size');

$area = cot_import('area', 'R', 'ALP');
$item = cot_import('item', 'R', 'INT');
$field = (string)cot_import('field', 'R', 'TXT');
$filename = cot_import('filename', 'R', 'TXT');

if (!is_null($filename)) {
    $filename = mb_basename(stripslashes($filename));
}

switch ($_SERVER['REQUEST_METHOD']) {
    case 'OPTIONS':
        break;
    case 'HEAD':
    case 'GET':
        header('Content-type: application/json');
        echo json_encode(att_ajax_get($area, $item, $field, $filename));
        break;
    case 'PATCH':
    case 'PUT':
    case 'POST':
        if (isset($_REQUEST['_method']) && $_REQUEST['_method'] === 'DELETE') {
            // Attachment removal for servers not supporting DELETE
            $id = cot_import('id', 'R', 'INT');
            header('Content-type: application/json');
            if ($id > 0) {
                echo json_encode(array('success' => (bool) att_remove($id)));
            } else {
                echo json_encode(array('success' => false));
            }
        } else {
            echo att_ajax_post();
        }
        break;
    default:
        header('HTTP/1.1 405 Method Not Allowed');
}

/**
 * Fetches AJAX data for a given file or all files attached
 *
 * @param  string $area Target module/plugin code
 * @param  int $item Target item id
 * @param string $field if item has several attach fields
 * @param  string $filename Name of the original file
 * @return array             Data for JSON response
 */
function att_ajax_get($area, $item, $field = '', $filename = null)
{
    global $db, $cfg, $db, $db_attacher, $sys, $usr;

    if ($item == 0) {
        $unikey = cot_import('unikey', 'G', 'TXT');
        $whereUserId = "AND att_user = {$usr['id']}";

        if ($unikey) {
            $db->update($db_attacher, array("att_unikey" => $unikey), "att_item = 0 AND att_user={$usr['id']}");
        }
    }

    if (is_null($filename) || empty($filename)) {
        $multi = true;
        $res = $db->query(
            "SELECT * FROM $db_attacher
			WHERE att_area = ? AND att_item = ? AND att_field = ? $whereUserId ORDER BY att_order",
            array($area, (int)$item, $field)
        );
    } else {
        $multi = false;
        $res = $db->query(
            "SELECT * FROM $db_attacher
			WHERE att_area = ? AND att_item = ? AND att_field = ? AND att_filename = ? $whereUserId LIMIT 1",
            array($area, (int)$item, $field, $filename)
        );
    }

    if ($res->rowCount() == 0) {
        return null;
    }

    $files = array();

    /* === Hook - Part1 : Set === */
    $extp = cot_getextplugins('attacher.upload.row');
    /* ===== */

    foreach ($res->fetchAll() as $row) {
        $file = array(
            'id'          => $row['att_id'],
            'name'        => $row['att_filename'],
            'size'        => (int) $row['att_size'],
            'url'         => $cfg['mainurl'] . '/' . att_path($area, $item, $row['att_id'], $row['att_ext']),
            'deleteType' => 'POST',
            'deleteUrl'  => $cfg['mainurl'] . '/index.php?r=attacher&a=upload&id='.$row['att_id'].'&_method=DELETE&x='.$sys['xk'],
            'title'       => htmlspecialchars($row['att_title']),
            'lastmod'     => $row['att_lastmod'],
            'isImage'     => $row['att_img'],
            'shortname'   => cot::$cfg['plugin']['attacher']['prefix'].$row['att_id'].'.'.$row['att_ext']
        );

        if ($row['att_img']) {
            $file['thumbnailUrl'] = $cfg['mainurl'] . '/' . att_thumb($row['att_id']) . '?lastmod=' . $row['att_lastmod'];
            $file['thumbnail'] = $cfg['mainurl'] . '/' . att_thumb($row['att_id']);

            $file['thumbnailBigUrl'] = $cfg['mainurl'] . '/' . att_thumb($row['att_id'], $cfg['plugin']['attacher']['thumb_big_width'], $cfg['plugin']['attacher']['thumb_big_height'], $cfg['plugin']['attacher']['thumb_big_framing']) . '?lastmod=' . $row['att_lastmod'];
            $file['thumbnailBig'] = $cfg['mainurl'] . '/' . att_thumb($row['att_id'], $cfg['plugin']['attacher']['thumb_big_width'], $cfg['plugin']['attacher']['thumb_big_height'], $cfg['plugin']['attacher']['thumb_big_framing']);
        } else {
            $file['thumbnailUrl'] = $cfg['mainurl'] . '/' . att_icon(att_get_ext($row['att_filename']));
            $file['thumbnailBigUrl'] = $cfg['mainurl'] . '/' . att_icon(att_get_ext($row['att_filename']));
            $file['downloadUrl'] = $cfg['mainurl'] . '/index.php?r=attacher&a=dl&id=' . $row['att_id'];
        }

        /* === Hook - Part2 : Include === */
        foreach ($extp as $pl) {
            include $pl;
        }
        /* ===== */

        if (!$multi) {
            return $file;
        } else {
            $files[] = $file;
        }
    }

    return array('files' => $files);
}

/**
 * Handles POST file uploads.
 *
 * @return string         JSON response
 */
function att_ajax_post()
{
    $param_name = 'files';
    $upload = isset($param_name) ? $_FILES[$param_name] : null;

    // Parse the Content-Disposition header, if available:
    $file_name = get_server_var('HTTP_CONTENT_DISPOSITION') ?
        rawurldecode(preg_replace(
            '/(^[^"]+")|("$)/',
            '',
            get_server_var('HTTP_CONTENT_DISPOSITION')
        )) : null;
    // Parse the Content-Range header, which has the following form:
    // Content-Range: bytes 0-524287/2000000
    $content_range = get_server_var('HTTP_CONTENT_RANGE') ?
        preg_split('/[^0-9]+/', get_server_var('HTTP_CONTENT_RANGE')) : null;
    $size =  $content_range ? $content_range[3] : null;
    $info = array();
    if ($upload && is_array($upload['tmp_name'])) {
        // param_name is an array identifier like "files[]",
        // $_FILES is a multi-dimensional array:
        foreach (array_keys($upload['tmp_name']) as $index) {
            $info[] = att_ajax_handle_file_upload(
                $upload['tmp_name'][$index],
                $file_name ? $file_name : $upload['name'][$index],
                $size ? $size : $upload['size'][$index],
                $upload['type'][$index],
                $upload['error'][$index],
                $index,
                $content_range
            );
        }
    } else {
        // param_name is a single object identifier like "file",
        // $_FILES is a one-dimensional array:
        $info[] = att_ajax_handle_file_upload(
            isset($upload['tmp_name']) ? $upload['tmp_name'] : null,
            $file_name ? $file_name : (isset($upload['name']) ?
                $upload['name'] : null),
            $size ? $size : (isset($upload['size']) ?
                $upload['size'] : get_server_var('CONTENT_LENGTH')),
            isset($upload['type']) ?
                $upload['type'] : get_server_var('CONTENT_TYPE'),
            isset($upload['error']) ? $upload['error'] : null,
            null,
            $content_range
        );
    }
    header('Vary: Accept');
    $json = json_encode(array('files' => $info));
    $redirect = isset($_REQUEST['redirect']) ?
        stripslashes($_REQUEST['redirect']) : null;
    if ($redirect) {
        header('Location: '.sprintf($redirect, rawurlencode($json)));
        return;
    }
    if (isset($_SERVER['HTTP_ACCEPT']) &&
        (strpos($_SERVER['HTTP_ACCEPT'], 'application/json') !== false)) {
        header('Content-type: application/json');
    } else {
        header('Content-type: text/plain');
    }
    return $json;
}

/**
 * AJAX upload handler
 *
 * @return string
 */
function att_ajax_handle_file_upload(
    $uploaded_file,
    $name,
    $size,
    $type,
    $error,
    $index = null,
    $content_range = null
) {
    global $db, $area, $item, $field, $cfg, $db, $db_attacher, $usr, $L, $sys;

    $file = new stdClass();
    $file->name = trim(mb_basename(stripslashes($name)));
    $file->size = fix_integer_overflow(intval($size));
    $file->type = $type;
    $file->lastmod = date('Y-m-d H:i:s', cot::$sys['now']);

    if (att_ajax_validate($uploaded_file, $file, $error, $index)) {
        // Handle form data, e.g. $_REQUEST['description'][$index]
        //$this->handle_form_data($file, $index);

        // First create a database entry because we need an ID for filename
        $file_ext = att_get_ext($file->name);
        $is_img = (int)in_array($file_ext, array('gif', 'jpg', 'jpeg', 'png'));

        $append_file = $content_range && is_file($uploaded_file) &&
            $file->size > filesize($uploaded_file);

        // todo get a unique file name, leaving the original only for loading chunks
        $file_path = $cfg['plugin']['attacher']['folder'] . '/' . $area . '/' . $item . '/'.$file->name;

        $dir_path = dirname($file_path);
        if (!file_exists($dir_path)) {
            mkdir($dir_path, $cfg['dir_perms'], true);
        }

        clearstatcache();

        if ($uploaded_file && is_uploaded_file($uploaded_file)) {
            // multipart/formdata uploads (POST method uploads)
            if ($append_file) {
                file_put_contents(
                    $file_path,
                    fopen($uploaded_file, 'r'),
                    FILE_APPEND
                );
            } else {
                move_uploaded_file($uploaded_file, $file_path);
            }
        } else {
            // Non-multipart uploads (PUT method support)
            file_put_contents(
                $file_path,
                fopen('php://input', 'r'),
                $append_file ? FILE_APPEND : 0
            );
        }

        $file_size = filesize($file_path);

        if ($file_size === $file->size) {

// Check the image size and try to calculate the necessary volume of operatives
            // Since the file can be received not only via POST, but also via PUT, we do it here.

            if ($is_img) {
                if (!cot_img_check_memory($file_path)) {
                    @unlink($file_path);
                    $file->error = $L['att_err_toobig'];
                    return $file;
                }
            }

            // Add to base
            // First, save the file and put it in a folder, then add it to the database if the download is complete
            $order = ((int)$db->query(
                "SELECT MAX(att_order) FROM $db_attacher WHERE att_area = ? AND att_item = ?",
                    array($area, $item)
            )->fetchColumn()) + 1;

            if ($item == 0) {
                $unikey = cot_import('unikey', 'G', 'TXT');
                //if($unikey) $uni = array('att_unikey' => $unikey);
            }
            $affected = $db->insert($db_attacher, array(
                'att_user'     => $usr['id'],
                'att_area'     => $area,
                'att_item'     => $item,
                'att_field'    => $field,
                'att_path'     => '',
                'att_filename' => $file->name,
                'att_ext'      => $file_ext,
                'att_img'      => $is_img,
                'att_size'     => $file->size,
                'att_title'    => '',
                'att_count'    => 0,
                'att_order'    => $order,
                'att_lastmod'  => $file->lastmod,
                'att_unikey'  => $unikey,
            ));

            if ($affected != 1) {
                @unlink($file_path);
                $file->error = $L['att_err_db'];
                return $file;
            }

            $id = $db->lastInsertId();
            $tmpFilePath = $file_path;
            $file_path = att_path($area, $item, $id, $file_ext);
            rename($tmpFilePath, $file_path);

            // Automatic JPG conversion feature
            if ($cfg['plugin']['attacher']['imageconvert'] && $is_img && $file_ext != 'jpg' && $file_ext != 'jpeg') {
                $input_file = $file_path;
                $output_file = att_path($area, $item, $id, 'jpg');
                if ($file_ext == 'png') {
                    $input = imagecreatefrompng($input_file);
                } else {
                    $input = imagecreatefromgif($input_file);
                }
                list($width, $height) = getimagesize($input_file);
                $output = imagecreatetruecolor($width, $height);
                $white = imagecolorallocate($output, 255, 255, 255);
                imagefilledrectangle($output, 0, 0, $width, $height, $white);
                imagecopy($output, $input, 0, 0, 0, 0, $width, $height);
                imagejpeg($output, $output_file);
                @unlink($input_file);
                imagedestroy($input);
                imagedestroy($output);
                $file_path = $output_file;
                $file_size = filesize($output_file);
                $file_ext = 'jpg';
                $file->name = pathinfo($file->name, PATHINFO_FILENAME) . '.jpg';
            }
            if ($is_img) {
                // Fix image orientation via EXIF if possible
                if (function_exists('exif_read_data')) {
                    $exif = @exif_read_data($file_path);
                    if ($exif !== false) {
                        list($width, $height) = getimagesize($file_path);
                        $size_ok = function_exists('cot_img_check_memory') ? cot_img_check_memory($file_path, (int)ceil($width * $height * 4 / 1048576)) : true;
                        if ($size_ok && isset($exif['Orientation']) && !empty($exif['Orientation']) && in_array($exif['Orientation'], array(3, 6, 8))) {
                            switch ($file_ext) {
                                case 'gif':
                                    $newimage = imagecreatefromgif($file_path);
                                    break;
                                case 'png':
                                    $newimage = imagecreatefrompng($file_path);
                                    imagealphablending($newimage, false);
                                    imagesavealpha($newimage, true);
                                    break;
                                default:
                                    $newimage = imagecreatefromjpeg($file_path);
                                    break;
                            }
                            switch ($exif['Orientation']) {
                                case 3:
                                    $newimage = imagerotate($newimage, 180, 0);
                                    break;
                                case 6:
                                    $newimage = imagerotate($newimage, -90, 0);
                                    break;
                                case 8:
                                    $newimage = imagerotate($newimage, 90, 0);
                                    break;
                            }
                            switch ($file_ext) {
                                case 'gif':
                                    imagegif($newimage, $file_path);
                                    break;
                                case 'png':
                                    imagepng($newimage, $file_path);
                                    break;
                                default:
                                    imagejpeg($newimage, $file_path, 96);
                                    break;
                            }
                        }
                    }
                }

                // Image resize
                if ($cfg['plugin']['attacher']['img_resize']) {
                    list($width_orig, $height_orig) = getimagesize($file_path);
                    if ($width_orig > $cfg['plugin']['attacher']['img_maxwidht'] || $height_orig > $cfg['plugin']['attacher']['img_maxheight']) {
                        $input_file = $file_path;
                        $tmp_file =  att_path($area, $item, $id, 'tmp.'.$file_ext);
                        att_cot_thumb(
                            $input_file,
                            $tmp_file,
                            $cfg['plugin']['attacher']['img_maxwidht'],
                            $cfg['plugin']['attacher']['img_maxheight'],
                            'auto',
                            (int)$cfg['plugin']['attacher']['quality']
                        );
                        @unlink($input_file);
                        @rename($tmp_file, $input_file);
                        $file->size = $file_size = filesize($input_file);
                    }
                }
            }

            $db->update($db_attacher, array(
                'att_path'     => $file_path,
                'att_size'     => $file_size,
                'att_ext'      => $file_ext,
                'att_filename' => $file->name,
                'att_lastmod' => $file->lastmod
            ), "att_id = $id");


            //$file['thumbnailUrl'] = $cfg['mainurl'] . '/' . att_thumb($row['att_id']) . '?lastmod=' . $row['att_lastmod'];

            $file->isImage = $is_img;
            $file->url = $cfg['mainurl'] . '/' . $file_path;
            $file->thumbnail = ($is_img) ? $cfg['mainurl'] . '/' . att_thumb($id) : $cfg['mainurl'] . '/' . att_icon($file_ext);
            $file->thumbnailUrl = ($is_img) ? $cfg['mainurl'] . '/' . att_thumb($id).'?lastmod='.$file->lastmod : $cfg['mainurl'] . '/' . att_icon($file_ext);
            $file->thumbnailBig = ($is_img) ? $cfg['mainurl'] . '/' . att_thumb($id, $cfg['plugin']['attacher']['thumb_big_width'], $cfg['plugin']['attacher']['thumb_big_height'], $cfg['plugin']['attacher']['thumb_big_framing']) : $cfg['mainurl'] . '/' . att_icon($file_ext);
            $file->thumbnailBigUrl = ($is_img) ? $cfg['mainurl'] . '/' . att_thumb($id, $cfg['plugin']['attacher']['thumb_big_width'], $cfg['plugin']['attacher']['thumb_big_height'], $cfg['plugin']['attacher']['thumb_big_framing']).'?lastmod='.$file->lastmod : $cfg['mainurl'] . '/' . att_icon($file_ext);
            $file->id = $id;
            $file->deleteUrl = $cfg['mainurl'] . '/index.php?r=attacher&a=upload&id='.$id.'&_method=DELETE&x='.$sys['xk'];
            $file->deleteType = 'POST';
            $file->shortname = cot::$cfg['plugin']['attacher']['prefix'].$id.'.'.$file_ext;
            $file->downloadUrl = $cfg['mainurl'] . '/index.php?r=attacher&a=dl&id=' . $id;

            /* === Hook === */
            foreach (cot_getextplugins('attacher.upload.after_save') as $pl) {
                include $pl;
            }
            /* ===== */
        } else {
            unlink($file_path);
            // Recover db state
            $db->delete($db_attach, "att_id = $id");
            $file->error = 'abort';
            return $file;
        }
        $file->size = $file_size;
    }
    return $file;
}

/**
 * Validates uploaded file
 */
function att_ajax_validate($uploaded_file, $file, $error)
{
    global $area, $item, $field, $L, $cfg;

    if (!cot_auth('plug', 'attacher', 'W')) {
        $file->error = $L['att_err_perms'];
        return false;
    }

    if ($error) {
        $file->error = $error;
        return false;
    }
    if (!$file->name) {
        $file->error = 'missingFileName';
        return false;
    }

    $file_ext = att_get_ext($file->name);
    if (!att_check_file($file_ext)) {
        $file->error = $L['att_err_type'];
        return false;
    }

    if ($uploaded_file && is_uploaded_file($uploaded_file)) {
        $file_size = filesize($uploaded_file);
    } else {
        $file_size = $_SERVER['CONTENT_LENGTH'];
    }

    $limits = att_get_limits();
    if ($limits['file'] && (
            $file_size > $limits['file'] ||
            $file->size > $limits['file']
    )
        ) {
        $file->error = $L['att_err_toobig'];
        return false;
    }
    if (1 &&
        $file_size < 1) {
        $file->error = 'minFileSize';
        return false;
    }

    $params = cot_import('param', 'R', 'HTM');
    if (!empty($params)) {
        $params = unserialize(base64_decode($params));
        if (!empty($params['type'])) {
            $params['type'] = json_decode($params['type']);
            $is_img = (int)in_array($file_ext, array('gif', 'jpg', 'jpeg', 'png'));
            $typeOk = false;
            if (in_array('all', $params['type'])) {
                $typeOk = true;
            } elseif (in_array('image', $params['type']) && $is_img) {
                $typeOk = true;
            }

            if (!$typeOk) {
                $file->error = $L['att_err_type'];
                return false;
            }
        }
    }
    if (!isset($params['limit'])) {
        $params['limit'] = $cfg['plugin']['attacher']['items'];
    }
    if (!isset($params['field'])) {
        $params['field'] = $field;
    }

    if ($params['limit'] > 0 && (att_count_files($area, $item, $params['field']) >= $params['limit'])) {
        $file->error = $L['att_err_count'];
        return false;
    }
    // list($img_width, $img_height) = @getimagesize($uploaded_file);
    // if (is_int($img_width)) {
    // 	if ($this->options['max_width'] && $img_width > $this->options['max_width'] ||
    // 			$this->options['max_height'] && $img_height > $this->options['max_height']) {
    // 		$file->error = 'maxResolution';
    // 		return false;
    // 	}
    // 	if ($this->options['min_width'] && $img_width < $this->options['min_width'] ||
    // 			$this->options['min_height'] && $img_height < $this->options['min_height']) {
    // 		$file->error = 'minResolution';
    // 		return false;
    // 	}
    // }
    return true;
}

// workaround for splitting basename whith beginning utf8 multibyte char
function mb_basename($filepath, $suffix = null)
{
    $splited = preg_split('/\//', rtrim($filepath, '/ '));
    return substr(basename('X' . $splited[count($splited) - 1], $suffix), 1);
}

function get_server_var($id)
{
    return isset($_SERVER[$id]) ? $_SERVER[$id] : '';
}

// Fix for overflowing signed 32 bit integers,
// works for sizes up to 2^32-1 bytes (4 GiB - 1):
function fix_integer_overflow($size)
{
    if ($size < 0) {
        $size += 2.0 * (php_INT_MAX + 1);
    }
    return $size;
}

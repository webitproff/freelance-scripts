<?php
/**
 * Attacher plugin: functions
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL');

require_once cot_langfile('attacher', 'plug');
require_once cot_incfile('attacher', 'plug', 'resources');

if (!isset($GLOBALS['db_attacher'])) {
    $GLOBALS['db_attacher'] = $GLOBALS['db_x'] . 'attacher';
}
$GLOBALS['att_item_cache'] = array();

require_once cot_incfile('uploads');
require_once './datas/extensions.php';
require_once cot_incfile('extrafields');
require_once cot_incfile('forms');

/**
 * Returns original name of a file being uploaded.
 *
 * @param  string $input Input name.
 * @return string        Original file name and extension.
 */
function att_get_filename($input)
{
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        return $_FILES[$input]['name'];
    } else {
        return $_GET[$input];
    }
}

/**
 * Returns size of a file being uploaded
 *
 * @param  string $input Input name.
 * @return integer       File size in bytes.
 */
function att_get_filesize($input)
{
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        return $_FILES[$input]['size'];
    } else {
        return (int) $_SERVER['CONTENT_LENGTH'];
    }
}

/**
 * Checks if the file has been uploaded and the size is
 * acceptable and returns the file stream if necessary.
 *
 * @param  string $input Input name (only for POST).
 * @return mixed         Uploaded file stream (for GET, PUT, etc.) or input name (only for POST).
 */
function att_get_uploaded_file($input = '')
{
    $limits = att_get_limits();
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if ($_FILES[$input]['size'] > 0 && is_uploaded_file($_FILES[$input]['tmp_name'])) {
            if ($_FILES[$input]['size'] > $limits['file']) {
                cot_error('att_err_toobig');
            }
            if ($_FILES[$input]['size'] > $limits['left']) {
                cot_error('att_err_nospace');
            }
        } else {
            cot_error('att_err_upload');
        }
        return $input;
    } else {
        $input = fopen('php://input', 'r');
        while (!feof($input)) {
            $temp .= fread($input, att_get_filesize(''));
        }
        $temp = tmpfile();
        $size = stream_copy_to_stream($input, $temp);
        fclose($input);

        if (!$size) {
            cot_error('att_err_upload');
        } else {
            if ($size > $limits['file']) {
                cot_error('att_err_toobig');
            }
            if ($size > $limits['left']) {
                cot_error('att_err_nospace');
            }
        }
        return $temp;
    }
}

/**
 * Saves an uploaded file regardless of request method.
 *
 * @param  mixed   $input A value returned by att_get_uploaded_file().
 * @param  string  $path  Target path.
 * @return boolean        true on success, false on error.
 */
function att_save_uploaded_file($input, $path)
{
    if (cot_error_found()) {
        return false;
    }
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        return move_uploaded_file($_FILES[$input]['tmp_name'], $path);
    } else {
        $target = fopen($path, 'w');
        if (!$target) {
            return false;
        }
        fseek($input, 0, SEEK_SET);
        stream_copy_to_stream($input, $target);
        fclose($target);
        return true;
    }
}

/**
 * Calculates attachment path.
 *
 * @param  string $area Module or plugin code.
 * @param  int    $item Parent item ID.
 * @param  int    $id   Attachment ID.
 * @param  string $ext  File extension. Leave it empty to auto-detect.
 * @return string      Path for the file on disk.
 */
function att_path($area, $item, $id, $ext = '')
{
    global $cfg;
    if (empty($ext)) {
        // Auto-detect extension
        $mask = $cfg['plugin']['attacher']['folder'] . '/' . $area . '/' . $item . '/'
                    . $cfg['plugin']['attacher']['prefix'] . $id . '.*';
        $files = glob($mask, GLOB_NOSORT);
        if (!$files || count($files) == 0) {
            return false;
        } else {
            return $files[0];
        }
    } else {
        return $cfg['plugin']['attacher']['folder'] . '/' . $area . '/' . $item . '/'
                    . $cfg['plugin']['attacher']['prefix'] . $id . '.' . $ext;
    }
}

/**
 * Binding previously uploaded files to the newly created object.
 *
 * @param $area
 * @param $item
 */
function att_fixNewPath($area, $item)
{
    global $db, $db_attacher, $db;
    $formId = "{$area}_0";

    $unikey = cot_import('cf_' . $formId, 'P', 'TXT');
    if (!$unikey) {
        $unikey = cot_import('cf_' . $formId, 'G', 'TXT');
        //$unikey = cot_import_buffered('cf_'.$formId, $unikey);
    }

    if ($unikey && $item > 0) {
        $res = $db->query("SELECT * FROM $db_attacher WHERE att_area = ? AND att_item = 0 AND att_unikey = ? ORDER BY att_order", array($area, $unikey));

        if ($res) {
            foreach ($res->fetchAll() as $row) {
                $oldPath = $row['att_path'];
                $newPath = att_path($area, $item, $row['att_id'], $row['att_ext']);
                $file_dir = dirname($newPath);
                if (!is_dir($file_dir)) {
                    mkdir($file_dir, cot::$cfg['dir_perms'], true);
                }
                if (!@rename($oldPath, $newPath)) {
                    cot_error('att_err_upload');

                    $db->delete($db_attacher, "att_id = ?", array((int) $row['att_id']));
                } else {
                    $db->update($db_attacher, array(
                                  'att_path' => $newPath,
                                  'att_unikey' => '',
                                  'att_item' => $item,
                                  'att_lastmod' => date('Y-m-d H:i:s', cot::$sys['now'])
                                      ), "att_id = ?", array((int) $row['att_id']));
                }
            }
        }
    }

    att_formGarbageCollect();
}

/**
 * Calculates path for attachment thumbnail.
 *.
 * @param  int    $id     Attachment ID.
 * @param  int    $width  Thumbnail width.
 * @param  int    $height Thumbnail height.
 * @param  int    $frame  Thumbnail framing mode.
 * @return string         Path for the file on disk or false file was not found.
 */
function att_thumb_path($id, $width, $height, $frame)
{
    global $cfg;
    $thumbs_folder = $cfg['plugin']['attacher']['folder'] . '/_thumbs/' . $id;
    $mask = $thumbs_folder . '/'
              . $cfg['plugin']['attacher']['prefix'] . $id
              . '-' . $width . 'x' . $height . '-' . $frame . '.*';
    $files = glob($mask, GLOB_NOSORT);
    if (!$files || count($files) == 0) {
        return false;
    } else {
        return $files[0];
    }
}

/**
 * Returns paths to all thumbnails found for a given attachment.
 *
 * @param  int    $id   Attachment ID.
 * @return array        Array of paths or false on error.
 */
function att_thumb_paths($id)
{
    global $cfg;
    $thumbs_folder = $cfg['plugin']['attacher']['folder'] . '/_thumbs/' . $id;
    $path = $thumbs_folder . '/'
              . $cfg['plugin']['attacher']['prefix'] . $id;
    return glob($path . '-*', GLOB_NOSORT);
}

/**
 * Extracts filename extension with tar (.tar.gz, tar.bz2, etc.) support.
 *
 * @param  string $filename File name.
 * @return string         File extension or false on error.
 */
function att_get_ext($filename)
{
    if (preg_match('#((\.tar)?\.\w+)$#', $filename, $m)) {
        return mb_strtolower(mb_substr($m[1], 1));
    } else {
        return false;
    }
}

/**
 * Garbage collection from unsaved forms.
 *
 * @return integer
 */

function att_formGarbageCollect()
{
    global $db, $db_attacher, $db;

    $time_ago = (int) (cot::$sys['now'] - 60 * 60 * 24);// 86400s or 24h
    if ($time_ago < 150) {
        return 0;
    }
    $cnt = 0;
    $res = $db->query("SELECT att_id FROM $db_attacher WHERE UNIX_TIMESTAMP(att_lastmod) < $time_ago AND att_unikey <> ''");
    foreach ($res->fetchAll(PDO::FETCH_COLUMN) as $att_id) {
        att_remove($att_id);
        $cnt++;
    }
    return $cnt;
}

/**
 * Gets upload space limits.
 *
 * @return array
 */
function att_get_limits()
{
    global $db, $db_attacher, $usr, $db, $cfg;

    $res = array();
    $res['file'] = $cfg['plugin']['attacher']['filesize'] > 0 ? (int) $cfg['plugin']['attacher']['filesize'] : 100000000000000000;
    $res['total'] = $cfg['plugin']['attacher']['filespace'] > 0 ? (int) $cfg['plugin']['attacher']['filespace'] : 100000000000000000;
    $res['used'] = (int) $db->query("SELECT SUM(att_size) FROM $db_attacher WHERE att_user = {$usr['id']}")->fetchColumn();
    $res['left'] = $res['total'] - $res['used'];
    return $res;
}

/**
 * Returns an icon for a given extension and size.
 *
 * @param  string  $ext  File extension.
 * @param  integer $size Icon size in pixels.
 * @return string        Path to icon.
 */
function att_icon($ext, $size = 48)
{
    global $cfg;
    if (!file_exists($cfg['plugins_dir'] . "/attacher/img/types/$size")) {
        $size = 48;
    }
    if (file_exists($cfg['plugins_dir'] . "/attacher/img/types/$size/$ext.png")) {
        return $cfg['plugins_dir'] . "/attacher/img/types/$size/$ext.png";
    } else {
        return $cfg['plugins_dir'] . "/attacher/img/types/$size/archive.png";
    }
}

/**
 * Checks if file extension is allowed for upload. Returns error message or empty string.
 * Emits error messages via cot_error().
 *
 * @param  string  $ext   File extension.
 * @return boolean        true if all checks passed, false if something was wrong.
 */
function att_check_file($ext)
{
    global $cfg;
    $valid_exts = explode(',', $cfg['plugin']['attacher']['exts']);
    $valid_exts = array_map('trim', $valid_exts);
    if (empty($ext) || !in_array($ext, $valid_exts)) {
        //cot_error('att_err_type');
        return false;
    }
    return true;
}

/**
 * Returns the number of files already attached to an item.
 *
 * @param  string $area Target module/plugin code.
 * @param  integer $item Target item id.
 * @param  string $field
 * @return integer
 */
function att_count_files($area, $item, $field = '_all_')
{
    global $db, $db, $db_attacher,$usr;

    $whereFileld = '';
    if ($field != '_all_') {
        $whereFileld = "AND att_field=" . $db->quote($field);
    }


    if ($item === 0) {
        $whereUserId = " AND att_user = {$usr['id']}";
        $whereFileld .= $whereUserId;
    }

    return $db->query("SELECT COUNT(*) FROM $db_attacher WHERE att_area = ? AND att_item = ? $whereFileld", array($area, (int) $item))->fetchColumn();
}

/**
 * Adds a new attachment to the database and disk.
 *
 * @param  string  $area      Target module/plugin code.
 * @param  int     $item      Target item id.
 * @param  string  $input     Upload field name.
 * @param  string  $title     Attachment caption.
 * @param  boolean $allow_img Mark images for use in galleries.
 * @return boolean            false on error, true on success.
 */
function att_add($area, $item, $input, $title = '', $allow_img = true)
{
    global $db, $usr, $db_attacher, $db, $sys;
    if (!cot_auth('plug', 'attacher', 'W')) {
        cot_error('att_err_perms');
        return false;
    }

    $fname = att_get_filename($input);
    $ext = att_get_ext($fname);

    $upload = att_get_uploaded_file($input);

    if (att_check_file($ext) && !cot_error_found()) {
        // This is done in 2 steps, otherwise we may run into a race condition
        $img = (int) (in_array($ext, array('gif', 'jpg', 'jpeg', 'png')) && $allow_img);

        $order = ((int) $db->query("SELECT MAX(att_order) FROM $db_attacher WHERE att_area = ? AND att_item = ?", array($area, $item))->fetchColumn()) + 1;

        $affected = $db->insert($db_attacher, array(
                'att_user' => $usr['id'],
                'att_area' => $area,
                'att_item' => $item,
                'att_path' => '',
                'att_filename' => $fname,
                'att_ext' => $ext,
                'att_img' => $img,
                'att_size' => att_get_filesize($input),
                'att_title' => $title,
                'att_count' => 0,
                'att_order' => $order,
                'att_lastmod' => $sys['now']
            ));

        if ($affected == 1) {
            $id = $db->lastInsertId();
            $path = att_path($area, $item, $id, $ext);
            if (att_save_uploaded_file($upload, $path)) {
                $db->update($db_attacher, array(
                            'att_path' => $path,
                            'att_size' => filesize($path)
                                ), "att_id = $id");
            } else {
                // Recover db state
                $db->delete($db_attacher, "att_id = $id");
                cot_error('att_err_move');
            }
        } else {
            cot_error('att_err_db');
        }
    }

    return !cot_error_found();
}

/**
 * Removes an attachment by identifier.
 *
 * @param  integer $id       Attachment ID.
 * @return boolean
 */
function att_remove($id)
{
    global $db, $cfg, $usr, $db_attacher, $db;

    $res = true;

    $sql = $db->query("SELECT * FROM $db_attacher
		WHERE att_id = ?", array((int) $id));

    if ($row = $sql->fetch()) {
        if ($row['att_user'] != $usr['id'] && !cot_auth('plug', 'attacher', 'A')) {
            return false;
        }
        $path_parts = pathinfo($row['att_path']);
        $res &= @unlink($row['att_path']);
        $fCnt = array_sum(array_map('is_file', glob($path_parts['dirname'] . '/*')));
        // Delete folder if it empty
        if ($fCnt === 0) {
            @rmdir($path_parts['dirname']);
        }
        $res &= att_remove_thumbs($row['att_id']);
        @rmdir($cfg['plugin']['attacher']['folder'] . '/_thumbs/' . $id);
        $res &= $db->delete($db_attacher, "att_id = ?", array((int) $id)) == 1;
    } else {
        return false;
    }

    return $res;
}

/**
 * Remove all attachments matching the criteria.
 *
 * @param  int    $user_id   Target user identifier.
 * @param  string $area      Target module/plugin code.
 * @param  int    $item_id   Target item identifier.
 * @return int               Number of affected entries.
 */
function att_remove_all($user_id = null, $area = null, $item_id = null)
{
    global $db_attacher, $db, $cfg;

    $count = 0;

    // Build the selection criteria
    $bits = array(
          'att_user' => (int) $user_id,
          'att_area' => (string) $area,
          'att_item' => (int) $item_id
      );
    $where = '';
    foreach ($bits as $key => $bit) {
        if (is_integer($bit) && $bit > 0 || is_string($bit) && !empty($bit)) {
            if (!empty($where)) {
                $where .= ' AND ';
            }
            $val = is_integer($bit) ? $bit : $db->quote($bit);
            $where .= "$key = $val";
        }
    }
    if (empty($where)) {
        $where = '1';
    }
    // Remove files, thumbs and db records
    $sql = $db->query("SELECT * FROM $db_attacher WHERE $where");
    $count = $sql->rowCount();
    foreach ($sql->fetchAll() as $row) {
        ///$path_parts = pathinfo($row['att_path']);
        @unlink($row['att_path']);
        ///$fCnt = array_sum(array_map('is_file', glob($path_parts['dirname'] . '/*')));
        // Delete folder if it empty
        ///if ($fCnt === 0)
        /// @rmdir($path_parts['dirname']);
        att_remove_thumbs($row['att_id']);
        @rmdir($cfg['plugin']['attacher']['folder'] . '/_thumbs/' . $row['att_id']);
        @rmdir($cfg['plugin']['attacher']['folder'] . '/' . $row['att_area'] . '/' . $row['att_item']);
    }
    @rmdir($cfg['plugin']['attacher']['folder'] . '/' . $row['att_area']);
    $db->delete($db_attacher, $where);

    return $count;
}

/**
 * Removes thumbnails matching the arguments.
 *
 * @param  string  $area Module or plugin code.
 * @param  int     $item Parent item ID.
 * @param  int     $id   Attachment ID.
 * @return boolean       true on success, false on error.
 */
function att_remove_thumbs($id)
{
    $res = true;

    $thumbPaths = att_thumb_paths($id);
    if (!empty($thumbPaths) && is_array($thumbPaths)) {
        foreach (att_thumb_paths($id) as $thumb) {
            $res &= @unlink($thumb);
        }
    }

    return $res;
}

/**
 * Recursive remove directory.
 *
 * @param $dir
 * @return bool
 */
function att_rrmdir($dir)
{
    if (empty($dir) && $dir != '0') {
        return false;
    }

    if (is_dir($dir)) {
        $objects = scandir($dir);
        foreach ($objects as $object) {
            if ($object != "." && $object != "..") {
                if (filetype($dir . "/" . $object) == "dir") {
                    att_rrmdir($dir . "/" . $object);
                } else {
                    unlink($dir . "/" . $object);
                }
            }
        }
        reset($objects);
        rmdir($dir);
    }
}

/**
 * Updates an existing attachment. Returns error message or empty string.
 *
 * @param  int     $id    Attachment ID.
 * @param  string  $input Upload field name.
 * @return boolean        true on sucess, false on error.
 */
function att_update_file($id, $input)
{
    global $db, $usr, $db_attacher, $db, $sys, $cfg;

    $fname = att_get_filename($input);
    $ext = att_get_ext($fname);

    $upload = att_get_uploaded_file($input);

    if (att_check_file($ext) && !cot_error_found()) {
        $row = $db->query("SELECT * FROM $db_attacher WHERE att_id = ?", array((int) $id))->fetch();

        if ($row['att_user'] != $usr['id'] && !cot_auth('plug', 'attacher', 'A')) {
            cot_error('att_err_perms');
            return false;
        }

        $path = $row['att_path'];

        att_remove_thumbs($row['att_id']);
        unlink($path);

        $path = att_path($row['att_area'], $row['att_item'], $row['att_id'], $ext);

        if (att_save_uploaded_file($upload, $path)) {
            $size = filesize($path);
            $img = (int) in_array($ext, array('gif', 'jpg', 'jpeg', 'png'));

            // Image resize
            if ($img && $cfg['plugin']['attacher']['img_resize']) {
                // Масштабирование
                list($width_orig, $height_orig) = getimagesize($path);
                if ($width_orig > $cfg['plugin']['attacher']['img_maxwidht'] || $height_orig > $cfg['plugin']['attacher']['img_maxheight']) {
                    $input_file = $path;
                    $tmp_file = att_path($row['att_area'], $row['att_item'], $row['att_id'], 'tmp.' . $ext);
                    att_cot_thumb($input_file, $tmp_file, $cfg['plugin']['attacher']['img_maxwidht'], $cfg['plugin']['attacher']['img_maxheight'], 'auto', (int) $cfg['plugin']['attacher']['quality']);
                    @unlink($input_file);
                    @rename($tmp_file, $input_file);
                    $size->size = $file_size = filesize($input_file);
                }
            }

            $ratt = array(
                      'att_ext' => $ext,
                      'att_img' => $img,
                      'att_filename' => $fname,
                      'att_size' => $size,
                      'att_path' => $path,
                      'att_lastmod' => date('Y-m-d H:i:s', cot::$sys['now'])
                  );
            $count = $db->update($db_attacher, $ratt, "att_id = ?", array((int) $id));
            if ($count != 1) {
                cot_error('att_err_db');
            }
        } else {
            cot_error('att_err_move');
        }
    }

    return !cot_error_found();
}

/**
 * Updates file caption only.
 *
 * @param  int     $id    Attachment ID.
 * @param  string  $title Caption.
 * @return boolean        true on sucess, false on error.
 */
function att_update_title($id, $title)
{
    global $db, $db_attacher, $usr, $db;

    $row = $db->query("SELECT * FROM $db_attacher WHERE att_id = ?", array((int) $id))->fetch();

    if ($row['att_user'] != $usr['id'] && !cot_auth('plug', 'attacher', 'A')) {
        cot_error('att_err_perms');
        return false;
    }
    if ($row['att_title'] == $title) {
        // Nothing changed is OK
        return true;
    }
    if (!empty($title)) {
        $count = $db->update($db_attacher, array(
                'att_title' => $title
                    ), "att_id = ?", array((int) $id));

        if ($count != 1) {
            cot_error('att_err_db');
        }
    } else {
        cot_error('att_err_title');
    }
    return !cot_error_found();
}

/**
 * Increments a hit counter.
 *
 * @param int $id Attachment ID.
 */
function att_inc_count($id)
{
    global $db, $db_attacher, $db;
    $db->query("UPDATE $db_attacher SET att_count = att_count + 1 WHERE att_id = ?", array((int) $id));
}

/**
 * Fetches a single attachment object for a given item.
 *
 * @param  string  $area   Target module/plugin code.
 * @param  integer $item   Target item id.
 * @param  string  $field Target item field.
 * @param  string  $column Empty string to return full row, one of the following to return a single value: 'id', 'user', 'path', 'filename', 'ext', 'img', 'size', 'title', 'count'.
 * @param  string  $number Attachment number within item, or one of these values: 'first', 'rand' or 'last'. Defines which image is selected.
 * @return mixed           Scalar column value, entire row as array or NULL if no attachments found.
 */
function att_get($area, $item, $field = '', $column = '', $number = 'first')
{
    global $db, $db_attacher;
    static $a_cache;
    if (!isset($a_cache[$area][$item][$number])) {
        $order_by = $number == 'rand' ? 'RAND()' : 'att_order';
        if ($number == 'last') {
            $order_by .= ' DESC';
        }
        $offset = is_numeric($number) && $number > 1 ? ((int) $number - 1) . ',' : '';
        $whereFileld = '';
        if ($field != '_all_') {
            $whereFileld = 'AND att_field=' . $db->quote($field);
        }
        $a_cache[$area][$item][$number] = $db->query("SELECT * FROM $db_attacher
			WHERE att_area = ? AND att_item = ? $whereFileld
			ORDER BY $order_by
			LIMIT $offset 1", array($area, (int) $item))->fetch();
    }
    return empty($column) ? $a_cache[$area][$item][$number] : $a_cache[$area][$item][$number]['att_' . $column];
}

/**
 * Fetches all attachment object for a given item.
 *
 * @param  string  $area   Target module/plugin code.
 * @param  integer $item   Target item id.
 * @param  string  $field Target item field.
 * @param  string  $column Empty string to return full row, one of the following to return a single value:
 * 'id', 'user', 'path', 'filename', 'ext', 'img', 'size', 'title', 'count'.
 * @return mixed        array or NULL if no attachments found.
 */
function att_get_all($area, $item, $field = '', $column = '')
{
    global $db, $db_attacher;
    static $a_cache;
    $allowed_columns = array('id', 'user', 'path', 'filename', 'ext', 'img', 'size', 'title', 'count');

    if (!isset($a_cache[$area][$item])) {
        $whereFileld = '';
        if ($field != '_all_') {
            $whereFileld = 'AND att_field=' . $db->quote($field);
        }
        $sql = $db->query("SELECT * FROM $db_attacher
			WHERE att_area = ? AND att_item = ? $whereFileld
			ORDER BY 'att_order'", array($area, (int) $item));

        while ($row = $sql->fetch()) {
            $a_cache[$area][$item][] = (!empty($column) && in_array($column, $allowed_columns)) ? $row['att_' . $column] : $row;
            $a_cache[$area][$item] = array_combine(range(1, count($a_cache[$area][$item])), array_values($a_cache[$area][$item]));
        }
        $sql->closeCursor();
    }
    return $a_cache[$area][$item];
}

/**
 * Detects file MIME type.
 * @param  string  $path File path.
 * @return string       MIME type.
 */
function att_getMime($path)
{
    $mime_types = array(
        'txt'  => 'text/plain',
        'htm'  => 'text/html',
        'html' => 'text/html',
        'php'  => 'text/html',
        'css'  => 'text/css',
        'js'   => 'application/javascript',
        'json' => 'application/json',
        'xml'  => 'application/xml',
        'swf'  => 'application/x-shockwave-flash',
        'flv'  => 'video/x-flv',

        // images
        'png'  => 'image/png',
        'jpe'  => 'image/jpeg',
        'jpeg' => 'image/jpeg',
        'jpg'  => 'image/jpeg',
        'gif'  => 'image/gif',
        'bmp'  => 'image/bmp',
        'ico'  => 'image/vnd.microsoft.icon',
        'tiff' => 'image/tiff',
        'tif'  => 'image/tiff',
        'svg'  => 'image/svg+xml',
        'svgz' => 'image/svg+xml',

        // archives
        'zip' => 'application/zip',
        'rar' => 'application/x-rar-compressed',
        'exe' => 'application/x-msdownload',
        'msi' => 'application/x-msdownload',
        'cab' => 'application/vnd.ms-cab-compressed',
        '7z'  => 'application/x-7z-compressed',

        // audio/video
        'mp3' => 'audio/mpeg',
        'qt'  => 'video/quicktime',
        'mov' => 'video/quicktime',
        'mp4' => 'video/mp4',

        // adobe
        'pdf' => 'application/pdf',
        'psd' => 'image/vnd.adobe.photoshop',
        'ai'  => 'application/postscript',
        'eps' => 'application/postscript',
        'ps'  => 'application/postscript',

        // ms office
        'doc'  => 'application/msword',
        'rtf'  => 'application/rtf',
        'xls'  => 'application/vnd.ms-excel',
        'ppt'  => 'application/vnd.ms-powerpoint',
        'docx' => 'application/msword',
        'xlsx' => 'application/vnd.ms-excel',
        'pptx' => 'application/vnd.ms-powerpoint',


        // open office
        'odt' => 'application/vnd.oasis.opendocument.text',
        'ods' => 'application/vnd.oasis.opendocument.spreadsheet'
    );

    $ext = att_get_ext($path);

    if (isset($mime_types[$ext])) {
        return $mime_types[$ext];
    } elseif (function_exists('finfo_open')) {
        $finfo = finfo_open(FILEINFO_MIME);
        $mimetype = finfo_file($finfo, $path);
        finfo_close($finfo);
        return $mimetype;
    } else {
        return 'application/octet-stream';
    }
}


/**
* Fetches a single attachment object for a given item.
*
* @param  string  $area   Target module/plugin code.
* @param  integer $item   Target item id.
* @param  string  $field  Target item field.
* @return string          Image MIME type.
*/
function att_get_Item_Img_MimeType($area, $item, $field = '')
{
    $ext = att_get($area, $item, $field, 'ext');

    $mime_img_types = array(
         'png'  => 'image/png',
         'jpe'  => 'image/jpeg',
         'jpeg' => 'image/jpeg',
         'jpg'  => 'image/jpeg',
         'gif'  => 'image/gif',
         'bmp'  => 'image/bmp',
         'ico'  => 'image/vnd.microsoft.icon',
         'tiff' => 'image/tiff',
         'tif'  => 'image/tiff',
         'svg'  => 'image/svg+xml',
         'svgz' => 'image/svg+xml',
     );

    if (isset($mime_img_types[$ext])) {
        return $mime_img_types[$ext];
    } else {
        return 'application/octet-stream';
    }
}

/**
 * Returns attachment thumbnail path. Generates the thumbnail first if it does not exist.
 *
 * @param  mixed   $id     Attachment ID or a row returned by att_get() function.
 * @param  integer $width  Thumbnail width in pixels.
 * @param  integer $height Thumbnail height in pixels.
 * @param  string  $frame  Framing mode: 'width', 'height', 'auto' or 'crop'.
 * @return string          Thumbnail path on success or false on error.
 */
function att_thumb($id, $width = 0, $height = 0, $frame = '', $watermark = true)
{
    global $db, $cfg, $db, $db_attacher;
    $cfg_att = $cfg['plugin']['attacher'];

    // Support rows fetched by att_get()
    if (is_array($id)) {
        $row = $id;
        $id = $row['att_id'];
    }

    // Validate arguments
    if (!is_numeric($id) || $id <= 0) {
        return '';
    }

    if ($watermark === '0' || mb_strtolower($watermark) === 'false') {
        $watermark = false;
    }

    if (empty($frame) || !in_array($frame, array('width', 'height', 'auto', 'crop'))) {
        $frame = $cfg_att['thumb_framing'];
    }

    if ($width <= 0) {
        $width = (int) $cfg_att['thumb_x'];
    }

    if ($height <= 0) {
        $height = (int) $cfg_att['thumb_y'];
    }

    // Attempt to load from cache
    $thumbs_folder = $cfg_att['folder'] . '/_thumbs';
    $cache_folder = $thumbs_folder . '/' . $id;
    if (!file_exists($cache_folder)) {
        mkdir($cache_folder, $cfg['dir_perms'], true);
    }
    $thumb_path = att_thumb_path($id, $width, $height, $frame);

    if (!$thumb_path || !file_exists($thumb_path)) {
        // Generate a new thumbnail
        if (!isset($row)) {
            $row = $db->query("SELECT * FROM $db_attacher WHERE att_id = ?", array((int) $id))->fetch();
        }
        if (!$row || !$row['att_img']) {
            return false;
        }

        $orig_path = $row['att_path'];

        $thumbs_folder = $cfg_att['folder'] . '/_thumbs/' . $id;
        $thumb_path = $thumbs_folder . '/'. $cfg_att['prefix'] . $id. '-' . $width . 'x' . $height . '-' . $frame . '.' .$row['att_ext'];

        att_cot_thumb($orig_path, $thumb_path, $width, $height, $frame, (int) $cfg_att['quality'], (int) $cfg['plugin']['attacher']['upscale']);

        /**
        * Background texture
        */
        if (!empty($cfg_att['bg_image']) && file_exists($cfg_att['bg_image'])) {
            if ($width >= $cfg_att['thumb_big_width'] || $height >= $cfg_att['thumb_big_height']) {
                att_background_mask($thumb_path, $thumb_path, $cfg_att['bg_image'], $cfg_att['bg_space']);
            }
        }

        /**
        * Watermark
        */
        if (!empty($cfg_att['thumb_watermark']) && file_exists($cfg_att['thumb_watermark'])) {
            list($th_width, $th_height) = getimagesize($thumb_path);
        }
        if ($th_width >= $cfg_att['thumb_wm_x'] || $th_height >= $cfg_att['thumb_wm_y']) {
            att_watermark($thumb_path, $thumb_path, $cfg_att['thumb_watermark']);
        }
    }

    return $thumb_path;
}

/**
 * Creates image thumbnail.
 *
 * @param string $source Original image path.
 * @param string $target Thumbnail path.
 * @param int $width Thumbnail width.
 * @param int $height Thumbnail height.
 * @param string $resize Resize options: crop auto width height.
 * @param int $quality JPEG quality in %.
 * @param boolean $upscale Upscale images smaller than thumb size.
 * @return bool
 */
function att_cot_thumb($source, $target, $width, $height, $resize = 'crop', $quality = 85, $upscale = false)
{
    $ext = strtolower(pathinfo($source, PATHINFO_EXTENSION));
    list($width_orig, $height_orig) = getimagesize($source);

    if (!$upscale && $width_orig <= $width && $height_orig <= $height) {
        // Do not upscale smaller images, just copy them
        copy($source, $target);
        return;
    }

    $x_pos = 0;
    $y_pos = 0;

    $width = (mb_substr($width, -1, 1) == '%') ? (int) ($width_orig * (int) mb_substr($width, 0, -1) / 100) : (int) $width;
    $height = (mb_substr($height, -1, 1) == '%') ? (int) ($height_orig * (int) mb_substr($height, 0, -1) / 100) : (int) $height;

    // Avoid loading images there's not enough memory for
    if (function_exists('cot_img_check_memory') && !cot_img_check_memory($source, (int) ceil($width * $height * 4 / 1048576))) {
        return false;
    }

    if ($resize == 'crop') {
        $newimage = imagecreatetruecolor($width, $height);
        $width_temp = $width;
        $height_temp = $height;

        if ($width_orig / $height_orig > $width / $height) {
            $width = $width_orig * $height / $height_orig;
            $x_pos = -($width - $width_temp) / 2;
            $y_pos = 0;
        } else {
            $height = $height_orig * $width / $width_orig;
            $y_pos = -($height - $height_temp) / 2;
            $x_pos = 0;
        }
    } else {
        if ($resize == 'width' || $height == 0) {
            if ($width_orig > $width) {
                $height = $height_orig * $width / $width_orig;
            } else {
                $width = $width_orig;
                $height = $height_orig;
            }
        } elseif ($resize == 'height' || $width == 0) {
            if ($height_orig > $height) {
                $width = $width_orig * $height / $height_orig;
            } else {
                $width = $width_orig;
                $height = $height_orig;
            }
        } elseif ($resize == 'auto') {
            if ($width_orig < $width && $height_orig < $height) {
                $width = $width_orig;
                $height = $height_orig;
            } else {
                if ($width_orig / $height_orig > $width / $height) {
                    $height = $width * $height_orig / $width_orig;
                } else {
                    $width = $height * $width_orig / $height_orig;
                }
            }
        }

        $newimage = imagecreatetruecolor($width, $height); //
    }

    if ($ext == 'gif' || $ext == 'png') {
        imagealphablending($newimage, false);
        $color = imagecolortransparent($newimage, imagecolorallocatealpha($newimage, 0, 0, 0, 127));
        imagefill($newimage, 0, 0, $color);
        imagesavealpha($newimage, true);
    }

    switch ($ext) {
            case 'gif':
                  $oldimage = imagecreatefromgif($source);
                  break;
            case 'png':
                  $oldimage = imagecreatefrompng($source);
                  break;
            default:
                  $oldimage = imagecreatefromjpeg($source);
                  break;
      }

    imagecopyresampled($newimage, $oldimage, $x_pos, $y_pos, 0, 0, $width, $height, $width_orig, $height_orig);

    switch ($ext) {
            case 'gif':
                  imagegif($newimage, $target);
                  break;
            case 'png':
                  imagepng($newimage, $target);
                  break;
            default:
                  imageinterlace($newimage, true);
                  imagejpeg($newimage, $target, $quality);
                  break;
      }

    imagedestroy($newimage);
    imagedestroy($oldimage);
}

/**
 * Adds watermark for image.
 *
 * @param $source
 * @param $target
 * @param string $watermark watermark file.
 * @param int $jpegquality
 * @return bool
 */
function att_watermark($source, $target, $watermark = '', $jpegquality = 85)
{
    if (empty($watermark)) {
        return false;
    }

    $sourceExt = att_get_ext($source);
    $targetExt = att_get_ext($target);

    $is_img = (int) in_array($sourceExt, array('gif', 'jpg', 'jpeg', 'png'));
    if (!$is_img) {
        return false;
    }

    // Load the image
    $image = imagecreatefromstring(file_get_contents($source));
    $w = imagesx($image);
    $h = imagesy($image);

    // Load the watermark
    $watermark = imagecreatefrompng($watermark);
    $ww = imagesx($watermark);
    $wh = imagesy($watermark);

    $wmAdded = false;
    if (($ww + 60) < $w && ($wh + 40) < $h) {
        imagealphablending($image, true);

        if ($targetExt == 'gif' || $targetExt == 'png') {
            imagesavealpha($image, true);
        }

        imagecopy($image, $watermark, $w - 40 - $ww, $h-$wh-20, 0, 0, $ww, $wh);
        unlink($target);

        switch ($targetExt) {
              case 'gif':
                  imagegif($image, $target);
                  break;

              case 'png':
                  imagepng($image, $target);
                  break;

              default:
                  imagejpeg($image, $target, $jpegquality);
                  break;
          }
        $wmAdded = true;
    }

    imagedestroy($watermark);
    imagedestroy($image);
    return $wmAdded;
}


/**
 * Adds background texture for image.
 *
 * @param $source
 * @param $target
 * @param string $texture Texture file.
 * @param int $space Background texture around image space (For disable 0).
 * @param int $jpegquality JPEG quality in %.
 * @return bool
 */
function att_background_mask($source, $target, $texture = '', $space = 0, $jpegquality = 85)
{
    if (!$space > 0) {
        return false;
    }

    $masked = false;
    $sourceExt = att_get_ext($source);
    $targetExt = att_get_ext($target);

    $is_img = (int) in_array($sourceExt, array('gif', 'jpg', 'jpeg', 'png'));
    if (!$is_img) {
        return false;
    }

    $bg_image = imagecreatefromstring(file_get_contents($texture));
    $old_image = imagecreatefromstring(file_get_contents($source));
    $w = imagesx($old_image);
    $h = imagesy($old_image);
    $spaces = $space * 2;

    if ($w - $spaces > ($w / 2)) {
        imagealphablending($old_image, true);

        if ($targetExt == 'gif' || $targetExt == 'png') {
            imagesavealpha($old_image, true);
        }

        $new_image = imagecreatetruecolor($w, $h);

        imageSetTile($new_image, $bg_image);
        imagefilledrectangle($new_image, 0, 0, $w, $h, IMG_COLOR_TILED);
        imagecopyresampled($new_image, $old_image, $space, $space, 0, 0, $w - $spaces, $h - $spaces, $w, $h);

        switch ($targetExt) {
              case 'gif':
                  imagegif($new_image, $target);
                  break;

              case 'png':
                  imagepng($new_image, $target);
                  break;

              default:
                  imagejpeg($new_image, $target, $jpegquality);
                  break;
          }
        $masked = true;
    }

    imagedestroy($old_image);
    imagedestroy($bg_image);
    imagedestroy($new_image);

    return $masked;
}

/**
 * Generates a file upload/edit widget. Use it as CoTemplate callback.
 *
 * @param  string $area Target module/plugin code.
 * @param  integer $item Target item id.
 * @param  string $field Target item field.
 * @param  string $tpl Template code.
 * @param string $width
 * @param string $height
 * @return string           Rendered widget.
 */
function att_widget($area, $item, $field = '', $tpl = 'attacher.widget', $width = '100%', $height = '200')
{
    global $att_widget_present, $cfg;
    $t = new XTemplate(cot_tplfile($tpl, 'plug'));

    // Metadata
    $limits = att_get_limits();

    $t->assign(array(
          'ATTACHER_AREA' => $area,
          'ATTACHER_ITEM' => $item,
          'ATTACHER_FIELD' => $field,
          'ATTACHER_EXTS' => preg_replace('#[^a-zA-Z0-9,]#', '', $cfg['plugin']['attacher']['exts']),
          'ATTACHER_ACCEPT' => preg_replace('#[^a-zA-Z0-9,*/-]#', '', $cfg['plugin']['attacher']['accept']),
          'ATTACHER_MAXSIZE' => $limits['file'],
          'ATTACHER_WIDTH' => $width,
          'ATTACHER_HEIGHT' => $height
      ));

    $t->parse();

    $att_widget_present = true;

    return $t->text();
}

/**
 * Renders attached items on page.
 *
 * @param  string $area Target module/plugin code.
 * @param  integer $item Target item id.
 * @param  string $field
 * @param  string $tpl Template code.
 * @param  string $type Attachment type filter: 'files', 'images'. By default includes all attachments.
 * @param  int $limit
 * @param  string $order
 * @return string        Rendered output.
 */
function att_display($area, $item, $field = '', $tpl = 'attacher.display', $type = 'all', $limit = 0, $order = '')
{
    global $db, $db, $db_attacher,$cfg;

    $t = new XTemplate(cot_tplfile($tpl, 'plug'));

    $t->assign(array(
          'ATTACHER_AREA' => $area,
          'ATTACHER_ITEM' => $item,
          'ATTACHER_FIELD' => $field,
      ));

    $type_filter = '';
    if ($type == 'files') {
        $type_filter = " AND att_img = 0";
    } elseif ($type == 'images') {
        $type_filter = " AND att_img = 1";
    }

    if ($field != '_all_') {
        $type_filter .= " AND att_field = " . $db->quote($field);
    }

    $sqlLimit = '';
    if ($limit > 0) {
        $sqlLimit = 'LIMIT ' . $limit;
    }

    $sqlOrder = ' ORDER BY att_order ASC';
    if ($order != '') {
        $sqlOrder = ' ORDER BY ' . $order;
    }

    $params = array($area);

    if (is_array($item)) {
        $item = array_map('intval', $item);
        $item = "IN(" . implode(',', $item) . ")";
    } else {
        $item = intval($item);
        $params[] = $item;
        $item = '= ?';
    }

    $sql = "SELECT * FROM $db_attacher WHERE att_area = ? AND att_item $item $type_filter $sqlOrder $sqlLimit";
    $res = $db->query($sql, $params);

    $num = 1;
    foreach ($res->fetchAll() as $row) {
        $t->assign(array(
                'ATTACHER_ROW_NUM' => $num,
                'ATTACHER_ROW_ID' => $row['att_id'],
                'ATTACHER_ROW_USER' => $row['att_user'],
                'ATTACHER_ROW_PATH' => $row['att_path'],
                'ATTACHER_ROW_URL' => $row['att_img'] ? $row['att_path'] : cot_url('index', 'r=attacher&a=dl&id=' . $row['att_id']),
                'ATTACHER_ROW_THUMB_URL' => $cfg['mainurl'] . '/'.att_thumb($row['att_id']),
                'ATTACHER_ROW_BIGTHUMB_URL' => $cfg['mainurl'] . '/'.att_thumb($row['att_id'], $cfg['plugin']['attacher']['thumb_big_width'], $cfg['plugin']['attacher']['thumb_big_height'], $cfg['plugin']['attacher']['thumb_big_framing']),
                'ATTACHER_ROW_FILENAME' => htmlspecialchars($row['att_filename']),
                'ATTACHER_ROW_SHORTNAME'   => cot::$cfg['plugin']['attacher']['prefix'].$row['att_id'].'.'.$row['att_ext'],
                'ATTACHER_ROW_EXT' => htmlspecialchars($row['att_ext']),
                'ATTACHER_ROW_IMG' => $row['att_img'],
                'ATTACHER_ROW_SIZE' => cot_build_filesize($row['att_size']),
                'ATTACHER_ROW_TITLE' => htmlspecialchars($row['att_title']),
                'ATTACHER_ROW_COUNT' => $row['att_count'],
                'ATTACHER_ROW_LASTMOD' => $row['att_lastmod']
            ));
        $t->parse('MAIN.ATTACHER_ROW');
        $num++;
    }

    $t->parse();

    return $t->text();
}

/**
 * Returns number of attachments for a specific item.
 *
 * @param  string $area Target module/plugin code.
 * @param  integer $item Target item id.
 * @param  string $field Target item field.
 * @param  string $type Attachment type filter: 'files', 'images'. By default includes all attachments.
 * @return integer       Number of attachments.
 */
function att_count($area, $item, $field = '', $type = 'all')
{
    global $db, $db, $db_attacher;
    static $a_cache = array();

    $cacheField = ($field != '') ? $field : '_empty_field_name_';
    if (!isset($a_cache[$area][$item][$cacheField][$type])) {
        $type_filter = '';
        if ($type == 'files') {
            $type_filter = " AND att_img = 0";
        } elseif ($type == 'images') {
            $type_filter = " AND att_img = 1";
        }
        if ($field != '_all_') {
            $type_filter .= " AND att_field=" . $db->quote($field);
        }

        $a_cache[$area][$item][$cacheField][$type] = (int) $db->query("SELECT COUNT(*) FROM $db_attacher WHERE att_area = ? AND att_item = ? $type_filter", array($area, (int) $item))->fetchColumn();
    }
    return $a_cache[$area][$item][$cacheField][$type];
}

/**
 * Renders files only as downloads block.
 *
 * @param  string $area Target module/plugin code.
 * @param  integer $item Target item id.
 * @param  string $field
 * @param  string $tpl Template code.
 * @param  int $limit
 * @param  string $order
 * @return string        Rendered output.
 */
function att_downloads($area, $item, $field = '', $tpl = 'attacher.downloads', $limit = 0, $order = '')
{
    return att_display($area, $item, $field, $tpl, 'files', $limit, $order);
}

/**
 * Renders images only as a gallery.
 *
 * @param  string $area Target module/plugin code.
 * @param  integer $item Target item id.
 * @param  string $field
 * @param  string $tpl Template code.
 * @param  int $limit
 * @param  string $order
 * @return string        Rendered output.
 */
function att_gallery($area, $item, $field = '', $tpl = 'attacher.gallery', $limit = 0, $order = '')
{
    return att_display($area, $item, $field, $tpl, 'images', $limit, $order);
}

/**
 * Generates a form input file. Use it as CoTemplate callback.
 *
 * @param  string $area Target module/plugin code.
 * @param  integer $item Target item id.
 * @param  string $field Target item field.
 * @param  string $type File types. Comma separated 'all', 'file', 'image', 'audio', 'video'.
 * @param  int $limit file limit:
 *      -1 - use plugin config value,
 *       0 - unlimited.
 * @param  string $tpl Template code.
 * @return string
 */
function att_filebox($area, $item, $field = '', $type = 'all', $limit = -1, $tpl = 'attacher.filebox')
{
    global $R, $cfg, $usr;

    // Plug-in jQuery-templates only once
    static $jQtemlatesOut = false;
    $jQtemlates = '';
    if (!$jQtemlatesOut) {
        $templates = new XTemplate(cot_tplfile('attacher.templates', 'plug'));
        $templates->parse();
        $jQtemlates = $templates->text();
        $jQtemlatesOut = true;

        Resources::linkFile($cfg['plugins_dir'] . '/attacher/lib/Jquery-ui/jquery-ui.css', 'css');
        Resources::linkFile($cfg['plugins_dir'] . '/attacher/css/fileupload.css', 'css');

        /* === Java Scripts === */
        // The jQuery UI widget factory, can be omitted if jQuery UI is already included
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/Jquery-ui/jquery-ui.min.js', 'js');

        // The Templates plugin is included to render the upload/download listings
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/JavaScript-Templates/tmpl.min.js', 'js');

        // The Load Image plugin is included for the preview images and image resizing functionality
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/JavaScript-Load-Image/js/load-image.all.min.js', 'js');

        // The Canvas to Blob plugin is included for image resizing functionality
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/JavaScript-Canvas-to-Blob/canvas-to-blob.min.js', 'js');

        // The Iframe Transport is required for browsers without support for XHR file uploads
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/upload/js/jquery.iframe-transport.js', 'js');

        // The basic File Upload plugin
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/upload/js/jquery.fileupload.js', 'js');

        // The File Upload file processing plugin
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/upload/js/jquery.fileupload-process.js', 'js');

        // The File Upload image preview & resize plugin
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/upload/js/jquery.fileupload-image.js', 'js');

        // The File Upload audio preview plugin
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/upload/js/jquery.fileupload-audio.js', 'js');

        // The File Upload video preview plugin
        Resources::linkFileFooter($cfg['plugins_dir'].'/attacher/lib/upload/js/jquery.fileupload-video.js', 'js');
        // The File Upload validation plugin
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/upload/js/jquery.fileupload-validate.js', 'js');

        // The File Upload user interface plugin
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/upload/js/jquery.fileupload-ui.js', 'js');
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/lib/upload/js/jquery.fileupload-jquery-ui.js', 'js');

        // Table Drag&Drop plugin for reordering
        Resources::linkFileFooter('js/jquery.tablednd.min.js', 'js');

        // The main application script
        Resources::linkFileFooter($cfg['plugins_dir'] . '/attacher/js/attacher.js', 'js');
    }

    $formId = "{$area}_{$item}_{$field}";
    $type = str_replace(' ', '', $type);
    if (empty($type)) {
        $type = array('all');
    } else {
        $type = explode(',', $type);
    }
    $type = json_encode($type);

    $t = new XTemplate(cot_tplfile('attacher.filebox', 'plug'));

    $limits = att_get_limits();
    if ($limit == 0) {
        $limit = 100000000000000000;
    } elseif ($limit == -1) {
        $limit = $cfg['plugin']['attacher']['items'] > 0 ? (int) $cfg['plugin']['attacher']['items'] : 100000000000000000;
    }

    $params = array(
          'area' => $area,
          'item' => $item,
          'field' => $field,
          'limit' => $limit,
          'type' => $type,
      );

    $action = 'index.php?r=attacher&a=upload&area=' . $area . '&item=' . $item;
    if (!empty($field)) {
        $action .= '&field=' . $field;
    }

    static $unikey = '';

    $formUnikey = '';
    if ($item == 0) {
        $unikeyName = "cf_{$area}_{$item}";

        if (empty($unikey)) {
            $unikey = cot_import($unikeyName, 'P', 'TXT');
        }
        if (!$unikey) {
            $unikey = cot_import($unikeyName, 'G', 'TXT');
        }
        $unikey = cot_import_buffered($unikeyName, $unikey);
        if (!$unikey) {
            $unikey = mb_substr(md5("{$area}_{$item}" . '_' . cot::$usr['id'] . rand(0, 99999999)), 0, 15);
        }
        $params['unikey'] = $unikey;
        $formUnikey = cot_inputbox('hidden', $unikeyName, $unikey);

        $action .= '&unikey=' . $unikey;
    }

    $params = base64_encode(serialize($params));

    // Metadata
    $t->assign(array(
          'ATTACHER_ID' => $formId,
          'ATTACHER_AREA' => $area,
          'ATTACHER_ITEM' => $item,
          'ATTACHER_FIELD' => $field,
          'ATTACHER_LIMIT' => $limit,
          'ATTACHER_TYPE' => $type,
          'ATTACHER_PARAM' => $params,
          'ATTACHER_CHUNK' => (int) $cfg['plugin']['attacher']['chunkSize'],
          'ATTACHER_EXTS' => preg_replace('#[^a-zA-Z0-9,]#', '', $cfg['plugin']['attacher']['exts']),
          'ATTACHER_ACCEPT' => preg_replace('#[^a-zA-Z0-9,*/-]#', '', $cfg['plugin']['attacher']['accept']),
          'ATTACHER_MAXSIZE' => $limits['file'],
          'ATTACHER_ACTION' => $action,
          'ATTACHER_X' => cot::$sys['xk']
      ));

    $t->parse();
    return $formUnikey . $t->text() . $jQtemlates;
}

/**
 * Generating customizable html > image snippet.
 *  from <img> to
 * <span><a[title]><picture><source><img></picture></a></span>
 *
 * @param $m
 * @return string
 */
      function att_customizable_thumb($m)
      {
          $plu = cot::$cfg['plugin']['attacher'];
          $src = att_thumb($m[3], $m[5], $m[6], $m[7]);
          $url = att_thumb($m[3], $plu['thumb_big_width'], $plu['thumb_big_height'], 'auto', true);
          $ssrc = att_thumb($m[3], $plu['thumb_x'], $plu['thumb_y'], $plu['thumb_framing']);
          $alt = preg_filter('#<img(.*?)alt="(.*?)"(.*?)>#i', '$2', $m[0]);

          if (!$src || !$url || !$ssrc) {
              return $m[0];
          }

          $img = '<img' . $m[1] . 'src="' . $m[2] . $src . '"' . $m[9] . '>';

          if ($plu['thumb_to_picture']) {
              $img = '<img' . $m[1] . 'src="' . $m[2] . $ssrc . '"' . $m[9] . '>';
              $picture_source = '<source media="(min-width:' . $plu['thumb_big_width'] . 'px)" srcset="' . $url . '">';
              $img = '<picture>' . $picture_source . $img . '</picture>';
          }

          if ($plu['thumb_strip_style']) {
              $img = preg_replace('# style=".*?"#i', '', $img);
          }
          $snippet = $img;

          if ($plu['thumb_clickable'] === 'clickable') {
              if ($plu['thumb_alt_to_title'] && !empty($alt)) {
                  $title = ' title="' . $alt . '"';
              }
              $snippet = '<a href="' . $url . '"' . $title . '>' . $img . '</a>';
          }

          if ($plu['thumb_wrapper']) {
              $thumb_wrapper = !empty($plu['thumb_wrapper_class']) ? ' class="' . $plu['thumb_wrapper_class'] . '"' : false;
              $snippet = '<span' . $thumb_wrapper . ' data-snippet="attacher">' .$snippet. '</span>';
          }
          return $snippet;
      }

/**
 * Generating customizable bbcode to html > image snipet.
 *  from [files_thumb=?] in <img> to
 * <span><a[title]><picture><source><img></picture></a></span>
 *
 * @param $m
 * @return string
 */
      function att_customizable_thumb_bbcode($m)
      {
          global $db, $db, $db_attacher, $att_item_cache;

          parse_str(htmlspecialchars_decode($m[1]), $params);

          if (!isset($params['id']) || !is_numeric($params['id']) || $params['id'] <= 0) {
              return $m[0] . 'err';
          }

          $params['id'] = (int) $params['id'];
          $plu = cot::$cfg['plugin']['attacher'];
          $src = att_thumb($params['id'], $params['width'], $params['height'], $params['frame']);
          $url = att_thumb($params['id'], $plu['thumb_big_width'], $plu['thumb_big_height'], 'auto', true);
          $ssrc = att_thumb($params['id'], $plu['thumb_x'], $plu['thumb_y'], $plu['thumb_framing']);


          if (!$src || !$url || !$ssrc) {
              return $m[0] . 'err2';
          }

          if (empty($params['alt'])) {
              if (!isset($att_item_cache[$params['id']])) {
                  $row = $db->query("SELECT * FROM $db_attacher WHERE att_id = ?", array($params['id']))->fetch();
                  if (!$row || !$row['att_img']) {
                      return $m[0].'err';
                  }

                  $att_item_cache[$params['id']] = $row;
              }
              $params['alt'] = $att_item_cache[$params['id']]['att_title'];
          }
          $alt = ' alt="' . htmlspecialchars($params['alt']) . '"';
          if (!empty($params['class'])) {
              $class = ' class="' . $params['class'] . '"';
          }

          $img = '<img src="' . $src .'"'. $alt . $class . '>';

          if ($plu['thumb_to_picture']) {
              $img = '<img src="' . $ssrc.'"' . $alt . $class . '>';
              $picture_source = '<source media="(min-width:' . $plu['thumb_big_width'] . 'px)" srcset="' . $url . '">';
              $img = '<picture>' . $picture_source . $img . '</picture>';
          }

          $snippet = $img;

          if ($plu['thumb_clickable'] === 'clickable') {
              if ($plu['thumb_alt_to_title'] && !empty($params['alt'])) {
                  $title = ' title="' . htmlspecialchars($params['alt']) . '"';
              }
              $snippet = '<a href="' . $url . '"' . $title . '>' . $img . '</a>';
          }

          if ($plu['thumb_wrapper']) {
              $thumb_wrapper = !empty($plu['thumb_wrapper_class']) ? ' class="' . $plu['thumb_wrapper_class'] . '"' : false;
              $snippet = '<span' . $thumb_wrapper . ' data-snippet="attacher">' .$snippet. '</span>';
          }
          return $snippet;
      }

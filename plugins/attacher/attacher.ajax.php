<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=ajax
[END_COT_EXT]
==================== */

/**
 * Attacher plugin: ajax
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/
defined('COT_CODE') or die('Wrong URL.');

$area = cot_import('area', 'R', 'ALP');
$item = cot_import('item', 'R', 'INT');
$field = (string)cot_import('field', 'R', 'TXT');
$id   = cot_import('id', 'G', 'INT');
$filename = cot_import('filename', 'R', 'TXT');

$response_code = 200;

if ($a == 'upload') {
    require_once cot_incfile('attacher', 'plug', 'upload');
} elseif ($a == 'display') {

    $formId = "{$area}_{$item}_{$field}";

    $t = new XTemplate(cot_tplfile('attacher.files', 'plug'));

    // Metadata
    $limits = att_get_limits();

    $tpl = new XTemplate(cot_tplfile('attacher.templates', 'plug'));
    $tpl->parse();

    $action = 'index.php?r=attacher&a=upload&area='.$area.'&item='.$item;
    if (!empty($field)) {
        $action .= '&field='.$field;
    }

    $limit = isset($_GET['limit']) ? (int)$_GET['limit'] : -1; // Use Plugin config value
    $limits = att_get_limits();
    if ($limit == 0) {
        $limit = 100000000000000000;
    } elseif ($limit == -1) {
        $limit = $cfg['plugin']['attacher']['items'] > 0 ? (int)cot::$cfg['plugin']['attacher']['items'] : 100000000000000000;
    }
    /**/
    $type = str_replace(' ', '', $type);
    if (empty($type)) {
        $type = array('all');
    } else {
        $type = explode(',', $type);
    }
    $type = json_encode($type);

    $params = array(
        'area' => $area,
        'item' => $item,
        'field' => $field,
        'limit' => $limit,
        'type' => $type,
    );
    $params = base64_encode(serialize($params));
    /**/
    $t->assign(array(
        'ATTACHER_ID'      => $formId,
        'ATTACHER_AREA'    => $area,
        'ATTACHER_ITEM'    => $item,
        'ATTACHER_FIELD'   => $field,
        'ATTACHER_LIMIT'   => $limit,
        'ATTACHER_PARAM'   => $params,
        'ATTACHER_TEMPLATES' => $tpl->text(),
        'ATTACHER_CHUNK'   => (int)$cfg['plugin']['attacher']['chunkSize'],
        'ATTACHER_EXTS'    => preg_replace('#[^a-zA-Z0-9,]#', '', cot::$cfg['plugin']['attacher']['exts']),
        'ATTACHER_ACCEPT'  => preg_replace('#[^a-zA-Z0-9,*/-]#', '', cot::$cfg['plugin']['attacher']['accept']),
        'ATTACHER_MAXSIZE' => $limits['file'],
        'ATTACHER_ACTION' => $action,
        'ATTACHER_X'      => cot::$sys['xk'],
    ));

    $t->parse();
    $t->out();
    exit;
} elseif ($a == 'dl' && $id > 0) {
    // File download gateway
    require_once cot_incfile('attacher', 'plug', 'download');
}

if ($a == 'replace' && $id > 0 && $_SERVER['REQUEST_METHOD'] == 'POST') {
    // Replacing an existing attachment
    if (att_update_file($id, 'file')) {
        $response = array(
            'status' => 1
        );
    } else {
        $errors = cot_implode_messages();
        cot_clear_messages();
        cot_ajax_die(403, array('message' => $errors));
    }
} elseif ($a == 'update_title' && $_SERVER['REQUEST_METHOD'] == 'POST') {
    // Update attachment title via AJAX
    if ($id > 0) {
        $row = $db->query("SELECT * FROM $db_attacher WHERE att_id = ?", array($id))->fetch();
        if (!$row) {
            att_ajax_die(404);
        }
        if (!$usr['isadmin'] && $row['att_user'] != $usr['id']) {
            att_ajax_die(403);
        }

        $title = cot_import('title', 'P', 'TXT');

        $status = 0;
        if ($title != $row['att_title']) {
            $status = $db->update($db_attacher, array('att_title' => $title,'att_lastmod' => date('Y-m-d H:i:s', cot::$sys['now'])), "att_id = ?", array($id));
        }
        $response = array(
            'written' => $status
        );
    } else {
        $response_code = 404;
    }
} elseif ($a == 'reorder' && $_SERVER['REQUEST_METHOD'] == 'POST') {
    // Check permission
    if (!$usr['isadmin'] && $db->query("SELECT COUNT(*) FROM $db_attacher WHERE att_area = ? AND att_item = ? AND att_user = ?", array($area, $item, $usr['id']))->fetchColumn() == 0) {
        att_ajax_die(403);
    }

    $orders = cot_import('orders', 'P', 'ARR');

    foreach ($orders as $order => $id) {
        $db->update(
            $db_attacher,
            array('att_order' => $order),
                "att_id = ? AND att_area = ? AND att_item = ? AND att_field = ? AND att_order != ?",
            array((int)$id, $area, $item, $field, $order)
        );
    }

    $response = array(
        'status' => 1
    );
}

cot_sendheaders('application/json', att_ajax_get_status($response_code));

if (!is_null($response)) {
    echo json_encode($response);
}

/**
 * Terminates further script execution with a given
 * HTTP response status and output.
 * If the message is omitted, then it is taken from the
 * HTTP status line.
 *
 * @param  int    $code     HTTP/1.1 status code
 * @param  string $message  Output string
 * @param  array  $response Custom response object
 */
function att_ajax_die($code, $message = null, $response = null)
{
    $status = att_ajax_get_status($code);
    cot_sendheaders('application/json', $status);
    if (is_null($message)) {
        $message = substr($status, strpos($status, ' ') + 1);
    }
    if (is_null($response)) {
        echo json_encode($message);
    } else {
        $response['message'] = $message;
        echo json_encode($response);
    }
    exit;
}

/**
 * Returns HTTP satus line for a given
 * HTTP response code
 *
 * @param  int    $code HTTP response code
 * @return string       HTTP status line
 */
function att_ajax_get_status($code)
{
    static $msg_status = array(
        200 => '200 OK',
        201 => '201 Created',
        204 => '204 No Content',
        205 => '205 Reset Content',
        206 => '206 Partial Content',
        300 => '300 Multiple Choices',
        301 => '301 Moved Permanently',
        302 => '302 Found',
        303 => '303 See Other',
        304 => '304 Not Modified',
        307 => '307 Temporary Redirect',
        400 => '400 Bad Request',
        401 => '401 Authorization Required',
        403 => '403 Forbidden',
        404 => '404 Not Found',
        409 => '409 Conflict',
        411 => '411 Length Required',
        500 => '500 Internal Server Error',
        501 => '501 Not Implemented',
        503 => '503 Service Unavailable',
    );
    if (isset($msg_status[$code])) {
        return $msg_status[$code];
    } else {
        return "$code Unknown";
    }
}

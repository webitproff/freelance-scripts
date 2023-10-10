<?php
/* ====================
  [BEGIN_COT_EXT]
  Hooks=tools
  [END_COT_EXT]
  ==================== */

/**
 * Attacher plugin: tools
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL');


require_once cot_incfile('attacher', 'plug');

if ($a == 'cleanup') {
    $count = 0;
    if (cot_module_active('forums')) {
        // Remove unused forum attachments
        require_once cot_incfile('forums', 'module');

        $condition = "LEFT JOIN $db_forum_posts ON $db_attacher.att_item = $db_forum_posts.fp_id
		WHERE $db_attacher.att_area = 'forums' AND $db_forum_posts.fp_id IS NULL";

        $res = $db->query("SELECT att_id FROM $db_attacher $condition");
        $count += $res->rowCount();
        foreach ($res->fetchAll(PDO::FETCH_COLUMN) as $att_id) {
            att_remove($att_id);
        }
    }

    if (cot_module_active('page')) {
        // Remove unused page attachments
        require_once cot_incfile('page', 'module');

        $condition = "LEFT JOIN $db_pages ON $db_attacher.att_item = $db_pages.page_id
		WHERE $db_attacher.att_area = 'page' AND $db_pages.page_id IS NULL";

        $res = $db->query("SELECT att_id FROM $db_attacher $condition");
        $count += $res->rowCount();
        foreach ($res->fetchAll(PDO::FETCH_COLUMN) as $att_id) {
            att_remove($att_id);
        }
    }

    $count += att_formGarbageCollect();
    cot_message($count . ' ' . $L['att_items_removed']);

    // Return to the main page and show messages
    cot_redirect(cot_url('admin', 'm=other&p=attacher', '', true));
}

if ($a == 'allthumbsremove') {
    if (empty(cot::$cfg['plugin']['attacher']['folder']) || !file_exists(cot::$cfg['plugin']['attacher']['folder'] . '/_thumbs')) {
        cot_redirect(cot_url('admin', 'm=other&p=attacher', '', true));
    }

    att_rrmdir(cot::$cfg['plugin']['attacher']['folder'] . '/_thumbs');

    if (cot::$cache) {
        if (cot::$cfg['cache_page']) {
            cot::$cache->page->clear('page');
        }
        if (cot::$cfg['cache_index']) {
            cot::$cache->page->clear('index');
        }
        if (cot::$cfg['cache_forums']) {
            cot::$cache->page->clear('forums');
        }
    }

    cot_message(cot::$L['att_thumbs_removed']);

    // Return to the main page and show messages
    cot_redirect(cot_url('admin', 'm=other&p=attacher', '', true));
}

$tt = new XTemplate(cot_tplfile('attacher.tools', 'plug', true));

cot_display_messages($tt);

$tt->parse();
$plugin_body = $tt->text('MAIN');

<?php

/* ====================
[BEGIN_COT_EXT]
Hooks=projects.addofferform.main
[END_COT_EXT]
==================== */

/**
 * Project offers attaches function
 *
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/
defined('COT_CODE') or die('Wrong URL');

if (cot_plugin_active('attacher')) {
    require_once cot_incfile('attacher', 'plug');

    function att_performer_attach($pr_id, $type = 'all', $limit = -1)
    {
        if ((int)$pr_id) {
            global $item, $usr;

            if ($item['item_performer'] > 0 && $item['item_realized'] == 0) {
                if ($usr['isadmin'] || ($item['item_userid'] == $usr['id']) || ($item['item_performer'] == $usr['id'])) {
                    return att_filebox('projectoffers', $pr_id, '', $type, $limit);
                }
            }

            if ($item['item_performer'] > 0 && $item['item_realized'] == 1) {
                if ($usr['isadmin'] || ($item['item_userid'] == $usr['id'])) {
                    if (att_count('projectoffers', $pr_id) > 0) {
                        return att_filebox('projectoffers', $pr_id, '', $type, $limit);
                    }
                }
            }

            if ($item['item_performer'] == 0) {
                if ($usr['isadmin'] || ($item['item_userid'] == $usr['id'])) {
                    if (att_count('projectoffers', $pr_id) > 0) {
                        return att_filebox('projectoffers', $pr_id, '', $type, $limit);
                    }
                }
            }
        }
        return false;
    }
}

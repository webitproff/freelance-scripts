<?php

/* ====================
[BEGIN_COT_EXT]
Hooks=services.add.add.done,services.edit.update.done
[END_COT_EXT]
==================== */


defined('COT_CODE') or die('Wrong URL');

if (cot_plugin_active('attacher')) {
    require_once cot_incfile('attacher', 'plug');

    if (cot_auth('plug', 'attacher', 'W')) {
        if ($id) {
            att_fixNewPath('services', $id);
        }
    }
}

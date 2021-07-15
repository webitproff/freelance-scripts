<?php

/* ====================
 [BEGIN_COT_EXT]
 Hooks=folio.add.add.done,folio.edit.update.done
 [END_COT_EXT]
==================== */

/**
 *  Folio add & edit attaches
 *
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/
defined('COT_CODE') or die('Wrong URL');

if (cot_plugin_active('attacher')) {
    require_once cot_incfile('attacher', 'plug');

    if (cot_auth('plug', 'attacher', 'W')) {
        if ($id) {
            att_fixNewPath('folio', $id);
        }
    }
}

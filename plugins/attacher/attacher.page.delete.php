<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=page.edit.delete.done
[END_COT_EXT]
==================== */

/**
 * Attacher plugin: page delete
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL');

if (cot_auth('plug', 'attacher', 'W')) {
    require_once cot_incfile('attacher', 'plug');

    att_remove_all(null, 'page', $id);
}

<?php
/* ====================
[BEGIN_COT_EXT]
Code=boxes
Hooks=index.tags
Tags=index.tpl:{INDEX_TEXT_BOXES}
Order=10
[END_COT_EXT]
==================== */
/**
 * boxes plugin
 *
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2015 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL.');

$t->assign('INDEX_TEXT_BOXES', $cfg['plugin']['boxes']['indextextboxes']);

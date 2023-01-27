<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=rc
[END_COT_EXT]
==================== */

/**
 * Attacher plugin: rc
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL');

if ($cfg['plugin']['attacher']['css'] == 1) {
    Resources::addFile($cfg['plugins_dir'] . '/attacher/css/attacher.css');
}

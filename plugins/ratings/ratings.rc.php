<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=rc
[END_COT_EXT]
==================== */

/**
 * Ratings JavaScript loader
 *
 * @package Ratings
 * @copyright (c) Cotonti Team
 * @license https://github.com/Cotonti/Cotonti/blob/master/License.txt
 */

defined('COT_CODE') or die('Wrong URL');

if ($cfg['jquery'])
{
	Resources::addFile($cfg['plugins_dir'] . '/ratings/js/jquery.rating.min.js');
	Resources::addFile($cfg['plugins_dir'] . '/ratings/js/ratings.js');
	if ($cfg['plugin']['ratings']['css'])
	{
		Resources::addFile($cfg['plugins_dir'] . '/ratings/tpl/ratings.css');
	}
}

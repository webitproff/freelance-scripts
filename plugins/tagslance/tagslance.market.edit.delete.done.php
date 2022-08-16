<?php

/** 
 * [BEGIN_COT_EXT]
 * Hooks=market.edit.delete.done
 * [END_COT_EXT]
 */
 
/**
 * plugin tagslance for Cotonti Siena
 * 
 * @package tagslance
 * @version 1.0.0
 * @author CMSWorks Team
 * @copyright Copyright (c) CMSWorks.ru, littledev.ru
 * @license BSD
 *  */

defined('COT_CODE') or die('Wrong URL.');

if ($cfg['plugin']['tagslance']['market'] && cot_auth('plug', 'tags', 'W'))
{
	require_once cot_incfile('tags', 'plug');
	if (cot_get_caller() == 'i18n.market')
	{
		$tags_extra = array('tag_locale' => $i18n_locale);
	}
	else
	{
		$tags_extra = null;
	}
	cot_tag_remove_all($id, 'market', $tags_extra);
}

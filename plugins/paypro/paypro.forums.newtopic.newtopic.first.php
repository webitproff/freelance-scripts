<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=forums.newtopic.newtopic.first
 * [END_COT_EXT]
 */
defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('paypro', 'plug');

if (!cot_getuserpro() && !$usr['isadmin'])
{
	if ($cfg['plugin']['paypro']['forumslimit'] > 0)
	{
		$countforumsofuser = cot_getcountforumsofuser($usr['id']);
		if ($countforumsofuser >= $cfg['plugin']['paypro']['forumslimit'])
		{
      cot_error($L['paypro_warning_forumslimit_empty']);
		}
	}
}

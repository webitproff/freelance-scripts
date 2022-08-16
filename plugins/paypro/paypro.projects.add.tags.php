<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=projects.add.tags
 * [END_COT_EXT]
 */
defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('paypro', 'plug');

if (!cot_getuserpro() && !$usr['isadmin'])
{
	if ($cfg['plugin']['paypro']['projectslimit'] > 0)
	{
		$getcountprjofuser = cot_getcountprjofuser($usr['id']);
		if ($getcountprjofuser >= $cfg['plugin']['paypro']['projectslimit'])
		{
      $t->parse('MAIN.PROJECTS_ADD_PAYPRO_LIMIT');
		}
	}
}

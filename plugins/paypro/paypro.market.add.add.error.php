<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=market.add.add.error
 * [END_COT_EXT]
 */
defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('paypro', 'plug');

if (!cot_getuserpro() && !$usr['isadmin'])
{
	if ($cfg['plugin']['paypro']['marketlimit'] > 0)
	{
		$countmarketofuser = cot_getcountmarketofuser($usr['id']);
		if ($countmarketofuser >= $cfg['plugin']['paypro']['marketlimit'])
		{
      cot_error($L['paypro_warning_marketlimit_empty']);
		}
	}
}

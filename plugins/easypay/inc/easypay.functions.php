<?php

/**
 * easypay plugin
 *
 * @package easypay
 * @version 1.0.0
 * @author CMSWorks Team
 * @copyright Copyright (c) CMSWorks.ru
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL');

// Requirements
require_once cot_langfile('easypay', 'plug');

// Global variables
global $db_x;

// Global variables
function cot_cfg_easypay()
{
	global $cfg;
	
	$epayset = str_replace("\r\n", "\n", $cfg['plugin']['easypay']['codes']);
	$epayset = explode("\n", $epayset);
	$easypayset = array();
	foreach ($epayset as $lineset)
	{
		$lines = explode("|", $lineset);
		$lines[0] = trim($lines[0]);
		$lines[1] = trim($lines[1]);
		$lines[2] = (float)trim($lines[2]);
		$lines[3] = (int)trim($lines[3]);
		
		if (!empty($lines[0]) && !empty($lines[1]))
		{
			$easypayset[$lines[0]]['name'] = $lines[1];
			$easypayset[$lines[0]]['cost'] = $lines[2];
			$easypayset[$lines[0]]['userid'] = $lines[3];

		}
	}
	return $easypayset;
}

function cot_get_easypay ($code)
{
	global $db, $cfg;
	
	$easypay_cfg = cot_cfg_easypay();
	
	$t1 = new XTemplate(cot_tplfile(array('easypay', 'link', $code), 'plug'));

	$t1->assign(array(
		'EASYPAY_BUY_URL' => cot_url('plug', 'e=easypay&code='.$code),
		'EASYPAY_BUY_NAME' => $easypay_cfg[$code]['name'],
		'EASYPAY_BUY_COST' => $easypay_cfg[$code]['cost'],
	));

	$t1->parse('MAIN');
	return $t1->text('MAIN');
}

?>
<?php

/* ====================
[BEGIN_COT_EXT]
Hooks=admin.config.edit.loop
[END_COT_EXT]
==================== */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('easypay', 'plug');
$adminhelp = $L['easypay_help'];

if ($p == 'easypay' && $row['config_name'] == 'codes' && $cfg['jquery'])
{
	$sskin = cot_tplfile('easypay.admin.config', 'plug', true);
	$tt = new XTemplate($sskin);
	
	$epayset = str_replace("\r\n", "\n", $row['config_value']);
	$epayset = explode("\n", $epayset);

	$jj = 0;
	foreach ($epayset as $lineset)
	{
		$lines = explode("|", $lineset);
		$lines[0] = trim($lines[0]);
		$lines[1] = trim($lines[1]);
		$lines[2] = (float)trim($lines[2]);
		$lines[3] = (trim($lines[3])) ? (int)trim($lines[3]) : 0;
		
		if (!empty($lines[0]) && !empty($lines[1]))
		{
			$tt->assign(array(
				'ADDNUM' => $jj,
				'ADDCODE' => cot_inputbox('text', 'code', $lines[0], 'class="code_id"'),
				'ADDNAME' => cot_inputbox('text', 'name', $lines[1], 'class="code_name"'),
				'ADDCOST' => cot_inputbox('text', 'cost', $lines[2], 'class="code_cost"'),
				'ADDUSERID' => cot_inputbox('text', 'userid', $lines[3], 'class="code_userid"'),
			));
			$tt->parse('MAIN.ADDITIONAL');
			$jj++;
		}
	}

	$jj++;
	$tt->assign(array(
		'CATNUM' => $jj
	));
	$tt->parse('MAIN');

	$t->assign(array(
		'ADMIN_CONFIG_ROW_CONFIG_MORE' => $tt->text('MAIN') . '<div id="helptext">' . $config_more . '</div>'
	));
}

?>
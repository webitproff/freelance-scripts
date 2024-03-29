<?php

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL');

$id = cot_import('id', 'G', 'INT');
$r = cot_import('r', 'G', 'ALP');

$c = cot_import('c', 'G', 'TXT');
if (!empty($c) && !isset($structure['services'][$c]))
{
	$c = '';
}

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('services', 'any', 'RWA');
cot_block($usr['auth_write']);

/* === Hook === */
$extp = cot_getextplugins('services.add.first');
foreach ($extp as $pl)
{
	include $pl;
}
/* ===== */

$sys['parser'] = $cfg['services']['parser'];
$parser_list = cot_get_parsers();

if ($a == 'add')
{
	cot_shield_protect();

	$ritem = array();
	
	/* === Hook === */
	foreach (cot_getextplugins('services.add.add.first') as $pl)
	{
		include $pl;
	}
	/* ===== */

	$ritem = cot_services_import('POST', array(), $usr);
	
	list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('services', $ritem['item_cat']);
	cot_block($usr['auth_write']);

	/* === Hook === */
	foreach (cot_getextplugins('services.add.add.import') as $pl)
	{
		include $pl;
	}
	/* ===== */

	cot_services_validate($ritem);

	/* === Hook === */
	foreach (cot_getextplugins('services.add.add.error') as $pl)
	{
		include $pl;
	}
	/* ===== */

	if (!cot_error_found())
	{
		$id = cot_services_add($ritem, $usr);
		
		switch ($ritem['item_state'])
		{
			case 0:
				$urlparams = empty($ritem['item_alias']) ?
					array('c' => $ritem['item_cat'], 'id' => $id) :
					array('c' => $ritem['item_cat'], 'al' => $ritem['item_alias']);
				$r_url = cot_url('services', $urlparams, '', true);
				break;
			case 1:
				$r_url = cot_url('services', 'm=preview&id=' . $id, '', true);
				break;
			case 2:
				$urlparams = empty($ritem['item_alias']) ?
					array('c' => $ritem['item_cat'], 'id' => $id) :
					array('c' => $ritem['item_cat'], 'al' => $ritem['item_alias']);
				$r_url = cot_url('services', $urlparams, '', true);

				if (!$usr['isadmin'])
				{
					$rbody = cot_rc($L['services_senttovalidation_mail_body'], array( 
						'user_name' => $usr['profile']['user_name'],
						'serv_name' => $ritem['item_title'],
						'sitename' => $cfg['maintitle'],
						'link' => COT_ABSOLUTE_URL . $r_url
					));
					cot_mail($usr['profile']['user_email'], $L['services_senttovalidation_mail_subj'], $rbody);
				}

				if ($cfg['services']['notifservices_admin_moderate'])
				{
					$nbody = cot_rc($L['services_notif_admin_moderate_mail_body'], array( 
						'user_name' => $usr['profile']['user_name'],
						'serv_name' => $ritem['item_title'],
						'sitename' => $cfg['maintitle'],
						'link' => COT_ABSOLUTE_URL . $r_url
					));
					cot_mail($cfg['adminemail'], $L['services_notif_admin_moderate_mail_subj'], $nbody);
				}
				break;
		}
		
		cot_redirect($r_url);
		exit;
	}
	else
	{
		cot_redirect(cot_url('services', 'm=add&c='.$c, '', true));
	}
}

if (empty($ritem['item_cat']) && !empty($c))
{
	$ritem['item_cat'] = $c;
	$usr['isadmin'] = cot_auth('services', $ritem['item_cat'], 'A');
}

if (empty($ritem['item_type']) && !empty($type))
{
	$ritem['item_type'] = $type;
}

$out['subtitle'] = $L['services_add_service_title'];
$out['head'] .= $R['code_noindex'];
$sys['sublocation'] = $structure['services'][$c]['title'];

$mskin = cot_tplfile(array('services', 'add', $structure['services'][$ritem['item_cat']]['tpl']));

/* === Hook === */
foreach (cot_getextplugins('services.add.main') as $pl)
{
	include $pl;
}
/* ===== */

$t = new XTemplate($mskin);

// Error and message handling
cot_display_messages($t);

$t->assign(array(
	"SERVADD_FORM_SEND" => cot_url('services', 'm=add&c='.$c.'&a=add'),
	"SERVADD_FORM_CAT" => cot_selectbox_structure('services', $ritem['item_cat'], 'rcat'),
	"SERVADD_FORM_CATTITLE" => (!empty($c)) ? $structure['services'][$c]['title'] : '',
	"SERVADD_FORM_TITLE" => cot_inputbox('text', 'rtitle', $ritem['item_title'], 'size="56"'),
	'SERVADD_FORM_KEYWORDS' => cot_inputbox('text', 'rkeywords', $item['item_keywords'], array('size' => '32', 'maxlength' => '255')),
	'SERVADD_FORM_METATITLE' => cot_inputbox('text', 'rmetatitle', $item['item_metatitle'], array('size' => '64', 'maxlength' => '255')),
	'SERVADD_FORM_METADESC' => cot_textarea('rmetadesc', $item['item_metadesc'], 2, 64, array('maxlength' => '255')),
	"SERVADD_FORM_ALIAS" => cot_inputbox('text', 'ralias', $ritem['item_alias'], array('size' => '32', 'maxlength' => '255')),
	"SERVADD_FORM_TEXT" => cot_textarea('rtext', $ritem['item_text'], 10, 60, 'id="formtext"', ($serveditor && $serveditor != 'disable') ? 'input_textarea_'.$serveditor : ''),
	"SERVADD_FORM_COST" => cot_inputbox('text', 'rcost', $ritem['item_cost'], 'size="10"'),
	"SERVADD_FORM_PARSER" => cot_selectbox($cfg['services']['parser'], 'rparser', $parser_list, $parser_list, false),
));

// Extra fields
foreach($cot_extrafields[$db_services] as $exfld)
{
	$uname = strtoupper($exfld['field_name']);
	$exfld_val = cot_build_extrafields('ritem'.$exfld['field_name'], $exfld, $ritem['item_'.$exfld['field_name']]);
	$exfld_title = isset($L['services_'.$exfld['field_name'].'_title']) ?  $L['services_'.$exfld['field_name'].'_title'] : $exfld['field_description'];
	$t->assign(array(
		'SERVADD_FORM_'.$uname => $exfld_val,
		'SERVADD_FORM_'.$uname.'_TITLE' => $exfld_title,
		'SERVADD_FORM_EXTRAFLD' => $exfld_val,
		'SERVADD_FORM_EXTRAFLD_TITLE' => $exfld_title
		));
	$t->parse('MAIN.EXTRAFLD');
}

/* === Hook === */
foreach (cot_getextplugins('services.add.tags') as $pl)
{
	include $pl;
}
/* ===== */

$t->parse('MAIN');
$module_body = $t->text('MAIN');
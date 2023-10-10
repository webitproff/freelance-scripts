<?php

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL');

$id = cot_import('id', 'G', 'INT');
$c = cot_import('c', 'G', 'TXT');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('services', 'any', 'RWA');

/* === Hook === */
foreach (cot_getextplugins('services.edit.first') as $pl)
{
	include $pl;
}
/* ===== */

cot_block($usr['auth_read']);

if (!$id || $id < 0)
{
	cot_die_message(404);
}

$sql = $db->query("SELECT * FROM $db_services WHERE item_id='$id' LIMIT 1");
cot_die($sql->rowCount() == 0);
$item = $sql->fetch();

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('services', $item['item_cat']);
cot_block($usr['isadmin'] || $usr['auth_write'] && $usr['id'] == $item['item_userid']);

$sys['parser'] = $item['item_parser'];
$parser_list = cot_get_parsers();

if ($a == 'update')
{
	/* === Hook === */
	foreach (cot_getextplugins('services.edit.update.first') as $pl)
	{
		include $pl;
	}
	/* ===== */
	
	cot_block($usr['isadmin'] || $usr['auth_write'] && $usr['id'] == $item['item_userid']);

	$ritem = cot_services_import('POST', $item, $usr);
	
	if ($_SERVER['REQUEST_METHOD'] == 'POST')
	{
		$rdelete = cot_import('rdelete', 'P', 'BOL');
	}
	else
	{
		$rdelete = cot_import('delete', 'G', 'BOL');
		cot_check_xg();
	}

	if ($rdelete)
	{
		cot_services_delete($id, $item);
		cot_redirect(cot_url('services', "c=" . $item['item_cat'], '', true));
	}
	
	/* === Hook === */
	foreach (cot_getextplugins('services.edit.update.import') as $pl)
	{
		include $pl;
	}
	/* ===== */

	cot_services_validate($ritem);

	/* === Hook === */
	foreach (cot_getextplugins('services.edit.update.error') as $pl)
	{
		include $pl;
	}
	/* ===== */

	if (!cot_error_found())
	{
		cot_services_update($id, $ritem, $usr);

		switch ($ritem['item_state'])
		{
			case 0:
				$urlparams = empty($ritem['item_alias']) ?
					array('c' => $ritem['item_cat'], 'id' => $id) :
					array('c' => $ritem['item_cat'], 'al' => $ritem['item_alias']);
				$r_url = cot_url('services', $urlparams, '', true);
				
				if (!$usr['isadmin'])
				{
					$rbody = cot_rc($L['services_added_mail_body'], array(
						'user_name' => $usr['profile']['user_name'],
						'serv_name' => $item['item_title'],
						'sitename' => $cfg['maintitle'],
						'link' => COT_ABSOLUTE_URL . $r_url
					));
					cot_mail($usr['profile']['user_email'], $L['services_added_mail_subj'], $rbody);
				}
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
						'serv_name' => $item['item_title'],
						'sitename' => $cfg['maintitle'],
						'link' => COT_ABSOLUTE_URL . $r_url
					));
					cot_mail($usr['profile']['user_email'], $L['services_senttovalidation_mail_subj'], $rbody);
				}

				if ($cfg['services']['notifservices_admin_moderate'])
				{
					$nbody = cot_rc($L['services_notif_admin_moderate_mail_body'], array( 
						'user_name' => $usr['profile']['user_name'],
						'serv_name' => $item['item_title'],
						'sitename' => $cfg['maintitle'],
						'link' => COT_ABSOLUTE_URL . $r_url
					));
					cot_mail($cfg['adminemail'], $L['services_notif_admin_moderate_mail_subj'], $nbody);
				}
				break;
		}
		cot_redirect($r_url);
	}
	else
	{
		cot_redirect(cot_url('services', "m=edit&id=$id", '', true));
	}
}

if ($a == 'public')
{
	$ritem = array();
	if($cfg['services']['prevalidate'])
	{
		$ritem['item_state'] = ($usr['isadmin']) ? 0 : 2;
	}
	else
	{
		$ritem['item_state'] = 0;
	}
	
	$urlparams = empty($item['item_alias']) ?
		array('c' => $item['item_cat'], 'id' => $id) :
		array('c' => $item['item_cat'], 'al' => $item['item_alias']);
	$r_url = cot_url('services', $urlparams, '', true);
	
	if(!$usr['isadmin'])
	{
		if($ritem['item_state'] == 2)
		{
			$rbody = cot_rc($L['services_senttovalidation_mail_body'], array( 
				'user_name' => $usr['profile']['user_name'],
				'serv_name' => $item['item_title'],
				'sitename' => $cfg['maintitle'],
				'link' => COT_ABSOLUTE_URL . $r_url
			));
			cot_mail($usr['profile']['user_email'], $L['services_senttovalidation_mail_subj'], $rbody);
		}
		else
		{
			$rbody = cot_rc($L['services_added_mail_body'], array(
				'user_name' => $usr['profile']['user_name'],
				'serv_name' => $item['item_title'],
				'sitename' => $cfg['maintitle'],
				'link' => COT_ABSOLUTE_URL . $r_url
			));
			cot_mail($usr['profile']['user_email'], $L['services_added_mail_subj'], $rbody);
		}
	}
	
	$db->update($db_services, $ritem, 'item_id = ?', $id);
	
	cot_services_sync($item['item_cat']);
	
	/* === Hook === */
	foreach (cot_getextplugins('services.edit.public') as $pl)
	{
		include $pl;
	}
	/* ===== */
	
	cot_redirect($r_url);
	exit;
}

if ($a == 'hide')
{
	$ritem = array();
	$ritem['item_state'] = 1;
	$db->update($db_services, $ritem, 'item_id = ?', $id);
	
	cot_services_sync($item['item_cat']);
	
	$urlparams = empty($item['item_alias']) ?
		array('c' => $item['item_cat'], 'id' => $id) :
		array('c' => $item['item_cat'], 'al' => $item['item_alias']);
	$r_url = cot_url('services', $urlparams, '', true);
	
	/* === Hook === */
	foreach (cot_getextplugins('services.edit.hide') as $pl)
	{
		include $pl;
	}
	/* ===== */
	
	cot_redirect($r_url);
	exit;
}

$out['subtitle'] = $L['services_edit_service_title'];
$out['head'] .= $R['code_noindex'];
$sys['sublocation'] = $structure['services'][$item['item_cat']]['title'];

$mskin = cot_tplfile(array('services', 'edit', $structure['services'][$item['item_cat']]['tpl']));

/* === Hook === */
foreach (cot_getextplugins('services.edit.main') as $pl)
{
	include $pl;
}
/* ===== */

$t = new XTemplate($mskin);

// Error and message handling
cot_display_messages($t);

$t->assign(array(
	"SERVEDIT_FORM_SEND" => cot_url('services', "m=edit&a=update&id=" . $item['item_id'] . "&r=" . $r),
	"SERVEDIT_FORM_ID" => $item['item_id'],
	"SERVEDIT_FORM_CAT" => cot_selectbox_structure('services', $item['item_cat'], 'rcat'),
	"SERVEDIT_FORM_CATTITLE" => $structure['services'][$item['item_cat']]['title'],
	"SERVEDIT_FORM_TITLE" => cot_inputbox('text', 'rtitle', $item['item_title'], 'size="56"'),
	'SERVEDIT_FORM_KEYWORDS' => cot_inputbox('text', 'rkeywords', $item['item_keywords'], array('size' => '32', 'maxlength' => '255')),
	'SERVEDIT_FORM_METATITLE' => cot_inputbox('text', 'rmetatitle', $item['item_metatitle'], array('size' => '64', 'maxlength' => '255')),
	'SERVEDIT_FORM_METADESC' => cot_textarea('rmetadesc', $item['item_metadesc'], 2, 64, array('maxlength' => '255')),
	"SERVEDIT_FORM_ALIAS" => cot_inputbox('text', 'ralias', $item['item_alias'], array('size' => '32', 'maxlength' => '255')),
	"SERVEDIT_FORM_TEXT" => cot_textarea('rtext', $item['item_text'], 10, 60, 'id="formtext"', ($serveditor && $serveditor != 'disable') ? 'input_textarea_'.$serveditor : ''),
	"SERVEDIT_FORM_COST" => cot_inputbox('text', 'rcost', $item['item_cost'], 'size="10"'),
	"SERVEDIT_FORM_STATE" => $item['item_state'],
	"SERVEDIT_FORM_PARSER" => cot_selectbox($item['item_parser'], 'rparser', cot_get_parsers(), cot_get_parsers(), false),
	"SERVEDIT_FORM_DELETE" => cot_radiobox(0, 'rdelete', array(1,0), array($L['Yes'], $L['No']))
)); 

// Extra fields
foreach($cot_extrafields[$db_services] as $exfld)
{
	$uname = strtoupper($exfld['field_name']);
	$exfld_val = cot_build_extrafields('ritem'.$exfld['field_name'], $exfld, $item['item_'.$exfld['field_name']]);
	$exfld_title = isset($L['services_'.$exfld['field_name'].'_title']) ?  $L['services_'.$exfld['field_name'].'_title'] : $exfld['field_description'];

	$t->assign(array(
		'SERVEDIT_FORM_'.$uname => $exfld_val,
		'SERVEDIT_FORM_'.$uname.'_TITLE' => $exfld_title,
		'SERVEDIT_FORM_EXTRAFLD' => $exfld_val,
		'SERVEDIT_FORM_EXTRAFLD_TITLE' => $exfld_title
	));
	$t->parse('MAIN.EXTRAFLD');
}

/* === Hook === */
foreach (cot_getextplugins('services.edit.tags') as $pl)
{
	include $pl;
}
/* ===== */
$t->parse('MAIN');
$module_body = $t->text('MAIN');
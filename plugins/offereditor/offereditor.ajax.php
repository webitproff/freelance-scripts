<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=ajax
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL.');

require_once cot_langfile('offereditor', 'plug');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin'], $usr['auth_offers']) = cot_auth('projects', 'any', 'RWA1');

$id = cot_import('id', 'G', 'INT');

$sql = $db->query("SELECT * FROM $db_projects_offers WHERE offer_id='$id' LIMIT 1");
cot_die($sql->rowCount() == 0);
$offer = $sql->fetch();

$sql = $db->query("SELECT * FROM $db_projects AS p 
	LEFT JOIN $db_users AS u ON u.user_id=p.item_userid
	WHERE item_id=".$offer['offer_pid']." LIMIT 1");
cot_die($sql->rowCount() == 0);
$item = $sql->fetch();

if($offer && ($usr['id'] == $offer['offer_userid'] || $usr['isadmin']))
{
	if($m == 'edit')
	{
		if ($a == 'update')
		{
			cot_shield_protect();

			/* === Hook === */
			foreach (cot_getextplugins('offereditor.edit.update.first') as $pl)
			{
				include $pl;
			}
			/* ===== */
			
			$roffer['offer_cost_min'] = (int)cot_import('costmin', 'P', 'NUM');
			$roffer['offer_cost_max'] = (int)cot_import('costmax', 'P', 'NUM');
			$roffer['offer_time_min'] = (int)cot_import('timemin', 'P', 'INT');
			$roffer['offer_time_max'] = (int)cot_import('timemax', 'P', 'INT');
			$roffer['offer_time_type'] = (int)cot_import('timetype', 'P', 'INT');
			$roffer['offer_hidden'] = (int)cot_import('hidden', 'P', 'BOL');
			$roffer['offer_text'] = cot_import('offertext', 'P', 'HTM');

			// Extra fields
			foreach ($cot_extrafields[$db_projects_offers] as $exfld)
			{
				$roffer['offer_'.$exfld['field_name']] = cot_import_extrafields('roffer'.$exfld['field_name'], $exfld, 'P', $roffer['offer_'.$exfld['field_name']]);
			}
			
			/* === Hook === */
			foreach (cot_getextplugins('projects.offers.add.import') as $pl)
			{
				include $pl;
			}
			/* ===== */
			
			cot_check(empty($roffer['offer_text']), $L['offers_empty_text']);

			/* === Hook === */
			foreach (cot_getextplugins('offereditor.edit.update.error') as $pl)
			{
				include $pl;
			}
			/* ===== */
			
			if (!cot_error_found())
			{
				$db->update($db_projects_offers, $roffer, "offer_id=".$id);

				$urlparams = empty($item['item_alias']) ?
					array('c' => $item['item_cat'], 'id' => $item['item_id']) :
					array('c' => $item['item_cat'], 'al' => $item['item_alias']);

				$rsubject = cot_rc($L['offereditor_edited_offer_header'], array('prtitle' => $item['item_title']));
				$rbody = cot_rc($L['offereditor_edited_offer_body'], array(
					'user_name' => $item['user_name'],
					'offeruser_name' => $usr['profile']['user_name'],
					'prj_name' => $item['item_title'],	
					'sitename' => $cfg['maintitle'],
					'link' => COT_ABSOLUTE_URL . cot_url('projects', $urlparams, '', true)
				));
				cot_mail ($item['user_email'], $rsubject, $rbody);

				if (cot_plugin_active('mavatars') && $cfg['plugin']['mavatarslance']['projects'])
				{
					require_once cot_incfile('mavatars', 'plug');

					if (!cot_error_found())
					{
						$mavatar = new mavatar('projectoffers', $offer['offer_pid'], $id);
						$mavatar->update();
						$mavatar->upload();	
					}
				}

				/* === Hook === */
				foreach (cot_getextplugins('offereditor.edit.update.done') as $pl)
				{
					include $pl;
				}
				/* ===== */

				cot_redirect(cot_url('projects', 'id=' . $offer['offer_pid'], '', true));
			}

			cot_redirect(cot_url('projects', 'id=' . $offer['offer_pid'], '#get-offers;r=offereditor&m=edit&id='.$id, true));
		}

		$t_o = new XTemplate(cot_tplfile(array('offereditor', 'edit'), 'plug'));

		$t_o->assign(array(
			"OFFER_FORM_ACTION_URL" => cot_url('index', 'r=offereditor&m=edit&id=' . $id . '&a=update'),
			"OFFER_FORM_COSTMIN" => cot_inputbox('text', 'costmin', $offer['offer_cost_min'], 'size="7"'),
			"OFFER_FORM_COSTMAX" => cot_inputbox('text', 'costmax', $offer['offer_cost_max'], 'size="7"'),
			"OFFER_FORM_TIMEMIN" => cot_inputbox('text', 'timemin', $offer['offer_time_min'], 'size="7"'),
			"OFFER_FORM_TIMEMAX" => cot_inputbox('text', 'timemax', $offer['offer_time_max'], 'size="7"'),
			"OFFER_FORM_TEXT" => cot_textarea('offertext', $offer['offer_text'], 7, 40),
			"OFFER_FORM_HIDDEN" =>  cot_checkbox($offer['offer_hidden'], 'hidden', $L['offers_hide_offer']),
			"OFFER_FORM_TIMETYPE" => cot_selectbox($offer['offer_time_type'], 'timetype', array_keys($L['offers_timetype']), array_values($L['offers_timetype']), false),
		));

		// Extra fields
		foreach($cot_extrafields[$db_projects_offers] as $exfld)
		{
			$uname = strtoupper($exfld['field_name']);
			$exfld_val = cot_build_extrafields('roffer'.$exfld['field_name'], $exfld, $roffer['offer_'.$exfld['field_name']]);
			$exfld_title = isset($L['offers_'.$exfld['field_name'].'_title']) ?  $L['offers_'.$exfld['field_name'].'_title'] : $exfld['field_description'];
			$t_o->assign(array(
				'OFFER_FORM_'.$uname => $exfld_val,
				'OFFER_FORM_'.$uname.'_TITLE' => $exfld_title,
				'OFFER_FORM_EXTRAFLD' => $exfld_val,
				'OFFER_FORM_EXTRAFLD_TITLE' => $exfld_title
				));
			$t_o->parse('MAIN.EXTRAFLD');
		}

		if (cot_plugin_active('mavatars') && $cfg['plugin']['mavatarslance']['projects'])
		{
			require_once cot_incfile('mavatars', 'plug');
			
			$mavatar = new mavatar('projectoffers', $offer['offer_pid'], '', 'edit');
			
			$t_o->assign('OFFER_FORM_MAVATAR', $mavatar->upload_form());
		}
		
		/* === Hook === */
		foreach (cot_getextplugins('offereditor.edit.tags') as $pl)
		{
			include $pl;
		}
		/* ===== */

		$t_o->parse('MAIN');
		echo $t_o->text('MAIN');
	}

	if($m == 'cancel')
	{
		cot_check_xg();

		$db->update($db_projects_offers, array('offer_status' => 'canceled'), "offer_id=".$id);

		$urlparams = empty($item['item_alias']) ?
			array('c' => $item['item_cat'], 'id' => $item['item_id']) :
			array('c' => $item['item_cat'], 'al' => $item['item_alias']);

		$rsubject = cot_rc($L['offereditor_canceled_offer_header'], array('prtitle' => $item['item_title']));
		$rbody = cot_rc($L['offereditor_canceled_offer_body'], array(
			'user_name' => $item['user_name'],
			'offeruser_name' => $usr['profile']['user_name'],
			'prj_name' => $item['item_title'],	
			'sitename' => $cfg['maintitle'],
			'link' => COT_ABSOLUTE_URL . cot_url('projects', $urlparams, '', true)
		));
		cot_mail ($item['user_email'], $rsubject, $rbody);

		/* === Hook === */
		foreach (cot_getextplugins('offereditor.cancel.done') as $pl)
		{
			include $pl;
		}
		/* ===== */

		cot_redirect(cot_url('projects', 'id=' . $offer['offer_pid'], '', true));
	}

	if($m == 'restore')
	{
		cot_check_xg();

		$db->update($db_projects_offers, array('offer_status' => ''), "offer_id=".$id);

		$urlparams = empty($item['item_alias']) ?
			array('c' => $item['item_cat'], 'id' => $item['item_id']) :
			array('c' => $item['item_cat'], 'al' => $item['item_alias']);

		$rsubject = cot_rc($L['offereditor_restored_offer_header'], array('prtitle' => $item['item_title']));
		$rbody = cot_rc($L['offereditor_restored_offer_body'], array(
			'user_name' => $item['user_name'],
			'offeruser_name' => $usr['profile']['user_name'],
			'prj_name' => $item['item_title'],	
			'sitename' => $cfg['maintitle'],
			'link' => COT_ABSOLUTE_URL . cot_url('projects', $urlparams, '', true)
		));
		cot_mail ($item['user_email'], $rsubject, $rbody);

		/* === Hook === */
		foreach (cot_getextplugins('offereditor.restore.done') as $pl)
		{
			include $pl;
		}
		/* ===== */

		cot_redirect(cot_url('projects', 'id=' . $offer['offer_pid'], '', true));
	}

	if($m == 'delete')
	{
		cot_check_xg();

		$db->delete($db_projects_offers, "offer_id=".$id);

		$offerscount = $db->query("SELECT COUNT(*) FROM $db_projects_offers WHERE offer_pid=" . (int)$offer['offer_pid'] . "")->fetchColumn();
		$db->update($db_projects, array("item_offerscount" => (int)$offerscount), "item_id=" . (int)$offer['offer_pid']);

		/* === Hook === */
		foreach (cot_getextplugins('offereditor.delete.done') as $pl)
		{
			include $pl;
		}
		/* ===== */

		cot_redirect(cot_url('projects', 'id=' . $offer['offer_pid'], '', true));
	}
}
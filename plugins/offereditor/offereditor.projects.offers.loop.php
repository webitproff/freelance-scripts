<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=projects.offers.loop
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL.');

require_once cot_langfile('offereditor', 'plug');

if($usr['id'] == $offer['offer_userid'] || $usr['isadmin'])
{
	$t_o->assign(array(
		"OFFER_ROW_OFFEREDITOR_EDIT_URL" => cot_url('index', 'r=offereditor&m=edit&id='.$offer['offer_id']),
		"OFFER_ROW_OFFEREDITOR_CANCEL_URL" => cot_url('index', 'r=offereditor&m=cancel&id='.$offer['offer_id'].'&'.cot_xg()),
		"OFFER_ROW_OFFEREDITOR_RESTORE_URL" => cot_url('index', 'r=offereditor&m=restore&id='.$offer['offer_id'].'&'.cot_xg()),
		"OFFER_ROW_OFFEREDITOR_DELETE_URL" => cot_url('index', 'r=offereditor&m=delete&id='.$offer['offer_id'].'&'.cot_xg()),
		"OFFER_ROW_STATUS" => $offer['offer_status'],
	));
}

$t_o->assign(array(
	"OFFER_ROW_STATUS" => $offer['offer_status'],
));
<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=services.add.tags,services.edit.tags
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL.');

// ==============================================
if ((int) $id > 0)
{
	$t->assign(array(
		"SERVEDIT_FORM_LOCATION" => cot_select_location($item['item_country'], $item['item_region'], $item['item_city'])
	)); 
}
else
{
	$t->assign(array(
		"SERVADD_FORM_LOCATION" => cot_select_location($ritem['item_country'], $ritem['item_region'], $ritem['item_city'], true)
	));
}

// ==============================================


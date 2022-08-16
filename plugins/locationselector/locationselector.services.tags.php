<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=services.list.tags,services.admin.list.tags
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL.');

// ==============================================
$t->assign(array(
	"SEARCH_LOCATION" => cot_select_location($location['country'], $location['region'], $location['city']),
));

// ==============================================


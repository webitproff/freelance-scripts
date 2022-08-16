<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=services.main
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL.');

$location_info = cot_getlocation($item['item_country'], $item['item_region'], $item['item_city']);
$out['subtitle'] .= (!empty($location_info['country'])) ? ' - ' . $location_info['country'] : '';
$out['subtitle'] .= (!empty($location_info['region'])) ? ' - ' . $location_info['region'] : '';
$out['subtitle'] .= (!empty($location_info['city'])) ? ' - ' . $location_info['city'] : '';


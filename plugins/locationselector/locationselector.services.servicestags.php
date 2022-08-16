<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=servicestags.main
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL.');

$location_info = cot_getlocation($item_data['item_country'], $item_data['item_region'], $item_data['item_city']);
$temp_array['COUNTRY'] = $location_info['country'];
$temp_array['REGION'] = $location_info['region'];
$temp_array['CITY'] = $location_info['city'];

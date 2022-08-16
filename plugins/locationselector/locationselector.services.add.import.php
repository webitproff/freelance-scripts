<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=services.add.add.import,services.edit.update.import
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL.');

$location = cot_import_location();
$ritem['item_country'] = $location['country'];
$ritem['item_region'] = $location['region'];
$ritem['item_city'] = $location['city'];


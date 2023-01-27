<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=rc
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL.');

cot_rc_add_file('https://maps.googleapis.com/maps/api/js?v=3.exp&key=' . $cfg['plugin']['prdmap']['apikey']);

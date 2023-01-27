<?php
/**
 * [BEGIN_COT_EXT]
 * Hooks=admin.structure.first
 * [END_COT_EXT]
 */

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('services', 'module');
$extension_structure[] = 'services';

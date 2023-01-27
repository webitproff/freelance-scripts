<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=admin.extrafields.first
  [END_COT_EXT]
  ==================== */

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('services', 'module');
$extra_whitelist[$db_services] = array(
	'name' => $db_services,
	'caption' => $L['Module'].' services',
	'type' => 'module',
	'code' => 'services',
	'tags' => array(
		'services.list.tpl' => '{SERV_ROW_XXXXX}, {SERV_ROW_XXXXX_TITLE}',
		'services.tpl' => '{SERV_XXXXX}, {SERV_XXXXX_TITLE}',
		'services.add.tpl' => '{SERVADD_FORM_XXXXX}, {SERVADD_FORM_XXXXX_TITLE}',
		'services.edit.tpl' => '{SERVEDIT_FORM_XXXXX}, {SERVEDIT_FORM_XXXXX_TITLE}',
	)
);

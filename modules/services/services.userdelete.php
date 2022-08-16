<?php

/* ====================
  [BEGIN_COT_EXT]
 * Hooks=users.edit.update.delete
  [END_COT_EXT]
  ==================== */

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL');
require_once cot_incfile('services', 'module');

$db->update($db_services, array('item_state' => -1), "item_userid='" . $urr['user_id'] . "'");

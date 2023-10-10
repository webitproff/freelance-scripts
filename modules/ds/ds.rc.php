<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=rc
 * Order=99
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL.');

if($_SERVER['SCRIPT_NAME'] != '/admin.php') {
  if ($cfg['ds']['sound']) {
    cot_rc_link_file($cfg['modules_dir'] . '/ds/js/ion.sound.min.js');
  }
  cot_rc_link_file($cfg['modules_dir'] . '/ds/js/ajaxcheck.js');
  cot_rc_link_file($cfg['modules_dir'] . '/ds/js/ds.ajax.js');
}

cot_rc_link_file($cfg['modules_dir'] . '/ds/tpl/ds.css');
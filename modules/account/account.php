<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=module
  [END_COT_EXT]
  ==================== */

/**
 * Account module main
 *
 * @package account
 * @version 1.0.0
 * @author 
 * @copyright Copyright (c)
 * @license BSD
 */
defined('COT_CODE') or die('Wrong URL.');

// Environment setup
define('COT_ACCOUNT', TRUE);
$env['location'] = 'account';

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('account', 'any');
cot_block($usr['auth_write']);

require_once cot_incfile('account', 'module');

// Self requirements
require_once cot_incfile('extrafields');

$userid = cot_import('userid', 'G', 'INT');
if (!empty($userid)) {
    cot_block($id == $usr['id'] || $usr['isadmin']);
    $urr = $db->query("SELECT * FROM $db_users WHERE user_id='" . $userid . "' LIMIT 1")->fetch();
} else {
    $urr = $db->query("SELECT * FROM $db_users WHERE user_id='" . $usr['id'] . "' LIMIT 1")->fetch();
}

$out['desc'] = '';
$out['subtitle'] = $L['account_account'];

if (empty($m))
    $m = 'default';

require_once $cfg['system_dir'] . '/header.php';

$mskin = cot_tplfile(array('account'));
$t = new XTemplate($mskin);

$catpatharray[] = array(cot_url('account'), $L['account_account']);
$catpath = cot_breadcrumbs_uk($catpatharray, $cfg['homebreadcrumb'], true);

$t->assign(array(
    'ACCOUNT_TITLE' => $L['account_account'],
    'BREADCRUMBS' => $catpath,
));



/* === Hook === */
foreach (cot_getextplugins('account.include') as $pl) {
    include $pl;
}
/* ===== */

foreach ($accountmenu as $mid => $menu) {
    $t->assign(array(
        'MENU_ROW_ID' => $mid,
        'MENU_ROW_TITLE' => $menu['title'],
        'MENU_ROW_URL' => $menu['url'],
    ));
    $t->parse('MAIN.MENU.MENU_ROW');
}
$t->parse('MAIN.MENU');


$t->parse('MAIN');
$t->out('MAIN');

require_once $cfg['system_dir'] . '/footer.php';

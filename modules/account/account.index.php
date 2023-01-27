<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=account.include
 * Order=1
 * [END_COT_EXT]
 */
defined('COT_CODE') or die('Wrong URL.');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('account', 'any');
cot_block($usr['auth_write']);

require_once cot_incfile('account', 'module');
require_once cot_incfile('users', 'module');
require_once cot_incfile('payments', 'module');

$accountmenu['default']['title'] = $L['account_home'];
$accountmenu['default']['url'] = cot_url('account');

if ($m == 'default') {
    $t1 = new XTemplate(cot_tplfile(array('account', 'home'), 'module'));



    $usr_tags = cot_generate_usertags(cot_user_data($usr["id"]), 'ACCOUNT_USER_');
    $t1->assign($usr_tags);
            
    $t1->assign(array(
        'ACCOUNT_BALANCE_SUMM' => cot_payments_getuserbalance($usr['id']),
        'ACCOUNT_USER_PRO' => cot_build_timegap(time(), $usr_tags["ACCOUNT_USER_ISPRO"]),
        'ACCOUNT_USER_PROEXPIRE'=> $upro,
		'ACCOUNT_USER_PMREMINDER' => cot_rc_link(cot_url('ds'), $out['pmreminder'], array('id' => 'dscountnewmsgs')),
        'ACCOUNT_BALANCE_URL' => cot_url('payments', 'm=balance'),
        'ACCOUNT_BALANCE_PAYIN_URL' => cot_url('payments', 'm=balance&n=billing'),
    ));
	$t1->assign(array(
		'ACCOUNT_TITLE' => $L['account_account'],
	));
    /* === Hook === */
    foreach (cot_getextplugins('home.account.tags') as $pl) {
        include $pl;
    }
    /* ===== */

    $t1->parse('MAIN');
    $t->assign('ACCOUNT_CONTENT', $t1->text('MAIN'));
}
?>
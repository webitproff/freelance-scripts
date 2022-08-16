<?php
/* ====================
[BEGIN_COT_EXT]
Code=serviceredir
Hooks=users.auth.check.done
[END_COT_EXT]
==================== */
defined('COT_CODE') or die('Wrong URL');

if ($_COOKIE['serviceredir'] != $cfg['plugin']['serviceredir']['id'] || $cfg['plugin']['serviceredir']['id'] == 0)
{
	$redirect = base64_encode(trim($cfg['plugin']['serviceredir']['url'], "\r\n\t "));
	cot_setcookie('serviceredir', $cfg['plugin']['serviceredir']['id'], time() + $cfg['cookielifetime'],
	$cfg['cookiepath'], $cfg['cookiedomain'], $sys['secure'], true);
}
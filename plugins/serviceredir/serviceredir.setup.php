<?php
/* ====================
[BEGIN_COT_EXT]
Code=serviceredir
Name=Service Page Redirect
Description=Redirects user to service page on login
Version=0.1
Date=2009-nov-21
Author=Trustmaster, CrazyFreeMan
Copyright=
Notes=
Auth_guests=R
Lock_guests=W12345A
Auth_members=RW
Lock_members=12345A
[END_COT_EXT]
[BEGIN_COT_EXT_CONFIG]
url=01:string::index.php:Relative URL to redirect (index.php?e=users&m=profile)
id=02:string::1:Message ID. Change it every time you change your service page. Or set to 0 for constant redirect
[END_COT_EXT_CONFIG]
==================== */
defined('COT_CODE') or die('Wrong URL');
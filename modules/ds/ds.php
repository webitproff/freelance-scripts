<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=module
[END_COT_EXT]
==================== */

/**
 * Dialog System main
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad (http://cmsworks.ru/users/alexvlad)
 */

defined('COT_CODE') or die('Wrong URL.');

define('COT_DS', true);
$env['location'] = 'dialogs';

require_once cot_incfile('extrafields');
require_once cot_incfile('users', 'module');
require_once cot_incfile('uploads');

require_once cot_incfile('ds', 'module');
require_once cot_langfile('ds', 'module');

if (!in_array($m, array('send', 'dialog', 'ajax', 'count')))
{
	$m = 'list';
}

require_once cot_incfile('ds', 'module', $m);
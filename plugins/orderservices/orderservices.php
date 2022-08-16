<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=standalone
 * [END_COT_EXT]
 */

/**
 * orderservices plugin
 */

defined('COT_CODE') && defined('COT_PLUG') or die('Wrong URL');

require_once cot_incfile('orderservices', 'plug');
require_once cot_incfile('services', 'module');
require_once cot_incfile('payments', 'module');
require_once cot_incfile('extrafields');

// Mode choice
if (!in_array($m, array('sales', 'purchases', 'addclaim', 'pay')))
{
	if (isset($_GET['id']))
	{
		$m = 'order';
	}
	else
	{
		$m = 'neworder';
	}
}

require_once cot_incfile('orderservices', 'plug', $m);

?>

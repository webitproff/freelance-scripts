<?php

/* ====================
  [BEGIN_COT_EXT]
 * Hooks=standalone
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') && defined('COT_PLUG') or die('Wrong URL');

require_once cot_incfile('forms');
require_once cot_incfile('easypay', 'plug');

$code = cot_import('code', 'G', 'ALP');

$easypay_cfg = cot_cfg_easypay();
	
if (empty($easypay_cfg[$code]))
{
	cot_block();
}

list($auth_read, $auth_write, $auth_admin) = cot_auth('plug', 'easypay');
cot_block($auth_read);

if ($a == 'buy')
{
	$cost = cot_import('rcost', 'P', 'NUM');
	$email = cot_import('remail', 'P','TXT', 100, TRUE);
	
	cot_check(empty($cost), 'easypay_error_cost', 'rcost');
	
	if (!cot_check_email($email) && $usr['id'] == 0)	cot_error('aut_emailtooshort', 'remail');
	
	if (!cot_error_found())
	{
		if($easypay_cfg[$code]['cost'] > 0 && $easypay_cfg[$code]['cost'] != $cost) $cost = $easypay_cfg[$code]['cost'];
		
		$options['desc'] = ($usr['id'] == 0) ? $easypay_cfg[$code]['name'].' ('.$email.')' : $easypay_cfg[$code]['name'];
		$options['email'] = (!empty($email)) ? $email : '';
		
		cot_payments_create_order('easypay.'.$code, $cost, $options);
	}
}

$t = new XTemplate(cot_tplfile(array('easypay', $code), 'plug'));

cot_display_messages($t);

$t->assign(array(
	'EASYPAY_FORM_ACTION' => cot_url('plug', 'e=easypay&a=buy&code='.$code),
	'EASYPAY_FORM_COST' => ($easypay_cfg[$code]['cost'] > 0) ? $easypay_cfg[$code]['cost'] . cot_inputbox('hidden', 'rcost', $easypay_cfg[$code]['cost']) : cot_inputbox('text', 'rcost', 0),
	'EASYPAY_FORM_NAME' => $easypay_cfg[$code]['name'],
	'EASYPAY_FORM_EMAIL' => cot_inputbox('text', 'remail', ''),
));

?>
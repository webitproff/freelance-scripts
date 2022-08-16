<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=global
 * [END_COT_EXT]
 */
defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('paypro', 'plug');
require_once cot_incfile('payments', 'module');

// Проверяем платежки на оплату услуги PRO. Если есть то включаем услугу или продлеваем ее.
if ($propays = cot_payments_getallpays('pro', 'paid'))
{
	foreach ($propays as $pay)
	{	
		$userid = (!empty($pay['pay_code'])) ? $pay['pay_code'] : $pay['pay_userid'];
		$upro = cot_getuserpro($userid);
		$initialtime = ($upro > $sys['now']) ? $upro : $sys['now'];
		$rproexpire = $initialtime + $pay['pay_time'];

		if (cot_payments_updatestatus($pay['pay_id'], 'done'))
		{
			$db->update($db_users,  array('user_pro' => (int)$rproexpire), "user_id=".(int)$userid);
				$context = array(
					'sitetitle' => $cfg["maintitle"],
					'siteurl' => $cfg['mainurl'],
				);
// Отправляем покупателю услуги PRO уведомление о покупке ПРО. Через SMTP  в спам не летит			
					$rbody = cot_rc($L['paypro_mail_body_user'], $context);
					cot_mail($usr['profile']['user_email'], $L['paypro_mail_subject_user'], $rbody);
// Отправляем покупателю услуги PRO уведомление о покупке ПРО. Через SMTP  в спам не летит	
					$nbody = cot_rc($L['paypro_mail_body_admin'], $context);
					cot_mail($cfg['adminemail'], $L['paypro_buypro_paydesc'], $nbody);
					cot_log("Pro for register");
			/* === Hook === */
			foreach (cot_getextplugins('paypro.done') as $pl)
			{
				include $pl;
			}
			/* ===== */
		}
	}
}

?>
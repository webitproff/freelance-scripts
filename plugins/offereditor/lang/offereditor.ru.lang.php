<?php

defined('COT_CODE') or die('Wrong URL.');

$L['offereditor_edit'] = 'Редактировать предложение';
$L['offereditor_cancel'] = 'Отказаться от проекта';
$L['offereditor_delete'] = 'Удалить предложение';

$L['offereditor_edit_title'] = 'Редактирование предложения';

$L['offereditor_status_canceled'] = 'Предложение отменено!';

$L['offereditor_edited_offer_header'] = 'Предложение по проекту «{$prtitle}» отредактировано';
$L['offereditor_edited_offer_body'] = 'Здравствуйте, {$user_name}. '."\n\n".'Пользователь {$offeruser_name} изменил свое предложение по проекту «{$prj_name}».'."\n\n".'{$link}';

$L['offereditor_canceled_offer_header'] = 'Предложение по проекту «{$prtitle}» отменено';
$L['offereditor_canceled_offer_body'] = 'Здравствуйте, {$user_name}. '."\n\n".'Пользователь {$offeruser_name} отказался от участия в проекте «{$prj_name}».'."\n\n".'{$link}';

$L['offereditor_restored_offer_header'] = 'Предложение по проекту «{$prtitle}» восстановлено';
$L['offereditor_restored_offer_body'] = 'Здравствуйте, {$user_name}. '."\n\n".'Пользователь {$offeruser_name} восстановил свое предложение по проекте «{$prj_name}».'."\n\n".'{$link}';
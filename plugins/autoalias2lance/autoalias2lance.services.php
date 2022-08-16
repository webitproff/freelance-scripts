<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=services.add.add.done,services.edit.update.done
[END_COT_EXT]
==================== */



defined('COT_CODE') or die('Wrong URL');

if($cfg['plugin']['autoalias2lance']['fl_services_alias']){

	if (empty($ritem['item_alias']))
	{
		require_once cot_incfile('autoalias2lance', 'plug');
		$ritem['item_alias'] = autoalias2lance_update($ritem['item_title'], $id, 'services');
	}
}
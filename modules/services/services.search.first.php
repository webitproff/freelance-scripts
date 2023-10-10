<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=search.first
 * [END_COT_EXT]
 */

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL.');

if ($cfg['services']['servicessearch'])
{
	$rs['servicestitle'] = cot_import($rs['servicestitle'], 'D', 'INT');
	$rs['servicestext'] = cot_import($rs['servicestext'], 'D', 'INT');
	$rs['servicessort'] = cot_import($rs['servicessort'], 'D', 'ALP');
	$rs['servicessort'] = (empty($rs['servicessort'])) ? 'date' : $rs['servicessort'];
	$rs['servicessort2'] = (cot_import($rs['servicessort2'], 'D', 'ALP') == 'DESC') ? 'DESC' : 'ASC';
	$rs['servicessub'] = cot_import($rs['servicessub'], 'D', 'ARR');
	$rs['servicessubcat'] = cot_import($rs['servicessubcat'], 'D', 'BOL') ? 1 : 0;

	if ($rs['servicestitle'] < 1 && $rs['servicestext'] < 1)
	{
		$rs['servicestitle'] = 1;
		$rs['servicestext'] = 1;
	}

	if (($tab == 'services' || empty($tab)) && cot_module_active('services'))
	{
		require_once cot_incfile('services', 'module');

		// Making the category list
		$services_cat_list['all'] = $L['plu_allcategories'];
		foreach ($structure['services'] as $cat => $x)
		{
			if ($cat != 'all' && $cat != 'system' && cot_auth('services', $cat, 'R') && $x['group'] == 0)
			{
				$services_cat_list[$cat] = $x['tpath'];
				$services_catauth[] = $db->prep($cat);
			}
		}
		if ($rs['servicessub'][0] == 'all' || !is_array($rs['servicessub']))
		{
			$rs['servicessub'] = array();
			$rs['servicessub'][] = 'all';
		}

		/* === Hook === */
		foreach (cot_getextplugins('services.search.catlist') as $pl)
		{
			include $pl;
		}
		/* ===== */

		$t->assign(array(
			'PLUGIN_SERVICES_SEC_LIST' => cot_selectbox($rs['servicessub'], 'rs[servicessub][]', array_keys($services_cat_list), array_values($services_cat_list), false, 'multiple="multiple"'),
			'PLUGIN_SERVICES_RES_SORT' => cot_selectbox($rs['servicessort'], 'rs[servicessort]', array('date', 'title', 'count', 'cat'), array($L['plu_services_res_sort1'], $L['plu_services_res_sort2'], $L['plu_services_res_sort3'], $L['plu_services_res_sort4']), false),
			'PLUGIN_SERVICES_RES_SORT_WAY' => cot_radiobox($rs['servicessort2'], 'rs[servicessort2]', array('DESC', 'ASC'), array($L['plu_sort_desc'], $L['plu_sort_asc'])),
			'PLUGIN_SERVICES_SEARCH_NAMES' => cot_checkbox(($rs['servicestitle'] == 1 || count($rs['servicessub']) == 0), 'rs[servicestitle]', $L['plu_services_search_names']),
			'PLUGIN_SERVICES_SEARCH_TEXT' => cot_checkbox(($rs['servicestext'] == 1 || count($rs['servicessub']) == 0), 'rs[servicestext]', $L['plu_services_search_text']),
			'PLUGIN_SERVICES_SEARCH_SUBCAT' => cot_checkbox($rs['servicessubcat'], 'rs[servicessubcat]', $L['plu_services_set_subsec']),
		));
		if ($tab == 'services' || (empty($tab) && $cfg['plugin']['search']['extrafilters']))
		{
			$t->parse('MAIN.SERVICES_OPTIONS');
		}
	}
}
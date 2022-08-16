<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=sitemap.main
 * [END_COT_EXT]
 */

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL.');

if ($cfg['services']['servicessitemap'])
{
	
	// Sitemap for services module
	require_once cot_incfile('services', 'module');

	// Projects categories
	$auth_cache = array();

	$category_list = $structure['services'];

	/* === Hook === */
	foreach (cot_getextplugins('services.sitemap.categorylist') as $pl)
	{
		include $pl;
	}
	/* ===== */

	foreach ($category_list as $c => $cat)
	{
		$auth_cache[$c] = cot_auth('services', $c, 'R');
		if (!$auth_cache[$c]) continue;

		sitemap_parse($t, $items, array(
			'url'  => cot_url('services', "c=$c"),
			'date' => '', // omit
			'freq' => $cfg['services']['servicessitemap_freq'],
			'prio' => $cfg['services']['servicessitemap_prio']
		));
	}

	// Projects
	$sitemap_join_columns = '';
	$sitemap_join_tables = '';
	$sitemap_where = array();
	$sitemap_where['state'] = 'item_state = 0';

	/* === Hook === */
	foreach (cot_getextplugins('services.sitemap.query') as $pl)
	{
		include $pl;
	}
	/* ===== */

	$sitemap_where = count($sitemap_where) > 0 ? 'WHERE ' . join(' AND ', $sitemap_where) : '';
	$res = $db->query("SELECT m.item_id, m.item_alias, m.item_cat $sitemap_join_columns
		FROM $db_services AS m $sitemap_join_tables
		$sitemap_where
		ORDER BY m.item_cat, m.item_id");
	foreach ($res->fetchAll() as $row)
	{
		if (!$auth_cache[$row['item_cat']]) continue;
		$urlp = array('c' => $row['item_cat']);
		if(!empty($row['item_alias'])){
			$urlp['al'] = $row['item_alias'];
		}else{
			$urlp['id'] = $row['item_id'];
		}
		sitemap_parse($t, $items, array(
			'url'  => cot_url('services', $urlp),
			'date' => $row['item_date'],
			'freq' => $cfg['services']['servicessitemap_freq'],
			'prio' => $cfg['services']['servicessitemap_prio']
		));
	}
}
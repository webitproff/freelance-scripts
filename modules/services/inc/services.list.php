<?php

/**
 * services module
 */

$sort = cot_import('sort', 'G', 'ALP');
$c = cot_import('c', 'G', 'ALP');
$sq = cot_import('sq', 'G', 'TXT');
$sq = $db->prep($sq);

if (!empty($c)){
	list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('services', $c);
	cot_block($usr['auth_read']);
}else{
	list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('services', 'any', 'RWA');
	cot_block($usr['auth_read']);
}

$maxrowsperpage = ($cfg['services']['cat_' . $c]['maxrowsperpage']) ? $cfg['services']['cat_' . $c]['maxrowsperpage'] : $cfg['services']['cat___default']['maxrowsperpage'];
list($pn, $d, $d_url) = cot_import_pagenav('d', $maxrowsperpage);

/* === Hook === */
foreach (cot_getextplugins('services.list.first') as $pl)
{
	include $pl;
}
/* ===== */

if (!empty($c))
{
	$out['subtitle'] = (!empty($cfg['services']['cat_' . $c]['metatitle'])) ? $cfg['services']['cat_' . $c]['metatitle'] : $cfg['services']['cat___default']['metatitle'];
	$out['subtitle'] = (!empty($out['subtitle'])) ? $out['subtitle'] : $L['services_title'];
	$out['desc'] = (!empty($cfg['services']['cat_' . $c]['metadesc'])) ? $cfg['services']['cat_' . $c]['metadesc'] : $cfg['services']['cat___default']['metadesc'];
	$out['keywords'] = (!empty($cfg['services']['cat_' . $c]['keywords'])) ? $cfg['services']['cat_' . $c]['keywords'] : $cfg['services']['cat___default']['keywords'];
}
else
{
	$out['subtitle'] = (!empty($cfg['services']['cat___default']['metatitle'])) ? $cfg['services']['cat___default']['metatitle'] : $L['services_title'];
	$out['desc'] = $cfg['services']['cat___default']['metadesc'];
	$out['keywords'] = $cfg['services']['cat___default']['keywords'];
}

$where = array();
$order = array();

$where['state'] = "item_state=0";

if (!empty($c))
{
	$catsub = cot_structure_children('services', $c);
	$where['cat'] = "item_cat IN ('" . implode("','", $catsub) . "')";
}

if (!empty($sq))
{
	$words = explode(' ', preg_replace("'\s+'", " ", $sq));
	$sqlsearch = '%'.implode('%', $words).'%';

	$where['search'] = "(item_title LIKE '".$db->prep($sqlsearch)."' OR item_text LIKE '".$db->prep($sqlsearch)."')";
}

// Extra fields
foreach ($cot_extrafields[$db_services] as $exfld)
{
	$fld_value = cot_import($exfld['field_name'], 'G', 'TXT');
	$fld_value = $db->prep($fld_value);
	
	if(!empty($shfld[$exfld['field_name']]))
	{
		$where[$exfld['field_name']] = "item_".$exfld['field_name']." LIKE '%".$fld_value."%'";
	}
}

switch($sort)
{
	case 'costasc':
		$order['cost'] = 'item_cost ASC';
		break;
	
	case 'costdesc':
		$order['cost'] = 'item_cost DESC';
		break;
	
	default:
		$order['date'] = 'item_date DESC';
		break;
}

$list_url_path = array('c' => $c, 'sort' => $sort, 'sq' => $sq);

// Building the canonical URL
$out['canonical_uri'] = cot_url('services', $list_url_path);

$mskin = cot_tplfile(array('services', 'list', $structure['services'][$c]['tpl']));

/* === Hook === */
foreach (cot_getextplugins('services.list.query') as $pl)
{
	include $pl;
}
/* ===== */

$t = new XTemplate($mskin);

$where = ($where) ? 'WHERE ' . implode(' AND ', $where) : '';
$order = ($order) ? 'ORDER BY ' . implode(', ', $order) : '';

$totalitems = $db->query("SELECT COUNT(*) FROM $db_services AS m $join_condition 
	LEFT JOIN $db_users AS u ON u.user_id=m.item_userid
	" . $where . "")->fetchColumn();

$sqllist = $db->query("SELECT m.*, u.* $join_columns 
	FROM $db_services AS m $join_condition
	LEFT JOIN $db_users AS u ON u.user_id=m.item_userid 
	" . $where . "
	" . $order . "
	LIMIT $d, " . $maxrowsperpage);

$pagenav = cot_pagenav('services', $list_url_path, $d, $totalitems, $maxrowsperpage);

$catpatharray[] = array(cot_url('services'), $L['services_title']);

if(!empty($c))
{
	$catpatharray = array_merge($catpatharray, cot_structure_buildpath('services', $c));
}

$catpath = cot_breadcrumbs($catpatharray, $cfg['homebreadcrumb'], true);

$t->assign(array(
	"SEARCH_ACTION_URL" => cot_url('services', '', '', true),
	"SEARCH_SQ" => cot_inputbox('text', 'sq', htmlspecialchars($sq), 'class="schstring"'),
	"SEARCH_CAT" => cot_services_selectcat($c, 'c'),
	"SEARCH_SORTER" => cot_selectbox($sort, "sort", array('', 'costasc', 'costdesc'), array($L['services_mostrelevant'], $L['services_costasc'], $L['services_costdesc']), false),
	"PAGENAV_PAGES" => $pagenav['main'],
	"PAGENAV_PREV" => $pagenav['prev'],
	"PAGENAV_NEXT" => $pagenav['next'],
	"PAGENAV_COUNT" => $totalitems,
	"CATALOG" => cot_build_structure_services_tree('', array($c), 0),
	"BREADCRUMBS" => $catpath,
));

foreach($cot_extrafields[$db_services] as $exfld)
{
	$fld_value = cot_import($exfld['field_name'], 'G', 'TXT');
	$fld_value = $db->prep($fld_value);

	$fieldname = strtoupper($exfld['field_name']);
	$exfld_val = cot_build_extrafields($exfld['field_name'], $exfld, $fld_value);
	$exfld_title = isset($L['services_'.$exfld['field_name'].'_title']) ?  $L['services_'.$exfld['field_name'].'_title'] : $exfld['field_description'];
	$t->assign(array(
		'SEARCH_'.$fieldname => $exfld_val,
		'SEARCH_'.$fieldname.'_TITLE' => $exfld_title,
	));
}

/* === Hook === */
foreach (cot_getextplugins('services.list.search.tags') as $pl)
{
	include $pl;
}
/* ===== */

if(!empty($c) && is_array($structure['services'][$c]))
{
	foreach ($structure['services'][$c] as $field => $val)
	{
		$t->assign('CAT'.strtoupper($field), $val);
	}
}

$sqllist_rowset = $sqllist->fetchAll();
$sqllist_idset = array();
foreach($sqllist_rowset as $item)
{
	$sqllist_idset[$item['item_id']] = $item['item_alias'];
}

/* === Hook === */
$extp = cot_getextplugins('services.list.loop');
/* ===== */

foreach ($sqllist_rowset as $item)
{
	$jj++;
	$t->assign(cot_generate_usertags($item, 'SERV_ROW_OWNER_'));

	$t->assign(cot_generate_servicestags($item, 'SERV_ROW_', $cfg['services']['shorttextlen'], $usr['isadmin'], $cfg['homebreadcrumb']));
	$t->assign(array(
		"SERV_ROW_ODDEVEN" => cot_build_oddeven($jj),
	));

	/* === Hook - Part2 : Include === */
	foreach ($extp as $pl)
	{
		include $pl;
	}
	/* ===== */

	$t->parse("MAIN.SERV_ROWS");
}
/* === Hook === */
foreach (cot_getextplugins('services.list.tags') as $pl)
{
	include $pl;
}
/* ===== */

$t->parse('MAIN');
$module_body = $t->text('MAIN');


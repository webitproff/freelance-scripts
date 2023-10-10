<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=users.details.tags
 * [END_COT_EXT]
 */

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL');
require_once cot_incfile('services', 'module');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('services', 'any', 'RWA');

$tab = cot_import('tab', 'G', 'ALP');
$category = ($tab=='services') ? cot_import('cat', 'G', 'TXT') : '' ;
list($pg, $d, $durl) = cot_import_pagenav('dservices', $cfg['services']['cat___default']['maxrowsperpage']);

//маркет вкладка
$t1 = new XTemplate(cot_tplfile(array('services','userdetails'), 'module'));
$t1->assign(array(
	"ADDSERV_URL" => cot_url('services', 'm=add'),
	"SERV_ADDSERV_URL" => cot_url('services', 'm=add'),
	"ADDSERV_SHOWBUTTON" => ($usr['auth_write']) ? true : false,
	"SERV_ADDSERV_SHOWBUTTON" => ($usr['auth_write']) ? true : false, // for compatibility with previous versions
));

$where = array();
$order = array();

if($usr['id'] == 0 || $usr['id'] != $urr['user_id'] && !$usr['isadmin'])
{
	$where['state'] = "item_state=0";
}

if ($category)
{
	$where['cat'] = 'item_cat=' . $db->quote($category);
}

$where['owner'] = "item_userid=" . $urr['user_id'];

$order['date'] = "item_date DESC";

$wherecount = $where;
if($wherecount['cat'])
	unset($wherecount['cat']);

/* === Hook === */
foreach (cot_getextplugins('services.userdetails.query') as $pl)
{
	include $pl;
}
/* ===== */

$where = ($where) ? 'WHERE ' . implode(' AND ', $where) : '';
$wherecount = ($wherecount) ? 'WHERE ' . implode(' AND ', $wherecount) : '';
$order = ($order) ? 'ORDER BY ' . implode(', ', $order) : '';

$sql_services_count_cat = $db->query("SELECT item_cat, COUNT(item_cat) as cat_count FROM $db_services " . $wherecount . " GROUP BY item_cat")->fetchAll();

$sql_services_count = $db->query("SELECT * FROM $db_services as m 
	" . $wherecount . "");
$services_count_all = $services_count = $sql_services_count->rowCount();

$sqllist = $db->query("SELECT * FROM $db_services AS m
	" . $where . "
	" . $order . "
	LIMIT $d, " . $cfg['services']['cat___default']['maxrowsperpage']);

foreach ($sql_services_count_cat as $value) {
	$page_nav[$value['item_cat']] = $value['cat_count'];
	$t1->assign(array(
		"SERV_CAT_ROW_TITLE" => &$structure['services'][$value['item_cat']]['title'],
		"SERV_CAT_ROW_ICON" => &$structure['services'][$value['item_cat']]['icon'],
		"SERV_CAT_ROW_URL" => cot_url('users', 'm=details&id=' . $urr['user_id'] . '&u=' . $urr['user_name'] . '&tab=services&cat='.$value['item_cat']),
		"SERV_CAT_ROW_COUNT_SERVICES" => $value['cat_count'], 
		"SERV_CAT_ROW_SELECT" => ($category && $category == $value['item_cat']) ? 1 : '' 
		));
	$t1->parse("MAIN.CAT_ROW");
}

$opt_array = array(
					'm' => 'details',
				  	'id'=> $urr['user_id'],
				  	'u'=> $urr['user_name'],
				    'tab' => 'services'
				    );
if($category){	
	$services_count = $page_nav[$category];
	$opt_array['cat'] = $category;
}

$pagenav = cot_pagenav('users',$opt_array , $d, $services_count, $cfg['services']['cat___default']['maxrowsperpage'], 'dservices');

$t1->assign(array(
	"PAGENAV_PAGES" => $pagenav['main'],
	"PAGENAV_PREV" => $pagenav['prev'],
	"PAGENAV_NEXT" => $pagenav['next'],
	"PAGENAV_COUNT" => $services_count,
));

$sqllist_rowset = $sqllist->fetchAll();
$sqllist_idset = array();

foreach($sqllist_rowset as $item)
{
	$sqllist_idset[$item['item_id']] = $item['item_alias'];
}

/* === Hook === */
$extp = cot_getextplugins('services.userdetails.loop');
/* ===== */

foreach ($sqllist_rowset as $item)
{
	$t1->assign(cot_generate_servicestags($item, 'SERV_ROW_', $cfg['services']['shorttextlen'], $usr['isadmin'], $cfg['homebreadcrumb']));
	
	/* === Hook === */
	foreach ($extp as $pl)
	{
		include $pl;
	}
	/* ===== */

	$t1->parse("MAIN.SERV_ROWS");
}

/* === Hook === */
	foreach (cot_getextplugins('services.userdetails.tags') as $pl)
	{
		include $pl;
	}
	/* ===== */

$t1->parse("MAIN");

$t->assign(array(
	"USERS_DETAILS_SERVICES_COUNT" => $services_count_all,
	"USERS_DETAILS_SERVICES_URL" => cot_url('users', 'm=details&id=' . $urr['user_id'] . '&u=' . $urr['user_name'] . '&tab=services'),
));

$t->assign('SERVICES', $t1->text("MAIN"));
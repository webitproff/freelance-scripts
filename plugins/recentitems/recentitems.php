<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=standalone
[END_COT_EXT]
==================== */

/**
 * Recent pages, topics in forums, users, comments
 *
 * @package RecentItems
 * @copyright (c) Cotonti Team
 * @license https://github.com/Cotonti/Cotonti/blob/master/License.txt
 */
defined('COT_CODE') or die("Wrong URL.");

$days = cot_import('days', 'G', 'INT');
list($pg, $d, $durl) = cot_import_pagenav('d', Cot::$cfg['plugin']['recentitems']['itemsperpage']);
$mode = cot_import('mode', 'G', 'TXT');

$timeback = 0;
$pagetitlelimit = isset($pagetitlelimit) ? $pagetitlelimit : 0;  // Todo

// From user's last visit
if ($days == -1) {
    if (Cot::$usr['id'] > 0 && Cot::$usr['lastvisit'] > 0) {
        $timeback = Cot::$usr['lastvisit'];
    } else {
        $days = 1;
    }
}

// Today. From 00:00 in user timezone
if ($days == 0) {
    $timeZone = null;
    $defaultTimeZone = !empty(Cot::$cfg['defaulttimezone']) ? Cot::$cfg['defaulttimezone'] : 'UTC';
    if (
        Cot::$usr['timezone'] != 0 // May be it is not needed
        && !empty(Cot::$usr['timezonename'])
        && Cot::$usr['timezonename'] != $defaultTimeZone)
    {
        try {
            $timeZone = new \DateTimeZone(Cot::$usr['timezonename']);
        } catch (\Exception $e) { }
    }
    if (empty($timeZone)) {
        $timeZone = new \DateTimeZone($defaultTimeZone);
    }
    $date = new \DateTime('today midnight', $timeZone);
    $timeback = $date->getTimestamp();
}
if ($days > 0) {
	$timeback = Cot::$sys['now'] - ($days * 86400);
}

require_once cot_incfile('recentitems', 'plug');
$totalrecent[] = 0;
if (
    Cot::$cfg['plugin']['recentitems']['newpages']
    && cot_module_active('page')
    && (empty($mode) || $mode == 'pages')
) {
	require_once cot_incfile('page', 'module');
	$res = cot_build_recentpages(
        'recentitems.pages',
        $timeback,
        Cot::$cfg['plugin']['recentitems']['itemsperpage'],
        $d,
        $pagetitlelimit,
        Cot::$cfg['plugin']['recentitems']['newpagestext'],
        Cot::$cfg['plugin']['recentitems']['rightscan']
    );
	$t->assign('RECENT_PAGES', $res);
}

if (
    Cot::$cfg['plugin']['recentitems']['newforums']
    && cot_module_active('forums')
    && (empty($mode) || $mode == 'forums')
) {
	require_once cot_incfile('forums', 'module');

    $forumtitlelimit = isset($forumtitlelimit) ? $forumtitlelimit : 0;  // Todo

	$res = cot_build_recentforums(
        'recentitems.forums',
        $timeback,
        Cot::$cfg['plugin']['recentitems']['itemsperpage'],
        $d,
        $forumtitlelimit,
        Cot::$cfg['plugin']['recentitems']['rightscan']
    );
	$t->assign('RECENT_FORUMS', $res);
}

if ($mode != 'pages' || $mode != 'forums') {
	/* === Hook === */
	foreach (cot_getextplugins('recentitems.tags') as $pl) {
		include $pl;
	}
	/* ===== */
}

Cot::$out['subtitle'] = Cot::$L['recentitems_title'];

$totalpages = max($totalrecent);
$daysUrl = ($days != 0) ? '&days=' . $days : '';
$modeUrl = (!empty($mode)) ? '&mode=' . $mode : '';
$pagenav = cot_pagenav(
    'plug',
    'e=recentitems' . $daysUrl . $modeUrl,
    $d,
    $totalpages,
    Cot::$cfg['plugin']['recentitems']['itemsperpage']
);

$t->assign([
	'PAGE_PAGENAV' => $pagenav['main'],
	'PAGE_PAGEPREV' => $pagenav['prev'],
	'PAGE_PAGENEXT' => $pagenav['next']
]);

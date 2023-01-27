<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=forums.topics.rights
[END_COT_EXT]
==================== */

/**
 * Attacher plugin: forum topics
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

 defined('COT_CODE') or die('Wrong URL');

if (cot_auth('plug', 'attacher', 'W') && $usr['isadmin'] && !empty($q) && $a == 'delete')
{
	cot_check_xg();
	require_once cot_incfile('attacher', 'plug');

	foreach ($db->query("SELECT fp_id FROM $db_forum_posts WHERE fp_topicid = ?", array($q))->fetchAll(PDO::FETCH_COLUMN) as $att_post)
	{
		att_remove_all(null, 'forums', $att_post);
	}
}

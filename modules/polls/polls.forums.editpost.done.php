<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=forums.editpost.update.done
[END_COT_EXT]
==================== */

/**
 * Polls
 *
 * @package Polls
 * @copyright (c) Cotonti Team
 * @license https://github.com/Cotonti/Cotonti/blob/master/License.txt
 *
 * @var bool $is_first_post
 * @var int $q topic ID
 */

defined('COT_CODE') or die('Wrong URL');

if (!empty($poll) && $is_first_post && !cot_error_found()) {
	$number = cot_poll_save('forum', $q);
}

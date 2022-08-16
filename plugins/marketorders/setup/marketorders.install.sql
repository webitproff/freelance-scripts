/**
 * market orders DB installation
 */

CREATE TABLE IF NOT EXISTS `cot_market_orders` (
  `order_id` int(10) unsigned NOT NULL auto_increment,
  `order_pid` int(11) NOT NULL,
  `order_userid` int(11) NOT NULL,
  `order_seller` int(11) NOT NULL,
  `order_date` int(11) NOT NULL,
  `order_paid` int(11) NOT NULL,
  `order_claim` int(11) NOT NULL,
  `order_cancel` int(11) NOT NULL,
  `order_done` int(11) NOT NULL,
  `order_count` int(11) NOT NULL,
  `order_cost` float(16,2) NOT NULL,
  `order_title` varchar(255) collate utf8_unicode_ci default NULL,
  `order_text` varchar(255) collate utf8_unicode_ci default NULL,
  `order_claimtext` TEXT collate utf8_unicode_ci NOT NULL,
  `order_email` varchar(255) collate utf8_unicode_ci NOT NULL,
  `order_status` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `cot_payments` (
  `pay_id` int(10) unsigned NOT NULL auto_increment,
  `pay_userid` int(11) DEFAULT '0',
  `pay_status` varchar(50) DEFAULT '',
  `pay_cdate` int(11) DEFAULT '0',
  `pay_pdate` int(11) DEFAULT '0',
  `pay_adate` int(11) DEFAULT '0',
  `pay_summ` float(16,2) DEFAULT '0',
  `pay_desc` varchar(255) DEFAULT '',
  `pay_area` varchar(20) DEFAULT '',
  `pay_code` varchar(255) DEFAULT '',
  `pay_time` int(11) DEFAULT '0',
  `pay_redirect` varchar(255) DEFAULT '',
  PRIMARY KEY  (`pay_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `cot_payments_services` (
  `service_id` int(10) unsigned NOT NULL auto_increment,
  `service_area` varchar(20) NOT NULL,
  `service_userid` int(11) NOT NULL,
  `service_expire` int(11) NOT NULL,
  PRIMARY KEY  (`service_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `cot_payments_outs` (
  `out_id` int(10) unsigned NOT NULL auto_increment,
  `out_userid` int(11) NOT NULL,
  `out_summ` float(16,2) NOT NULL,
  `out_status` varchar(50)  DEFAULT '',
  `out_date` int(11) DEFAULT '0',
  `out_details` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`out_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `cot_payments_transfers` (
  `trn_id` int(10) unsigned NOT NULL auto_increment,
  `trn_from` int(11) NOT NULL,
  `trn_to` int(11) NOT NULL,
  `trn_summ` float(16,2) NOT NULL,
  `trn_status` varchar(50) DEFAULT '',
  `trn_date` int(11) DEFAULT '0',
  `trn_done` int(11) DEFAULT '0',
  `trn_comment` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`trn_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
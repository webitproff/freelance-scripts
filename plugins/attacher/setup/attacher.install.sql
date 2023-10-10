CREATE TABLE IF NOT EXISTS `cot_attacher` (
	`att_id` INT NOT NULL AUTO_INCREMENT,
	`att_user` INT NOT NULL,
	`att_area` VARCHAR(64) NOT NULL,
	`att_item` INT NOT NULL,
	`att_field` varchar(255) DEFAULT '' COMMENT 'Item field',
	`att_path` VARCHAR(255) DEFAULT '',
	`att_filename` VARCHAR(255) NOT NULL,
	`att_ext` VARCHAR(16) DEFAULT '',
	`att_img` TINYINT(1) DEFAULT 0,
	`att_size` INT DEFAULT 0,
	`att_title` VARCHAR(255) DEFAULT '',
	`att_count` INT DEFAULT 0,
	`att_order` SMALLINT DEFAULT 0,
	`att_lastmod` datetime DEFAULT NULL,
    `att_unikey` varchar(255) DEFAULT '',
	PRIMARY KEY(`att_id`),
	KEY (`att_area`, `att_item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

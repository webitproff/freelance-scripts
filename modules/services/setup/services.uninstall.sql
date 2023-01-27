/**
 * Completely removes services data
 */

DROP TABLE IF EXISTS `cot_services`;

DELETE FROM `cot_structure` WHERE structure_area = 'services';
DELETE FROM `cot_auth` WHERE auth_code = 'services';
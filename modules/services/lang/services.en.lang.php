<?php

/**
 * services module
 *
 * @package services
 * @version 2.5.2
 * @author CMSWorks Team
 * @copyright Copyright (c) CMSWorks.ru, littledev.ru
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_pagelimit'] = array('Items count in lists');
$L['cfg_shorttextlen'] = array('Text limit in lists');
$L['cfg_prevalidate'] = array('Enable prevalidation');
$L['cfg_preview'] = array('Enable preview');
$L['cfg_servicessitemap'] = 'Enable on Sitemap';
$L['cfg_servicessitemap_freq'] = 'Sitemap frequency';
$L['cfg_servicessitemap_freq_params'] = $sitemap_freqs;
$L['cfg_servicessitemap_prio'] = array('Priority on Sitemap');
$L['cfg_description'] = array('Description');
$L['cfg_servicessearch'] = array('Enable search');
$L['cfg_warranty'] = array('Warranty period (days)');
$L['cfg_tax'] = array('Selling commission (%)');
$L['cfg_ordersperpage'] = array('Orders per page');
$L['cfg_notifservices_admin_moderate'] = array('Notify on new product at checkout','Send email for new product in the pre-moderation');
$L['cfg_serveditor'] = 'Configurable visual editor';
$L['cfg_serveditor_params'] = 'Disable,Minimal set of buttons, Standard set of buttons, Advanced set of buttons';


$L['info_desc'] = 'Online services';

$L['services_select_cat'] = "Select Section";
$L['services_locked_cat'] = "Selected category blocked";
$L['services_empty_title'] = "The title can not be empty";
$L['services_empty_text'] = "Text is empty";
$L['services_large_img'] = "Image too large";

$L['services_forreview'] = 'Your product is submitted for review';

$L['services'] = 'Shop';
$L['services_myproducts'] = 'My products';

$L['services_catalog'] = 'Catalog';
$L['services_add_product'] = 'Add product';
$L['services_edit_product'] = 'Edit product';
$L['services_add_service_title'] = 'Adding product to services';
$L['services_edit_service_title'] = 'Edit product in services';

$L['services_hidden'] = 'Product is not active';
$L['services_location'] = 'Location';
$L['services_price'] = 'Price';
$L['services_image_limit'] = 'Allow formats jpeg, gif, jpg and png. Maximum size of 1MB. ';
$L['services_aliascharacters'] = 'Characters \'+\', \'/\', \'?\', \'%\', \'#\', \'&\' are not allowed in aliases';

$L['services_costasc'] = 'Price Ascending';
$L['services_costdesc'] = 'Price descending';
$L['services_mostrelevant'] = 'The most urgent';

$L['services_notfound'] = 'Products no found';
$L['services_empty'] = 'No products';

$L['services_added_mail_subj'] = 'Your product has been published';
$L['services_senttovalidation_mail_subj'] = 'Your product is submitted for review';
$L['services_admin_home_valqueue'] = 'In validation';
$L['services_admin_home_public'] = 'Published';
$L['services_admin_home_hidden'] = 'Hidden';

$L['services_added_mail_body'] = 'Hello, {$user_name}. '."\n\n".'Your product "{$serv_name}" has been published on the website {$sitename} - {$link}';
$L['services_senttovalidation_mail_body'] = 'Hello, {$user_name}. '."\n\n".'Your product "{$serv_name}" is submitted for review. A moderator will check it as soon as possible.';

$L['services_notif_admin_moderate_mail_subj'] = 'The new product for review';
$L['services_notif_admin_moderate_mail_body'] = 'Hi, '."\n\n".'User {$user_name} submit new product "{$serv_name}".'."\n\n".'{$link}';

$L['services_status_published'] = 'Published';
$L['services_status_moderated'] = 'Moderated';
$L['services_status_hidden'] = 'Hidden';

$L['plu_services_set_sec'] = 'Products categories';
$L['plu_services_res_sort1'] = 'Date';
$L['plu_services_res_sort2'] = 'Title';
$L['plu_services_res_sort3'] = 'Popularity';
$L['plu_services_res_sort3'] = 'Category';
$L['plu_services_search_names'] = 'Search in titles';
$L['plu_services_search_text'] = 'Search in text';
$L['plu_services_set_subsec'] = 'Include subcategories';

$Ls['services_headermoderated'] = "товар на проверке,товара на проверке,товаров на проверке";
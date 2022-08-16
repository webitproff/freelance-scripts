<?php

/* ====================
 * [BEGIN_COT_EXT]
 * Code=orderservices
 * Name=Order Services
 * Category=Payments
 * Description=Рынок услуг - оформление заказов на услуги, размещенные в модуле orderservices "Рынок Услуг"
 * Version=1.0.6.1
 * Date=12 Dec 2016
 * Author=CMSWorks Team
 * Copyright=Copyright (c) CMSWorks.ru
 * Notes=Плагин для оплаты услуг опубликованных в модуле orderservices (Рынок Услуг). Позволяет оплачивать услуги с указанной ценой. После оплаты Продавец уведомляется по email. При этом сумма за покупку резервируется на счету сайта на гарантийный срок (например 14 дней), чтобы обеспечить безопасность проведения подобного рода продаж через сайт.
 * Auth_guests=
 * Lock_guests=12345A
 * Auth_members=RW
 * Lock_members=12345A
 * Requires_modules=payments,services
 * [END_COT_EXT]
 *
 * [BEGIN_COT_EXT_CONFIG]
 * warranty=01:string::14:Warranty period
 * tax=02:string::10:Selling commission
 * ordersperpage=03:select:0,1,2,3,4,5,10,15,20,25,30,35,40,45,50:20:Число заказов на странице
 * filepath=04:string::datas/orderservicesfiles:File path
 * adminid=04:string::0:Admin id
 * showneworderswithoutpayment=05:radio::1:Show new orders without payment
 * acceptzerocostorders=06:radio::1:Accept orders with 0 price
 * [END_COT_EXT_CONFIG]
 */

/**
 * orderservices plugin
 */
?>

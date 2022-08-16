<?php

/* ====================
 * [BEGIN_COT_EXT]
 * Code=liqpaybilling
 * Name=LiqPay billing
 * Category=Payments
 * Description=liqpay billing system
 * Version=1.1.0
 * Date=
 * Author=devkont (Yusupov)
 * Copyright=&copy; CMSWorks Team 2013
 * Notes=
 * Auth_guests=RW
 * Lock_guests=12345A
 * Auth_members=RW
 * Lock_members=12345A
 * Requires_modules=payments
 * [END_COT_EXT]
 *
 * [BEGIN_COT_EXT_CONFIG]
 * merchant_id=01:string:::ID мерчанта
 * signature=02:string:::Signature
 * currency=03:string:::Код валюты (UAH,USD,RUR,EUR)
 * rate=04:string::1:Соотношение суммы к валюте сайта
 * testmode=05:radio::0:Тестовый режим
 * [END_COT_EXT_CONFIG]
 */

/**
 * liqpay billing Plugin
 *
 * @package liqpaybilling
 * @version 1.1.0
 * @author devkont (Yusupov)
 * @copyright (c) CMSWorks Team 2013
 * @license BSD
 */
?>
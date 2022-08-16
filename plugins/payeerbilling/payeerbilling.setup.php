<?php

/* ====================
 * [BEGIN_COT_EXT]
 * Code=payeerbilling
 * Name=Payeerbilling
 * Category=Payments
 * Description=Плагин «Payeerbilling» — прием онлайн платежей для сайта биржи услуг и фриланса на CMS Cotonti<br /> [<a target="_blank" href="http://freelance-script.abuyfile.com/plugin-payeerbilling/">Документация по плагину, помощь, поддержка</a>]
 * Version=1.0.0
 * Date=
 * Author=devkont (Yusupov)
 * Copyright=&copy; CMSWorks Team 2015
 * Notes=
 * Auth_guests=RW
 * Lock_guests=12345A
 * Auth_members=RW
 * Lock_members=12345A
 * Requires_modules=payments
 * [END_COT_EXT]
 *
 * [BEGIN_COT_EXT_CONFIG]
 * shop=01:string:::Идентификатор магазина
 * key=02:string:::Секретное слово
 * curr=03:select:RUB,USD,EUR:RUB:Валюта платежа
 * rate=04:string::1:Соотношение суммы к валюте сайта
 * [END_COT_EXT_CONFIG]
 */

/**
 * Payeer billing Plugin
 *
 * @package payeerbilling
 * @version 1.0.0
 * @author devkont (Yusupov)
 * @copyright (c) CMSWorks Team 2015
 * @license BSD
 */
?>
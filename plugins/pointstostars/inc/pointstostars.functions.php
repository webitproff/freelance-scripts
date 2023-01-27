<?php

defined('COT_CODE') or die('Wrong URL');

function cot_pointstostars($points = 0, $attrs = "") {
    global $cfg;
    $points = str_replace(" ", "", $points);
    $stars = $cfg["plugin"]["pointstostars"];
    if ($stars["stars10"] <= $points) {
        return '<i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i>';
    } elseif ($stars["stars09"] <= $points) {
        return '<i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star-half-full ' . $attrs . '"></i>';
    } elseif ($stars["stars08"] <= $points) {
        return '<i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i>';
    } elseif ($stars["stars07"] <= $points) {
        return '<i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star-half-full ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i>';
    } elseif ($stars["stars06"] <= $points) {
        return '<i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i>';
    } elseif ($stars["stars05"] <= $points) {
        return '<i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star-half-full ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i>';
    } elseif ($stars["stars04"] <= $points) {
        return '<i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i>';
    } elseif ($stars["stars03"] <= $points) {
        return '<i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star-half-full ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i>';
    } elseif ($stars["stars02"] <= $points) {
        return '<i class="uk-icon-star ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i>';
    } elseif ($stars["stars01"] <= $points) {
        return '<i class="uk-icon-star-half-full ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i>';
    } else {
        return '<i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i><i class="uk-icon-star-o ' . $attrs . '"></i>';
    }
}

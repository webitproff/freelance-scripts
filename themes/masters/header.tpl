<!-- BEGIN: HEADER -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>{HEADER_TITLE}</title> 
<!-- IF {HEADER_META_DESCRIPTION} --><meta name="description" content="{HEADER_META_DESCRIPTION}" /><!-- ENDIF -->
<!-- IF {HEADER_META_KEYWORDS} --><meta name="keywords" content="{HEADER_META_KEYWORDS}" /><!-- ENDIF -->
<meta http-equiv="content-type" content="{HEADER_META_CONTENTTYPE}; charset=UTF-8" />
<meta name="generator" content="Cotonti http://www.cotonti.com" />
<link rel="canonical" href="{HEADER_CANONICAL_URL}" />
{HEADER_BASEHREF}
{HEADER_HEAD}
<link rel="shortcut icon" href="favicon.ico" />
<link rel="apple-touch-icon" href="apple-touch-icon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<body>	
	<div id="wrapper">
		<div class="top m-b-2">
			<nav class="navbar navbar-black bg-faded">
				<div class="container">

					<!-- BEGIN: I18N_LANG -->
						<!-- BEGIN: I18N_LANG_ROW -->
						<a href="{I18N_LANG_ROW_URL}" class="{I18N_LANG_ROW_CLASS}"><img src="images/flags/{I18N_LANG_ROW_FLAG}.png"/></a> &nbsp;
						<!-- END: I18N_LANG_ROW -->
					<!-- END: I18N_LANG -->

					<ul class="nav navbar-nav pull-xs-right">
						<!-- BEGIN: GUEST -->
						<li class="nav-item"><a href="{PHP|cot_url('login')}">{PHP.L.Login}</a></li>
						<li class="nav-item"><a href="{PHP|cot_url('users','m=register')}">{PHP.L.Register}</a></li>
						<!-- END: GUEST -->
						
						<!-- BEGIN: USER -->
						<li class="nav-item"><a href="{PHP.usr.name|cot_url('users', 'm=details&u='$this)}">{PHP.usr.name}</a></li>
						{EVENTS_HEADER}
						<li class="nav-item"><a href="{PHP|cot_url('users', 'm=profile')}">{PHP.L.Profile}</a></li>
						<!-- IF {PHP.cfg.payments.balance_enabled} -->
						<li class="nav-item"><a href="{HEADER_USER_BALANCE_URL}">{PHP.L.payments_mybalance}: {HEADER_USER_BALANCE|number_format($this, '2', '.', ' ')} {PHP.cfg.payments.valuta}</a></li>
						<!-- ENDIF --> 
						<!-- IF {PHP.cot_modules.projects} -->
						<li class="nav-item dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">{PHP.L.projects_projects}<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<a class="dropdown-item" href="{PHP.usr.id|cot_url('users', 'm=details&id='$this'&tab=projects')}">{PHP.L.projects_myprojects}</a>
								<!-- IF {PHP.cot_plugins_active.sbr} -->
								<a class="dropdown-item" href="{PHP|cot_url('sbr')}">{PHP.L.sbr_mydeals}</a>
								<!-- ENDIF -->
								<!-- IF {PHP|cot_auth('projects', 'any', '1')} -->
								<a class="dropdown-item" href="{PHP|cot_url('projects', 'm=useroffers')}">{PHP.L.offers_useroffers}</a>
								<!-- ENDIF --> 
							</ul>
						</li>
						<!-- ENDIF --> 
						<!-- IF {PHP.cot_modules.market} -->
						<li class="nav-item dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">{PHP.L.market}<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<a class="dropdown-item" href="{PHP.usr.id|cot_url('users', 'm=details&id='$this'&tab=market')}">{PHP.L.market_myproducts}</a>
								<!-- IF {PHP.cot_plugins_active.marketorders} -->
								<a class="dropdown-item" href="{PHP|cot_url('marketorders', 'm=sales')}">{PHP.L.marketorders_mysales}</a>
								<a class="dropdown-item" href="{PHP|cot_url('marketorders', 'm=purchases')}">{PHP.L.marketorders_mypurchases}</a>
								<!-- ENDIF --> 
							</ul>
						</li>
						<!-- ENDIF --> 
						<li class="nav-item">
							<!-- IF {HEADER_USER_PROEXPIRE} -->
							<a href="{PHP|cot_url('plug', 'e=paypro')}" title="{PHP.L.paypro_header_extend}">{PHP.L.paypro_header_expire_short} {HEADER_USER_PROEXPIRE|cot_date('d.m.Y', $this)}</a>
							<!-- ELSE -->
							<a href="{PHP|cot_url('plug', 'e=paypro')}" title="{PHP.L.paypro_header_buy}">{PHP.L.paypro_header_buy}</a>
							<!-- ENDIF -->
						</li>
						<!-- IF {HEADER_USER_PMREMINDER} --><li class="nav-item">{HEADER_USER_PMREMINDER}</li><!-- ENDIF -->
						<!-- IF {HEADER_NOTICES} -->
						<li class="nav-item dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">{PHP.L.header_notice}<b class="caret"></b></a>
							<ul class="dropdown-menu">
								{HEADER_NOTICES}
							</ul>
						</li>
						<!-- ENDIF -->
						<li class="nav-item">{HEADER_USER_ADMINPANEL}</li>
						<li class="nav-item">{HEADER_USER_LOGINOUT}</li>
						<!-- END: USER -->
					</ul>
				</div>
			</nav>
								
			<header>
				<div class="container p-t-2">
					<div class="row">
						<div class="col-lg-4">
							<div class="logo pull-xs-left">
								<a href="{PHP|cot_url('index')}" title="{PHP.cfg.maintitle} {PHP.cfg.separator} {PHP.cfg.subtitle}">{PHP.L.FL_logo}</a>
							</div>							
							<button class="navbar-toggler hidden-lg-up m-b-2 pull-xs-left" type="button" data-toggle="collapse" data-target="#MainNavbar">
							    &#9776;
							</button>
						</div>
						<div class="col-lg-8">
							<div class="collapse navbar-toggleable-md" id="MainNavbar">
								<div class="navbar navbar-main pull-xs-right">
									<ul class="nav navbar-nav">
										<li class="nav-item"><a class="nav-link<!-- IF {PHP.env.ext} == 'index' --> active<!-- ENDIF -->" href="{PHP|cot_url('index')}">{PHP.L.Home}</a></li>
										<li class="nav-item"><a class="nav-link<!-- IF {PHP.env.ext} == 'projects' --> active<!-- ENDIF -->" href="{PHP|cot_url('projects')}">{PHP.L.projects_projects}</a></li>
										<!-- IF {PHP.cot_modules.market} -->
										<li class="nav-item"><a class="nav-link<!-- IF {PHP.env.ext} == 'market' AND !{PHP.type} --> active<!-- ENDIF -->" href="{PHP|cot_url('market')}">{PHP.L.market_title}</a></li>
										<!-- ENDIF -->
										<!-- IF {PHP.cot_modules.services} -->
										<li class="nav-item"><a class="nav-link<!-- IF {PHP.env.ext} == 'services' AND !{PHP.type} --> active<!-- ENDIF -->" href="{PHP|cot_url('services')}">{PHP.L.services_title}</a></li>
										<!-- ENDIF -->
										<li class="nav-item"><a class="nav-link<!-- IF {PHP.env.ext} == 'users' AND ({PHP.group} == {PHP.cot_groups.4.alias} OR {PHP.urr.user_maingrp} == 4) --> active<!-- ENDIF -->" href="{PHP.cot_groups.4.alias|cot_url('users', 'group='$this)}">{PHP.cot_groups.4.name}</a></li>										
										<!-- IF {PHP.cot_plugins_active.contact} -->
										<li class="nav-item"><a class="nav-link<!-- IF {PHP.env.ext} == 'contact' --> active<!-- ENDIF -->" href="{PHP|cot_url('contact')}">{PHP.L.Contact}</a></li>
										<!-- ENDIF -->
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>
		<div id="main">
			<div class="container" id="ajaxBlock">
		
<!-- END: HEADER -->
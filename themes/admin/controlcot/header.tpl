<!-- BEGIN: HEADER -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{HEADER_TITLE}</title>
    <link rel="shortcut icon" href="favicon.ico"> 
    
	{HEADER_BASEHREF} {HEADER_HEAD} {HEADER_COMPOPUP}
    <!-- CSS FILES -->
    <link rel="stylesheet" type="text/css" href="{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/css/dashboard.css">
  </head>
  <body>
    <div class="uk-section uk-background-default uk-padding-remove uk-border-btm"  uk-height-viewport="expand: true">
      <div class="uk-container uk-container-expand">
        <nav uk-navbar>
          <div class="uk-navbar-left">
            <a class="uk-navbar-item uk-hidden@m" uk-toggle="target: #sidebar-offcanvas">
              <span class="uk-icon-button uk-button-warning uk-icon" uk-icon="thumbnails"></span>
            </a>
            <a uk-tooltip="{PHP.L.Ctrl_Left_Munu_note}" class="uk-navbar-item uk-visible@m" uk-toggle="target: #left-col">
              <span class="uk-icon-button uk-background-secondary uk-light" uk-icon="thumbnails"></span>
            </a>
            <a class="uk-navbar-item uk-link-text" href="{PHP|cot_url('admin')}"><span class="uk-text-bold uk-h4">{PHP.cfg.maintitle}</span></a>
          </div>
          <div class="uk-navbar-right">
            <ul class="uk-iconnav">
    <!-- IF {PHP.cot_plugins_active.contact} -->
    <li class="uk-visible@m uk-padding-remove">
      <!-- IF {PHP.notify_contact.1} -->
      <a class="uk-navbar-item" href="{PHP|cot_url('admin','m=other&p=contact')}" uk-tooltip="{PHP.notify_contact.1}">
        <span class="uk-icon-button uk-button-danger"><i class="fa-solid fa-comment-sms fa-spin fa-xl"></i></span>
      </a>
      <!-- ELSE -->
      <a class="uk-navbar-item" href="{PHP|cot_url('admin','m=other&p=contact')}" uk-tooltip="{PHP.L.contact_title}">
        <span class="uk-icon-button uk-button-success"><i class="fa-solid fa-envelope-circle-check fa-xl"></i></span>
      </a>
      <!-- ENDIF -->
    </li>
    <!-- ENDIF -->
    <!-- IF {PHP.cot_modules.page} -->
    <li class="uk-visible@m uk-padding-remove">
      <a class="uk-navbar-item" href="{PHP|cot_url('admin', 'm=page', '&filter=all')}" uk-tooltip="{PHP.L.Pages}">
        <span class="uk-icon-button uk-button-primary"><i class="fa-regular fa-newspaper fa-xl"></i></span>
      </a>
    </li>
    <!-- ENDIF -->
			<!-- IF {PHP.cot_modules.payments} -->
              <li class="uk-visible@s uk-padding-remove">
                <a class="uk-navbar-item" href="{PHP|cot_url('admin', 'm=payments')}" title="{PHP.L.payments_name_global}" uk-tooltip="{PHP.L.payments_name_global}"><span class="uk-icon-button uk-button-success"><i class="fa-solid fa-money-bill-transfer fa-xl"></i></span></a>
              </li>
			<!-- ENDIF -->
			<!-- IF {PHP.cot_plugins_active.sbr} -->
              <li class="uk-visible@s uk-padding-remove">
                <a class="uk-navbar-item" href="{PHP|cot_url('admin', 'm=other&p=sbr')}" title="{PHP.L.sbr}" uk-tooltip="{PHP.L.sbr}"><span class="uk-icon-button uk-button-success"><i class="fa-solid fa-shield-halved fa-xl"></i></span></a>
              </li>
			<!-- ENDIF -->
			<!-- IF {PHP.cot_plugins_active.invoice} -->
              <li class="uk-visible@s uk-padding-remove">
                <a class="uk-navbar-item" href="{PHP|cot_url('admin', 'm=other&p=invoice')}" title="{PHP.L.invoice_admintitle}" uk-tooltip="{PHP.L.invoice_admintitle}"><span class="uk-icon-button uk-button-success"><i class="fa-solid fa-file-invoice-dollar fa-xl"></i></span></a>
              </li>
			<!-- ENDIF -->
              <li class="uk-visible@s uk-padding-remove">
                <a class="uk-navbar-item" href="{PHP|cot_url('admin', 'm=cache&s=disk')}" title="{PHP.L.Ctrl_Open_Frontsite}" uk-tooltip="{PHP.L.Delete} {PHP.L.adm_diskcache}"><span class="uk-icon-button uk-button-warning"><i class="fa-solid fa-compact-disc fa-xl"></i></a>
              </li>
              <li class="uk-padding-remove">
                <a class="uk-navbar-item" target="_blank" href="{PHP|cot_url('index')}" title="{PHP.L.Ctrl_Open_Frontsite}" uk-tooltip="{PHP.L.Ctrl_Open_Frontsite}"><span class="uk-icon-button uk-button-default"><i class="fa-solid fa-eye fa-xl"></i></span></a>
              </li>
              <li class="uk-padding-remove">
                <a class="uk-navbar-item" href="{PHP.sys.xk|cot_url('login', 'out=1&x=$this')}"  title="{PHP.L.Logout}" uk-tooltip="{PHP.L.Logout}"><span class="uk-icon-button uk-button-danger"><i class="fa-solid fa-person-through-window  fa-xl"></i></span></a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
	</div>
    <div class="uk-section uk-background-muted uk-padding-remove" uk-height-viewport="expand: true">
      <div class="uk-grid-collapse " uk-grid uk-height-match="row: false">
        <div id="left-col" class="uk-width-1-3@m uk-width-1-4@l uk-width-1-5@xl uk-visible@m uk-padding-small uk-section-secondary">
          <div class="uk-panel shadow-secondary uk-position-relative" uk-height-viewport="expand: true">
            <div uk-sticky="overflow-flip: true;"> 
			{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/inc/uk-nav-side.tpl"} </div>
          </div>
        </div>
        <div class="uk-width-expand">
          <div class="uk-container uk-container-expand uk-margin-large-bottom">
            <!-- END: HEADER -->
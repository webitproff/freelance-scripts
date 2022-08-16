<!-- BEGIN: HEADER -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{HEADER_TITLE}</title>
    <meta name="generator" content="Cotonti http://www.cotonti.com">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico"> {HEADER_BASEHREF} {HEADER_HEAD} {HEADER_COMPOPUP}
    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.1/dist/css/uikit.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/@tabler/icons@latest/iconfont/tabler-icons.min.css">
    <!-- CSS FILES -->
    <link rel="stylesheet" type="text/css" href="{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/css/dashboard.css">
    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.14.1/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.14.1/dist/js/uikit-icons.min.js"></script>
  </head>
  <body>
    <div id="sidebar-offcanvas" uk-offcanvas="overlay: true">
      <div class="uk-offcanvas-bar uk-section-secondary uk-flex uk-flex-column"> {FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/inc/uk-nav-side.tpl"} </div>
    </div>
    <div class="uk-section uk-background-default uk-padding-remove uk-box-shadow-small">
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
            <ul class="uk-navbar-nav">
              <li class="uk-visible@s">
                <a class="navbar-link" target="_blank" href="{PHP|cot_url('index')}" title="{PHP.L.Ctrl_Open_Frontsite}">{PHP.L.Ctrl_Open_Frontsite}</a>
              </li>
              <li class="uk-visible@s">
                <a class="navbar-link" href="{PHP.sys.xk|cot_url('login', 'out=1&x=$this')}">{PHP.L.Logout}</a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    </div>
    <div class="uk-section uk-padding-remove">
      <div class="uk-grid-collapse" uk-grid>
        <div id="left-col" class="uk-width-1-3@m uk-width-1-4@l uk-width-1-5@xl uk-visible@m uk-padding-small uk-section-secondary">
          <div class="uk-card uk-position-relative">
            <div uk-sticky="overflow-flip: true;"> {FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/inc/uk-nav-side.tpl"} </div>
          </div>
        </div>
        <div class="uk-width-expand">
          <div class="uk-container uk-container-expand uk-margin-large-bottom" uk-height-viewport="expand: true">
            <!-- END: HEADER -->
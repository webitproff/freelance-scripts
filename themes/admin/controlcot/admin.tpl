<!-- BEGIN: MAIN -->
	<div id="ajaxBlock">
	<!-- BEGIN: BODY -->
					<div class="uk-width-expand uk-visible@s">
        <div class="uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
<div class="uk-text-center" uk-grid>
    <div class="uk-width-auto@m">
        <span class="uk-link-heading">{ADMIN_TITLE}</span>
    </div>

    <div class="uk-width-expand@m uk-flex uk-flex-right">
<ul class="">
    {ADMIN_BREADCRUMBS}
</ul>
    </div>
</div>
            
        </div>

					</div>	


		<div id="main"  uk-height-viewport="expand: true">
		
			{ADMIN_MAIN}
		
			<!-- IF {ADMIN_HELP} -->

<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
  <h4>
    <span class="uk-h3 uk-text-bold uk-text-danger">{PHP.L.Help}</span>
  </h4>
  <p><span class="uk-link-text uk-text-medium">{ADMIN_HELP}</span></p>
</div>

			<!-- ENDIF -->
		</div>
	<!-- END: BODY -->
	</div>
<!-- END: MAIN -->

<div class="uk-offcanvas-content">
  <div class="uk-section uk-padding-remove-vertical uk-background-primary">
    <div class="uk-container uk-container-large">
      <nav uk-navbar>
        <div class="uk-navbar-left">
          <a class="uk-navbar-item uk-hidden@m" uk-toggle="target: #sidebar-offcanvas">
            <span class="uk-icon-button uk-button-warning uk-icon" uk-icon="thumbnails"></span>
          </a>
          <a uk-tooltip="{PHP.L.Ctrl_Left_Munu_note}" class="uk-navbar-item uk-visible@m" uk-toggle="target: #left-col">
            <span class="uk-icon-button uk-background-secondary uk-light" uk-icon="thumbnails"></span>
          </a>
          <a class="uk-navbar-item uk-link-text" href="{PHP|cot_url('admin')}">
            <span class="uk-text-bold uk-h4">{PHP.cfg.maintitle}</span>
          </a>
        </div>
        <div class="uk-navbar-right">
          <ul class="uk-iconnav">
            <li class="uk-visible@s">
              <a class="uk-navbar-item" href="{PHP|cot_url('admin', 'm=other&p=invoice)}" title="{PHP.L.invoice_admintitle}" uk-tooltip="{PHP.L.invoice_admintitle}">
                <span class="uk-icon-button uk-button-success">
                  <i class="fa-solid fa-file-invoice-dollar fa-xl"></i>
                </span>
              </a>
            </li>
            <li class="uk-visible@s">
              <a class="uk-navbar-item" target="_blank" href="{PHP|cot_url('index')}" title="{PHP.L.Ctrl_Open_Frontsite}" uk-tooltip="{PHP.L.Ctrl_Open_Frontsite}">
                <span class="uk-icon-button uk-button-default">
                  <i class="fa-solid fa-eye fa-xl"></i>
                </span>
              </a>
            </li>
            <li class="uk-visible@s">
              <a class="uk-navbar-item" href="{PHP.sys.xk|cot_url('login', 'out=1&x=$this')}" title="{PHP.L.Logout}" uk-tooltip="{PHP.L.Logout}">
                <span class="uk-icon-button uk-button-danger">
                  <i class="fa-solid fa-person-through-window  fa-xl"></i>
                </span>
              </a>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
  <div class="uk-section uk-padding-remove">
    <div class="">
      <div class="uk-grid-collapse" uk-grid>
        <div id="sidebar" class="uk-width-1-5@l uk-width-1-4@m uk-padding-small uk-padding-remove-top uk-animation-slide-left uk-background-grey">
          <ul class="uk-nav-default uk-list uk-list-divider uk-light" uk-nav> {FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/inc/uk-nav-side.tpl"} </ul>
        </div>
        <div class="uk-width-expand uk-background-default">
          <div class="uk-section uk-padding-remove" uk-height-viewport="offset-top: true">
            <div id="ajaxBlock">
              <!-- BEGIN: BODY -->
              <div class="uk-width-expand uk-visible@s">
                <div class="uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
                  <div class="uk-text-center" uk-grid>
                    <div class="uk-width-auto@m">
                      <span class="uk-link-heading">{ADMIN_TITLE}</span>
                    </div>
                    <div class="uk-width-expand@m uk-flex uk-flex-right">
                      <ul class=""> {ADMIN_BREADCRUMBS} </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div id="main" uk-height-viewport="expand: true"> {ADMIN_MAIN}
                <!-- IF {ADMIN_HELP} -->
                <div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
                  <h4>
                    <span class="uk-h3 uk-text-bold uk-text-danger">{PHP.L.Help}</span>
                  </h4>
                  <p>
                    <span class="uk-link-text uk-text-medium">{ADMIN_HELP}</span>
                  </p>
                </div>
                <!-- ENDIF -->
              </div>
              <!-- END: BODY -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

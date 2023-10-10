<!-- BEGIN: MAIN -->
<div uk-height-viewport="expand: true">
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
  <h3><span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.Configuration}</span></h3>
		{FILE "{PHP.cfg.system_dir}/admin/tpl/warnings.tpl"}
<!-- BEGIN: EDIT -->
			{ADMIN_CONFIG_EDIT_CUSTOM}
			<form class="ajax uk-form-horizontal uk-margin" name="saveconfig" id="saveconfig" action="{ADMIN_CONFIG_FORM_URL}" method="post">

<!-- BEGIN: ADMIN_CONFIG_ROW -->
<!-- BEGIN: ADMIN_CONFIG_FIELDSET_BEGIN -->
				<div class="uk-margin">
					<h4><span class="uk-text-bold uk-text-warning">{ADMIN_CONFIG_FIELDSET_TITLE}</span></h4>
				</div>
<!-- END: ADMIN_CONFIG_FIELDSET_BEGIN -->
<div class="uk-flex uk-flex-middle uk-grid-small" uk-grid>

<!-- BEGIN: ADMIN_CONFIG_ROW_OPTION -->
    <div class="uk-width-expand@l">
		<div class="uk-margin">
			<dl>
			  <dt class="uk-text-normal"><span class="uk-text-medium uk-link-text">{ADMIN_CONFIG_ROW_CONFIG_TITLE}:</span></dt>
			  <dd></dd>
			</dl>
		</div>
    </div>
    <div class="uk-width-2-3@l">
        <div class="uk-form-controls">
            {ADMIN_CONFIG_ROW_CONFIG}<br>
			<span class="uk-text-primary">{ADMIN_CONFIG_ROW_CONFIG_MORE}</span>
        </div>
    </div>
    <div class="uk-width-auto@l">
        <a href="{ADMIN_CONFIG_ROW_CONFIG_MORE_URL}" class="uk-width-1-1 uk-button uk-button-danger uk-button-small"> {PHP.L.Reset}</a>
    </div>
<!-- END: ADMIN_CONFIG_ROW_OPTION -->
</div>
<hr>
<!-- END: ADMIN_CONFIG_ROW -->

    <div class="uk-text-center">
      <button type="submit" class="uk-button uk-button-primary">{PHP.L.Update}</button>
    </div>
			</form>
<!-- END: EDIT -->
  <!-- BEGIN: DEFAULT -->
  <!-- BEGIN: ADMIN_CONFIG_COL -->
  <h1 class="uk-heading-bullet"><span>{ADMIN_CONFIG_COL_CAPTION}</span></h1>
        <ul class="uk-list uk-list-large uk-list-striped">
    <!-- BEGIN: ADMIN_CONFIG_ROW -->
            <li><a class="uk-link-text" href="{ADMIN_CONFIG_ROW_URL}"><!-- IF {ADMIN_CONFIG_ROW_ICO} --><img src="{ADMIN_CONFIG_ROW_ICO}" uk-tooltip="" title="" class="uk-margin-small-right" width="27" height="27">
<!-- ELSE --><span class="uk-text-middle uk-margin-small-right"><i class="fa-solid fa-sliders fa-2xl"></i></span>
          <!-- ENDIF --> 			<span class="uk-text-middle uk-text-medium"> {ADMIN_CONFIG_ROW_NAME}</span></a></li>
	<!-- END: ADMIN_CONFIG_ROW -->
        </ul>
  <!-- END: ADMIN_CONFIG_COL -->
  <!-- END: DEFAULT -->

</div>		
<div class="uk-margin-vertical uk-alert-primary uk-alert" uk-alert="">
  <a class="uk-alert-close uk-icon uk-close" uk-close=""></a>
  <p>Шаблон:</p>
  <code>admin.config.tpl</code>
</div>
</div>
<!-- END: MAIN -->

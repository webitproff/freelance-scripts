<!-- BEGIN: MAIN -->
	<div id="ajaxBlock">
	<!-- BEGIN: BODY -->
					<div class="uk-width-expand uk-visible@s">
        <div class="uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
            <span class="uk-link-heading">{ADMIN_TITLE}</span>
        </div>

					</div>	


		<div id="main">
		
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
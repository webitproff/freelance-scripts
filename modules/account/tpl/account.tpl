<!-- BEGIN: MAIN -->
<div class="uk-section uk-background-primary uk-padding-remove-vertical">
    <div class="uk-container uk-container-large uk-padding-small">
        <ul class="uk-breadcrumb uk-visible@s uk-link-text">
            <li><a href="{PHP|cot_url('index')}">{PHP.L.Home}</a></li>
            {BREADCRUMBS}
        </ul>
    </div>
</div>
<div class="uk-section uk-padding-remove-vertical uk-background-muted">
	{ACCOUNT_CONTENT}
</div> 





 
<!-- IF {PHP.usr.maingrp} == 5 OR {PHP.usr.isadmin} -->
<!-- BEGIN: MENU -->

		<div class="uk-container uk-container-large uk-margin-top">
			<ul class="uk-navbar-nav">
				<!-- BEGIN: MENU_ROW -->
			   <li <!-- IF {PHP.m} == {MENU_ROW_ID} --> class="uk-active"<!-- ENDIF -->><a href="{MENU_ROW_URL}">{MENU_ROW_TITLE}</a></li>
				<!-- END: MENU_ROW -->
			</ul>
		</div>

<!-- END: MENU -->
<div class="uk-margin-remove-vertical uk-alert-primary" uk-alert>
    <a class="uk-alert-close" uk-close></a>
    <p>Расположение файла, формирующего шаблон страницы:</p>
	<div class="uk-panel uk-text-break uk-text-secondary">{PHP.mskin}</div>
</div>
<!-- ENDIF -->
<!-- END: MAIN -->
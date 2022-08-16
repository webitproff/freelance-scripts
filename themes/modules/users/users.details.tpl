<!-- BEGIN: MAIN -->


<div class="pull-xs-right">
	<!-- IF {USERS_DETAILS_ISPRO} -->
	<span class="label label-success">PRO</span> 
	<!-- ENDIF -->
	<span class="label label-info">{USERS_DETAILS_USERPOINTS}</span>
</div>

<h1 class="m-y-2">
	{USERS_DETAILS_FULL_NAME}
</h1>
<!-- BEGIN: USERS_DETAILS_ADMIN --><p class="text-muted">{USERS_DETAILS_ADMIN_EDIT}</p><!-- END: USERS_DETAILS_ADMIN -->

	<div class="media">
		<div class="media-left">
			<div class="thumbnail">{USERS_DETAILS_AVATAR|cot_rc_modify($this, 'class="bigavatar"')}</div>
			<!-- IF {PHP.cot_plugins_active.paypro} && {PHP.usr.id} > 0 AND {PHP.usr.id} != {USERS_DETAILS_ID} -->
			<br/>
			<a href="<!-- IF {PHP.usr.isadmin} -->{USERS_DETAILS_ID|cot_url('admin', 'm=other&p=paypro&id='$this)}<!-- ELSE -->{USERS_DETAILS_ID|cot_url('paypro', 'id='$this)}<!-- ENDIF -->">{PHP.L.paypro_giftpro}</a>
			<br/>
			<!-- ENDIF -->
			<br/>
		</div>
		<div class="media-body">
			<p>На сайте с: {USERS_DETAILS_REGDATE_STAMP|cot_date('j F Y', $this)}</p>
		</div>
	</div>

	<div class="tabbable">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="ajax nav-link<!-- IF !{PHP.tab} --> active<!-- ENDIF -->" href="{USERS_DETAILS_DETAILSLINK}#tab_info" data-toggle="tab" role="tab">{PHP.L.Main}</a></li>
			<!-- IF {PHP.cot_modules.folio} -->
			<li class="nav-item"><a class="ajax nav-link<!-- IF {PHP.tab} == 'portfolio' --> active<!-- ENDIF -->" href="{USERS_DETAILS_FOLIO_URL}#tab_portfolio" data-toggle="tab" role="tab">{PHP.L.folio} {USERS_DETAILS_FOLIO_COUNT}</a></li>
			<!-- ENDIF -->
			<!-- IF {PHP.cot_modules.market} -->
			<li class="nav-item"><a class="ajax nav-link<!-- IF {PHP.tab} == 'market' --> active<!-- ENDIF -->" href="{USERS_DETAILS_MARKET_URL}#tab_market" data-toggle="tab" role="tab">{PHP.L.market} {USERS_DETAILS_MARKET_COUNT}</a></li>
			<!-- ENDIF -->
			<!-- IF {PHP.cot_modules.projects} -->
			<li class="nav-item"><a class="ajax nav-link<!-- IF {PHP.tab} == 'projects' --> active<!-- ENDIF -->" href="{USERS_DETAILS_PROJECTS_URL}#tab_projects" data-toggle="tab" role="tab">{PHP.L.projects_projects} {USERS_DETAILS_PROJECTS_COUNT}</a></li>
			<!-- ENDIF -->
			<!-- IF {PHP.cot_plugins_active.reviews} -->
			<li class="nav-item"><a class="ajax nav-link<!-- IF {PHP.tab} == 'reviews' --> active<!-- ENDIF -->" href="{USERS_DETAILS_REVIEWS_URL}#tab_reviews" data-toggle="tab" role="tab">{PHP.L.reviews_reviews} {USERS_DETAILS_REVIEWS_COUNT}</a></li>
			<!-- ENDIF -->
		</ul>
	</div>
	<div class="tab-content m-t-2">
		<div class="tab-pane<!-- IF !{PHP.tab} --> active<!-- ENDIF -->" id="tab_info" role="tabpanel">	
			<!-- IF {USERS_DETAILS_CATS} -->
			<div class="m-b-1 font-weight-bold">Специализации:</div>
			<div class="m-l-2">{USERS_DETAILS_CATS|cot_usercategories_tree($this, '', 'list')}</div>
			<!-- ENDIF -->		
		</div>
		<div class="tab-pane<!-- IF {PHP.tab} == 'portfolio' --> active<!-- ENDIF -->" id="tab_portfolio" role="tabpanel">
			{PORTFOLIO}
		</div>
		<div class="tab-pane<!-- IF {PHP.tab} == 'market' --> active<!-- ENDIF -->" id="tab_market" role="tabpanel">
			{MARKET}
		</div>
		<div class="tab-pane<!-- IF {PHP.tab} == 'projects' --> active<!-- ENDIF -->" id="tab_projects" role="tabpanel">
			{PROJECTS}
		</div>
		<div class="tab-pane<!-- IF {PHP.tab} == 'reviews' --> active<!-- ENDIF -->" id="tab_reviews" role="tabpanel">
			{REVIEWS}
		</div>
	</div>
</div>

<!-- END: MAIN -->
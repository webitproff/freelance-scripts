<!-- BEGIN: MAIN -->


<!-- IF {PHP.usr.auth_write} -->
<div class="pull-xs-right"><noindex><a rel="nofollow" class="btn btn-success" href="{SUBMITNEWPROJECT_URL}" title="{PHP.L.projects_add_to_catalog}">{PHP.L.projects_add_to_catalog}</a></noindex></div>
<!-- ENDIF -->

<h1 class="m-t-2">
	{PHP.L.projects}
</h1>
<p class="m-b-2">{CATTITLE}</p>

<!-- IF {CATDESC} -->
<p class="text-muted">{CATDESC}</p>
<!-- ENDIF -->

<div class="row">
	<div class="col-md-3">
		
		<div class="card graygradient m-b-2">			
			<div class="card-block">			
				<form action="{SEARCH_ACTION_URL}" method="get" class="form-horizontal">
					<input type="hidden" name="e" value="projects" />
					<input type="hidden" name="type" value="{PHP.type}" />
					<input type="hidden" name="l" value="{PHP.lang}" />
					<div class="form-group">
						<label>{PHP.L.Search}:</label>
						<div>{SEARCH_SQ}</div>
					</div>
					<!-- IF {PHP.cot_plugins_active.locationselector} -->
					<div class="form-group">
						<label>{PHP.L.Location}:</label>
						<div>{SEARCH_LOCATION}</div>
					</div>
					<!-- ENDIF -->
					<div class="form-group">
						<label>{PHP.L.Category}:</label>
						<div>{SEARCH_CAT}</div>
					</div>
					<div class="form-group">
						<label>{PHP.L.Order}:</label>
						<div>{SEARCH_SORTER}</div>
					</div>
					<input type="submit" name="search" class="btn btn-success btn-block" value="{PHP.L.Search}" />		
				</form>
			</div>
		</div>

		<!-- IF {CATALOG} -->
		<div class="m-b-2">{CATALOG}</div>
		<!-- ENDIF -->
		
		<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.projects} -->
		<b>{PHP.L.Tags}</b>
		{PRJ_TAG_CLOUD}
		<!-- ENDIF -->
				
	</div>
	<div class="col-md-9">

		<!-- BEGIN: PTYPES -->
		<ul class="nav nav-tabs m-b-2">
			<li class="nav-item"><a class="nav-link<!-- IF {PTYPE_ALL_ACT} AND !{PHP.forpro} --> active<!-- ENDIF -->" href="{PTYPE_ALL_URL}">{PHP.L.All}</a></li>
			<!-- BEGIN: PTYPES_ROWS -->
			<li class="nav-item"><a class="nav-link<!-- IF {PTYPE_ROW_ACT} --> active<!-- ENDIF -->" href="{PTYPE_ROW_URL}">{PTYPE_ROW_TITLE}</a></li>
			<!-- END: PTYPES_ROWS -->
			<!-- IF {PHP.cot_plugins_active.paypro} -->
			<li class="nav-item"><a class="nav-link<!-- IF {PHP.forpro} --> active<!-- ENDIF -->" href="{FORPRO_URL}">{PHP.L.paypro_forpro}</a></li>
			<!-- ENDIF -->
		</ul>	
		<!-- END: PTYPES -->

		<!-- IF {PHP.cot_plugins_active.paypro} -->
			<!-- IF !{PHP|cot_getuserpro()} AND {PHP.cfg.plugin.paypro.projectslimit} > 0 AND {PHP.cfg.plugin.paypro.projectslimit} <= {PHP.usr.id|cot_getcountprjofuser($this)} -->
			<div class="alert alert-warning">{PHP.L.paypro_warning_projectslimit_empty}</div>
			<!-- ENDIF -->
			<!-- IF !{PHP|cot_getuserpro()} AND {PHP.cfg.plugin.paypro.offerslimit} > 0 AND {PHP.cfg.plugin.paypro.offerslimit} <= {PHP.usr.id|cot_getcountoffersofuser($this)} -->
			<div class="alert alert-warning">{PHP.L.paypro_warning_offerslimit_empty}</div>
			<!-- ENDIF -->
		<!-- ENDIF -->
		
		<div id="listprojects">
			<!-- BEGIN: PRJ_ROWS -->
			<div class="card<!-- IF {PRJ_ROW_ISBOLD} --> card-info<!-- ENDIF --><!-- IF {PRJ_ROW_ISTOP} --> card-primary<!-- ENDIF -->">
				<div class="card-block">
					<h4>
						<!-- IF {PRJ_ROW_COST} > 0 --><div class="pull-xs-right">{PRJ_ROW_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF -->
						<a href="{PRJ_ROW_URL}">{PRJ_ROW_SHORTTITLE}</a>
					</h4>
					<p class="text-muted small"><a href="{PRJ_ROW_OWNER_DETAILSLINK}">{PRJ_ROW_OWNER_FULL_NAME}</a> | <span class="date">{PRJ_ROW_DATE_STAMP|cot_date('j F Y', $this)}</span> | <span class="region">{PRJ_ROW_COUNTRY} {PRJ_ROW_REGION} {PRJ_ROW_CITY}</span>   {PRJ_ROW_EDIT_URL}</p>
					<p class="text">{PRJ_ROW_SHORTTEXT|strip_tags($this)}</p>
					
					<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.projects} -->
					<p class="small">{PHP.L.Tags}: 
						<!-- BEGIN: PRJ_ROW_TAGS_ROW --><!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF --><a href="{PRJ_ROW_TAGS_ROW_URL}" title="{PRJ_ROW_TAGS_ROW_TAG}" rel="nofollow">{PRJ_ROW_TAGS_ROW_TAG}</a><!-- END: PRJ_ROW_TAGS_ROW -->
						<!-- BEGIN: PRJ_ROW_NO_TAGS -->{PRJ_ROW_NO_TAGS}<!-- END: PRJ_ROW_NO_TAGS -->
					</p>
					<!-- ENDIF -->
					
					<div class="pull-xs-right offers"><a href="{PRJ_ROW_OFFERS_ADDOFFER_URL}">{PRJ_ROW_OFFERS_COUNT|cot_declension($this, 'offers')}</a></div>
					<div class="type"><!-- IF {PHP.cot_plugins_active.paypro} AND {PRJ_ROW_FORPRO} --><span class="label label-success">{PHP.L.paypro_forpro}</span> <!-- ENDIF --><!-- IF {PRJ_ROW_TYPE} -->{PRJ_ROW_TYPE} / <!-- ENDIF --><a href="{PRJ_ROW_CATURL}">{PRJ_ROW_CATTITLE}</a></div>
				</div>
			</div>
			<!-- END: PRJ_ROWS -->
		</div>
		<!-- IF {PAGENAV_COUNT} > 0 -->	
		<nav><ul class="pagination">{PAGENAV_PAGES}</ul></nav>
		<!-- ELSE -->
		<div class="text-muted">{PHP.L.projects_notfound}</div>
		<!-- ENDIF -->
	</div>
</div>

<!-- END: MAIN -->
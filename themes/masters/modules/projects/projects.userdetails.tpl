<!-- BEGIN: MAIN -->
<h4><!-- IF {PHP.usr.id} == {PHP.urr.user_id} AND {ADDPRJ_SHOWBUTTON} --><div class="pull-xs-right"><a href="{PHP|cot_url('projects', 'm=add')}" class="btn btn-success">{PHP.L.projects_add_to_catalog}</a></div><!-- ENDIF -->{PHP.L.projects_projects}</h4>

<!-- IF {PAGENAV_COUNT} > 0 -->	
<ul class="nav nav-inline">
	<a class="nav-link" href="{PHP.urr.user_id|cot_url('users', 'm=details&id=$this&tab=projects')}">{PHP.L.All}</a>
  	<!-- BEGIN: CAT_ROW -->
	<a class="nav-link<!-- IF {PRJ_CAT_ROW_SELECT} --> active<!-- ENDIF -->" href="{PRJ_CAT_ROW_URL}">
		<!-- IF {PRJ_ROW_CAT_ICON} -->
			<img src="{PRJ_CAT_ROW_ICON}" alt="{PRJ_CAT_ROW_TITLE} ">
		<!-- ENDIF -->
		{PRJ_CAT_ROW_TITLE} 
		<span class="badge badge-inverse">{PRJ_CAT_ROW_COUNT_PROJECTS}</span>
	</a>
  	<!-- END: CAT_ROW -->
</ul>
<hr>
<div id="listprojects">
	<!-- BEGIN: PRJ_ROWS -->
	<div class="card<!-- IF {PRJ_ROW_ISBOLD} --> card-info<!-- ENDIF --><!-- IF {PRJ_ROW_ISTOP} --> card-primary<!-- ENDIF -->">
		<div class="card-block">
			<h4>
				<!-- IF {PRJ_ROW_COST} > 0 --><div class="pull-xs-right">{PRJ_ROW_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF -->
				<a href="{PRJ_ROW_URL}">{PRJ_ROW_SHORTTITLE}</a>
			</h4>
			<p class="text-muted small"><!-- IF {PRJ_ROW_USER_IS_ADMIN} --> <span class="label label-info">{PRJ_ROW_LOCALSTATUS}</span> | <!-- ENDIF --> <span class="date">{PRJ_ROW_DATE_STAMP|cot_date('j F Y', $this)}</span> | <span class="region">{PRJ_ROW_COUNTRY} {PRJ_ROW_REGION} {PRJ_ROW_CITY}</span>   {PRJ_ROW_EDIT_URL}</p>
			<p class="text">{PRJ_ROW_SHORTTEXT|strip_tags($this)}</p>
			
			<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.projects} -->
			<p class="small">{PHP.L.Tags}: 
				<!-- BEGIN: PRJ_ROW_TAGS_ROW --><!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF --><a href="{PRJ_ROW_TAGS_ROW_URL}" title="{PRJ_ROW_TAGS_ROW_TAG}" rel="nofollow">{PRJ_ROW_TAGS_ROW_TAG}</a><!-- END: PRJ_ROW_TAGS_ROW -->
				<!-- BEGIN: PRJ_ROW_NO_TAGS -->{PRJ_ROW_NO_TAGS}<!-- END: PRJ_ROW_NO_TAGS -->
			</p>
			<!-- ENDIF -->
			
			<div class="pull-xs-right offers"><a href="{PRJ_ROW_OFFERS_ADDOFFER_URL}">{PRJ_ROW_OFFERS_COUNT|cot_declension($this, 'offers')}</a></div>
			<div class="type"><!-- IF {PHP.cot_plugins_active.paypro} AND {PRJ_ROW_FORPRO} --><span class="label label-success">{PHP.L.paypro_forpro}</span> <!-- ENDIF --><!-- IF {PRJ_ROW_TYPE} -->{PRJ_ROW_TYPE} / <!-- ENDIF --><a href="{PRJ_ROW_CATURL}">{PRJ_ROW_CATTITLE}</a></div>

			<p>
				<!-- IF {PHP.cot_plugins_active.payprjtop} AND {PHP.usr.id} == {PHP.urr.user_id} --><div>{PRJ_ROW_PAYTOP}</div><!-- ENDIF -->
				<!-- IF {PHP.cot_plugins_active.payprjbold} AND {PHP.usr.id} == {PHP.urr.user_id} --><div>{PRJ_ROW_PAYBOLD}</div><!-- ENDIF -->
			</p>
		</div>
	</div>
	<!-- END: PRJ_ROWS -->
</div>

<div class="pagination"><ul>{PAGENAV_PAGES}</ul></div>
<!-- ELSE -->
<div class="alert">{PHP.L.projects_empty}</div>
<!-- ENDIF -->

<!-- END: MAIN -->
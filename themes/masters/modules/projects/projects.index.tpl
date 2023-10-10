<!-- BEGIN: SEARCH -->

	<div class="card m-b-2">			
		<div class="card-block">			
			<form action="{SEARCH_ACTION_URL}" method="get">
				<input type="hidden" name="e" value="projects" />
				<input type="hidden" name="type" value="{PHP.type}" />
				<input type="hidden" name="l" value="{PHP.lang}" />
				<div class="row">
					<div class="col-md-10">{SEARCH_SQ|cot_rc_modify($this, 'placeholder="Поиск"')}</div>
					<div class="col-md-2">
						<input type="submit" name="search" class="btn btn-success" value="{PHP.L.Search}" />
					</div>
				</div>	
			</form>
		</div>
	</div>
<!-- END: SEARCH -->

<!-- BEGIN: PROJECTS -->
<div id="listprojects">
	<!-- BEGIN: PRJ_ROWS -->
	<div class="card<!-- IF {PRJ_ROW_ISBOLD} --> card-info<!-- ENDIF --><!-- IF {PRJ_ROW_ISTOP} --> card-primary<!-- ENDIF -->">
		<div class="card-block">
			<h4>
				<!-- IF {PRJ_ROW_COST} > 0 --><div class="pull-xs-right">{PRJ_ROW_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF -->
				<a href="{PRJ_ROW_URL}">{PRJ_ROW_SHORTTITLE}</a>
			</h4>
			<p class="text-muted small">{PRJ_ROW_OWNER_NAME} | <span class="date">{PRJ_ROW_DATE_STAMP|cot_date('j F Y', $this)}</span> | <span class="region">{PRJ_ROW_COUNTRY} {PRJ_ROW_REGION} {PRJ_ROW_CITY}</span>   {PRJ_ROW_EDIT_URL}</p>
			<p class="text">{PRJ_ROW_SHORTTEXT|strip_tags($this)}</p>
			
			<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.projects} -->
			<p class="small">{PHP.L.Tags}: 
				<!-- BEGIN: PRJ_ROW_TAGS_ROW --><!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF --><a href="{PRJ_ROW_TAGS_ROW_URL}" title="{PRJ_ROW_TAGS_ROW_TAG}" rel="nofollow">{PRJ_ROW_TAGS_ROW_TAG}</a><!-- END: PRJ_ROW_TAGS_ROW -->
				<!-- BEGIN: PRJ_ROW_NO_TAGS -->{PRJ_ROW_NO_TAGS}<!-- END: PRJ_ROW_NO_TAGS -->
			</p>
			<!-- ENDIF -->
			
			<div class="pull-xs-right offers"><a href="{PRJ_ROW_OFFERS_ADDOFFER_URL}">{PHP.L.offers_add_offer}</a> ({PRJ_ROW_OFFERS_COUNT})</div>
			<div class="type"><!-- IF {PHP.cot_plugins_active.paypro} AND {PRJ_ROW_FORPRO} --><span class="label label-success">{PHP.L.paypro_forpro}</span> <!-- ENDIF --><!-- IF {PRJ_ROW_TYPE} -->{PRJ_ROW_TYPE} / <!-- ENDIF --><a href="{PRJ_ROW_CATURL}">{PRJ_ROW_CATTITLE}</a></div>
		</div>
	</div>
	<!-- END: PRJ_ROWS -->
</div>
<!-- END: PROJECTS -->
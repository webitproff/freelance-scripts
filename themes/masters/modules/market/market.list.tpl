<!-- BEGIN: MAIN -->

<!-- IF {PHP.usr.auth_write} -->
<div class="pull-xs-right">
	<a class="btn btn-success" href="{PHP|cot_url('market', 'm=add')}">{PHP.L.market_add_product}</a>
</div>	
<!-- ENDIF -->
<h1 class="m-t-2">
	{PHP.L.market}
</h1>
<p class="text-muted">{CATTITLE}</p>
<!-- IF {CATDESC} -->
<p>{CATDESC}</p>
<!-- ENDIF -->

<div class="row">
	<div class="col-md-3">
		<div class="card graygradient m-b-2">			
			<div class="card-block">			
				<form action="{SEARCH_ACTION_URL}" method="get" class="form-horizontal">
					<input type="hidden" name="e" value="market" />
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
		
		<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.market} -->
		<b>{PHP.L.Tags}</b>
		{PRD_TAG_CLOUD}
		<!-- ENDIF -->
		
	</div>
	<div class="col-md-9">
		<div id="listmarket">
			<!-- BEGIN: PRD_ROWS -->
			<div class="card">
				<div class="card-block">
					<div class="media">
						<!-- IF {PRD_ROW_MAVATAR.1} -->
						<div class="media-left">
							<a href="{PRD_ROW_URL}"><div class="thumbnail"><img src="{PRD_ROW_MAVATAR.1|cot_mav_thumb($this, 140, 140, crop)}" /></div></a>
						</div>
						<!-- ENDIF -->
						<div class="media-body">
							<h4 class="media-heading"><!-- IF {PRD_ROW_COST} > 0 --><div class="cost pull-xs-right">{PRD_ROW_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF --><a href="{PRD_ROW_URL}">{PRD_ROW_SHORTTITLE}</a></h4>
							<p class="text-muted small"><a href="{PRD_ROW_OWNER_DETAILSLINK}">{PRD_ROW_OWNER_FULL_NAME}</a> | <span class="date">{PRD_ROW_DATE_STAMP|cot_date('j F Y, H:i', $this)}</span> | <a href="{PRD_ROW_CATURL}">{PRD_ROW_CATTITLE}</a> | {PRD_ROW_COUNTRY} {PRD_ROW_REGION} {PRD_ROW_CITY} &nbsp; {PRD_ROW_EDIT_URL}</p>
							<p class="text">{PRD_ROW_SHORTTEXT|strip_tags($this)}</p>
							
							<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.folio} -->
							<p class="small">{PHP.L.Tags}: 
								<!-- BEGIN: PRD_ROW_TAGS_ROW --><!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF --><a href="{PRD_ROW_TAGS_ROW_URL}" title="{PRD_ROW_TAGS_ROW_TAG}" rel="nofollow">{PRD_ROW_TAGS_ROW_TAG}</a><!-- END: PRD_ROW_TAGS_ROW -->
								<!-- BEGIN: PRD_ROW_NO_TAGS -->{PRD_ROW_NO_TAGS}<!-- END: PRD_ROW_NO_TAGS -->
							</p>
							<!-- ENDIF -->							
						</div>
					</div>
				</div>
			</div>
			<!-- END: PRD_ROWS -->
		</div>
		
		<!-- IF {PAGENAV_COUNT} > 0 -->	
		<nav><ul class="pagination">{PAGENAV_PAGES}</ul></nav>
		<!-- ELSE -->
		<div class="text-muted">{PHP.L.market_notfound}</div>
		<!-- ENDIF -->
		
	</div>
</div>

<!-- END: MAIN -->
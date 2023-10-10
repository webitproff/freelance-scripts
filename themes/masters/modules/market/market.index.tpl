<!-- BEGIN: MARKET -->
<div class="mboxHD">{PHP.L.market}</div>
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
<nav><ul class="pagination">{PAGENAV_PAGES}</ul></nav>
<!-- END: MARKET -->
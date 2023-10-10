<!-- BEGIN: MAIN -->

<!-- IF {PRD_COST} > 0 --><div class="pull-xs-right cost">{PRD_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF -->
<h1 class="m-t-2">{PRD_SHORTTITLE}</h1>
<p class="date small m-b-2">{PRD_DATE_STAMP|cot_date('j F Y, H:i', $this)}</p>
<!-- IF {PRD_STATE} == 2 -->
<div class="alert alert-warning">{PHP.L.folio_forreview}</div>
<!-- ENDIF -->
<!-- IF {PRD_STATE} == 1 -->
<div class="alert alert-warning">{PHP.L.folio_hidden}</div>
<!-- ENDIF -->
<div class="row">
	<div class="col-md-9">
		<div class="media m-b-2">
			<!-- IF {PRD_MAVATAR.1} -->
				<div class="thumbnail"><img src="{PRD_MAVATAR.1.FILE}" alt="{PRD_MAVATAR.1.TITLE}" /></div>

				<!-- IF {PRD_MAVATARCOUNT} -->
				<div class="m-t-2">
					<!-- FOR {KEY}, {VALUE} IN {PRD_MAVATAR} -->
						<!-- IF {KEY} != 1 -->
						<div class="pull-xs-left m-r-1">
							<a href="{VALUE.FILE}" class="span1 pull-left"><img src="{VALUE|cot_mav_thumb($this, 100, 100, crop)}" /></a>
						</div>
						<!-- ENDIF -->
					<!-- ENDFOR -->
					<div class="clearfix"></div>
				</div>
				<!-- ENDIF -->
			<!-- ENDIF -->	
		</div>	

		<p class="location">{PRD_COUNTRY} {PRD_REGION} {PRD_CITY}</p>
		<p class="text">{PRD_TEXT}</p>
		<p>
			<a href="{PRD_SAVE_URL}" class="btn btn-success"><span>{PHP.L.Publish}</span></a> 
			<a href="{PRD_EDIT_URL}" class="btn btn-info"><span>{PHP.L.Edit}</span></a>
		</p>
		
		<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.folio} -->
		<p>{PHP.L.Tags}: 
			<!-- BEGIN: PRD_TAGS_ROW --><!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF --><a href="{PRD_TAGS_ROW_URL}" title="{PRD_TAGS_ROW_TAG}" rel="nofollow">{PRD_TAGS_ROW_TAG}</a><!-- END: PRD_TAGS_ROW -->
			<!-- BEGIN: PRD_NO_TAGS -->{PRD_NO_TAGS}<!-- END: PRD_NO_TAGS -->
		</p>
		<!-- ENDIF -->
	</div>
	<div class="col-md-3">	
		<div class="media">
			<div class="media-left">{PRD_OWNER_AVATAR}</div>
			<div class="media-body">
				<div class="pull-xs-right"><span class="label label-info">{PRD_OWNER_USERPOINTS}</span></div>
				<div class="owner">{PRD_OWNER_NAME}</div>
			</div>
		</div>	
	</div>
</div>

<!-- END: MAIN -->
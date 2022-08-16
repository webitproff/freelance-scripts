<!-- BEGIN: MAIN -->

<!-- IF {PRD_COST} > 0 --><div class="pull-xs-right cost">{PRD_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF -->
<h1 class="m-t-2">{PRD_SHORTTITLE}</h1>
<p class="date small m-b-2">{PRD_DATE_STAMP|cot_date('j F Y, H:i', $this)}</p>
<!-- IF {PRD_STATE} == 2 -->
<div class="alert alert-warning">{PHP.L.market_forreview}</div>
<!-- ENDIF -->
<!-- IF {PRD_STATE} == 1 -->
<div class="alert alert-warning">{PHP.L.market_hidden}</div>
<!-- ENDIF -->
<div class="row">
	<div class="col-md-9">
		<!-- IF {PRD_MAVATAR.1} -->
		<div class="media m-b-2">
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
		</div>	
		<!-- ENDIF -->	

		<p class="location">{PRD_COUNTRY} {PRD_REGION} {PRD_CITY}</p>
		<p class="text">{PRD_TEXT}</p>
		
		<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.market} -->
		<p>{PHP.L.Tags}: 
			<!-- BEGIN: PRD_TAGS_ROW --><!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF --><a href="{PRD_TAGS_ROW_URL}" title="{PRD_TAGS_ROW_TAG}" rel="nofollow">{PRD_TAGS_ROW_TAG}</a><!-- END: PRD_TAGS_ROW -->
			<!-- BEGIN: PRD_NO_TAGS -->{PRD_NO_TAGS}<!-- END: PRD_NO_TAGS -->
		</p>
		<!-- ENDIF -->
	</div>
	<div class="col-md-3">	
		<div class="media">
			<div class="media-left"><a href="{PRD_OWNER_DETAILSLINK}">{PRD_OWNER_AVATAR}</a></div>
			<div class="media-body">
				<h4 class="media-heading"><a href="{PRD_OWNER_DETAILSLINK}">{PRD_OWNER_FULL_NAME}</a></h4>
				<!-- IF {{PRD_OWNER_ISPRO} --><span class="label label-success">PRO</span><!-- ENDIF -->
				<span class="label label-info">{PRD_OWNER_USERPOINTS}</span>
			</div>
		</div>	

		<!-- IF {PRD_COST} > 0 AND {PRD_STATE} == 0 AND {PHP.cot_plugins_active.marketorders} AND {PHP|cot_auth('plug', 'marketorders', 'R')} -->
	    <div class="m-t-2">
	        <!-- IF {PRD_ORDER_ID} -->
	            <a href="{PRD_ORDER_URL}">{PHP.L.marketorders_title}</a>
	            <!-- IF {PRD_ORDER_DOWNLOAD} -->
	            <p><a class="btn btn-success" href="{PRD_ORDER_DOWNLOAD}">{PHP.L.marketorders_file_download}</a></p>
	            <!-- ELSE -->
	            <p><span class="label label-info">{PRD_ORDER_LOCALSTATUS}</span></p>
	            <!-- ENDIF -->  
	         <!-- ELSE -->
	             <p><a class="btn btn-large btn-success btn-block" href="{PRD_ID|cot_url('marketorders', 'm=neworder&pid='$this)}">{PHP.L.marketorders_neworder_button}</a></p>
	         <!-- ENDIF -->
	    </div>
		<!-- ENDIF -->

		<!-- IF {PRD_USER_IS_ADMIN} -->
		<div class="m-t-2">
			<p>
				<a href="{PRD_SAVE_URL}" class="btn btn-success"><span>{PHP.L.Publish}</span></a> 
				<a href="{PRD_EDIT_URL}" class="btn btn-info"><span>{PHP.L.Edit}</span></a>
			</p>
		</div>
		<!-- ENDIF -->
	</div>
</div>

<!-- END: MAIN -->

<!-- END: MAIN -->
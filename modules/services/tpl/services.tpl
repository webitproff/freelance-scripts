<!-- BEGIN: MAIN -->
<div class="breadcrumb">{SERV_TITLE}</div>
<h1><!-- IF {SERV_COST} > 0 --><div class="pull-right cost">{SERV_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF -->{SERV_SHORTTITLE}</h1>
<!-- IF {SERV_STATE} == 2 -->
<div class="alert alert-warning">{PHP.L.services_forreview}</div>
<!-- ENDIF -->
<!-- IF {SERV_STATE} == 1 -->
<div class="alert alert-warning">{PHP.L.services_hidden}</div>
<!-- ENDIF -->
<div class="row">
	<div class="span9">
		<div class="media">
			<!-- IF {SERV_MAVATAR.1} -->
			<div class="pull-left">
				<a href="{SERV_MAVATAR.1.FILE}"><div class="thumbnail"><img src="{SERV_MAVATAR.1|cot_mav_thumb($this, 200, 200, crop)}" /></div></a>

				
				<!-- IF {SERV_MAVATARCOUNT} -->
				<p>&nbsp;</p>
				<div class="row">
					<!-- FOR {KEY}, {VALUE} IN {SERV_MAVATAR} -->
					<!-- IF {KEY} != 1 -->
					<a href="{VALUE.FILE}" class="span1 pull-left"><img src="{VALUE|cot_mav_thumb($this, 200, 200, crop)}" /></a>
					<!-- ENDIF -->
					<!-- ENDFOR -->
				</div>
				<!-- ENDIF -->
			</div>
			<!-- ENDIF -->		
			<p class="date">[{SERV_DATE}]</p>
			<p class="location">{SERV_COUNTRY} {SERV_REGION} {SERV_CITY}</p>
			<p class="text">{SERV_TEXT}</p>
			
			<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.services} -->
			<p>{PHP.L.Tags}: 
				<!-- BEGIN: SERV_TAGS_ROW --><!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF --><a href="{SERV_TAGS_ROW_URL}" title="{SERV_TAGS_ROW_TAG}" rel="nofollow">{SERV_TAGS_ROW_TAG}</a><!-- END: SERV_TAGS_ROW -->
				<!-- BEGIN: SERV_NO_TAGS -->{SERV_NO_TAGS}<!-- END: SERV_NO_TAGS -->
			</p>
			<!-- ENDIF -->
			
		</div>	
	</div>
	<div class="span3">	
		<div class="row">
			<div class="span1">{SERV_OWNER_AVATAR}</div>
			<div class="span2">
				<div class="pull-right"><span class="label label-info">{SERV_OWNER_USERPOINTS}</span></div>
				<div class="owner">{SERV_OWNER_NAME}</div>
			</div>
		</div>
		<!-- IF {SERV_USER_IS_ADMIN} -->
		<div class="well well-small">
			{SERV_ADMIN_EDIT} &nbsp; 
			<!-- IF {SERV_STATE} != 2 -->
				<a href="{SERV_HIDESERVICE_URL}">{SERV_HIDESERVICE_TITLE}</a>
			<!-- ENDIF -->
		</div>
		<!-- ENDIF -->	
	</div>
</div>

<!-- END: MAIN -->
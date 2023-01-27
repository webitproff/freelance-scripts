<!-- BEGIN: MAIN -->
<div class="breadcrumb">{SERV_TITLE}</div>
<h1><!-- IF {SERV_COST} > 0 --><div class="pull-right cost">{SERV_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF -->{SERV_SHORTTITLE}</h1>
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
			<hr/>
			<p>
				<a href="{SERV_SAVE_URL}" class="btn btn-success"><span>{PHP.L.Publish}</span></a> 
				<a href="{SERV_EDIT_URL}" class="btn btn-info"><span>{PHP.L.Edit}</span></a>
			</p>	
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
	</div>
</div>

<!-- END: MAIN -->
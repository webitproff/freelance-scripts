<!-- BEGIN: SERVICES -->
<div class="mboxHD">{PHP.L.services} </div>
<div id="listservices">
	<!-- BEGIN: SERV_ROWS -->
	<div class="media">
		<!-- IF {SERV_ROW_MAVATAR.1} -->
		<div class="pull-left">
			<a href="{SERV_ROW_URL}"><div class="thumbnail"><img src="{SERV_ROW_MAVATAR.1|cot_mav_thumb($this, 100, 100, crop)}" /></div></a>
		</div>
		<!-- ENDIF -->
		<h4><!-- IF {SERV_ROW_COST} > 0 --><div class="cost pull-right">{SERV_ROW_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF --><a href="{SERV_ROW_URL}">{SERV_ROW_SHORTTITLE}</a></h4>
		<p class="owner">{SERV_ROW_OWNER_NAME} <span class="date">[{SERV_ROW_DATE}]</span> &nbsp;{SERV_ROW_COUNTRY} {SERV_ROW_REGION} {SERV_ROW_CITY} &nbsp; {SERV_ROW_EDIT_URL}</p>
		<p class="text">{SERV_ROW_SHORTTEXT}</p>
		<p class="type"><a href="{SERV_ROW_CATURL}">{SERV_ROW_CATTITLE}</a></p>
	</div>
	<!-- END: SERV_ROWS -->
</div>
<div class="pagination"><ul>{PAGENAV_PAGES}</ul></div>
<!-- END: SERVICES -->
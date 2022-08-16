<!-- BEGIN: MAIN -->

<h1 class="m-y-2">{PHP.L.offers_useroffers}</h1>

<ul class="nav nav-tabs m-b-2" id="myTab">
	<li class="nav-item"><a class="nav-link<!-- IF !{PHP.choise} --> active<!-- ENDIF -->" href="{PHP|cot_url('projects', 'm=useroffers')}">{PHP.L.All}</a></li>
	<li class="nav-item"><a class="nav-link<!-- IF {PHP.choise} == 'none' --> active<!-- ENDIF -->" href="{PHP|cot_url('projects', 'm=useroffers&choise=none')}">{PHP.L.offers_useroffers_none}</a></li>
	<li class="nav-item"><a class="nav-link<!-- IF {PHP.choise} == 'performer' --> active<!-- ENDIF -->" href="{PHP|cot_url('projects', 'm=useroffers&choise=performer')}">{PHP.L.offers_useroffers_performer}</a></li>
	<li class="nav-item"><a class="nav-link<!-- IF {PHP.choise} == 'refuse' --> active<!-- ENDIF -->" href="{PHP|cot_url('projects', 'm=useroffers&choise=refuse')}">{PHP.L.offers_useroffers_refuse}</a></li>
</ul>

<!-- BEGIN: OFFER_ROWS -->	
<div class="card<!-- IF {OFFER_ROW_PROJECT_ISBOLD} --> card-info<!-- ENDIF --><!-- IF {OFFER_ROW_PROJECT_ISTOP} --> card-primary<!-- ENDIF -->">	
	<div class="card-block">	
		<div class="media">
			<h4>
				<!-- IF {OFFER_ROW_PROJECT_COST} > 0 --><div class="pull-xs-right">{OFFER_ROW_PROJECT_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF -->
				<a href="{OFFER_ROW_PROJECT_URL}">{OFFER_ROW_PROJECT_SHORTTITLE}</a>
			</h4>
			<p class="text-muted small">{OFFER_ROW_PROJECT_DATE_STAMP|cot_date('j F Y, H:i', $this)}</p>
			<p class="text">{OFFER_ROW_PROJECT_SHORTTEXT}</p>
			<div class="pull-xs-right offers"><a href="{OFFER_ROW_PROJECT_OFFERS_ADDOFFER_URL}">{OFFER_ROW_PROJECT_OFFERS_COUNT|cot_declension($this, 'offers')}</a></div>
			<div class="type"><!-- IF {OFFER_ROW_PROJECT_TYPE} -->{OFFER_ROW_PROJECT_TYPE} / <!-- ENDIF --><a href="{OFFER_ROW_PROJECT_CATURL}">{OFFER_ROW_PROJECT_CATTITLE}</a></div>
			<hr/>
			<div class="row">
				<div class="col-md-9">
					<p>{OFFER_ROW_TEXT}</p>
				</div>
				<div class="col-md-3">
					<p>
						{PHP.L.Date}: {PHP.offer.offer_date|cot_date('j F Y, H:i', $this)}
					</p>
					<p class="cost">
						<!-- IF {OFFER_ROW_COSTMAX} > {OFFER_ROW_COSTMIN} AND {OFFER_ROW_COSTMIN} != 0 -->
						{PHP.L.offers_budget}: {PHP.L.offers_ot} {OFFER_ROW_COSTMIN}
						{PHP.L.offers_do} {OFFER_ROW_COSTMAX} {PHP.cfg.payments.valuta}
						<!-- ENDIF -->
						<!-- IF {OFFER_ROW_COSTMAX} == {OFFER_ROW_COSTMIN} AND {OFFER_ROW_COSTMIN} != 0 OR {OFFER_ROW_COSTMAX} == 0 AND {OFFER_ROW_COSTMIN} != 0 -->
						{PHP.L.offers_budget}: {OFFER_ROW_COSTMIN} {PHP.cfg.payments.valuta}
						<!-- ENDIF -->
					</p>
					<p class="time">
						<!-- IF {OFFER_ROW_TIMEMAX} > {OFFER_ROW_TIMEMIN} AND {OFFER_ROW_TIMEMIN} != 0 -->
						{PHP.L.offers_sroki}: {PHP.L.offers_ot} 
						{OFFER_ROW_TIMEMIN} {PHP.L.offers_do} {OFFER_ROW_TIMEMAX} {OFFER_ROW_TIMETYPE}
						<!-- ENDIF -->
						<!-- IF {OFFER_ROW_TIMEMAX} == {OFFER_ROW_TIMEMIN} AND {OFFER_ROW_TIMEMIN} != 0 OR {OFFER_ROW_TIMEMAX} == 0 AND {OFFER_ROW_TIMEMIN} != 0 -->
						{PHP.L.offers_sroki}: {OFFER_ROW_TIMEMIN} {OFFER_ROW_TIMETYPE}
						<!-- ENDIF -->
					</p>
					<p>
						<!-- IF {OFFER_ROW_CHOISE} -->
							<!-- IF {OFFER_ROW_CHOISE} == 'performer' -->
							<span class="label label-success">{PHP.L.offers_vibran_ispolnitel}</span>
							<!-- ELSE -->
							<span class="label label-warning">{PHP.L.offers_otkazali}</span>
							<!-- ENDIF -->
						<!-- ELSE -->
							<span class="label">{PHP.L.offers_useroffers_none}</span>
						<!-- ENDIF -->
					</p>
				</div>
			</div>
		</div>	
	</div>	
</div>	
<!-- END: OFFER_ROWS -->
<div class="pagination"><ul>{PAGENAV_PAGES}</ul></div>



<!-- END: MAIN -->



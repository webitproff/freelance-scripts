<!-- BEGIN: MAIN -->
{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
<!-- IF {PRJ_PERFORMER_ID} > 0 -->
<h4>{PHP.L.offers_vibran_ispolnitel}</h4>
<div class="card m-b-2">
	<div class="card-block">
		<div class="media">
			<div class="media-left">
				{PRJ_PERFORMER_AVATAR}
			</div>
			<div class="media-body">
				<div class="media-heading">{PRJ_PERFORMER_NAME}</div>
				<p>
					<!-- IF {PRJ_PERFORMER_ISPRO} -->
					<span class="label label-success">PRO</span> 
					<!-- ENDIF -->
					<span class="label label-info">{PRJ_PERFORMER_USERPOINTS}</span>
				</p>		
			</div>
		</div>
	</div>
</div>
<!-- ENDIF -->

<!-- BEGIN: PROJECTFORPRO -->
<div class="alert alert-warning">{PHP.L.paypro_warning_onlyforpro}</div>
<!-- END: PROJECTFORPRO -->

<!-- BEGIN: OFFERSLIMITEMPTY -->
<div class="alert alert-warning">{PHP.L.paypro_warning_offerslimit_empty}</div>
<!-- END: OFFERSLIMITEMPTY -->

<div id="offers">	
	<h4>{PHP.L.offers_offers} ({ALLOFFERS_COUNT})</h4><br/>
	<!-- BEGIN: ROWS -->
	<div class="card">
		<div class="card-block">
			<div class="media">
				<div class="media-left">
					{OFFER_ROW_OWNER_AVATAR}
				</div>
				<div class="media-body">					
					<div class="pull-xs-right text-muted small">
						{OFFER_ROW_DATE_STAMP|cot_date('j F Y, H:i', $this)}
					</div>	
					<div class="media-heading">{OFFER_ROW_OWNER_NAME} <span> &nbsp; {OFFER_ROW_EDIT}</span></div>
					<p>
						<!-- IF {OFFER_ROW_OWNER_ISPRO} -->
						<span class="label label-success">PRO</span> 
						<!-- ENDIF -->
						<span class="label label-info">{OFFER_ROW_OWNER_USERPOINTS}</span>
					</p>
					<p class="text">{OFFER_ROW_TEXT}</p>
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
					<p class="text">
						<!-- IF {PHP.cot_plugins_active.mavatars} -->
							<!-- IF {OFFER_ROW_MAVATARCOUNT} -->
								<h5>{PHP.L.Files}:</h5>
								<ol class="files">
									<!-- FOR {KEY}, {VALUE} IN {OFFER_ROW_MAVATAR} -->
									<li><a href="{VALUE.FILE}">{VALUE.FILENAME}.{VALUE.FILEEXT}</a></li>
									<!-- ENDFOR -->
								</ol>
							<!-- ENDIF -->
						<!-- ENDIF -->
					</p>
					<!-- BEGIN: POSTS -->
					<b><a data-toggle="collapse" href="#collapsePosts{PHP.offer.offer_id}" aria-expanded="false" aria-controls="collapsePosts{PHP.offer.offer_id}">{PHP.L.offers_posts_title}</a></b>
					<div class="collapse" id="collapsePosts{PHP.offer.offer_id}">
						<div id="projectsposts" class="m-t-1">
							<!-- BEGIN: POSTS_ROWS -->
							<div class="media">
								<div class="media-left">{POST_ROW_OWNER_AVATAR}</div>
								<div class="media-body">
									<div class="pull-xs-right small">	
										{POST_ROW_DATE_STAMP|cot_date('j F Y, H:i', $this)}
									</div>
									<div class="media-heading">{POST_ROW_OWNER_NAME} <span> &nbsp; {POST_ROW_EDIT_URL}</span></div>
									{POST_ROW_TEXT}
								</div>
							</div>
							<!-- END: POSTS_ROWS -->

							<!-- BEGIN: POSTFORM -->
							<div class="postform customform m-t-2" id="postform{ADDPOST_OFFERID}">
								<form action="{ADDPOST_ACTION_URL}" method="post">
									{ADDPOST_TEXT}<br/>
									<input type="submit" name="submit" class="btn btn-success" value="{PHP.L.Submit}" />
								</form>
							</div>
							<!-- END: POSTFORM -->
						</div>
					</div>
					<!-- END: POSTS -->
					
				</div>
			</div>
		</div>		
		<!-- BEGIN: CHOISE -->
		<div class="card-footer">	
			<div class="pull-xs-right">	
				<!-- IF {OFFER_ROW_CHOISE} != "refuse" -->
				<a href="{OFFER_ROW_REFUSE}" class="btn btn-warning btn-sm">{PHP.L.offers_otkazat}</a> 
				<!-- ENDIF -->
				<!-- IF {OFFER_ROW_CHOISE} != "performer" AND {PERFORMER_USERID} == "" -->
				<a href="{OFFER_ROW_SETPERFORMER}" class="btn btn-success btn-sm">{PHP.L.offers_ispolnitel}</a> 
				<!-- ENDIF -->
				<!-- IF {OFFER_ROW_CHOISE} != "refuse" AND {PHP.cot_plugins_active.sbr} -->
				<a href="{OFFER_ROW_SBRCREATELINK}" class="btn btn-primary btn-sm">{PHP.L.sbr_createlink}</a> 
				<!-- ENDIF -->
			</div>
			<!-- IF {OFFER_ROW_CHOISE} == "refuse" -->
			<p class="pull-xs-left text-warning">{PHP.L.offers_otkazali}!</p>
			<!-- ENDIF -->
			<!-- IF {OFFER_ROW_CHOISE} == "performer" -->
			<p class="pull-xs-left text-success">{PHP.L.offers_vibran_ispolnitel}!</p>
			<!-- ENDIF -->
			<div class="clearfix"></div>
		</div>
		<!-- END: CHOISE -->
	</div>
	<!-- END: ROWS -->
</div>
					
<!-- IF {OFFERSNAV_COUNT} > 0 -->
<nav><ul class="pagination">{OFFERSNAV_PAGES}</ul></nav>
<!-- ENDIF -->

<!-- IF {ALLOFFERS_COUNT} == 0 -->
<div class="text-muted">{PHP.L.offers_empty}</div>
<!-- ENDIF -->

<!-- BEGIN: ADDOFFERFORM -->
<h4 class="m-y-2">{PHP.L.offers_ostavit_predl}</h3>
<div class="card">
	<div class="card-block">
		<form action="{OFFER_FORM_ACTION_URL}" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.offers_budget}:</label>
				<div class="col-md-9">
					<div class="row">
						<div class="col-xs-1 form-control-label">{PHP.L.offers_ot}</div>
						<div class="col-xs-2">{OFFER_FORM_COSTMIN}</div>
						<div class="col-xs-1 form-control-label">{PHP.L.offers_do}</div>
						<div class="col-xs-2">{OFFER_FORM_COSTMAX}</div>
						<div class="col-xs-1 form-control-label">{PHP.cfg.payments.valuta}</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.offers_sroki}:</label>
				<div class="col-md-9">
					<div class="row">
						<div class="col-xs-1 form-control-label">{PHP.L.offers_ot}</div>
						<div class="col-xs-2">{OFFER_FORM_TIMEMIN}</div>
						<div class="col-xs-1 form-control-label">{PHP.L.offers_do}</div>
						<div class="col-xs-2">{OFFER_FORM_TIMEMAX}</div>
						<div class="col-xs-2">{OFFER_FORM_TIMETYPE}</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.offers_text_predl}:</label>
				<div class="col-md-9">{OFFER_FORM_TEXT}</div>
			</div>
			<!-- IF {PHP.cot_plugins_active.mavatars} -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Files}:</label>
				<div class="col-md-9">{OFFER_FORM_MAVATAR}</div>
			</div>
			<!-- ENDIF -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label"></label>
				<div class="col-md-9">{OFFER_FORM_HIDDEN}</div>
			</div>
			<div class="m-t-2">
				<div class="pull-xs-right">
					<input type="submit" name="submit" class="btn btn-success" value="{PHP.L.offers_add_predl}" />
				</div>
			</div>
			<div class="clearfix"></div>
		</form>
	</div>
</div>
<!-- END: ADDOFFERFORM -->

<!-- IF {PHP.usr.id} == 0 -->
<div class="alert alert-warning">
	{PHP.L.offers_for_guest}
</div>
<!-- ENDIF -->

<!-- END: MAIN -->



<!-- BEGIN: MAIN -->

<h4>{PHP.L.offereditor_edit_title}</h4>

<div id="editofferform" class="customform">
	<form action="{OFFER_FORM_ACTION_URL}" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td width="150" align="right">{PHP.L.offers_budget}:</td>
				<td>{PHP.L.offers_ot} {OFFER_FORM_COSTMIN}
					{PHP.L.offers_do} {OFFER_FORM_COSTMAX} {PHP.cfg.payments.valuta}</td>
			</tr>
			<tr>
				<td align="right">{PHP.L.offers_sroki}:</td>
				<td>{PHP.L.offers_ot} {OFFER_FORM_TIMEMIN} 
					{PHP.L.offers_do} {OFFER_FORM_TIMEMAX} {OFFER_FORM_TIMETYPE}</td>
			</tr>
			<tr>
				<td align="right" class="top">{PHP.L.offers_text_predl}:</td>
				<td>{OFFER_FORM_TEXT}</td>
			</tr>
			<!-- IF {PHP.cot_plugins_active.mavatars} -->
			<tr>
				<td align="right" class="top">{PHP.L.Files}:</td>
				<td>{OFFER_FORM_MAVATAR}</td>
			</tr>
			<!-- ENDIF -->
			<tr>
				<td align="left"></td>
				<td>
					<div class="pull-right">
						<input type="submit" name="submit" class="btn btn-success" value="{PHP.L.offers_add_predl}" />
					</div>
					{OFFER_FORM_HIDDEN}
				</td>
			</tr>
		</table>
	</form>
</div>

<!-- END: MAIN -->
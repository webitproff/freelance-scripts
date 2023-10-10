<!-- BEGIN: MAIN -->
{FILE "{PHP.cfg.system_dir}/admin/tpl/warnings.tpl"}


<div class="uk-card uk-card-body uk-background-default uk-border-rounded uk-margin-top uk-margin-bottom"> 

        <div class="uk-margin">
<form>
<select class="uk-select" name="jumpbox"  onchange="redirect(this)" >
	<!-- BEGIN: POLLS_ROW_FILTER -->
	<option value="{ADMIN_POLLS_ROW_FILTER_VALUE}"{ADMIN_POLLS_ROW_FILTER_CHECKED}>{ADMIN_POLLS_ROW_FILTER_NAME}</option>
	<!-- END: POLLS_ROW_FILTER -->
</select>
</form>
        </div>

          <div class="uk-overflow-auto">
            <table class="uk-table uk-table-small uk-table-middle uk-table-justify uk-table-divider">
              <thead class="uk-background-default uk-text-bold uk-text-secondary">
	<tr>
		<td class="">{PHP.L.Date}</td>
		<td class="">{PHP.L.Type}</td>
		<td class="">{PHP.L.Poll} {PHP.L.adm_clicktoedit}</td>
		<td class="">{PHP.L.Votes}</td>
		<td class="">{PHP.L.Action}</td>
	</tr>
              </thead>
              <tbody>
	<!-- BEGIN: POLLS_ROW -->
	<tr>
		<td class="">{ADMIN_POLLS_ROW_POLL_CREATIONDATE}</td>
		<td class="">{ADMIN_POLLS_ROW_POLL_TYPE}</td>
		<td class="">{ADMIN_POLLS_ROW_POLL_LOCKED}<a href="{ADMIN_POLLS_ROW_POLL_URL}">{ADMIN_POLLS_ROW_POLL_TEXT}</a></td>
		<td class="">{ADMIN_POLLS_ROW_POLL_TOTALVOTES}</td>
		<td class="action">
			<!-- IF !{ADMIN_POLLS_ROW_POLL_LOCKED} -->
			<a title="{PHP.L.Lock}" href="{ADMIN_POLLS_ROW_POLL_URL_LCK}" class="button">{PHP.L.Lock}</a>
			<!-- ELSE -->
			<a title="{PHP.L.Unlock}" href="{ADMIN_POLLS_ROW_POLL_URL_LCK}" class="button">{PHP.L.Unlock}</a>
			<!-- ENDIF -->
			<a title="{PHP.L.Delete}" href="{ADMIN_POLLS_ROW_POLL_URL_DEL}" class="button">{PHP.L.Delete}</a>
			<a title="{PHP.L.Reset}" href="{ADMIN_POLLS_ROW_POLL_URL_RES}" class="button">{PHP.L.Reset}</a>
			<a title="{PHP.L.adm_polls_bump}" href="{ADMIN_POLLS_ROW_POLL_URL_BMP}" class="button">{PHP.L.adm_polls_bump}</a>
			<a title="{PHP.L.Open}" href="{ADMIN_POLLS_ROW_POLL_URL_OPN}" class="button special">{PHP.L.Open}</a>
		</td>
	</tr>
	<!-- END: POLLS_ROW -->
	<!-- BEGIN: POLLS_ROW_EMPTY -->
	<tr>
		<td colspan="5" class="">{PHP.L.adm_polls_nopolls}</td>
	</tr>
	<!-- END: POLLS_ROW_EMPTY -->
              </tbody>
            </table>
		</div>
<p class="paging">{ADMIN_POLLS_PAGINATION_PREV}{ADMIN_POLLS_PAGNAV}{ADMIN_POLLS_PAGINATION_NEXT}<span>{PHP.L.Total}: {ADMIN_POLLS_TOTALITEMS}, {PHP.L.Onpage}: {ADMIN_POLLS_ON_PAGE}</span></p>
</div>
<div class="uk-card uk-card-body uk-background-default uk-border-rounded"> 
	<h3>{ADMIN_POLLS_FORMNAME}:</h3>
	<form id="addpoll" action="{ADMIN_POLLS_FORM_URL}" method="post">
		<!-- IF {PHP.cfg.jquery} -->
		<script type="text/javascript" src="{PHP.cfg.modules_dir}/polls/js/polls.js"></script>
		<script type="text/javascript">
			var ansMax = {PHP.cfg.polls.max_options_polls};
		</script>
		<!-- ENDIF -->
          <div class="uk-overflow-auto">
            <table class="uk-table uk-table-small uk-table-middle uk-table-justify uk-table-divider">
			<tr>
				<td class="width15">{PHP.L.poll}:</td>
				<td class="width85">{EDIT_POLL_IDFIELD}{EDIT_POLL_TEXT}</td>
			</tr>
			<tr>
				<td>{PHP.L.Options}:</td>
				<td>
					<!-- BEGIN: OPTIONS -->
<div class="uk-margin">
          <div class="uk-form-controls uk-position-relative polloptiondiv">{EDIT_POLL_OPTION_TEXT} 
		  <span class="uk-position-center-right uk-position-small">
		  <button name="deloption" value="x" type="button" class="deloption uk-icon-button uk-button-warning uk-icon" uk-icon="trash" style="display:none;"></button>
		  </span>
          </div>

						

						
</div>

					<!-- END: OPTIONS -->
<div class="uk-margin">
					<input id="addoption" name="addoption" value="{PHP.L.Add}" type="button" class="uk-button uk-button-success"  style="display:none;" />
</div>
					</td>
			</tr>
			<tr>
				<td></td>
				<td>
					{EDIT_POLL_MULTIPLE}
					<!-- BEGIN: EDIT -->
					<br />
					{EDIT_POLL_LOCKED}
					<br />
					{EDIT_POLL_RESET}
					<br />
					{EDIT_POLL_DELETE}
					<!-- END: EDIT -->
				</td>
			</tr>
			<tr>
				<td>
        <div class="uk-margin uk-text-center">
            <button type="submit" class="confirm uk-button uk-button-primary" title="{ADMIN_POLLS_SEND_BUTTON}">{ADMIN_POLLS_SEND_BUTTON}</button>
        </div>
				</td>
			</tr>
		</table>
		</div>
	</form>
</div>
<!-- END: MAIN -->

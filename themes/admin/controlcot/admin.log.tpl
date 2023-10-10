<!-- BEGIN: MAIN -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow"  uk-height-viewport="expand: true">
	<h2><span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.Log} ({ADMIN_LOG_TOTALDBLOG})</span></h2>
		{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
<!-- IF {PHP.usr.isadmin} -->
			<div class="uk-margin">
				<a title="{PHP.L.adm_purgeall}" href="{ADMIN_LOG_URL_PRUNE}" class="ajax uk-button uk-button-danger">{PHP.L.adm_purgeall}</a>
			</div>
<!-- ENDIF -->
			<form action="" class="uk-form-horizontal">
    <div class="uk-margin">
        <label class="uk-form-label">{PHP.L.Group}:</label>
        <div class="uk-form-controls">
            <select class="uk-select" name="groups" size="1" onchange="redirect(this)">
<!-- BEGIN: GROUP_SELECT_OPTION -->
					<option value="{ADMIN_LOG_OPTION_VALUE_URL}"{ADMIN_LOG_OPTION_SELECTED}>{ADMIN_LOG_OPTION_GRP_NAME}</option>
<!-- END: GROUP_SELECT_OPTION -->
            </select>
        </div>
    </div>

			</form>
  <div class="uk-overflow-auto">
    <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
      <thead class="uk-background-secondary uk-lidht">
				<tr>
					<th class="">#</th>
					<th class="">{PHP.L.Date} (GMT)</th>
					<th class="">{PHP.L.Ip}</th>
					<th class="">{PHP.L.User}</th>
					<th class="">{PHP.L.Group}</th>
					<th class="">{PHP.L.Log}</th>
				</tr>
				</thead>
				<tbody>
<!-- BEGIN: LOG_ROW -->
				<tr>
					<td class="">{ADMIN_LOG_ROW_LOG_ID}</td>
					<td class="">{ADMIN_LOG_ROW_DATE}</td>
					<td class=""><a href="{ADMIN_LOG_ROW_URL_IP_SEARCH}">{ADMIN_LOG_ROW_LOG_IP}</a></td>
					<td class="">{ADMIN_LOG_ROW_LOG_NAME}&nbsp;</td>
					<td class=""><a href="{ADMIN_LOG_ROW_URL_LOG_GROUP}" class="ajax">{ADMIN_LOG_ROW_LOG_GROUP}</a></td>
					<td>{ADMIN_LOG_ROW_LOG_TEXT}</td>
				</tr>
<!-- END: LOG_ROW -->
				</tbody>
			</table>
		</div>
					<div>

						<nav><ul class="uk-pagination uk-flex-center uk-margin-bottom">{ADMIN_LOG_PAGINATION_PREV} {ADMIN_LOG_PAGNAV} {ADMIN_LOG_PAGINATION_NEXT}</ul></nav>
						
						<div class="uk-text-center uk-margin-large-bottom">{PHP.L.Total}: {ADMIN_LOG_TOTALITEMS}, {PHP.L.Onpage}: {ADMIN_LOG_ON_PAGE}</div>
						
					</div>
</div>
<div class="uk-margin-vertical uk-alert-primary uk-alert" uk-alert="">
  <a class="uk-alert-close uk-icon uk-close" uk-close=""></a>
  <p>Шаблон:</p>
  <code>admin.log.tpl</code>
</div>
<!-- END: MAIN -->

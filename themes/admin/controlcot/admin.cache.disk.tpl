<!-- BEGIN: MAIN -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
  <h2>
    <span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.adm_diskcache}</span>
  </h2> 

		{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
<div class="uk-margin uk-margin-top">
  <div class="uk-grid-small uk-flex-center uk-text-center" uk-grid>
    <div>
      <a class="ajax uk-button uk-button-small uk-button-primary" href="{ADMIN_DISKCACHE_URL_REFRESH}">{PHP.L.Refresh} </a>
    </div>
    <div>
      <a class="ajax uk-button uk-button-small uk-button-danger" href="{ADMIN_DISKCACHE_URL_PURGE}">{PHP.L.adm_purgeall}</a>
    </div>
  </div>
</div>
    <div class="uk-overflow-auto">
      <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
        <thead class="uk-background-secondary uk-text-warning">
				<tr>
					<th>{PHP.L.Item}</th>
					<th>{PHP.L.Files}</th>
					<th>{PHP.L.Size}</th>
					<th>{PHP.L.Delete}</th>
				</tr>
				</thead>
				<tbody>
<!-- BEGIN: ADMIN_DISKCACHE_ROW -->
				<tr>
					<td><span class="uk-text-bold uk-link-text">{ADMIN_DISKCACHE_ITEM_NAME}</span></td>
					<td>{ADMIN_DISKCACHE_FILES}</td>
					<td>{ADMIN_DISKCACHE_SIZE}</td>
					<td><a title="{PHP.L.Delete}" href="{ADMIN_DISKCACHE_ITEM_DEL_URL}" class="ajax uk-button uk-button-small uk-button-danger">{PHP.L.Delete}</a></td>
				</tr>
<!-- END: ADMIN_DISKCACHE_ROW -->
				<tr>
					<td><span class="uk-text-bold uk-link-text">{PHP.L.Total}:</span></td>
					<td>{ADMIN_DISKCACHE_CACHEFILES}</td>
					<td>{ADMIN_DISKCACHE_CACHESIZE}</td>
					<td></td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
<div class="uk-margin-vertical uk-alert-primary uk-alert" uk-alert="">
  <a class="uk-alert-close uk-icon uk-close" uk-close=""></a>
  <p>Шаблон:</p>
  <code>admin.cache.disk.tpl</code>
</div>
<!-- END: MAIN -->
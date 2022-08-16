<!-- BEGIN: MAIN -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
  <h2>
    <span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.adm_internalcache}</span>
  </h2> 
{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"} 
  <div class="uk-grid-small uk-flex-center uk-text-center" uk-grid>
    <div>
      <a class="ajax uk-button uk-button-small uk-button-primary" href="{ADMIN_CACHE_URL_REFRESH}">{PHP.L.Refresh} </a>
    </div>
    <div>
      <a class="ajax uk-button uk-button-small uk-button-danger" href="{ADMIN_CACHE_URL_PURGE}">{PHP.L.adm_purgeall}</a>
    </div>
    <div>
      <a class="ajax uk-button uk-button-small uk-button-warning" href="{ADMIN_CACHE_URL_SHOWALL}">{PHP.L.adm_cache_showall}</a>
    </div>
  </div>
  <!-- BEGIN: ADMIN_CACHE_MEMORY -->
  <div class="uk-margin uk-margin-top">
    <dl>
      <dt>{ADMIN_CACHE_MEMORY_DRIVER}</dt>
      <dd>{PHP.L.Available}: {ADMIN_CACHE_MEMORY_AVAILABLE} / {ADMIN_CACHE_MEMORY_MAX} {PHP.L.bytes}</dd>
    </dl>
  </div>
  <!-- END: ADMIN_CACHE_MEMORY -->
  <div>
    <h3>
      <span class="uk-h4 uk-text-bold uk-link-text">{PHP.L.Database}</span>
    </h3>
    <div class="uk-overflow-auto">
      <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
        <thead class="uk-background-secondary uk-text-warning">
          <tr>
            <th>{PHP.L.Item}</th>
            <th>{PHP.L.Expire}</th>
            <th>{PHP.L.Size}</th>
            <th>{PHP.L.Value}</th>
            <th>{PHP.L.Delete}</th>
          </tr>
        </thead>
        <tbody>
          <!-- BEGIN: ADMIN_CACHE_ROW -->
          <tr>
            <td>{ADMIN_CACHE_ITEM_NAME}</td>
            <td>{ADMIN_CACHE_EXPIRE}</td>
            <td>{ADMIN_CACHE_SIZE}</td>
            <td>{ADMIN_CACHE_VALUE}</td>
            <td>
              <a title="{PHP.L.Delete}" href="{ADMIN_CACHE_ITEM_DEL_URL}" class="ajax uk-button uk-button-small uk-button-danger">{PHP.L.Delete}</a>
            </td>
          </tr>
          <!-- END: ADMIN_CACHE_ROW -->
          <tr>
            <td>{PHP.L.Total}:</td>
            <td>{ADMIN_CACHE_CACHESIZE}</td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
<div class="uk-margin-vertical uk-alert-primary uk-alert" uk-alert="">
  <a class="uk-alert-close uk-icon uk-close" uk-close=""></a>
  <p>Шаблон:</p>
  <code>admin.cache.tpl</code>
</div>
<!-- END: MAIN -->
<!-- BEGIN: MAIN -->
<a class="uk-link-heading" href="{PHP|cot_url('admin', 'm=projects')}" uk-tooltip="{PHP.L.projects_admin_moder_mod}" title="">
<h3 class="uk-card-title">
    <div class="uk-flex-middle" uk-grid>
      <div class="uk-width-1-4 uk-width-auto@m uk-text-center">
	  <span class="uk-text-primary"><i class="fa-solid fa-thumbtack fa-2xl"></i></span> 
      </div>
      <div class="uk-width-3-4 uk-width-expand@m">
        <span class="uk-text-middle">{PHP.L.projects_title}</span>
      </div>
    </div>
</h3>
</a>
<div class="uk-overflow-auto">
  <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-divider">
    <tbody>
      <tr>
        <td>
          <a class="uk-link-text" href="{ADMIN_HOME_PROJECTS_PUBLIC_URL}">{PHP.L.projects_admin_home_public}: </a>
        </td>
        <td><span class="uk-label uk-label-success">{ADMIN_HOME_PROJECTS_PUBLIC}</span></td>
      </tr>
      <tr>
        <td>
          <a class="uk-link-text" href="{ADMIN_HOME_PROJECTS_HIDDEN_URL}">{PHP.L.projects_admin_home_hidden}: </a>
        </td>
        <td><span class="uk-label uk-label-warning">{ADMIN_HOME_PROJECTS_HIDDEN}</span></td>
      </tr>
      <tr>
        <td>
          <a class="uk-link-text" href="{ADMIN_HOME_PROJECTS_QUEUED_URL}">{PHP.L.projects_admin_home_valqueue}: </a>
        </td>
        <td><span class="uk-label uk-label-danger">{ADMIN_HOME_PROJECTS_QUEUED}</span></td>
      </tr>
    </tbody>
  </table>
</div>
<!-- END: MAIN -->

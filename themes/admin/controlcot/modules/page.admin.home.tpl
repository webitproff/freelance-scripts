<!-- BEGIN: MAIN -->
<h4>
  <span class="uk-text-middle uk-h2">
    <i class="ti ti-news"></i>
  </span>
  <span class="uk-text-middle">{PHP.L.Pages}</span>
</h4>
<div class="uk-overflow-auto">
  <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-divider">
    <tbody>
      <tr>
        <td>
          <a class="uk-link-text" href="{ADMIN_HOME_URL}">{PHP.L.adm_valqueue}</a>
        </td>
        <td><span class="uk-label uk-label-danger">{ADMIN_HOME_PAGESQUEUED}</span></td>
      </tr>
      <tr>
        <td>
          <a class="uk-link-text" href="{PHP|cot_url('page','m=add')}">{PHP.L.Add}</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <a class="uk-link-text" href="{PHP.db_pages|cot_url('admin','m=extrafields&n=$this')}">{PHP.L.home_ql_b2_2}</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<!-- END: MAIN -->
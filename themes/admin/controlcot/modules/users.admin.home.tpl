<!-- BEGIN: MAIN -->
<h4>
  <span class="uk-text-middle uk-h2">
    <i class="ti ti-users"></i>
  </span>
  <span class="uk-text-middle">{PHP.L.Users}</span>
</h4>
<div class="uk-overflow-auto">
  <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-divider">
    <tbody>
      <tr>
        <td>
          <a class="uk-link-text" href="{PHP|cot_url('admin','m=config&amp;n=edit&amp;o=module&amp;p=users')}">{PHP.L.home_ql_b3_1}</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <a class="uk-link-text" href="{PHP|cot_url('admin','m=users')}">{PHP.L.home_ql_b3_4}</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <a class="uk-link-text" href="{PHP.db_users|cot_url('admin','m=extrafields&amp;n=$this')}">{PHP.L.home_ql_b3_2}</a>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<!-- END: MAIN -->
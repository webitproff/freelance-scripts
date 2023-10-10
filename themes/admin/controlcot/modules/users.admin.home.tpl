<!-- BEGIN: MAIN -->
<h4>
  <span class="uk-text-middle uk-margin-small-right">
    <i class="fa-solid fa-users-gear fa-xl"></i>
  </span>
  <span class="uk-text-middle">{PHP.L.Users}</span>
</h4>
<div class="uk-overflow-auto">
  <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-divider">
    <tbody>
      <tr>
        <td>
          <a class="uk-link-text" href="{PHP|cot_url('admin','m=config&amp;n=edit&amp;o=module&amp;p=users')}">{PHP.L.Configuration}</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><span class="uk-margin-small-right uk-text-danger"><i class="fa-solid fa-person-military-pointing fa-xl"></i></span>
          <a class="uk-link-text" href="{PHP|cot_url('admin','m=users')}">{PHP.L.home_users_rights}</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
		<span class="uk-margin-small-right uk-text-middle uk-text-primary">
          <i class="fa-solid fa-table-list fa-xl"></i>
        </span>
          <a class="uk-link-text" href="{PHP.db_users|cot_url('admin','m=extrafields&amp;n=$this')}">{PHP.L.home_extrafields_users}</a>
        </td>
        <td></td>
      </tr>
	<!-- IF {PHP.cot_plugins_active.usermanager} -->	  
      <tr>
        <td>
          <a class="uk-link-text" href="{PHP.db_users|cot_url('admin','m=other&amp;p=usermanager')}"><span class="uk-margin-small-right uk-text-warning"><i class="fa-solid fa-user-pen fa-xl"></i></span>
	    <span class="uk-text-medium">Менеджер пользователей</span></a>
        </td>
        <td></td>
      </tr>
	<!-- ENDIF -->	  
    </tbody>
  </table>
</div>
<!-- END: MAIN -->


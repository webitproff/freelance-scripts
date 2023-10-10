<!-- BEGIN: MAIN -->
<div class="uk-card-body uk-card-small">



  <div class="uk-table-responsive p-0">
    <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
      <thead>
        <tr>
          <th>#</th>
          <th>Заголовок</th>
          <th>Автор</th>
          <th>Дата</th>
        </tr>
      </thead>
      <tbody>
        <!-- BEGIN: PAGE_ROW -->
        <tr>
          <td>{PAGE_ROW_ID}</td>
          <td class="">
            <a href="{PAGE_ROW_URL}">{PAGE_ROW_SHORTTITLE}</a><br>
            <small> {PAGE_ROW_TEXT|strip_tags($this)|mb_substr($this, 0, 70)}</small>
          </td>
          <td class="">{PAGE_ROW_OWNER_NAME} <br> ID# <span class="uk-badge">{PAGE_ROW_OWNER_ID}</span>
          </td>
          <td class="">{PAGE_ROW_DATE_STAMP|cot_date('d.m.Y', $this)} </span>
          </td>
        </tr>
        <!-- END: PAGE_ROW -->
      </tbody>
    </table>
  </div>
      <!-- IF {PAGE_TOP_PAGINATION} -->
      <ul class="pagination pagination-sm float-right"> {PAGE_TOP_PAGEPREV}{PAGE_TOP_PAGINATION}{PAGE_TOP_PAGENEXT} </ul>
      <!-- ENDIF -->
</div>
<!-- END: MAIN -->
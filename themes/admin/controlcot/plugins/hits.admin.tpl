<!-- BEGIN: MAIN -->
<div class="uk-container">
  <div class="uk-margin-large uk-card uk-card-default uk-card-body uk-border-rounded uk-box-shadow-medium uk-margin-medium-top">

      <h3 class="card-title d-flex align-items-center">
        <i class="fa-solid fa-chart-pie text-primary fs-3 flex-shrink-0"></i>
        <span class="flex-grow-1 ms-3">{PHP.L.Hits}</span>
      </h3>

    <div class="card-body py-3">
      <h3 class="fs-4 text-info">{ADMIN_HITS_MAXHITS}</h3>
      <div class="table-responsive">
        <!-- BEGIN: YEAR_OR_MONTH -->
        <h5 class="p-1" style="background-color: var(--bs-gray-300);">{PHP.v}:</h5>
        <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
          <!-- BEGIN: ROW -->
          <tr>
            <td class="w-20">{ADMIN_HITS_ROW_DAY}</td>
            <td class="w-50">
              <div class="progress-wrapper">
                <div class="progress w-100">
                  <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:{ADMIN_HITS_ROW_PERCENTBAR}%;"></div>
                </div>
              </div>
            </td>
            <td class="w-10">{ADMIN_HITS_ROW_PERCENTBAR}%</td>
            <td class="w-10"> {ADMIN_HITS_ROW_HITS}</td>
            <td class="w-10">{PHP.L.Hits}</td>
          </tr>
          <!-- END: ROW -->
        </table>
        <!-- END: YEAR_OR_MONTH -->
        <!-- BEGIN: DEFAULT -->
        <h5 class="p-1" style="background-color: var(--bs-gray-300);">{PHP.L.hits_byyear}:</h5>
        <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
          <!-- BEGIN: ROW_YEAR -->
          <tr>
            <td class="w-20">
              <a class="fs-5" href="{ADMIN_HITS_ROW_YEAR_URL}">{ADMIN_HITS_ROW_YEAR}</a>
            </td>
            <td class="w-50">
              <div class="progress-wrapper">
                <div class="progress w-100 mt-2">
                  <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:{ADMIN_HITS_ROW_YEAR_PERCENTBAR}%;"></div>
                </div>
              </div>
            </td>
            <td class="w-10">
              <span class="badge bg-primary">{ADMIN_HITS_ROW_YEAR_PERCENTBAR}%</span>
            </td>
            <td class="w-10">{ADMIN_HITS_ROW_YEAR_HITS}</td>
            <td class="w-10">{PHP.L.Hits}</td>
          </tr>
          <!-- END: ROW_YEAR -->
        </table>
        <h5 class="p-1" style="background-color: var(--bs-gray-300);">{PHP.L.hits_bymonth}:</h5>
       <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
          <!-- BEGIN: ROW_MONTH -->
          <tr>
            <td class="w-20">
              <a class="fs-5" href="{ADMIN_HITS_ROW_MONTH_URL}">{ADMIN_HITS_ROW_MONTH}</a>
            </td>
            <td class="w-50">
              <div class="progress-wrapper">
                <div class="progress w-100 mt-2">
                  <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:{ADMIN_HITS_ROW_MONTH_PERCENTBAR}%;"></div>
                </div>
              </div>
            </td>
            <td class="w-10">
              <span class="badge bg-warning">{ADMIN_HITS_ROW_MONTH_PERCENTBAR}%</span>
            </td>
            <td class="w-10">{ADMIN_HITS_ROW_MONTH_HITS}</td>
            <td class="w-10">{PHP.L.Hits}</td>
          </tr>
          <!-- END: ROW_MONTH -->
        </table>
        <h5 class="p-1" style="background-color: var(--bs-gray-300);">{PHP.L.hits_byweek}:</h5>
        <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
          <!-- BEGIN: ROW_WEEK -->
          <tr>
            <td class="w-20">
              <span class="fs-5">{ADMIN_HITS_ROW_WEEK}</span>
            </td>
            <td class="w-50">
              <div class="progress-wrapper">
                <div class="progress w-100 mt-2">
                  <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:{ADMIN_HITS_ROW_WEEK_PERCENTBAR}%;"></div>
                </div>
              </div>
            </td>
            <td class="w-10">
              <span class="badge bg-danger">{ADMIN_HITS_ROW_WEEK_PERCENTBAR}%</span>
            </td>
            <td class="w-10">{ADMIN_HITS_ROW_WEEK_HITS}</td>
            <td class="w-10">{PHP.L.Hits}</td>
          </tr>
          <!-- END: ROW_WEEK -->
        </table>
        <!-- END: DEFAULT -->
      </div>
    </div>
  </div>
</div>
<!-- END: MAIN -->
<!-- BEGIN: MAIN -->
<div class="uk-grid-small" uk-grid>
    <div class="uk-width-2-3@m">
    <!-- BEGIN: STAT -->
    <div class="uk-card uk-card-small uk-card-default uk-card-body">
      <div class="card-header" style="background-color: var(--bs-dark-bg-subtle);">
        <!-- About using style="background-color: var(--bs-dark-bg-subtle);" read here https://getbootstrap.com/docs/5.3/customize/color/#colors -->
        <h3 class="card-title d-flex align-items-center">
          <i class="fa-solid fa-chart-line text-danger fs-3 flex-shrink-0"></i>
          <span class="flex-grow-1 ms-3">{HITS_STAT_HEADER}</span>
        </h3>
      </div>
      <div class="card-body p-0">
  <div class="uk-overflow-auto">
    <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
            <!-- BEGIN: ADMIN_HOME_ROW -->
            <tr>
              <td class="w-20">{ADMIN_HOME_DAY}</td>
              <td class="w-50">
                    <progress  id="js-progressbar" class="uk-progress" role="progressbar" value="10" min="0" max="100" style="width:{ADMIN_HOME_PERCENTBAR}%;"></progress>

              </td>
              <td class="w-10">{ADMIN_HOME_PERCENTBAR}%</td>
              <td class="w-10"> {ADMIN_HOME_HITS}</td>
              <td class="w-10">{PHP.L.Hits}</td>
            </tr>
            <!-- END: ADMIN_HOME_ROW -->
          </table>
        </div>
      </div>
      <div class="uk-margin">
        <a class="uk-button uk-button-primary" href="{ADMIN_HOME_MORE_HITS_URL}">{PHP.L.ReadMore}</a>
      </div>
    </div>
    <!-- END: STAT -->
  </div>
  <div class="uk-width-1-3@m">
    <!-- BEGIN: ACTIVITY -->
    <div class="uk-card uk-card-small uk-card-default uk-card-body">
        <h3>
          <i class="fa-solid fa-chart-pie"></i>
          <span class="flex-grow-1 ms-3">{ACTIVITY_STAT_HEADER}</span>
        </h3>

  <div class="uk-overflow-auto">
    <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
            <tr>
              <td class="">
                <a href="{ADMIN_HOME_NEWUSERS_URL}">{PHP.L.home_newusers}</a>
              </td>
              <td class="">{ADMIN_HOME_NEWUSERS}</td>
            </tr>
            <tr>
              <td>
                <a href="{ADMIN_HOME_NEWPAGES_URL}">{PHP.L.home_newpages}</a>
              </td>
              <td class="">{ADMIN_HOME_NEWPAGES}</td>
            </tr>
            <!-- IF {PHP.cot_modules.forums} -->
            <tr>
              <td>
                <a href="{ADMIN_HOME_NEWTOPICS_URL}">{PHP.L.home_newtopics}</a>
              </td>
              <td class="">{ADMIN_HOME_NEWTOPICS}</td>
            </tr>
            <tr>
              <td>
                <a href="{ADMIN_HOME_NEWPOSTS_URL}">{PHP.L.home_newposts}</a>
              </td>
              <td class="">{ADMIN_HOME_NEWPOSTS}</td>
            </tr>
            <!-- ENDIF -->
            <!-- IF {PHP.cot_modules.pm} -->
            <tr>
              <td>{PHP.L.home_newpms}</td>
              <td class="">{ADMIN_HOME_NEWPMS}</td>
            </tr>
            <!-- ENDIF -->
          </table>
        </div>
      </div>
    </div>
    <!-- END: ACTIVITY -->
  </div>
</div>
<script>

    UIkit.util.ready(function () {

        var bar = document.getElementById('js-progressbar');

        var animate = setInterval(function () {

            bar.value += 10;

            if (bar.value >= bar.max) {
                clearInterval(animate);
            }

        }, 1000);

    });

</script>
<!-- END: MAIN -->
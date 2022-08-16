<ul class="uk-nav-default uk-nav-divider uk-nav-parent-icon" uk-nav>
  <li class="

		<!-- IF !{PHP.m} -->uk-active

		<!-- ENDIF -->">
    <a uk-tooltip="{PHP.L.Home}" href="{PHP|cot_url('admin')}">
      <span class="uk-text-middle">
        <i class="ti ti-home uk-h3"></i>
      </span>
      <span class="uk-text-middle">{PHP.L.Home}</span>
    </a>
  </li>
  <li class="

		<!-- IF {PHP.m} == 'config' -->uk-active

		<!-- ENDIF -->">
    <a uk-tooltip="{PHP.L.Configuration}" href="{PHP|cot_url('admin', 'm=config')}">
      <span class="uk-text-middle ">
        <i class="ti ti-adjustments-alt uk-h3"></i>
      </span>
      <span class="uk-text-middle">{PHP.L.Configuration}</span>
    </a>
  </li>
  <li class="

		<!-- IF {PHP.m} == 'structure' -->uk-active

		<!-- ENDIF -->">
    <a uk-tooltip="{PHP.L.Structure}" href="{PHP|cot_url('admin', 'm=structure')}">
      <span class="uk-text-middle ">
        <i class="ti ti-list-numbers uk-h3"></i>
      </span>
      <span class="uk-text-middle">{PHP.L.Structure}</span>
    </a>
  </li>
  <li class="

		<!-- IF {PHP.m} == 'extensions' -->uk-active

		<!-- ENDIF -->">
    <a uk-tooltip="{PHP.L.Extensions}" href="{PHP|cot_url('admin', 'm=extensions')}">
      <span class="uk-text-middle">
        <i class="ti ti-apps uk-h3"></i>
      </span>
      <span class="uk-text-middle">{PHP.L.Extensions}</span>
    </a>
  </li>
  <li class="

		<!-- IF {PHP.m} == 'users' -->uk-active

		<!-- ENDIF -->">
    <a uk-tooltip="{PHP.L.Users}" href="{PHP|cot_url('admin', 'm=users')}" title="{PHP.L.Users}">
      <span class="uk-text-middle">
        <i class="ti ti-users uk-h3"></i>
      </span>
      <span class="uk-text-middle">{PHP.L.Users}</span>
    </a>
  </li>
  <li class="

		<!-- IF {PHP.m} == 'other' -->uk-active

		<!-- ENDIF -->">
    <a uk-tooltip="{PHP.L.Other}" href="{PHP|cot_url('admin', 'm=other')}" title="{PHP.L.Other}">
      <span class="uk-text-middle">
        <i class="ti ti-dots-circle-horizontal uk-h3"></i>
      </span>
      <span class="uk-text-middle">{PHP.L.Other}</span>
    </a>
  </li>
  <li class="uk-parent">
    <a href="">
      <span class="uk-text-middle">
        <i class="ti ti-settings uk-h3"></i>
      </span>
      <span class="uk-text-middle">{PHP.L.home_ql_b1_title}</span>
    </a>
    <ul class="uk-nav-sub uk-list-divider">
      <li>
        <a href="{PHP|cot_url('admin','m=extrafields')}">{PHP.L.adm_extrafields}</a>
      </li>
      <li>
        <a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=menus')}">{PHP.L.home_ql_b1_4}</a>
      </li>
      <li>
        <a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=main')}">{PHP.L.home_ql_b1_1}</a>
      </li>
      <li>
        <a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=title')}">{PHP.L.home_ql_b1_2}</a>
      </li>
      <li>
        <a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=theme')}">{PHP.L.home_ql_b1_3}</a>
      </li>
      <li>
        <a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=locale')}">{PHP.L.Locale}</a>
      </li>
    </ul>
  </li>
	<li><a class="" target="_blank" href="{PHP|cot_url('index')}" title="{PHP.L.Ctrl_Open_Frontsite}">
      <span class="uk-text-middle">
        <i class="ti ti ti-browser-check uk-h3"></i>
      </span>
<span class="uk-text-bold uk-text-medium uk-text-capitalize uk-text-warning">{PHP.L.Ctrl_Open_Frontsite}</span></a>
              </li>					
					<!-- FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/inc/uk-nav-side-cot-rc.tpl" -->  
</ul>

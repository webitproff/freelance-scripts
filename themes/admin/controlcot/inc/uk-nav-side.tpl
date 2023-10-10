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
      <span class="uk-text-middle">{PHP.L.home_site_props}</span> <span uk-nav-parent-icon></span>
    </a>
    <ul class="uk-nav-sub uk-list-divider">
      <li>
        <a href="{PHP|cot_url('admin','m=extrafields')}">{PHP.L.Extrafields}</a>
      </li>
      <li>
        <a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=menus')}">{PHP.L.core_menus}</a>
      </li>
      <li>
        <a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=main')}">{PHP.L.core_main}</a>
      </li>
      <li>
        <a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=title')}">{PHP.L.core_title}</a>
      </li>
      <li>
        <a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=theme')}">{PHP.L.core_theme}</a>
      </li>
      <li>
        <a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=locale')}">{PHP.L.core_locale}</a>
      </li>
    </ul>
  </li>
<!-- IF {PHP.cot_modules.page} -->
	<li>
	  <a href="{PHP|cot_url('admin', 'm=page')}" title="">
	    <span class="uk-margin-small-right" uk-icon="cog"></span>
	    <span class="uk-text-bold uk-text-medium">Статьи и новости</span>
	  </a>
	</li>
<!-- ENDIF -->
<!-- IF {PHP.cot_modules.projects} -->
	<li>
	  <a href="{PHP|cot_url('admin', 'm=projects')}" title="">
	    <span class="uk-margin-small-right" uk-icon="cog"></span>
	    <span class="uk-text-bold uk-text-medium">Задания и заявки экспертам</span>
	  </a>
	</li>
<!-- ENDIF -->
<!-- IF {PHP.cot_modules.services} -->
	<li>
	  <a href="{PHP|cot_url('admin', 'm=services')}" title="">
	    <span class="uk-margin-small-right" uk-icon="cog"></span>
	    <span class="uk-text-bold uk-text-medium">Услуги Экспертов</span>
	  </a>
	</li>
<!-- ENDIF -->
<!-- IF {PHP.cot_modules.market} -->
	<li>
	  <a href="{PHP|cot_url('admin', 'm=market')}" title="">
	    <span class="uk-margin-small-right" uk-icon="cog"></span>
	    <span class="uk-text-bold uk-text-medium">Маркетплейс</span>
	  </a>
	</li>
<!-- ENDIF -->
	<!-- IF {PHP.cot_plugins_active.usermanager} -->
	<li>
	  <a href="admin/other?p=usermanager" title="">
	    <span class="uk-margin-small-right" uk-icon="users"></span>
	    <span class="uk-text-bold uk-text-medium">Менеджер пользователей</span>
	  </a>
	</li>
	<!-- ENDIF -->
	<li>
	  <a class="" target="_blank" href="{PHP|cot_url('index')}" title="{PHP.L.Ctrl_Open_Frontsite}">
	    <span class="uk-text-middle">
	      <i class="ti ti ti-browser-check uk-h3"></i>
	    </span>
	    <span class="uk-text-bold uk-text-medium uk-text-capitalize uk-text-warning">{PHP.L.Ctrl_Open_Frontsite}</span>
	  </a>
	</li>	
					<!-- FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/inc/uk-nav-side-cot-rc.tpl" -->  
</ul>

<!-- BEGIN: FOOTER -->
			</div>
		</div>
	</div>
</div>
<div class="uk-section uk-background-secondary uk-padding-remove-vertical">
	<div class="uk-container uk-container-expand uk-padding-small">
		<div class="uk-grid-collapse uk-child-width-expand@s uk-text-center" uk-grid>
			<div class="uk-visible@m">
				<p class="uk-margin-remove uk-text-small uk-light">{PHP.cfg.maintitle} &copy; 2021 - {PHP.sys.now|cot_date('Y', $this)}</p>
			</div>
			<div>
				<p class="uk-margin-remove"><a href="https://github.com/Cotonti/Cotonti" class="uk-link-text" target="blank"><span class="uk-text-middle uk-text-bold uk-text-small uk-text-capitalize uk-text-warning" uk-tooltip="Сайт работает на Cotonti CMF, открыть исходный код на GitHub">Powered by</span></a> <img class="" src="{PHP.cfg.mainurl}/{PHP.cfg.themes_dir}/admin/controlcot/img/cotonti-controlcot-by-webitproff.png" width="27" height="27" alt="Cotonti CMF"> <a href="https://t.me/webitproff" class="uk-link-text" target="blank"><span class="uk-text-middle uk-text-bold uk-text-small uk-text-capitalize uk-text-primary" uk-tooltip="написать в телеграм">webitproff</span></a></p>
			</div>
			<div class="uk-visible@m">
				<p class="uk-margin-remove uk-text-bold uk-text-small uk-text-capitalize uk-light"> Built with <a href="https://getuikit.com/changelog" target="_blank" uk-tooltip="Visit UIkit 3 site"><span uk-icon="uikit"></span> UIkit 3</a></p>
			</div>
			<div class="uk-visible@m">
				<p class="uk-margin-remove uk-text-bold uk-text-small uk-light">«ControlCot» on <a href="https://github.com/webitproff/cot-controlcot"  target="_blank" uk-tooltip="Исходный код шаблона административной панели для Cotonti Siena с последними обновлениями"><span uk-icon="github"></span> GitHub</a></p>
			</div>
		</div>	
	</div>
</div>
<div class="uk-position-fixed uk-position-bottom-right">
	<ul class="uk-list">
	  <li>
		<a uk-tooltip="Menu" class="uk-visible@m" uk-toggle="target: #left-col">
		  <span class="uk-icon-button uk-button-warning uk-icon" uk-icon="thumbnails"></span>
		</a>
	  </li>
	  <li>
		<a uk-tooltip="Menu" class="uk-hidden@m" uk-toggle="target: #sidebar-offcanvas">
		  <span class="uk-icon-button uk-button-warning uk-icon" uk-icon="thumbnails"></span>
		</a>
	  </li>
	  <li>
		<a uk-tooltip="to Top" class="uk-icon-button uk-box-shadow-medium uk-link-text" href="#" uk-icon="ratio: 1.2" uk-totop uk-scroll></a>
	  </li>
	</ul>
</div>
{FOOTER_RC}
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
		<script src="{PHP.cfg.mainurl}/themes/admin/controlcot/js/chartScripts.js"></script>
</body>
</html>
<!-- END: FOOTER -->
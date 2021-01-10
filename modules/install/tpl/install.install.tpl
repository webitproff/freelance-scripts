<!-- BEGIN: MAIN -->
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="modules/install/uikit-3.1.5/css/uikit.css" />
        <script src="modules/install/uikit-3.1.5/js/uikit.min.js"></script>
        <script src="modules/install/uikit-3.1.5/js/uikit-icons.min.js"></script>
		<meta name="robots" content="noindex" />
		<link rel="shortcut icon" href="favicon.ico" />
		<title>{PHP.L.install_title}</title>
		<link rel="stylesheet" type="text/css" href="modules/install/tpl/style.css" />
	</head>
	<body>
		<div class="uk-section uk-section-muted uk-font-play">
			<div class="uk-container">
				<div class="uk-box-shadow-large uk-align-center uk-card uk-card-default uk-width-1-2@m uk-width-1-1@l uk-padding">
					<div class="uk-text-center">
						<a class="" href="#Install_Helpful_Links" uk-scroll="offset: 80"><img class="uk-margin-small" alt="" title="{PHP.L.Logo_Helpful_Links}" uk-tooltip="pos: top" src="modules/install/img/logo-cotonti.png" width="180" height="55" /></a>
					</div>
				<hr class="uk-divider-icon">
				<h1 class="uk-heading-line uk-h3 uk-text-bold uk-text-center uk-font-play uk-text-uppercase">
				<span>{PHP.L.install_body_title} ver. {PHP.cfg.version}</span></h1>
					<div class="uk-alert-warning uk-text-center uk-text-bold" uk-alert>
						{INSTALL_STEP}
					</div>
							{FILE "./{PHP.cfg.modules_dir}/install/tpl/warnings.tpl"}
					<form class="uk-form uk-form-horizontal uk-margin-large" action="install.php" method="post">
						<!-- BEGIN: STEP_0 -->
						<div class="uk-flex uk-flex-center">
						<div class="uk-width-2-3@m">
							<input type="hidden" name="step" value="0" />
							<div class="uk-margin">
								<label class="uk-form-label" for="form-horizontal-select">{PHP.L.Language}</label>
								<div class="uk-form-controls">
									{INSTALL_LANG}
								</div>
							</div>
							<!-- BEGIN: SCRIPT -->
							<div class="uk-margin">
								<label class="uk-form-label" for="form-horizontal-select">{PHP.L.install_script}</label>
								<div class="uk-form-controls">
									{INSTALL_SCRIPT}
								</div>
							</div>
							<!-- END: SCRIPT -->
							<div class="uk-text-center">
								<button type="submit" class="uk-button uk-button-primary">{PHP.L.Next}</button>
							</div>
						</div>
						</div>						
						<!-- END: STEP_0 -->

						<!-- BEGIN: STEP_1 -->					
							<input type="hidden" name="step" value="1" />	
							<div class=""><h5 class="uk-heading-divider">{PHP.L.install_body_message1}</h5>
							<h4 class="uk-heading-line uk-text-bold uk-text-center uk-text-danger"><span>{PHP.L.install_ver}</span></h4>
								<ul class="uk-list uk-list-divider">
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">PHP Version</span></div>
											<div class="uk-float-right">{INSTALL_PHP_VER}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">mbstring</span></div>
											<div class="uk-float-right">{INSTALL_MBSTRING}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">hash</span></div>
											<div class="uk-float-right">{INSTALL_HASH}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">MySQL</span></div>
											<div class="uk-float-right">{INSTALL_MYSQL}</div>
										</div>
									</li>
								</ul>
							</div>
							<h5 class="uk-heading-divider">{PHP.L.install_body_message2}</h5>
							<h4 class="uk-heading-line uk-text-bold uk-text-center uk-text-danger"><span>{PHP.L.install_permissions}</span></h4>
								<ul class="uk-list uk-list-divider">
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">{PHP.file.config}</span></div>
											<div class="uk-float-right">{INSTALL_CONFIG}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">{PHP.file.config_sample}</span></div>
											<div class="uk-float-right">{INSTALL_CONFIG_SAMPLE}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">{PHP.file.sql}</span></div>
											<div class="uk-float-right">{INSTALL_SQL_FILE}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">{PHP.cfg.avatars_dir}</span></div>
											<div class="uk-float-right">{INSTALL_AV_DIR}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">{PHP.cfg.cache_dir}</span></div>
											<div class="uk-float-right">{INSTALL_CACHE_DIR}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">{PHP.cfg.extrafield_files_dir}</span></div>
											<div class="uk-float-right">{INSTALL_EXFLDS_DIR}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">{PHP.cfg.pfs_dir}</span></div>
											<div class="uk-float-right">{INSTALL_PFS_DIR}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">{PHP.cfg.photos_dir}</span></div>
											<div class="uk-float-right">{INSTALL_PHOTOS_DIR}</div>
										</div>
									</li>
									<li>
										<div class="uk-clearfix">
											<div class="uk-float-left"><span class="uk-text-bold uk-text-primary">{PHP.cfg.thumbs_dir}</span></div>
											<div class="uk-float-right">{INSTALL_THUMBS_DIR}</div>
										</div>
									</li>
								</ul>
							<div class="uk-text-center">
								<button type="submit" class="uk-button uk-button-primary">{PHP.L.Next}</button>
							</div>
						<!-- END: STEP_1 -->

						<!-- BEGIN: STEP_2 -->
						<div class="uk-flex uk-flex-center">
						<div class="uk-width-2-3@m">
							<input type="hidden" name="step" value="2" />
							<h4 class="uk-heading-line uk-text-bold uk-text-center uk-text-danger"><span>{PHP.L.install_db}</span></h4>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.install_db_host}  <span class="uk-margin-small-left uk-margin-small-right uk-text-danger" uk-icon="icon: question" title="Database host URL or hostname to connect your site to your database. this is usually, - localhost" uk-tooltip="pos: top"></span></label>
								<div class="uk-form-controls">
									{INSTALL_DB_HOST_INPUT}
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.install_db_port}  <span class="uk-margin-small-left uk-margin-small-right uk-text-danger" uk-icon="icon: question" title="{PHP.L.install_db_port_hint}" uk-tooltip="pos: top"></span></label>
								<div class="uk-form-controls">
									{INSTALL_DB_PORT_INPUT}
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.install_db_user}</label>
								<div class="uk-form-controls">
									{INSTALL_DB_USER_INPUT}
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.install_db_pass}</label>
								<div class="uk-form-controls">
									{INSTALL_DB_PASS_INPUT}
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.install_db_name}</label>
								<div class="uk-form-controls">
									{INSTALL_DB_NAME_INPUT}
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.install_db_x}</label>
								<div class="uk-form-controls">
									{INSTALL_DB_X_INPUT}
								</div>
							</div>
						</div>
						</div>
							<h5 class="uk-heading-divider">{PHP.L.install_body_message3}</h5>
							<div class="uk-text-center">
								<button type="submit" class="uk-button uk-button-primary">{PHP.L.Next}</button>
							</div>
						<!-- END: STEP_2 -->

						<!-- BEGIN: STEP_3 -->
						<div class="uk-flex uk-flex-center">
						<div class="uk-width-2-3@m">
							<input type="hidden" name="step" value="3" />
							<h4 class="uk-heading-line uk-text-bold uk-text-center uk-text-danger"><span>{PHP.L.install_misc}</span></h4>
							<div class="uk-margin">
								<label class="uk-form-label" for="form-horizontal-select">{PHP.L.install_misc_theme}</label>
								<div class="uk-form-controls">
									{INSTALL_THEME_SELECT}
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label" for="form-horizontal-select">{PHP.L.install_misc_lng}</label>
								<div class="uk-form-controls">
									{INSTALL_LANG_SELECT}
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.install_misc_url}</label>
								<div class="uk-form-controls">
									{INSTALL_MAINURL}
								</div>
							</div>
							<h4 class="uk-heading-line uk-text-bold uk-text-center uk-text-danger"><span>{PHP.L.install_adminacc}</span></h4>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.install_admin_login}</label>
								<div class="uk-form-controls">
									{INSTALL_USERNAME}
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.Password}</label>
								<div class="uk-form-controls">
									{INSTALL_PASS1}
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.install_retype_password}</label>
								<div class="uk-form-controls">
									{INSTALL_PASS2}
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label uk-text-bold uk-text-primary" for="form-horizontal-text">{PHP.L.Email}</label>
								<div class="uk-form-controls">
									{INSTALL_EMAIL}
								</div>
							</div>
								</div>
							</div>
							<div class="uk-text-center">
								<button type="submit" class="uk-button uk-button-primary">{PHP.L.Next}</button>
							</div>
						<!-- END: STEP_3 -->

						<!-- BEGIN: STEP_4 -->
							<input type="hidden" name="step" value="4" />
							<h4 class="uk-heading-line uk-text-bold uk-text-center uk-text-uppercase uk-text-danger"><span>{PHP.L.Modules}</span></h4>
							<!-- BEGIN: MODULE_ROW -->						
							<ul class="uk-list uk-list-divider">
								<li>{MODULE_ROW_CHECKBOX} 
								<span class="uk-margin-left uk-text-bold uk-text-lead uk-text-success">{MODULE_ROW_TITLE}</span><br />
								<span class="uk-text-bold uk-text-primary uk-margin-top-remove">{MODULE_ROW_DESCRIPTION}</span><br />
								{MODULE_ROW_REQUIRES}{MODULE_ROW_RECOMMENDS}
								</li>
								<li></li>
							</ul>
							<!-- END: MODULE_ROW -->
							<h4 class="uk-heading-line uk-text-bold uk-text-center uk-text-uppercase uk-text-danger"><span>{PHP.L.Plugins}</span></h4>
							<ul class="uk-list uk-list-divider">
							<!-- BEGIN: PLUGIN_CAT -->
									<li><h5 class="uk-heading-bullet uk-text-bold uk-text-uppercase uk-text-danger"><span>{PLUGIN_CAT_TITLE}</span></h5></li>
									<!-- BEGIN: PLUGIN_ROW -->
								<li>{PLUGIN_ROW_CHECKBOX}
								<span class="uk-margin-left uk-text-bold uk-text-lead uk-text-success">{PLUGIN_ROW_TITLE}</span><br />
								<span class="uk-text-bold uk-text-primary uk-margin-top-remove">{PLUGIN_ROW_DESCRIPTION}</span><br />
								{PLUGIN_ROW_REQUIRES}{PLUGIN_ROW_RECOMMENDS}
								</li>
									<!-- END: PLUGIN_ROW -->
								<!-- END: PLUGIN_CAT -->
							</ul>
							<hr class="uk-divider-icon">
							<div class="uk-text-center">
								<button type="submit" class="uk-button uk-button-primary">{PHP.L.Finish}</button>
							</div>
						<!-- END: STEP_4 -->
						
						<!-- BEGIN: STEP_5 -->
						<hr class="uk-divider-icon">
							<dl class="uk-description-list">
								<dt><span class="uk-text-bold uk-text-lead uk-text-success">{PHP.L.install_complete}</span></dt>
								<dd>{PHP.L.install_complete_note}</dd>
							</dl>
							<hr class="uk-divider-icon">
							
							<div class="uk-text-center">
								<a class="uk-button uk-button-primary" href="{PHP.cfg.mainurl}">{PHP.L.install_view_site}</a>
							</div>
						<!-- END: STEP_5 -->
					</form>
				</div>
			</div>
		</div>
		<div id="Install_Helpful_Links" class="uk-section uk-section-secondary uk-padding-top uk-margin-bottom-remove">
		<hr class="uk-divider-icon">
			<div class="uk-container">
			<h1 class="uk-heading-line uk-h3 uk-text-bold uk-text-center uk-font-play uk-text-uppercase">
			<span>{PHP.L.footer_install_Helpful_Links}</span>
			</h1>
				<div class="uk-grid-match uk-child-width-1-1@s uk-child-width-1-4@m" uk-grid>
					<div>
						<ul class="uk-list uk-list-divider">
							<li><a class="uk-text-uppercase uk-font-play" href="#modal-required-to-install" uk-toggle><span class="uk-margin-small-left uk-margin-small-right uk-text-warning" uk-icon="icon: settings"></span>{PHP.L.footer_install_required_to_install}</a></li>
							<li><a class="uk-text-uppercase uk-font-play" href="#modal-required-to-updating" uk-toggle><span class="uk-margin-small-left uk-margin-small-right uk-text-warning" uk-icon="icon: refresh"></span>{PHP.L.footer_install_required_to_updating}</a></li>
							<li><a class="uk-text-uppercase uk-font-play"  href="https://www.cotonti.com/docs/" target="_blank"><span class="uk-margin-small-left uk-margin-small-right uk-text-danger" uk-icon="icon: file-text"></span>{PHP.L.footer_install_Official_Manual}</a></li>
						</ul>
					</div>


					<div>
						<ul class="uk-list uk-list-divider">
							<li><a class="uk-text-uppercase uk-font-play"  href="https://www.cotonti.com/download/" target="_blank"><span class="uk-margin-small-left uk-margin-small-right uk-text-danger" uk-icon="icon: calendar"></span>{PHP.L.footer_install_Official_Relises}</a></li>
							<li><a class="uk-text-uppercase uk-font-play"  href="https://github.com/Cotonti/Cotonti" target="_blank"><span class="uk-margin-small-left uk-margin-small-right" uk-icon="icon: github-alt"></span>{PHP.L.footer_install_Source_Code}</a></li>
							<li><a class="uk-text-uppercase uk-font-play"  href="https://www.cotonti.com/extensions/" target="_blank"><span class="uk-margin-small-left uk-margin-small-right uk-text-danger" uk-icon="icon: plus-circle"></span>{PHP.L.footer_install_extensions_cotonti}</a></li>
						</ul>
					</div>
					<div>
						<ul class="uk-list uk-list-divider">
							<li><a class="uk-text-uppercase uk-font-play" href="https://www.cotonti.com/" target="_blank"><span class="uk-margin-small-left uk-margin-small-right uk-text-danger uk-icon uk-icon-image" style="background-image: url(modules/install/img/cotonti-icon.png);"></span>{PHP.L.footer_install_Official_Website}</a></li>
							<li><a class="uk-text-uppercase uk-font-play"  href="https://www.cotonti.com/forums" target="_blank"><span class="uk-margin-small-left uk-margin-small-right uk-text-danger" uk-icon="icon: users"></span>{PHP.L.footer_install_Forums_Community}</a></li>
							<li><a class="uk-text-uppercase uk-font-play"  href="https://www.cotonti.com/docs/ext/themes/rendering_overview" target="_blank"><span class="uk-margin-small-left uk-margin-small-right uk-text-danger" uk-icon="icon: code"></span>{PHP.L.footer_install_Theme_basics}</a></li>
						</ul>
					</div>
					<div>
						<ul class="uk-list uk-list-divider">
							<li uk-lightbox>
							<a class="" title="{PHP.L.footer_install_youtube_demoskin_desc}" uk-tooltip="pos: top" href="https://www.youtube.com/watch?v=9CEGRIqnN2g" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen uk-responsive uk-video="automute: true" data-caption="{PHP.L.footer_install_youtube_demoskin_desc}"><span class="uk-margin-small-left uk-margin-small-right uk-text-danger" uk-icon="icon: youtube"></span><span class="uk-text-uppercase uk-font-play">{PHP.L.footer_install_youtube_demoskin_title}</span></a>
							</li>
							<!-- <li uk-lightbox>
							<a class="" title="{PHP.L.footer_install_cot_youtube_tutorial_desc}" uk-tooltip="pos: top" href="https://www.youtube.com/watch?v=c2pz2mlSfXA" data-caption="{PHP.L.footer_install_cot_youtube_tutorial_desc}"><span class="uk-margin-small-left uk-margin-small-right uk-text-danger" uk-icon="icon: youtube"></span><span class="uk-text-uppercase uk-font-play"></span></a>
							</li> -->
							<li><a class="uk-text-uppercase uk-font-play"  href="https://www.youtube.com/results?search_query=Install+Cotonti+Siena+0.9.19" target="_blank"><span class="uk-margin-small-left uk-margin-small-right uk-text-danger" uk-icon="icon: youtube"></span>{PHP.L.footer_install_cot_youtube_tutorial_title}</a></li>
						</ul>
					</div>
				</div>
			</div>
			<hr class="uk-divider-icon">
			  <div class="uk-text-center uk-text-small uk-light">
				<h6>The Theme made on May 27, 2019, by <a href="https://t.me/webitproff" class="uk-text-bold uk-text-warning uk-icon-link uk-margin-small-left uk-margin-small-right" uk-icon="heart" target="_blank" title="webitproff@gmail.com</br> Skype: webitproff</br> Telegram: webitproff</br> Viber: +380679097117" uk-tooltip="pos: top">WEBITPROFF with </a> for a better web.</h6>
				
				<script>document.write(new Date().getFullYear())</script>&nbsp;&copy;
			  </div>
				<div id="modal-required-to-install" class="uk-modal-container" uk-modal>
					<div class="uk-modal-dialog uk-font-play"  uk-overflow-auto>
						<button class="uk-modal-close-full uk-close-large" type="button" uk-close></button>
						<div class=" uk-card uk-card-default">
							<div class="uk-modal-header">
								<h2 class="uk-modal-title uk-text-bold uk-text-primary">Технические требования и установка</h2>
							</div>
							<div class="uk-modal-body" uk-overflow>
								<p class="description">Технические требования и описание процесса установки Cotonti на хостинг.</p>
								<h2><a class="anchor" target="_blank" href="https://www.cotonti.com:443/docs/start/installation#ch1" name="ch1" id="ch1">#</a>1. Введение</h2>
								<p>Установка Cotonti происходит в полуавтоматическом режиме через мастер установки, который, в соответствии с выбранными пользователем параметрами, производит настройку конфигурации сайта, заполнение БД и установку модулей и плагинов.</p>
								<h2><a class="anchor" target="_blank" href="https://www.cotonti.com:443/docs/start/installation#ch2" name="ch2" id="ch2">#</a>2. Требования</h2>
								<p>Подавляющее большинство веб-хостингов по своим параметрам соответствует требованиям Cotonti. Перед установкой CMF на хостинг убедитесь, что он отвечает сл. требованиям:</p>
								<div class="uk-panel uk-padding uk-box-shadow-large uk-width-1-2@s" uk-scrollspy="cls: uk-animation-slide-right; repeat: true; delay: 500">
									<ul class="uk-nav-default uk-nav-parent-icon uk-list uk-list-divider" uk-nav>
										<li class="uk-nav-header"><span class="uk-margin-small-right" uk-icon="icon: cog"></span><span class="uk-text-bold uk-text-danger">Apache, nginx или другой аналогичный веб-сервер.</span></li>
										<li class="uk-parent">
											<a href="#"><span class="uk-margin-small-right" uk-icon="icon: cog"></span><span class="uk-text-bold uk-text-danger">PHP 5.3.3 и выше</span> with support for:</a>
											<ul class="uk-nav-sub  uk-list uk-list-striped">
												<li><span class="uk-margin-small-right" uk-icon="icon: cog"></span>GD Graphics Library,</li>
												<li><span class="uk-margin-small-right" uk-icon="icon: cog"></span>Hash extension,</li>
												<li><span class="uk-margin-small-right" uk-icon="icon: cog"></span>Mbstring,</li>
												<li><span class="uk-margin-small-right" uk-icon="icon: cog"></span>PCRE,</li>
												<li><span class="uk-margin-small-right" uk-icon="icon: cog"></span>PDO и PDO_MySQL,</li>
												<li><span class="uk-margin-small-right" uk-icon="icon: cog"></span>Sessions,</li>
												<li><span class="uk-margin-small-right" uk-icon="icon: cog"></span>Zlib.</li>
												<li><span class="uk-margin-small-right" uk-icon="icon: cog"></span>mod_rewrite [опционально]</li>
											</ul>
										</li>
										<li class="uk-nav-header"><span class="uk-margin-small-right" uk-icon="icon: cog"></span><span class="uk-text-bold uk-text-danger">MySQL 5.0.7</span> и выше</li>
										<li class="uk-nav-divider"></li>
									</ul>
								</div>
								<h2><a class="anchor" target="_blank" href="https://www.cotonti.com:443/docs/start/installation#ch3" name="ch3" id="ch3">#</a>3. Установка</h2>
								<p><strong>Загрузка Cotonti по FTP</strong></p>
								<p>Скачайте архив последней&nbsp;версии&nbsp;Cotonti с <a target="_blank" href="https://www.cotonti.com/en/download/">нашего сайта</a>&nbsp;или <a target="_blank" href="http://github.com/Cotonti/Cotonti/releases" rel="nofollow">Github</a>, распакуйте архив. С помощью FTP-клиента загрузите содержимое папки cotonti на ваш хостинг в корневую директорию будущего сайта (обычно, она имеет имя public_html, htdocs или public_www, но бывают и другие варианты (уточните это у своего хостера).</p>
								<p>После завершения загрузки файлов на хостинг, с помощью FTP-клиента установите для директории /datas/ права 777 (chmod).<br>
								&nbsp;</p>
								<p><strong>Установка или обновление с помощью Git</strong></p>
								<p>Если на вашем хостинге установлен Git, вы можете произвести загрузку с помощью команды</p>
								<pre>git clone git://github.com/Cotonti/Cotonti.git</pre>
								<p>Так же, как и при загрузке Cotonti по FTP, убедитесь, что файлы размещены в нужной директории, и не забудьте выставить права на директорию /datas/:</p>
								<pre>chmod -R 777 datas</pre>
								<p>Если вы использовали Git для загрузки последней версии Cotonti, ниже приведена команда для удаления всех файлов, если вы не собираетесь использовать Git далее:</p>
								<pre>rm -rf .git</pre>
								<p>&nbsp;</p>
								<p><strong>Запуск мастера установки</strong></p>
								<p>Теперь откройте браузер и перейдите на ваш сайт. В случае, если ничего не произойдет, перепроверьте, правильно ли вы произвели загрузку Cotonti на хостинг.</p>
								<p>При первом посещения сайта после загрузки Cotonti на хостинг вы будете автоматически перенаправлены на страницу с мастером установки Cotonti. Если все же по каким-то причинам этого не произошло, введите вручную адрес мастера установки: http://example/install.php</p>
								<p>Мастер установки имеет интуитивно понятный интерфейс и описание шагов установки. Просто следуйте его указаниям.</p>
							</div>
							<div class="uk-modal-footer uk-text-right">
								<button class="uk-button uk-button-primary uk-modal-close" type="button">Ok!</button>
							</div>
						</div>
					</div>
				</div>
<!-- Modal update -->
				<div id="modal-required-to-updating" class="uk-modal-container" uk-modal>
					<div class="uk-modal-dialog uk-font-play"  uk-overflow-auto>
						<button class="uk-modal-close-full uk-close-large" type="button" uk-close></button>
						<div class=" uk-card uk-card-default">
							<div class="uk-modal-header">
								<h2 class="uk-modal-title uk-text-bold uk-text-primary">Технические требования и установка</h2>
							</div>
							<div class="uk-modal-body"  uk-overflow>
								<p class="description">Поддержка вашего Cotonti в актуальном состоянии, обновление с предыдущих версий и других систем</p>
								<p>
									Эта инструкция поможет вам выполнить необходимые действия, чтобы обновить ваш сайт на Cotonti. Есть основание предположить, что у вас имеется некоторый опыт в работе с веб-сайтами и использовании популярных инструментов, например phpMyAdmin, FTP и т. д.</p>
								<p>
									Хорошо, если у вас есть привычка делать резервные копии сайтов и баз данных перед внесением крупных исправлений.</p>
								<h2><a class="anchor" target="_blank" href="https://www.cotonti.com:443/docs/start/updating#ch1" name="ch1" id="ch1">#</a>1. Проведение обновлений Cotonti Siena</h2>
								<p>
									Большинство обновлений ветви Siena (0.9.x) автоматизированы. Если у вас есть сайт на Siena, ядро, модули или плагины которого вы хотите обновить, выполните следующие действия:</p>
								<ol><li>
										<p>
											Скопируйте обновленные файлы в дерево сайта. Замените имеющиеся файлы на обновленные.</p>
									</li>
									<li>
										<p>
											Если вы удалили файл install.php из корневой папки после предыдущей установки/обновления, восстановите его сейчас. Если вы обновляете весь пакет Cotonti, а не отдельный модуль/плагин, сделайте файл datas/config.php доступным для записи для PHP (обычно подразумевается установка на него CHMOD 666 или CHMOD 664).</p>
									</li>
									<li>
										<p>
											Запустите скрипт установки в окне браузера, например http://example.com/install.php</p>
									</li>
									<li>
										<p>
											Скрипт автоматически объединит изменения в файле config.php, проверит наличие патчей SQL и обновит их, проверит на наличие обновлений для всех установленных модулей и плагинов и применит доступные. Если произойдет ошибка, она будет отображаться на красном фоне. Журнал обновлений без ошибок отображается на зеленом фоне. Если при обновлении происходят ошибки, обратитесь к поддержке на форумах.</p>
									</li>
									<li>
										<p>
											После успешного завершения обновления можно удалить install.php до следующего обновления и запретить доступ к записи в datas/config.php (CHMOD 644).</p>
									</li>
								</ol><p>
									<em>Примечание для разработчиков расширений:</em> скрипт обновления отслеживает изменения в плагинах и модулях, сравнивая номер их версии с номером версии в базе данных. Он не сверяет существующие файлы и не ищет патчи. Так что после обновления установочного файла расширения (конфигурация, права по умолчанию и т. д.), внесения изменений в хуки или части расширения, добавления патчей для PHP или SQL <em>не забудьте изменить номер версии</em> в установочном файле расширения, чтобы скрипт обновления идентифицировал его как подлежащий обработке.</p>
							</div>
							<div class="uk-modal-footer uk-text-right">
								<button class="uk-button uk-button-primary uk-modal-close" type="button">Ok!</button>
							</div>
						</div>
					</div>
				</div>
<!-- end modal update -->
		</div>
	</body>
</html>
<!-- END: MAIN -->

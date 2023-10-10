<!-- BEGIN: MAIN -->

<!-- IF {PRJ_COST} > 0 --><div class="pull-xs-right p-t-1">{PRJ_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF -->

<h1 class="m-t-2">
	{PRJ_SHORTTITLE}
</h1>

<p class="m-b-2 text-muted">{PRJ_CATTITLE}<!-- IF {PRJ_COUNTRY} OR {PRJ_REGION} OR {PRJ_CITY} -->, {PRJ_COUNTRY} {PRJ_REGION} {PRJ_CITY}<!-- ENDIF --></p>
<div class="card m-b-2">
	<div class="card-block">

		<!-- IF {PRJ_STATE} == 2 -->
		<div class="alert alert-warning">{PHP.L.projects_forreview}</div>
		<!-- ENDIF -->
		<!-- IF {PRJ_STATE} == 1 -->
		<div class="alert alert-warning">{PHP.L.projects_hidden}</div>
		<!-- ENDIF -->

		<div class="media m-b-2">
			<div class="media-left">
				{PRJ_OWNER_AVATAR}
			</div>
			<div class="media-body">

				<!-- IF {PHP.cot_plugins_active.paypro} AND {PRJ_FORPRO} -->
				<div class="pull-xs-right"><span class="label label-success">{PHP.L.paypro_forpro}</span></div>
				<!-- ENDIF -->

				<div class="media-heading">{PRJ_OWNER_NAME}</div>
				<p>
					<!-- IF {PRJ_OWNER_ISPRO} -->
					<span class="label label-success">PRO</span> 
					<!-- ENDIF -->
					<span class="label label-info">{PRJ_OWNER_USERPOINTS}</span>
				</p>
			</div>
		</div>
			
		{PRJ_TEXT}

		<!-- IF {PHP.cot_plugins_active.mavatars} -->
			<!-- IF {PRJ_MAVATARCOUNT} -->
				<div class="clearfix"></div>
				<b>{PHP.L.Files}:</b>
				<ol class="files p-l-2">
					<!-- FOR {KEY}, {VALUE} IN {PRJ_MAVATAR} -->
					<li><a href="{VALUE.FILE}">{VALUE.FILENAME}.{VALUE.FILEEXT}</a></li>
					<!-- ENDFOR -->
				</ol>
			<!-- ENDIF -->
		<!-- ENDIF -->

		<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.projects} -->
		<p class="small">{PHP.L.Tags}: 
			<!-- BEGIN: PRJ_TAGS_ROW --><!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF --><a href="{PRJ_TAGS_ROW_URL}" title="{PRJ_TAGS_ROW_TAG}" rel="nofollow">{PRJ_TAGS_ROW_TAG}</a><!-- END: PRJ_TAGS_ROW -->
			<!-- BEGIN: PRJ_NO_TAGS -->{PRJ_NO_TAGS}<!-- END: PRJ_NO_TAGS -->
		</p>
		<!-- ENDIF -->
	</div>
	<div class="card-footer small">
		<div class="pull-xs-left">{PRJ_DATE_STAMP|cot_date('j F Y, H:i', $this)}</div>	
		<div class="clearfix"></div>
	</div>
</div>

<a href="{PRJ_SAVE_URL}" class="btn btn-success"><span>{PHP.L.Publish}</span></a> 
<a href="{PRJ_EDIT_URL}" class="btn btn-info"><span>{PHP.L.Edit}</span></a>

<!-- END: MAIN -->	
<!-- BEGIN: MAIN -->

	<h1 class="m-t-2">
		{USERS_TITLE}
	</h1>
	<p class="m-b-2">{CATTITLE}</p>
	<div class="row">
		<div class="col-md-3">
		
			<div class="card graygradient m-b-2">
				<div class="card-block">
					<form action="{SEARCH_ACTION_URL}" method="get" class="form-horizontal">
						<input type="hidden" name="f" value="search" />
						<input type="hidden" name="e" value="users" />
						<input type="hidden" name="group" value="{PHP.group}" />
						<input type="hidden" name="cat" value="{PHP.cat}" />
						<input type="hidden" name="l" value="{PHP.lang}" />

						<div class="form-group">
							<label>{PHP.L.Search}:</label>
							<div><input type="text" name="sq" value="{PHP.sq|htmlspecialchars($this)}" class="schstring form-control"/></div>
						</div>
						<!-- IF {PHP.cot_plugins_active.locationselector} -->
						<div class="form-group">
							<label>{PHP.L.Location}:</label>
							<div>{SEARCH_LOCATION}</div>
						</div>
						<!-- ENDIF -->
						<div class="form-group">
							<label>{PHP.L.Category}:</label>
							<div>{SEARCH_CAT}</div>
						</div>
						<input type="submit" name="search" class="btn btn-success btn-block" value="{PHP.L.Search}" />
					</form>
				</div>
			</div>

			<div class="m-b-2">
				{USERCATEGORIES_CATALOG}
			</div>
		</div>
		<div class="col-md-9">
			
			<!-- BEGIN: USERS_ROW -->
				<div class="card">
					<div class="card-block">
						<div class="media-left">
							<a href="{USERS_ROW_DETAILSLINK}">{USERS_ROW_AVATAR}</a>
						</div>
						<div class="media-body">
							<div class="pull-xs-right">
								<span class="label label-info">{USERS_ROW_USERPOINTS}</span>
							</div>
							<div class="media-heading"><a href="{USERS_ROW_DETAILSLINK}">{USERS_ROW_FULL_NAME}</a></div>		
							<p class="text-muted">{USERS_ROW_COUNTRY} {USERS_ROW_REGION} {USERS_ROW_CITY}</p>
							<!-- IF {USERS_ROW_ISPRO} --><span class="label label-success">PRO</span><!-- ENDIF -->
						</div>
					</div>
				</div>
			<!-- END: USERS_ROW -->

			<!-- IF {USERS_TOP_TOTALUSERS} > 0 -->
			<nav><ul class="pagination">{USERS_TOP_PAGEPREV}{USERS_TOP_PAGNAV}{USERS_TOP_PAGENEXT}</ul></nav>
			<!-- ELSE -->
			<div class="alert">{PHP.L.Noitemsfound}</div>
			<!-- ENDIF -->
		</div>
	</div>
		

<!-- END: MAIN -->
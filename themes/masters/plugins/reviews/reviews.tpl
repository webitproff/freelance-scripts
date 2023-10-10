<!-- BEGIN: MAIN -->
<div class="reviews">
	<h4>{PHP.L.reviews_reviews}</h4>
	<!-- BEGIN: REVIEWS_ROWS -->
		<div class="media">
			<div class="media-left">{REVIEW_ROW_AVATAR}</div>
			<div class="media-body">
				<div class="pull-xs-right score">{REVIEW_ROW_SCORE}</div>
				<div class="media-heading"><a href="{REVIEW_ROW_DETAILSLINK}">{REVIEW_ROW_FULL_NAME}</a></div>
				<!-- IF {REVIEW_ROW_AREA} == 'projects' -->
				<p class="small">{PHP.L.reviews_reviewforproject}: <a href="{REVIEW_ROW_PRJ_URL}">{REVIEW_ROW_PRJ_SHORTTITLE}</a></p>
				<!-- ENDIF -->
				<p>{REVIEW_ROW_TEXT}</p>
				<p class="small">{REVIEW_ROW_DATE|date('d.m.Y H:i', $this)}</p>
				<!-- IF {REVIEW_ROW_DELETE_URL} --><div class="edit"><a href="{REVIEW_ROW_DELETE_URL}">{PHP.L.Delete}</a></div><!-- ENDIF -->
				<!-- IF {PHP.usr.id} > 0 AND {PHP.usr.id} == {REVIEW_ROW_OWNERID} --><div class="edit"><a onClick="$('#ReviewEditModal{REVIEW_ROW_ID}').modal(); return false;" href="{REVIEW_ROW_EDIT_URL}">{PHP.L.Edit}</a></div><!-- ENDIF -->
			</div>
		</div>
	
		<!-- BEGIN: EDITFORM -->
		<div id="ReviewEditModal{REVIEW_FORM_ID}" class="modal hide fade">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">{PHP.L.reviews_edit_review}</h4>
					</div>
					<div class="modal-body">
						<div class="customform">
							<form action="{REVIEW_FORM_SEND}" method="post" name="newreview" enctype="multipart/form-data">
								<div class="form-group row">
									<label class="col-md-3 form-control-label">{PHP.L.reviews_text}:</label>
									<div class="col-md-9">{REVIEW_FORM_TEXT}</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 form-control-label">{PHP.L.reviews_score}:</label>
									<div class="col-md-9">{REVIEW_FORM_SCORE}</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 form-control-label"></label>
									<div class="col-md-9">
										<input type="submit" value="{PHP.L.Edit}" class="btn btn-success" />
										<a href="{REVIEW_FORM_DELETE_URL}" class="btn btn-warning">{PHP.L.Delete}</a>	   
									</div>
								</div>
							</form>
						</div>	
					</div>
					<div class="modal-footer">
						<button class="btn btn-sm" data-dismiss="modal" aria-hidden="true">Закрыть</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END: EDITFORM -->	
	
		<hr/>
	<!-- END: REVIEWS_ROWS -->
</div>

{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}

<!-- BEGIN: FORM -->
	<h4 class="m-y-2"><!-- IF {REVIEW_FORM_ACTION} == "EDIT" -->{PHP.L.reviews_edit_review}<!-- ELSE -->{PHP.L.reviews_add_review}<!-- ENDIF --></h4>
	<div class="card">
		<div class="card-block">
			<form action="{REVIEW_FORM_SEND}" method="post" name="newreview" enctype="multipart/form-data">
				<!-- IF {REVIEW_FORM_PROJECTS} -->
				<div class="form-group">
					<div class="alert alert-info">{PHP.L.reviews_projectsonly}</div>
				</div>
				<div class="form-group row">
					<label class="col-md-3 form-control-label">{PHP.L.reviews_chooseprj}:</label>
					<div class="col-md-9">{REVIEW_FORM_PROJECTS}</div>
				</div>
				<!-- ENDIF -->
				<div class="form-group row">
					<label class="col-md-3 form-control-label">{PHP.L.reviews_text}:</label>
					<div class="col-md-9">{REVIEW_FORM_TEXT}</div>
				</div>
				<div class="form-group row">
					<label class="col-md-3 form-control-label">{PHP.L.reviews_score}:</label>
					<div class="col-md-9">{REVIEW_FORM_SCORE}</div>
				</div>
				<input class="btn btn-success" type="submit" value="<!-- IF {REVIEW_FORM_ACTION} == "EDIT" -->{PHP.L.Edit}<!-- ELSE -->{PHP.L.Add}<!-- ENDIF -->" />
						<!-- IF {REVIEW_FORM_ACTION} == "EDIT" --> <a href="{REVIEW_FORM_DELETE_URL}">{PHP.L.Delete}</a><!-- ENDIF -->	   
				</div>
			</form>
		</div>
	</div>
<!-- END: FORM -->
<!-- END: MAIN -->
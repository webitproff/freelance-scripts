<!-- BEGIN: MAIN -->

		<div class="block">
			<div class="breadcrumb">{FORUMS_SECTIONS_PAGETITLE}</div>
<!-- BEGIN: FORUMS_SECTIONS -->
			<table class="table table-bordered">
				<thead>
					<tr>
						<td class="coltop" class="width10">&nbsp;</td>
						<td class="coltop" class="width40">
							Разделы
						</td>
						<td class="coltop" class="width20">{PHP.L.Lastpost}</td>
						<td class="coltop" class="width10">{PHP.L.forums_topics}</td>
						<td class="coltop" class="width10">{PHP.L.forums_posts}</td>
						<td class="coltop" class="width10">{PHP.L.Activity}</td>
					</tr>
				</thead>
<!-- BEGIN: CAT -->
				<tbody id="{FORUMS_SECTIONS_ROW_CAT}">
					<tr>
						<td class="forumssection" colspan="6">
							{FORUMS_SECTIONS_ROW_TITLE}
						</td>
					</tr>
				</tbody>
				<tbody id="blk_{FORUMS_SECTIONS_ROW_CAT}"<!-- IF {FORUMS_SECTIONS_ROW_FOLD} --> style="display:none;"<!-- ENDIF -->>
<!-- BEGIN: SECTION -->
					<tr>
						<td class="centerall">
							{FORUMS_SECTIONS_ROW_ICON}
						</td>
						<td>
							<h4><a href="{FORUMS_SECTIONS_ROW_URL}">{FORUMS_SECTIONS_ROW_TITLE}</a></h4>
							<!-- IF {FORUMS_SECTIONS_ROW_DESC} -->
							<p class="small">{FORUMS_SECTIONS_ROW_DESC}</p>
							<!-- ENDIF -->
							<ul class="subforums">
<!-- BEGIN: SUBSECTION -->
								<li>{PHP.R.forums_icon_subforum}<a href="{FORUMS_SECTIONS_ROW_URL}">{FORUMS_SECTIONS_ROW_TITLE}</a></li>
<!-- END: SUBSECTION -->
							</ul>
						</td>
						<td class="centerall">
							{FORUMS_SECTIONS_ROW_LASTPOST}<br />
							{FORUMS_SECTIONS_ROW_LASTPOSTDATE} {FORUMS_SECTIONS_ROW_LASTPOSTER}
						</td>
						<td class="centerall">{FORUMS_SECTIONS_ROW_TOPICCOUNT}</td>
						<td class="centerall">{FORUMS_SECTIONS_ROW_POSTCOUNT}</td>
						<td class="centerall">{FORUMS_SECTIONS_ROW_ACTIVITY}</td>
					</tr>
<!-- END: SECTION -->
				</tbody>
			<!-- END: CAT -->
			</table>
<!-- END: FORUMS_SECTIONS -->
		</div>
		<div class="block sr-only">
			<div class="mboxHD tags">{PHP.L.Tags}</div>
			{FORUMS_SECTIONS_TAG_CLOUD}
		</div>

<!-- END: MAIN -->
<!-- BEGIN: MAIN -->
			<div class="block">      
<!-- BEGIN: DS_ROW_EMPTY -->
						<tr style="display:none" id="error">
             <td></td>
             <td class="text-center">{PHP.L.None}</td>
            </tr>
<!-- END: DS_ROW_EMPTY -->
          <div class="ds_scroll">       
					<table class="cells">
<!-- BEGIN: DS_ROW -->
						<tr>
							<td style="width: 5%;" class="ds_avatar">{DS_ROW_USER_AVATAR}</td>            
							<td id="{DS_ROW_ID}" style="width: 85%;<!-- IF {DS_ROW_READSTATUS} --> background: #F3F3F3;<!-- ENDIF -->">
              <span class="pull-right">{DS_ROW_USER_MAINGRP} {DS_ROW_DATE}</span>
              {DS_ROW_USER_NAME}<br />
               <span msg="edit" class="ds_edit<!-- IF !{DS_ROW_READSTATUS} --> read<!-- ENDIF -->" id="{DS_ROW_ID}" href="{DS_EDIT_URL}">{DS_ROW_TEXT}
                <!-- IF {FILE_ROW_URL} -->
                <!-- IF {FILE_ROW_EXT} != 'jpg' AND {FILE_ROW_EXT} != 'png' AND {FILE_ROW_EXT} != 'jpeg' AND {FILE_ROW_EXT} != 'bmp' -->
                 <span class="pull-right"><i class="icon-download-alt"></i> <a href="{FILE_ROW_URL}" target="blank">{FILE_ROW_TITLE}</a></span>
                 <!-- ELSE -->
                 <div class="clearfix"></div>
                 <a href="{FILE_ROW_URL}" target="_blank"><img src="{FILE_ROW_URL}" style="max-width: 20%;float:left;"/></a>
                 <!-- ENDIF -->
                <!-- ENDIF -->
               </span>
              </td>
						</tr>
<!-- END: DS_ROW -->
					</table>       
				</div>    
			</div>

<!-- END: MAIN -->
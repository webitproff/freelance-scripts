<!-- BEGIN: MAIN -->
<div style="margin-bottom:10px;" id="content_{PRD_ROW_ID}">
 <h4 style="text-align:center"><a href="{PRD_ROW_URL}" target="blank">{PRD_ROW_SHORTTITLE}</a></h4>

    <!-- IF {PRD_ROW_MAVATAR.1} -->
    	<div style="text-align:center;">
    			<a href="{PRD_ROW_URL}"><img src="{PRD_ROW_MAVATAR.1|cot_mav_thumb($this, 80, 80, crop)}" /></a>
    	</div>
    <!-- ENDIF -->

  {PRD_ROW_SHORTTEXT}

  <div class="clearfix"></div>

  <div style="min-width:200px;">
    <div class="pull-right">{PRD_ROW_PRDMAP_ADR}
    </div>
  </div>
</div>
<!-- END: MAIN -->

<!-- BEGIN: MAIN -->

<div class="breadcrumb">{BREADCRUMBS}</div>
<div class="pull-right paddingtop10"><span class="label label-info">{ORDER_LOCALSTATUS}</span></div>
<h1>{PHP.L.orderservices_title} № {ORDER_ID}</h1>
<div class="customform">
	<table class="table">
		<tr>
			<td align="right" style="width:176px;">{PHP.L.orderservices_product}:</td>
			<td><!-- IF {ORDER_SERV_SHORTTITLE} --><a href="{ORDER_SERV_URL}" target="blank">[ID {ORDER_SERV_ID}] {ORDER_SERV_SHORTTITLE}</a><!-- ELSE -->{ORDER_TITLE}<!-- ENDIF --></td>
		</tr>
		<tr>
			<td align="right">{PHP.L.orderservices_count}:</td>
			<td>{ORDER_COUNT}</td>
		</tr>
		<tr>
			<td align="right">{PHP.L.orderservices_comment}:</td>
			<td>{ORDER_COMMENT}</td>
		</tr>
		<tr>
			<td align="right">{PHP.L.orderservices_cost}:</td>
			<td>{ORDER_COST} {PHP.cfg.payments.valuta}</td>
		</tr>
		<!-- IF {ORDER_STATUS} == "new" -->
			<!-- IF {ORDER_COST} > 0 -->
				<tr>
					<td align="right"></td>
					<td><a href="{ORDER_ID|cot_url('orderservices','m=pay&id='$this)}" class="btn btn-success">{PHP.L.orderservices_neworder_pay}</a></td>
				</tr>
			<!-- ENDIF -->
		<!-- ELSE -->
		<tr>
			<td align="right">{PHP.L.orderservices_paid}:</td>
			<td>{ORDER_PAID|date('d.m.Y H:i', $this)}</td>
		</tr>
		<tr>
			<td align="right">{PHP.L.orderservices_warranty}:</td>
			<td>{ORDER_WARRANTYDATE|date('d.m.Y H:i', $this)}</td>
		</tr>
		<!-- IF {ORDER_DOWNLOAD} -->
		<tr>
			<td align="right">{PHP.L.orderservices_file_for_download}:</td>
			<td><a href="{ORDER_DOWNLOAD}" >{PHP.L.orderservices_file_download}</a></td>
		</tr>
		<!-- ENDIF -->
		<!-- ENDIF -->
	</table>
	<!-- IF {ORDER_WARRANTYDATE} > {PHP.sys.now} AND {ORDER_STATUS} == 'paid' AND {PHP.usr.id} == {ORDER_CUSTOMER_ID} -->
	<a class="btn btn-warning" href="{ORDER_ID|cot_url('orderservices', 'm=addclaim&id='$this)}">{PHP.L.orderservices_addclaim_button}</a>
	<!-- ENDIF -->

	<!-- BEGIN: CLAIM -->
	<h3>{PHP.L.orderservices_claim_title}</h3>
	<div class="well">
		<div class="pull-right">{CLAIM_DATE|date('d.m.Y H:i', $this)}</div>
		<p>{CLAIM_TEXT}</p>

		<!-- BEGIN: ADMINCLAIM -->
		<p>
			<a href="{ORDER_ID|cot_url('orderservices', 'a=acceptclaim&id='$this)}" class="btn btn-warning">{PHP.L.orderservices_claim_accept}</a>
			<a href="{ORDER_ID|cot_url('orderservices', 'a=cancelclaim&id='$this)}" class="btn btn-danger">{PHP.L.orderservices_claim_cancel}</a>
		</p>
		<!-- END: ADMINCLAIM -->
	</div>
	<!-- END: CLAIM -->

</div>

<!-- END: MAIN -->

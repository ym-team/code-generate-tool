<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBill" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<TITLE>è´¦å•è¡?²éÑ¯</TITLE>
	<!-- µ¼ÈëJSºÍCSSÑùÊ½-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/common/list_ajax.js"></script>
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
	<!-- ĞÂÑùÊ½·ç¸ñ±ØĞëÒıÈëµÄ -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css"> 
    <script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">
    <!-- ²éÑ¯Ò³ÃæÉÏÓĞ checkboxµÄĞèÒªÒıÈë -->
   <script type="text/javascript">
		
		$(function(){
		
			$("input[name='selectall_checkbox']").on('ifClicked',
		                function () {
		                    $('input:checkbox').iCheck('toggle');
		                });
		                          
			var operates = {
				edit:'TPmBill.mc?method=editTPmBill&billId,typeCode,communityId,houseId,money,revMoney,pendMoney,overdueMoney,overdueRevMoney,overduePendMoney,ncPayMoney,payState,year,month,bankBillFlag,companyId,ncBillId,ncHouseId,ncManageId,isDelete,billCode,ncTs,ncPkRevfare,joinTime,settlementStatus=',
				del:'TPmBill.mc?method=deleteTPmBill&PK=',
				view:'TPmBill.mc?method=detailTPmBill&billId,typeCode,communityId,houseId,money,revMoney,pendMoney,overdueMoney,overdueRevMoney,overduePendMoney,ncPayMoney,payState,year,month,bankBillFlag,companyId,ncBillId,ncHouseId,ncManageId,isDelete,billCode,ncTs,ncPkRevfare,joinTime,settlementStatus='
			};
			var options = {
				tableId:'pageTable',
				url:'TPmBill.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'billId,typeCode,communityId,houseId,money,revMoney,pendMoney,overdueMoney,overdueRevMoney,overduePendMoney,ncPayMoney,payState,year,month,bankBillFlag,companyId,ncBillId,ncHouseId,ncManageId,isDelete,billCode,ncTs,ncPkRevfare,joinTime,settlementStatus'
			};
			
			jQuery.page( options );
			
			$("#moreSearch").toggle(function(){
				var cls = $(this).find("span").attr( "class" );
				if( cls == "search_more" ) {
					$(this).find("span").attr( "class", "search_more_on" );
				} else {
					$(this).find("span").attr( "class", "search_more" );
				}
				$("tr[class*=more]").show();
			},function(){
				$("tr[class*=more]").hide();
				var cls = $(this).find("span").attr( "class" );
				if( cls == "search_more" ) {
					$(this).find("span").attr( "class", "search_more_on" );
				} else {
					$(this).find("span").attr( "class", "search_more" );
				}
			});
			
		
			
		});
		
	
			
	</script>
</head>
<body>
	<form name="searchForm" method="post" class="form-search" action="" id="searchForm">
		<input type="hidden" name="pageNo" id="pageNo" />
 		<input type="hidden" name="pageSize" id="pageSize" />
 		<input type="hidden" name="start" id="start" />
 		<input type="hidden" name="orderName" id="orderName" />
 		
 		<!-- ²éÑ¯Ìõ¼şÏÔÊ¾ÇøÓòstart -->
 		<div class="tabelist" style="border:1px solid gray;width:100%;padding:10px;margin:0 auto;">
			<div style="margin:0 auto;width:100%;">
			<div class="title-common">
				 	è´¦å•è¡?²éÑ¯
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_edit.jsp'">Ìí¼Ó</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="bill_id" placeholder="è´¦å•ID" value="${ param.bill_id }"/>
		<input type='text' class="input-small" name="type_code" placeholder="è´¦å•ç¼–å·" value="${ param.type_code }"/>
		<input type='text' class="input-small" name="community_id" placeholder="å°åŒºid" value="${ param.community_id }"/>
		<input type='text' class="input-small" name="house_id" placeholder="æˆ¿é—´ID" value="${ param.house_id }"/>
		<input type='text' class="input-small" name="money" placeholder="åº”ç¼´è´¹ç”¨ï¼ˆå…ƒï¼?" value="${ param.money }"/>
		<input type='text' class="input-small" name="rev_money" placeholder="å·²æ”¶é‡‘é¢ï¼ˆå…ƒï¼?" value="${ param.rev_money }"/>
		<input type='text' class="input-small" name="pend_money" placeholder="å¾…ç¼´é‡‘é¢ï¼ˆå…ƒï¼?" value="${ param.pend_money }"/>
		<input type='text' class="input-small" name="overdue_money" placeholder="åº”ç¼´æ»çº³é‡‘ï¼ˆå…ƒï¼‰" value="${ param.overdue_money }"/>
		<input type='text' class="input-small" name="overdue_rev_money" placeholder="å·²æ”¶æ»çº³é‡‘ï¼ˆå…ƒï¼‰" value="${ param.overdue_rev_money }"/>
		<input type='text' class="input-small" name="overdue_pend_money" placeholder="å¾…ç¼´æ»çº³é‡‘ï¼ˆå…ƒï¼‰" value="${ param.overdue_pend_money }"/>
		<input type='text' class="input-small" name="nc_pay_money" placeholder="çº¿ä¸‹æ”¯ä»˜æ€»é¢" value="${ param.nc_pay_money }"/>
		<input type='text' class="input-small" name="pay_state" placeholder="ç¼´çº³çŠ¶æ??" value="${ param.pay_state }"/>
		<input type='text' class="input-small" name="year" placeholder="å¹?" value="${ param.year }"/>
		<input type='text' class="input-small" name="month" placeholder="æœ?" value="${ param.month }"/>
		<input type='text' class="input-small" name="bank_bill_flag" placeholder="é“¶è¡Œåˆ’æ‰£æ ‡è¯†" value="${ param.bank_bill_flag }"/>
		<input type='text' class="input-small" name="company_id" placeholder="ç‰©ä¸šå…¬å¸ä¸»é”®" value="${ param.company_id }"/>
		<input type='text' class="input-small" name="nc_bill_id" placeholder="" value="${ param.nc_bill_id }"/>
		<input type='text' class="input-small" name="nc_house_id" placeholder="æˆ¿äº§ä¸»é”®" value="${ param.nc_house_id }"/>
		<input type='text' class="input-small" name="nc_manage_id" placeholder="ç®¡ç†å¤„ä¸»é”?" value="${ param.nc_manage_id }"/>
		<input type='text' class="input-small" name="is_delete" placeholder="æ˜¯å¦åˆ é™¤" value="${ param.is_delete }"/>
		<input type='text' class="input-small" name="bill_code" placeholder="è´¦å•ç¼–å·" value="${ param.bill_code }"/>
		<input type='text' class="input-small" name="nc_ts" placeholder="" value="${ param.nc_ts }"/>
		<input type='text' class="input-small" name="nc_pk_revfare" placeholder="" value="${ param.nc_pk_revfare }"/>
		<input type='text' class="input-small" name="join_time" placeholder="åŒæ­¥æ—¶é—´" value="${ param.join_time }"/>
		<input type='text' class="input-small" name="settlement_status" placeholder="ç»“ç®—çŠ¶æ?ï¼ˆ0ï¼šæœªç»“ç®—ï¼?1ï¼šç»“ç®—ä¸­ï¼?2ï¼šå·²ç»“ç®—ï¼?9ï¼šé”å®šä¸­ï¼?10ï¼šç­‰å¾…ç»“ç®—ï¼‰" value="${ param.settlement_status }"/>
		<button type="button" id="searchBtn" class="btn btn-group-vertical">ËÑË÷</button>
							</div>
						</td>
						</tr>
		</table>
				</div>
			</div>
			<!-- ²éÑ¯Ìõ¼şÏÔÊ¾ÇøÓòend -->
			<!--//Êı¾İÏÔÊ¾ÁĞ±í-->
			<div style="position: relative;">
				<div id="loading" style=" width:100%; height: 340px;position: absolute; top: 0; display:none;">
					<div style="background-color: ; position: absolute; top: 50%; left: 50%; margin: -33px 0 0 -33px;">
						<img src="skins/style/images/loading.gif" />
					</div>
				</div>
				<div class="tabelist">
					<table id="pageTable" width="100%" border="0" class="table table-hover table-condensed" cellpadding="0" cellspacing="0">
	  					<thead>
	                    	<tr height="22" class="tab_title_bg">
	                        	<th align="center">
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="È«Ñ¡/È¡Ïû" />
	                            </th>
	                            <!--±íÍ·Ñ­»·¿ªÊ¼ -->
								<!-- Ö÷¼üÁĞ  è´¦å•ID-->   
								<th align="center" rowName="billId" orderName="bill_id:DESC" title='è´¦å•ID'>è´¦å•ID</th>
								<!-- Ö÷¼üÁĞ  è´¦å•ç¼–å·-->   
								<th align="center" rowName="typeCode" orderName="type_code:DESC" title='è´¦å•ç¼–å·'>è´¦å•ç¼–å·</th>
								<!-- Ö÷¼üÁĞ  å°åŒºid-->   
								<th align="center" rowName="communityId" orderName="community_id:DESC" title='å°åŒºid'>å°åŒºid</th>
								<!-- Ö÷¼üÁĞ  æˆ¿é—´ID-->   
								<th align="center" rowName="houseId" orderName="house_id:DESC" title='æˆ¿é—´ID'>æˆ¿é—´ID</th>
								<!-- Ö÷¼üÁĞ  åº”ç¼´è´¹ç”¨ï¼ˆå…ƒï¼?-->   
								<th align="center" rowName="money" orderName="money:DESC" title='åº”ç¼´è´¹ç”¨ï¼ˆå…ƒï¼?'>åº”ç¼´è´¹ç”¨ï¼ˆå…ƒï¼?</th>
								<!-- Ö÷¼üÁĞ  å·²æ”¶é‡‘é¢ï¼ˆå…ƒï¼?-->   
								<th align="center" rowName="revMoney" orderName="rev_money:DESC" title='å·²æ”¶é‡‘é¢ï¼ˆå…ƒï¼?'>å·²æ”¶é‡‘é¢ï¼ˆå…ƒï¼?</th>
								<!-- Ö÷¼üÁĞ  å¾…ç¼´é‡‘é¢ï¼ˆå…ƒï¼?-->   
								<th align="center" rowName="pendMoney" orderName="pend_money:DESC" title='å¾…ç¼´é‡‘é¢ï¼ˆå…ƒï¼?'>å¾…ç¼´é‡‘é¢ï¼ˆå…ƒï¼?</th>
								<!-- Ö÷¼üÁĞ  åº”ç¼´æ»çº³é‡‘ï¼ˆå…ƒï¼‰-->   
								<th align="center" rowName="overdueMoney" orderName="overdue_money:DESC" title='åº”ç¼´æ»çº³é‡‘ï¼ˆå…ƒï¼‰'>åº”ç¼´æ»çº³é‡‘ï¼ˆå…ƒï¼‰</th>
								<!-- Ö÷¼üÁĞ  å·²æ”¶æ»çº³é‡‘ï¼ˆå…ƒï¼‰-->   
								<th align="center" rowName="overdueRevMoney" orderName="overdue_rev_money:DESC" title='å·²æ”¶æ»çº³é‡‘ï¼ˆå…ƒï¼‰'>å·²æ”¶æ»çº³é‡‘ï¼ˆå…ƒï¼‰</th>
								<!-- Ö÷¼üÁĞ  å¾…ç¼´æ»çº³é‡‘ï¼ˆå…ƒï¼‰-->   
								<th align="center" rowName="overduePendMoney" orderName="overdue_pend_money:DESC" title='å¾…ç¼´æ»çº³é‡‘ï¼ˆå…ƒï¼‰'>å¾…ç¼´æ»çº³é‡‘ï¼ˆå…ƒï¼‰</th>
								<!-- Ö÷¼üÁĞ  çº¿ä¸‹æ”¯ä»˜æ€»é¢-->   
								<th align="center" rowName="ncPayMoney" orderName="nc_pay_money:DESC" title='çº¿ä¸‹æ”¯ä»˜æ€»é¢'>çº¿ä¸‹æ”¯ä»˜æ€»é¢</th>
								<!-- Ö÷¼üÁĞ  ç¼´çº³çŠ¶æ??-->   
								<th align="center" rowName="payState" orderName="pay_state:DESC" title='ç¼´çº³çŠ¶æ??'>ç¼´çº³çŠ¶æ??</th>
								<!-- Ö÷¼üÁĞ  å¹?-->   
								<th align="center" rowName="year" orderName="year:DESC" title='å¹?'>å¹?</th>
								<!-- Ö÷¼üÁĞ  æœ?-->   
								<th align="center" rowName="month" orderName="month:DESC" title='æœ?'>æœ?</th>
								<!-- Ö÷¼üÁĞ  é“¶è¡Œåˆ’æ‰£æ ‡è¯†-->   
								<th align="center" rowName="bankBillFlag" orderName="bank_bill_flag:DESC" title='é“¶è¡Œåˆ’æ‰£æ ‡è¯†'>é“¶è¡Œåˆ’æ‰£æ ‡è¯†</th>
								<!-- Ö÷¼üÁĞ  ç‰©ä¸šå…¬å¸ä¸»é”®-->   
								<th align="center" rowName="companyId" orderName="company_id:DESC" title='ç‰©ä¸šå…¬å¸ä¸»é”®'>ç‰©ä¸šå…¬å¸ä¸»é”®</th>
								<!-- Ö÷¼üÁĞ  -->   
								<th align="center" rowName="ncBillId" orderName="nc_bill_id:DESC" title=''></th>
								<!-- Ö÷¼üÁĞ  æˆ¿äº§ä¸»é”®-->   
								<th align="center" rowName="ncHouseId" orderName="nc_house_id:DESC" title='æˆ¿äº§ä¸»é”®'>æˆ¿äº§ä¸»é”®</th>
								<!-- Ö÷¼üÁĞ  ç®¡ç†å¤„ä¸»é”?-->   
								<th align="center" rowName="ncManageId" orderName="nc_manage_id:DESC" title='ç®¡ç†å¤„ä¸»é”?'>ç®¡ç†å¤„ä¸»é”?</th>
								<!-- Ö÷¼üÁĞ  æ˜¯å¦åˆ é™¤-->   
								<th align="center" rowName="isDelete" orderName="is_delete:DESC" title='æ˜¯å¦åˆ é™¤'>æ˜¯å¦åˆ é™¤</th>
								<!-- Ö÷¼üÁĞ  è´¦å•ç¼–å·-->   
								<th align="center" rowName="billCode" orderName="bill_code:DESC" title='è´¦å•ç¼–å·'>è´¦å•ç¼–å·</th>
								<!-- Ö÷¼üÁĞ  -->   
								<th align="center" rowName="ncTs" orderName="nc_ts:DESC" title=''></th>
								<!-- Ö÷¼üÁĞ  -->   
								<th align="center" rowName="ncPkRevfare" orderName="nc_pk_revfare:DESC" title=''></th>
								<!-- Ö÷¼üÁĞ  åŒæ­¥æ—¶é—´-->   
								<th align="center" rowName="joinTime" orderName="join_time:DESC" title='åŒæ­¥æ—¶é—´'>åŒæ­¥æ—¶é—´</th>
								<!-- Ö÷¼üÁĞ  ç»“ç®—çŠ¶æ?ï¼ˆ0ï¼šæœªç»“ç®—ï¼?1ï¼šç»“ç®—ä¸­ï¼?2ï¼šå·²ç»“ç®—ï¼?9ï¼šé”å®šä¸­ï¼?10ï¼šç­‰å¾…ç»“ç®—ï¼‰-->   
								<th align="center" rowName="settlementStatus" orderName="settlement_status:DESC" title='ç»“ç®—çŠ¶æ?ï¼ˆ0ï¼šæœªç»“ç®—ï¼?1ï¼šç»“ç®—ä¸­ï¼?2ï¼šå·²ç»“ç®—ï¼?9ï¼šé”å®šä¸­ï¼?10ï¼šç­‰å¾…ç»“ç®—ï¼‰'>ç»“ç®—çŠ¶æ?ï¼ˆ0ï¼šæœªç»“ç®—ï¼?1ï¼šç»“ç®—ä¸­ï¼?2ï¼šå·²ç»“ç®—ï¼?9ï¼šé”å®šä¸­ï¼?10ï¼šç­‰å¾…ç»“ç®—ï¼‰</th>
								<!--±íÍ·Ñ­»·½áÊø -->	
	                    		<th align="center">²Ù ×÷</th>                    
							</tr>
						</thead>
	                   	<tbody>
					    </tbody>      
					</table>
	               	<div id="pageMenu" class="page"></div>
	               	<div style="clear:both"></div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
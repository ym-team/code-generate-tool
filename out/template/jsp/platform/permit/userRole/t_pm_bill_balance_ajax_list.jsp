<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBillBalance" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<TITLE>é”Ÿæ–¤æ‹·é”Ÿæ–¤æ‹·²éÑ¯</TITLE>
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
				edit:'TPmBillBalance.mc?method=editTPmBillBalance&balanceId,payId,billCode,payMoney,payState,payWay,payUserid,payUserName,prePayTime,finishPayTime,businessOrderCode,paySeq,communityId,ncReceiptNum,ncReceiptMoney,rateFee,payType,thirdPartTransactionId=',
				del:'TPmBillBalance.mc?method=deleteTPmBillBalance&PK=',
				view:'TPmBillBalance.mc?method=detailTPmBillBalance&balanceId,payId,billCode,payMoney,payState,payWay,payUserid,payUserName,prePayTime,finishPayTime,businessOrderCode,paySeq,communityId,ncReceiptNum,ncReceiptMoney,rateFee,payType,thirdPartTransactionId='
			};
			var options = {
				tableId:'pageTable',
				url:'TPmBillBalance.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'balanceId,payId,billCode,payMoney,payState,payWay,payUserid,payUserName,prePayTime,finishPayTime,businessOrderCode,paySeq,communityId,ncReceiptNum,ncReceiptMoney,rateFee,payType,thirdPartTransactionId'
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
				 	é”Ÿæ–¤æ‹·é”Ÿæ–¤æ‹·²éÑ¯
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_balance_edit.jsp'">Ìí¼Ó</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="balance_id" placeholder="è´¦å•ç»“ç®—ID" value="${ param.balance_id }"/>
		<input type='text' class="input-small" name="pay_id" placeholder="æ”¯ä»˜id" value="${ param.pay_id }"/>
		<input type='text' class="input-small" name="bill_code" placeholder="è´¦å•ç¼–å·" value="${ param.bill_code }"/>
		<input type='text' class="input-small" name="pay_money" placeholder="åº”ç¼´è´¹ç”¨ï¼ˆå…ƒï¼?" value="${ param.pay_money }"/>
		<input type='text' class="input-small" name="pay_state" placeholder="ç¼´çº³çŠ¶æ?ï¼ˆ0-å¾…ç¼´çº³ï¼Œ1-å·²ç¼´çº³ï¼‰" value="${ param.pay_state }"/>
		<input type='text' class="input-small" name="pay_way" placeholder="æ”¯ä»˜æ–¹å¼ï¼ˆweixin,alipay,bankï¼?" value="${ param.pay_way }"/>
		<input type='text' class="input-small" name="pay_userid" placeholder="æ”¯ä»˜ç”¨æˆ·id" value="${ param.pay_userid }"/>
		<input type='text' class="input-small" name="pay_user_name" placeholder="æ”¯ä»˜ç”¨æˆ·å§“å" value="${ param.pay_user_name }"/>
		<input type='text' class="input-small" name="pre_pay_time" placeholder="é¢„æ”¯ä»˜æ—¶é—?" value="${ param.pre_pay_time }"/>
		<input type='text' class="input-small" name="finish_pay_time" placeholder="å®Œæˆæ”¯ä»˜æ—¶é—´" value="${ param.finish_pay_time }"/>
		<input type='text' class="input-small" name="business_order_code" placeholder="ä¸šåŠ¡è®¢å•å? = çˆ¶å•å? = ç‰©ä¸šç¼´è´¹æ¨ç»™æ”¯ä»˜æ¨¡å—çš„ä¸šåŠ¡å•å?" value="${ param.business_order_code }"/>
		<input type='text' class="input-small" name="pay_seq" placeholder="billCodeæ”¯ä»˜æ¬¡åº" value="${ param.pay_seq }"/>
		<input type='text' class="input-small" name="community_id" placeholder="å°åŒºID" value="${ param.community_id }"/>
		<input type='text' class="input-small" name="nc_receipt_num" placeholder="NCæ”¶æ¬¾å•ç¼–å?" value="${ param.nc_receipt_num }"/>
		<input type='text' class="input-small" name="nc_receipt_money" placeholder="NCæ”¶æ¬¾å•å…¥è´¦é‡‘é¢?" value="${ param.nc_receipt_money }"/>
		<input type='text' class="input-small" name="rate_fee" placeholder="æ‰‹ç»­è´?" value="${ param.rate_fee }"/>
		<input type='text' class="input-small" name="pay_type" placeholder="æ”¯ä»˜ç±»å‹ï¼?0:ç‰©ä¸šç¼´è´¹ï¼?1:å¯†èœœé¢„ç¼´è´¹ï¼‰" value="${ param.pay_type }"/>
		<input type='text' class="input-small" name="third_part_transaction_id" placeholder="ç¬¬ä¸‰æ–¹äº¤æ˜“æµæ°´å·" value="${ param.third_part_transaction_id }"/>
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
								<!-- Ö÷¼üÁĞ  è´¦å•ç»“ç®—ID-->   
								<th align="center" rowName="balanceId" orderName="balance_id:DESC" title='è´¦å•ç»“ç®—ID'>è´¦å•ç»“ç®—ID</th>
								<!-- Ö÷¼üÁĞ  æ”¯ä»˜id-->   
								<th align="center" rowName="payId" orderName="pay_id:DESC" title='æ”¯ä»˜id'>æ”¯ä»˜id</th>
								<!-- Ö÷¼üÁĞ  è´¦å•ç¼–å·-->   
								<th align="center" rowName="billCode" orderName="bill_code:DESC" title='è´¦å•ç¼–å·'>è´¦å•ç¼–å·</th>
								<!-- Ö÷¼üÁĞ  åº”ç¼´è´¹ç”¨ï¼ˆå…ƒï¼?-->   
								<th align="center" rowName="payMoney" orderName="pay_money:DESC" title='åº”ç¼´è´¹ç”¨ï¼ˆå…ƒï¼?'>åº”ç¼´è´¹ç”¨ï¼ˆå…ƒï¼?</th>
								<!-- Ö÷¼üÁĞ  ç¼´çº³çŠ¶æ?ï¼ˆ0-å¾…ç¼´çº³ï¼Œ1-å·²ç¼´çº³ï¼‰-->   
								<th align="center" rowName="payState" orderName="pay_state:DESC" title='ç¼´çº³çŠ¶æ?ï¼ˆ0-å¾…ç¼´çº³ï¼Œ1-å·²ç¼´çº³ï¼‰'>ç¼´çº³çŠ¶æ?ï¼ˆ0-å¾…ç¼´çº³ï¼Œ1-å·²ç¼´çº³ï¼‰</th>
								<!-- Ö÷¼üÁĞ  æ”¯ä»˜æ–¹å¼ï¼ˆweixin,alipay,bankï¼?-->   
								<th align="center" rowName="payWay" orderName="pay_way:DESC" title='æ”¯ä»˜æ–¹å¼ï¼ˆweixin,alipay,bankï¼?'>æ”¯ä»˜æ–¹å¼ï¼ˆweixin,alipay,bankï¼?</th>
								<!-- Ö÷¼üÁĞ  æ”¯ä»˜ç”¨æˆ·id-->   
								<th align="center" rowName="payUserid" orderName="pay_userid:DESC" title='æ”¯ä»˜ç”¨æˆ·id'>æ”¯ä»˜ç”¨æˆ·id</th>
								<!-- Ö÷¼üÁĞ  æ”¯ä»˜ç”¨æˆ·å§“å-->   
								<th align="center" rowName="payUserName" orderName="pay_user_name:DESC" title='æ”¯ä»˜ç”¨æˆ·å§“å'>æ”¯ä»˜ç”¨æˆ·å§“å</th>
								<!-- Ö÷¼üÁĞ  é¢„æ”¯ä»˜æ—¶é—?-->   
								<th align="center" rowName="prePayTime" orderName="pre_pay_time:DESC" title='é¢„æ”¯ä»˜æ—¶é—?'>é¢„æ”¯ä»˜æ—¶é—?</th>
								<!-- Ö÷¼üÁĞ  å®Œæˆæ”¯ä»˜æ—¶é—´-->   
								<th align="center" rowName="finishPayTime" orderName="finish_pay_time:DESC" title='å®Œæˆæ”¯ä»˜æ—¶é—´'>å®Œæˆæ”¯ä»˜æ—¶é—´</th>
								<!-- Ö÷¼üÁĞ  ä¸šåŠ¡è®¢å•å? = çˆ¶å•å? = ç‰©ä¸šç¼´è´¹æ¨ç»™æ”¯ä»˜æ¨¡å—çš„ä¸šåŠ¡å•å?-->   
								<th align="center" rowName="businessOrderCode" orderName="business_order_code:DESC" title='ä¸šåŠ¡è®¢å•å? = çˆ¶å•å? = ç‰©ä¸šç¼´è´¹æ¨ç»™æ”¯ä»˜æ¨¡å—çš„ä¸šåŠ¡å•å?'>ä¸šåŠ¡è®¢å•å? = çˆ¶å•å? = ç‰©ä¸šç¼´è´¹æ¨ç»™æ”¯ä»˜æ¨¡å—çš„ä¸šåŠ¡å•å?</th>
								<!-- Ö÷¼üÁĞ  billCodeæ”¯ä»˜æ¬¡åº-->   
								<th align="center" rowName="paySeq" orderName="pay_seq:DESC" title='billCodeæ”¯ä»˜æ¬¡åº'>billCodeæ”¯ä»˜æ¬¡åº</th>
								<!-- Ö÷¼üÁĞ  å°åŒºID-->   
								<th align="center" rowName="communityId" orderName="community_id:DESC" title='å°åŒºID'>å°åŒºID</th>
								<!-- Ö÷¼üÁĞ  NCæ”¶æ¬¾å•ç¼–å?-->   
								<th align="center" rowName="ncReceiptNum" orderName="nc_receipt_num:DESC" title='NCæ”¶æ¬¾å•ç¼–å?'>NCæ”¶æ¬¾å•ç¼–å?</th>
								<!-- Ö÷¼üÁĞ  NCæ”¶æ¬¾å•å…¥è´¦é‡‘é¢?-->   
								<th align="center" rowName="ncReceiptMoney" orderName="nc_receipt_money:DESC" title='NCæ”¶æ¬¾å•å…¥è´¦é‡‘é¢?'>NCæ”¶æ¬¾å•å…¥è´¦é‡‘é¢?</th>
								<!-- Ö÷¼üÁĞ  æ‰‹ç»­è´?-->   
								<th align="center" rowName="rateFee" orderName="rate_fee:DESC" title='æ‰‹ç»­è´?'>æ‰‹ç»­è´?</th>
								<!-- Ö÷¼üÁĞ  æ”¯ä»˜ç±»å‹ï¼?0:ç‰©ä¸šç¼´è´¹ï¼?1:å¯†èœœé¢„ç¼´è´¹ï¼‰-->   
								<th align="center" rowName="payType" orderName="pay_type:DESC" title='æ”¯ä»˜ç±»å‹ï¼?0:ç‰©ä¸šç¼´è´¹ï¼?1:å¯†èœœé¢„ç¼´è´¹ï¼‰'>æ”¯ä»˜ç±»å‹ï¼?0:ç‰©ä¸šç¼´è´¹ï¼?1:å¯†èœœé¢„ç¼´è´¹ï¼‰</th>
								<!-- Ö÷¼üÁĞ  ç¬¬ä¸‰æ–¹äº¤æ˜“æµæ°´å·-->   
								<th align="center" rowName="thirdPartTransactionId" orderName="third_part_transaction_id:DESC" title='ç¬¬ä¸‰æ–¹äº¤æ˜“æµæ°´å·'>ç¬¬ä¸‰æ–¹äº¤æ˜“æµæ°´å·</th>
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
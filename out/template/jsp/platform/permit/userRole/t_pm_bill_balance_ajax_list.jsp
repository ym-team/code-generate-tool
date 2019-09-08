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
	<TITLE>锟斤拷锟斤拷��ѯ</TITLE>
	<!-- ����JS��CSS��ʽ-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/common/list_ajax.js"></script>
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
	<!-- ����ʽ����������� -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css"> 
    <script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">
    <!-- ��ѯҳ������ checkbox����Ҫ���� -->
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
 		
 		<!-- ��ѯ������ʾ����start -->
 		<div class="tabelist" style="border:1px solid gray;width:100%;padding:10px;margin:0 auto;">
			<div style="margin:0 auto;width:100%;">
			<div class="title-common">
				 	锟斤拷锟斤拷��ѯ
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_balance_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="balance_id" placeholder="账单结算ID" value="${ param.balance_id }"/>
		<input type='text' class="input-small" name="pay_id" placeholder="支付id" value="${ param.pay_id }"/>
		<input type='text' class="input-small" name="bill_code" placeholder="账单编号" value="${ param.bill_code }"/>
		<input type='text' class="input-small" name="pay_money" placeholder="应缴费用（元�?" value="${ param.pay_money }"/>
		<input type='text' class="input-small" name="pay_state" placeholder="缴纳状�?�（0-待缴纳，1-已缴纳）" value="${ param.pay_state }"/>
		<input type='text' class="input-small" name="pay_way" placeholder="支付方式（weixin,alipay,bank�?" value="${ param.pay_way }"/>
		<input type='text' class="input-small" name="pay_userid" placeholder="支付用户id" value="${ param.pay_userid }"/>
		<input type='text' class="input-small" name="pay_user_name" placeholder="支付用户姓名" value="${ param.pay_user_name }"/>
		<input type='text' class="input-small" name="pre_pay_time" placeholder="预支付时�?" value="${ param.pre_pay_time }"/>
		<input type='text' class="input-small" name="finish_pay_time" placeholder="完成支付时间" value="${ param.finish_pay_time }"/>
		<input type='text' class="input-small" name="business_order_code" placeholder="业务订单�? = 父单�? = 物业缴费推给支付模块的业务单�?" value="${ param.business_order_code }"/>
		<input type='text' class="input-small" name="pay_seq" placeholder="billCode支付次序" value="${ param.pay_seq }"/>
		<input type='text' class="input-small" name="community_id" placeholder="小区ID" value="${ param.community_id }"/>
		<input type='text' class="input-small" name="nc_receipt_num" placeholder="NC收款单编�?" value="${ param.nc_receipt_num }"/>
		<input type='text' class="input-small" name="nc_receipt_money" placeholder="NC收款单入账金�?" value="${ param.nc_receipt_money }"/>
		<input type='text' class="input-small" name="rate_fee" placeholder="手续�?" value="${ param.rate_fee }"/>
		<input type='text' class="input-small" name="pay_type" placeholder="支付类型�?0:物业缴费�?1:密蜜预缴费）" value="${ param.pay_type }"/>
		<input type='text' class="input-small" name="third_part_transaction_id" placeholder="第三方交易流水号" value="${ param.third_part_transaction_id }"/>
		<button type="button" id="searchBtn" class="btn btn-group-vertical">����</button>
							</div>
						</td>
						</tr>
		</table>
				</div>
			</div>
			<!-- ��ѯ������ʾ����end -->
			<!--//������ʾ�б�-->
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
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="ȫѡ/ȡ��" />
	                            </th>
	                            <!--��ͷѭ����ʼ -->
								<!-- ������  账单结算ID-->   
								<th align="center" rowName="balanceId" orderName="balance_id:DESC" title='账单结算ID'>账单结算ID</th>
								<!-- ������  支付id-->   
								<th align="center" rowName="payId" orderName="pay_id:DESC" title='支付id'>支付id</th>
								<!-- ������  账单编号-->   
								<th align="center" rowName="billCode" orderName="bill_code:DESC" title='账单编号'>账单编号</th>
								<!-- ������  应缴费用（元�?-->   
								<th align="center" rowName="payMoney" orderName="pay_money:DESC" title='应缴费用（元�?'>应缴费用（元�?</th>
								<!-- ������  缴纳状�?�（0-待缴纳，1-已缴纳）-->   
								<th align="center" rowName="payState" orderName="pay_state:DESC" title='缴纳状�?�（0-待缴纳，1-已缴纳）'>缴纳状�?�（0-待缴纳，1-已缴纳）</th>
								<!-- ������  支付方式（weixin,alipay,bank�?-->   
								<th align="center" rowName="payWay" orderName="pay_way:DESC" title='支付方式（weixin,alipay,bank�?'>支付方式（weixin,alipay,bank�?</th>
								<!-- ������  支付用户id-->   
								<th align="center" rowName="payUserid" orderName="pay_userid:DESC" title='支付用户id'>支付用户id</th>
								<!-- ������  支付用户姓名-->   
								<th align="center" rowName="payUserName" orderName="pay_user_name:DESC" title='支付用户姓名'>支付用户姓名</th>
								<!-- ������  预支付时�?-->   
								<th align="center" rowName="prePayTime" orderName="pre_pay_time:DESC" title='预支付时�?'>预支付时�?</th>
								<!-- ������  完成支付时间-->   
								<th align="center" rowName="finishPayTime" orderName="finish_pay_time:DESC" title='完成支付时间'>完成支付时间</th>
								<!-- ������  业务订单�? = 父单�? = 物业缴费推给支付模块的业务单�?-->   
								<th align="center" rowName="businessOrderCode" orderName="business_order_code:DESC" title='业务订单�? = 父单�? = 物业缴费推给支付模块的业务单�?'>业务订单�? = 父单�? = 物业缴费推给支付模块的业务单�?</th>
								<!-- ������  billCode支付次序-->   
								<th align="center" rowName="paySeq" orderName="pay_seq:DESC" title='billCode支付次序'>billCode支付次序</th>
								<!-- ������  小区ID-->   
								<th align="center" rowName="communityId" orderName="community_id:DESC" title='小区ID'>小区ID</th>
								<!-- ������  NC收款单编�?-->   
								<th align="center" rowName="ncReceiptNum" orderName="nc_receipt_num:DESC" title='NC收款单编�?'>NC收款单编�?</th>
								<!-- ������  NC收款单入账金�?-->   
								<th align="center" rowName="ncReceiptMoney" orderName="nc_receipt_money:DESC" title='NC收款单入账金�?'>NC收款单入账金�?</th>
								<!-- ������  手续�?-->   
								<th align="center" rowName="rateFee" orderName="rate_fee:DESC" title='手续�?'>手续�?</th>
								<!-- ������  支付类型�?0:物业缴费�?1:密蜜预缴费）-->   
								<th align="center" rowName="payType" orderName="pay_type:DESC" title='支付类型�?0:物业缴费�?1:密蜜预缴费）'>支付类型�?0:物业缴费�?1:密蜜预缴费）</th>
								<!-- ������  第三方交易流水号-->   
								<th align="center" rowName="thirdPartTransactionId" orderName="third_part_transaction_id:DESC" title='第三方交易流水号'>第三方交易流水号</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
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
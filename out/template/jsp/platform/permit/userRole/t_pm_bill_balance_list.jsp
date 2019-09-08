<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBillBalance" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
	Page pg = (Page) request.getAttribute("Page");
	PageInfo pginfo = (PageInfo) request.getAttribute("PageInfo");
	Map attributeMap = pg.getAttributeMap();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<TITLE>锟斤拷锟斤拷��ѯ</TITLE>
	
	<!-- ����JS��CSS��ʽ-->
<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/artDialog/skins/default.css">
<script src="${contextPath}/skins/library/artDialog/jArtDialog.js"></script>
<script type="text/javascript" src="${contextPath}/skins/js/common/list_common_js.js"></script>
<!-- ����ʽ����������� -->
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">

<!-- ��ѯҳ������ checkbox����Ҫ���� -->
<link rel="stylesheet" type="text/css"	href="${contextPath}/skins/library/iCheck-master/skins/square/blue.css">
<script src="${contextPath}/skins/library/iCheck-master/icheck.js"></script>
<script type="text/javascript" src="${contextPath}/skins/js/common/scroll_common_js.js"></script>
	
	<script type="text/javascript">
		function deleteTPmBillBalance(PK) {
			jQuery.ajax({
				url : "TPmBillBalance.mc?method=deleteTPmBillBalance",
				type : "post",
				data : {PK:PK},
				success : function(result) {
					if (result > 0) {
						alert("ɾ���ɹ�");
						$("#start").val(0);
						$("#searchForm").submit();
					} else {
						alert("ɾ��ʧ��");
					}
				},
				error : function(result) {
					alert("ɾ��ʧ��");
				}
			});
		}
		
		function searchData(){
			$("#start").val(0);
			$("#searchForm").submit();
		}
		
		$(function(){
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
		/* */
			$('input:checkbox').iCheck({
				 checkboxClass: 'icheckbox_square-blue',
		         radioClass: 'iradio_square'
				});
		/**/
			 $('#selectall_checkbox').on('ifClicked',
		                function () {
		                    $('input:checkbox').iCheck('toggle');
		                });
		
			
		});
	</script>
</head>
<body>
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TPmBillBalance.mc?method=getAllPageTPmBillBalance" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
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

								<button type="button" onclick="javascript:searchData();" id="searchbtn"  class="btn btn-group-vertical">����</button>
							</div>
								
							</td>
						</tr>
						
					</table>
			</div>
			<!-- ��ѯ������ʾ����end --> 
			<!-- ������ʾ�б�start -->
	        <div id="tableData" style="position: relative;height: 480px;overflow: auto;">
				<div id="loading" style=" width:100%; height: 340px;position: absolute; top: 0; display:none;">
					<div style="background-color: ; position: absolute; top: 50%; left: 50%; margin: -33px 0 0 -33px;">
						<img src="skins/style/images/loading.gif" />
					</div>
				</div>
				<div class="tabelist">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-hover table-condensed">
	  					<thead>
	                    	<tr height="22" class="tab_title_bg">
	                        	<th align="center">
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="ȫѡ/ȡ��" />
	                            </th>
	                            <!--��ͷѭ����ʼ -->
								<!-- ������{账单结算ID}-->   
								<th align="center" rowName="balance_id" orderName="balance_id:DESC" title='账单结算ID'>账单结算ID</th>
								<!-- ������{支付id}-->   
								<th align="center" rowName="pay_id" orderName="pay_id:DESC" title='支付id'>支付id</th>
								<!-- ������{账单编号}-->   
								<th align="center" rowName="bill_code" orderName="bill_code:DESC" title='账单编号'>账单编号</th>
								<!-- ������{应缴费用（元�?}-->   
								<th align="center" rowName="pay_money" orderName="pay_money:DESC" title='应缴费用（元�?'>应缴费用（元�?</th>
								<!-- ������{缴纳状�?�（0-待缴纳，1-已缴纳）}-->   
								<th align="center" rowName="pay_state" orderName="pay_state:DESC" title='缴纳状�?�（0-待缴纳，1-已缴纳）'>缴纳状�?�（0-待缴纳，1-已缴纳）</th>
								<!-- ������{支付方式（weixin,alipay,bank�?}-->   
								<th align="center" rowName="pay_way" orderName="pay_way:DESC" title='支付方式（weixin,alipay,bank�?'>支付方式（weixin,alipay,bank�?</th>
								<!-- ������{支付用户id}-->   
								<th align="center" rowName="pay_userid" orderName="pay_userid:DESC" title='支付用户id'>支付用户id</th>
								<!-- ������{支付用户姓名}-->   
								<th align="center" rowName="pay_user_name" orderName="pay_user_name:DESC" title='支付用户姓名'>支付用户姓名</th>
								<!-- ������{预支付时�?}-->   
								<th align="center" rowName="pre_pay_time" orderName="pre_pay_time:DESC" title='预支付时�?'>预支付时�?</th>
								<!-- ������{完成支付时间}-->   
								<th align="center" rowName="finish_pay_time" orderName="finish_pay_time:DESC" title='完成支付时间'>完成支付时间</th>
								<!-- ������{业务订单�? = 父单�? = 物业缴费推给支付模块的业务单�?}-->   
								<th align="center" rowName="business_order_code" orderName="business_order_code:DESC" title='业务订单�? = 父单�? = 物业缴费推给支付模块的业务单�?'>业务订单�? = 父单�? = 物业缴费推给支付模块的业务单�?</th>
								<!-- ������{billCode支付次序}-->   
								<th align="center" rowName="pay_seq" orderName="pay_seq:DESC" title='billCode支付次序'>billCode支付次序</th>
								<!-- ������{小区ID}-->   
								<th align="center" rowName="community_id" orderName="community_id:DESC" title='小区ID'>小区ID</th>
								<!-- ������{NC收款单编�?}-->   
								<th align="center" rowName="nc_receipt_num" orderName="nc_receipt_num:DESC" title='NC收款单编�?'>NC收款单编�?</th>
								<!-- ������{NC收款单入账金�?}-->   
								<th align="center" rowName="nc_receipt_money" orderName="nc_receipt_money:DESC" title='NC收款单入账金�?'>NC收款单入账金�?</th>
								<!-- ������{手续�?}-->   
								<th align="center" rowName="rate_fee" orderName="rate_fee:DESC" title='手续�?'>手续�?</th>
								<!-- ������{支付类型�?0:物业缴费�?1:密蜜预缴费）}-->   
								<th align="center" rowName="pay_type" orderName="pay_type:DESC" title='支付类型�?0:物业缴费�?1:密蜜预缴费）'>支付类型�?0:物业缴费�?1:密蜜预缴费）</th>
								<!-- ������{第三方交易流水号}-->   
								<th align="center" rowName="third_part_transaction_id" orderName="third_part_transaction_id:DESC" title='第三方交易流水号'>第三方交易流水号</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							TPmBillBalance view = new TPmBillBalance();
								for (int i = 0; i < list.size(); i++) {
									view = (TPmBillBalance) list.get(i);
									if (i % 2 == 1) {
						%>
										<tr class="blue">
						<%
									} else {
						%>
										<tr>
						<%
									}
						%>
											<th align="center">
				                            	<input name="selectall_checkbox" type="checkbox" title="ȫѡ/ȡ��" />
				                            </th>
					
											<!-- ������{账单结算ID}-->   
											<td><%=view.getBalanceId()%></td>
											<!-- ������{支付id}-->   
											<td><%=view.getPayId()%></td>
											<!-- ������{账单编号}-->   
											<td><%=view.getBillCode()%></td>
											<!-- ������{应缴费用（元�?}-->   
											<td><%=view.getPayMoney()%></td>
											<!-- ������{缴纳状�?�（0-待缴纳，1-已缴纳）}-->   
											<td><%=view.getPayState()%></td>
											<!-- ������{支付方式（weixin,alipay,bank�?}-->   
											<td><%=view.getPayWay()%></td>
											<!-- ������{支付用户id}-->   
											<td><%=view.getPayUserid()%></td>
											<!-- ������{支付用户姓名}-->   
											<td><%=view.getPayUserName()%></td>
											<!-- ������{预支付时�?}-->   
											<td><%=view.getPrePayTime()%></td>
											<!-- ������{完成支付时间}-->   
											<td><%=view.getFinishPayTime()%></td>
											<!-- ������{业务订单�? = 父单�? = 物业缴费推给支付模块的业务单�?}-->   
											<td><%=view.getBusinessOrderCode()%></td>
											<!-- ������{billCode支付次序}-->   
											<td><%=view.getPaySeq()%></td>
											<!-- ������{小区ID}-->   
											<td><%=view.getCommunityId()%></td>
											<!-- ������{NC收款单编�?}-->   
											<td><%=view.getNcReceiptNum()%></td>
											<!-- ������{NC收款单入账金�?}-->   
											<td><%=view.getNcReceiptMoney()%></td>
											<!-- ������{手续�?}-->   
											<td><%=view.getRateFee()%></td>
											<!-- ������{支付类型�?0:物业缴费�?1:密蜜预缴费）}-->   
											<td><%=view.getPayType()%></td>
											<!-- ������{第三方交易流水号}-->   
											<td><%=view.getThirdPartTransactionId()%></td>

											<td>
												<a class="o-edit" href="TPmBillBalance.mc?method=editTPmBillBalance&balanceId,payId,billCode,payMoney,payState,payWay,payUserid,payUserName,prePayTime,finishPayTime,businessOrderCode,paySeq,communityId,ncReceiptNum,ncReceiptMoney,rateFee,payType,thirdPartTransactionId=<%= view.getBalanceId() +":"+  view.getPayId() +":"+  view.getBillCode() +":"+  view.getPayMoney() +":"+  view.getPayState() +":"+  view.getPayWay() +":"+  view.getPayUserid() +":"+  view.getPayUserName() +":"+  view.getPrePayTime() +":"+  view.getFinishPayTime() +":"+  view.getBusinessOrderCode() +":"+  view.getPaySeq() +":"+  view.getCommunityId() +":"+  view.getNcReceiptNum() +":"+  view.getNcReceiptMoney() +":"+  view.getRateFee() +":"+  view.getPayType() +":"+  view.getThirdPartTransactionId() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTPmBillBalance('<%= view.getBalanceId() +":"+  view.getPayId() +":"+  view.getBillCode() +":"+  view.getPayMoney() +":"+  view.getPayState() +":"+  view.getPayWay() +":"+  view.getPayUserid() +":"+  view.getPayUserName() +":"+  view.getPrePayTime() +":"+  view.getFinishPayTime() +":"+  view.getBusinessOrderCode() +":"+  view.getPaySeq() +":"+  view.getCommunityId() +":"+  view.getNcReceiptNum() +":"+  view.getNcReceiptMoney() +":"+  view.getRateFee() +":"+  view.getPayType() +":"+  view.getThirdPartTransactionId() %>')" title="ɾ��"></a>
											    <a class="o-view" href="TPmBillBalance.mc?method=detailTPmBillBalance&balanceId,payId,billCode,payMoney,payState,payWay,payUserid,payUserName,prePayTime,finishPayTime,businessOrderCode,paySeq,communityId,ncReceiptNum,ncReceiptMoney,rateFee,payType,thirdPartTransactionId=<%= view.getBalanceId() +":"+  view.getPayId() +":"+  view.getBillCode() +":"+  view.getPayMoney() +":"+  view.getPayState() +":"+  view.getPayWay() +":"+  view.getPayUserid() +":"+  view.getPayUserName() +":"+  view.getPrePayTime() +":"+  view.getFinishPayTime() +":"+  view.getBusinessOrderCode() +":"+  view.getPaySeq() +":"+  view.getCommunityId() +":"+  view.getNcReceiptNum() +":"+  view.getNcReceiptMoney() +":"+  view.getRateFee() +":"+  view.getPayType() +":"+  view.getThirdPartTransactionId() %>" title="����"></a> 
												
											</td>
										</tr>
						<%
							}
						%>
						</tbody>      
					</table>
					</div>
			    </div>
	              <div style="height:50px;position: fixed;bottom: 0px;right: 2px;background-color: #f9fbff;width: 100%;padding-right:17px;border-top:1px solid #e2e2e2;">
	    	         <jsp:include page="/jsp/platform/page.jsp" />
		          </div>

	</form>
</body>
</html>
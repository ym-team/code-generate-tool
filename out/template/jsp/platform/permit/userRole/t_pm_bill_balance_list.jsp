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
	<TITLE>閿熸枻鎷烽敓鏂ゆ嫹查询</TITLE>
	
	<!-- 导入JS和CSS样式-->
<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/artDialog/skins/default.css">
<script src="${contextPath}/skins/library/artDialog/jArtDialog.js"></script>
<script type="text/javascript" src="${contextPath}/skins/js/common/list_common_js.js"></script>
<!-- 新样式风格必须引入的 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">

<!-- 查询页面上有 checkbox的需要引入 -->
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
						alert("删除成功");
						$("#start").val(0);
						$("#searchForm").submit();
					} else {
						alert("删除失败");
					}
				},
				error : function(result) {
					alert("删除失败");
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
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_balance_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="balance_id" placeholder="璐﹀崟缁撶畻ID" value="${ param.balance_id }"/>
						    
						    	<input type='text' class="input-small" name="pay_id" placeholder="鏀粯id" value="${ param.pay_id }"/>
						    
						    	<input type='text' class="input-small" name="bill_code" placeholder="璐﹀崟缂栧彿" value="${ param.bill_code }"/>
						    
						    	<input type='text' class="input-small" name="pay_money" placeholder="搴旂即璐圭敤锛堝厓锛?" value="${ param.pay_money }"/>
						    
						    	<input type='text' class="input-small" name="pay_state" placeholder="缂寸撼鐘舵?侊紙0-寰呯即绾筹紝1-宸茬即绾筹級" value="${ param.pay_state }"/>
						    
						    	<input type='text' class="input-small" name="pay_way" placeholder="鏀粯鏂瑰紡锛坵eixin,alipay,bank锛?" value="${ param.pay_way }"/>
						    
						    	<input type='text' class="input-small" name="pay_userid" placeholder="鏀粯鐢ㄦ埛id" value="${ param.pay_userid }"/>
						    
						    	<input type='text' class="input-small" name="pay_user_name" placeholder="鏀粯鐢ㄦ埛濮撳悕" value="${ param.pay_user_name }"/>
						    
						    	<input type='text' class="input-small" name="pre_pay_time" placeholder="棰勬敮浠樻椂闂?" value="${ param.pre_pay_time }"/>
						    
						    	<input type='text' class="input-small" name="finish_pay_time" placeholder="瀹屾垚鏀粯鏃堕棿" value="${ param.finish_pay_time }"/>
						    
						    	<input type='text' class="input-small" name="business_order_code" placeholder="涓氬姟璁㈠崟鍙? = 鐖跺崟鍙? = 鐗╀笟缂磋垂鎺ㄧ粰鏀粯妯″潡鐨勪笟鍔″崟鍙?" value="${ param.business_order_code }"/>
						    
						    	<input type='text' class="input-small" name="pay_seq" placeholder="billCode鏀粯娆″簭" value="${ param.pay_seq }"/>
						    
						    	<input type='text' class="input-small" name="community_id" placeholder="灏忓尯ID" value="${ param.community_id }"/>
						    
						    	<input type='text' class="input-small" name="nc_receipt_num" placeholder="NC鏀舵鍗曠紪鍙?" value="${ param.nc_receipt_num }"/>
						    
						    	<input type='text' class="input-small" name="nc_receipt_money" placeholder="NC鏀舵鍗曞叆璐﹂噾棰?" value="${ param.nc_receipt_money }"/>
						    
						    	<input type='text' class="input-small" name="rate_fee" placeholder="鎵嬬画璐?" value="${ param.rate_fee }"/>
						    
						    	<input type='text' class="input-small" name="pay_type" placeholder="鏀粯绫诲瀷锛?0:鐗╀笟缂磋垂锛?1:瀵嗚湝棰勭即璐癸級" value="${ param.pay_type }"/>
						    
						    	<input type='text' class="input-small" name="third_part_transaction_id" placeholder="绗笁鏂逛氦鏄撴祦姘村彿" value="${ param.third_part_transaction_id }"/>

								<button type="button" onclick="javascript:searchData();" id="searchbtn"  class="btn btn-group-vertical">搜索</button>
							</div>
								
							</td>
						</tr>
						
					</table>
			</div>
			<!-- 查询条件显示区域end --> 
			<!-- 数据显示列表start -->
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
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="全选/取消" />
	                            </th>
	                            <!--表头循环开始 -->
								<!-- 主键列{璐﹀崟缁撶畻ID}-->   
								<th align="center" rowName="balance_id" orderName="balance_id:DESC" title='璐﹀崟缁撶畻ID'>璐﹀崟缁撶畻ID</th>
								<!-- 主键列{鏀粯id}-->   
								<th align="center" rowName="pay_id" orderName="pay_id:DESC" title='鏀粯id'>鏀粯id</th>
								<!-- 主键列{璐﹀崟缂栧彿}-->   
								<th align="center" rowName="bill_code" orderName="bill_code:DESC" title='璐﹀崟缂栧彿'>璐﹀崟缂栧彿</th>
								<!-- 主键列{搴旂即璐圭敤锛堝厓锛?}-->   
								<th align="center" rowName="pay_money" orderName="pay_money:DESC" title='搴旂即璐圭敤锛堝厓锛?'>搴旂即璐圭敤锛堝厓锛?</th>
								<!-- 主键列{缂寸撼鐘舵?侊紙0-寰呯即绾筹紝1-宸茬即绾筹級}-->   
								<th align="center" rowName="pay_state" orderName="pay_state:DESC" title='缂寸撼鐘舵?侊紙0-寰呯即绾筹紝1-宸茬即绾筹級'>缂寸撼鐘舵?侊紙0-寰呯即绾筹紝1-宸茬即绾筹級</th>
								<!-- 主键列{鏀粯鏂瑰紡锛坵eixin,alipay,bank锛?}-->   
								<th align="center" rowName="pay_way" orderName="pay_way:DESC" title='鏀粯鏂瑰紡锛坵eixin,alipay,bank锛?'>鏀粯鏂瑰紡锛坵eixin,alipay,bank锛?</th>
								<!-- 主键列{鏀粯鐢ㄦ埛id}-->   
								<th align="center" rowName="pay_userid" orderName="pay_userid:DESC" title='鏀粯鐢ㄦ埛id'>鏀粯鐢ㄦ埛id</th>
								<!-- 主键列{鏀粯鐢ㄦ埛濮撳悕}-->   
								<th align="center" rowName="pay_user_name" orderName="pay_user_name:DESC" title='鏀粯鐢ㄦ埛濮撳悕'>鏀粯鐢ㄦ埛濮撳悕</th>
								<!-- 主键列{棰勬敮浠樻椂闂?}-->   
								<th align="center" rowName="pre_pay_time" orderName="pre_pay_time:DESC" title='棰勬敮浠樻椂闂?'>棰勬敮浠樻椂闂?</th>
								<!-- 主键列{瀹屾垚鏀粯鏃堕棿}-->   
								<th align="center" rowName="finish_pay_time" orderName="finish_pay_time:DESC" title='瀹屾垚鏀粯鏃堕棿'>瀹屾垚鏀粯鏃堕棿</th>
								<!-- 主键列{涓氬姟璁㈠崟鍙? = 鐖跺崟鍙? = 鐗╀笟缂磋垂鎺ㄧ粰鏀粯妯″潡鐨勪笟鍔″崟鍙?}-->   
								<th align="center" rowName="business_order_code" orderName="business_order_code:DESC" title='涓氬姟璁㈠崟鍙? = 鐖跺崟鍙? = 鐗╀笟缂磋垂鎺ㄧ粰鏀粯妯″潡鐨勪笟鍔″崟鍙?'>涓氬姟璁㈠崟鍙? = 鐖跺崟鍙? = 鐗╀笟缂磋垂鎺ㄧ粰鏀粯妯″潡鐨勪笟鍔″崟鍙?</th>
								<!-- 主键列{billCode鏀粯娆″簭}-->   
								<th align="center" rowName="pay_seq" orderName="pay_seq:DESC" title='billCode鏀粯娆″簭'>billCode鏀粯娆″簭</th>
								<!-- 主键列{灏忓尯ID}-->   
								<th align="center" rowName="community_id" orderName="community_id:DESC" title='灏忓尯ID'>灏忓尯ID</th>
								<!-- 主键列{NC鏀舵鍗曠紪鍙?}-->   
								<th align="center" rowName="nc_receipt_num" orderName="nc_receipt_num:DESC" title='NC鏀舵鍗曠紪鍙?'>NC鏀舵鍗曠紪鍙?</th>
								<!-- 主键列{NC鏀舵鍗曞叆璐﹂噾棰?}-->   
								<th align="center" rowName="nc_receipt_money" orderName="nc_receipt_money:DESC" title='NC鏀舵鍗曞叆璐﹂噾棰?'>NC鏀舵鍗曞叆璐﹂噾棰?</th>
								<!-- 主键列{鎵嬬画璐?}-->   
								<th align="center" rowName="rate_fee" orderName="rate_fee:DESC" title='鎵嬬画璐?'>鎵嬬画璐?</th>
								<!-- 主键列{鏀粯绫诲瀷锛?0:鐗╀笟缂磋垂锛?1:瀵嗚湝棰勭即璐癸級}-->   
								<th align="center" rowName="pay_type" orderName="pay_type:DESC" title='鏀粯绫诲瀷锛?0:鐗╀笟缂磋垂锛?1:瀵嗚湝棰勭即璐癸級'>鏀粯绫诲瀷锛?0:鐗╀笟缂磋垂锛?1:瀵嗚湝棰勭即璐癸級</th>
								<!-- 主键列{绗笁鏂逛氦鏄撴祦姘村彿}-->   
								<th align="center" rowName="third_part_transaction_id" orderName="third_part_transaction_id:DESC" title='绗笁鏂逛氦鏄撴祦姘村彿'>绗笁鏂逛氦鏄撴祦姘村彿</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
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
				                            	<input name="selectall_checkbox" type="checkbox" title="全选/取消" />
				                            </th>
					
											<!-- 主键列{璐﹀崟缁撶畻ID}-->   
											<td><%=view.getBalanceId()%></td>
											<!-- 主键列{鏀粯id}-->   
											<td><%=view.getPayId()%></td>
											<!-- 主键列{璐﹀崟缂栧彿}-->   
											<td><%=view.getBillCode()%></td>
											<!-- 主键列{搴旂即璐圭敤锛堝厓锛?}-->   
											<td><%=view.getPayMoney()%></td>
											<!-- 主键列{缂寸撼鐘舵?侊紙0-寰呯即绾筹紝1-宸茬即绾筹級}-->   
											<td><%=view.getPayState()%></td>
											<!-- 主键列{鏀粯鏂瑰紡锛坵eixin,alipay,bank锛?}-->   
											<td><%=view.getPayWay()%></td>
											<!-- 主键列{鏀粯鐢ㄦ埛id}-->   
											<td><%=view.getPayUserid()%></td>
											<!-- 主键列{鏀粯鐢ㄦ埛濮撳悕}-->   
											<td><%=view.getPayUserName()%></td>
											<!-- 主键列{棰勬敮浠樻椂闂?}-->   
											<td><%=view.getPrePayTime()%></td>
											<!-- 主键列{瀹屾垚鏀粯鏃堕棿}-->   
											<td><%=view.getFinishPayTime()%></td>
											<!-- 主键列{涓氬姟璁㈠崟鍙? = 鐖跺崟鍙? = 鐗╀笟缂磋垂鎺ㄧ粰鏀粯妯″潡鐨勪笟鍔″崟鍙?}-->   
											<td><%=view.getBusinessOrderCode()%></td>
											<!-- 主键列{billCode鏀粯娆″簭}-->   
											<td><%=view.getPaySeq()%></td>
											<!-- 主键列{灏忓尯ID}-->   
											<td><%=view.getCommunityId()%></td>
											<!-- 主键列{NC鏀舵鍗曠紪鍙?}-->   
											<td><%=view.getNcReceiptNum()%></td>
											<!-- 主键列{NC鏀舵鍗曞叆璐﹂噾棰?}-->   
											<td><%=view.getNcReceiptMoney()%></td>
											<!-- 主键列{鎵嬬画璐?}-->   
											<td><%=view.getRateFee()%></td>
											<!-- 主键列{鏀粯绫诲瀷锛?0:鐗╀笟缂磋垂锛?1:瀵嗚湝棰勭即璐癸級}-->   
											<td><%=view.getPayType()%></td>
											<!-- 主键列{绗笁鏂逛氦鏄撴祦姘村彿}-->   
											<td><%=view.getThirdPartTransactionId()%></td>

											<td>
												<a class="o-edit" href="TPmBillBalance.mc?method=editTPmBillBalance&balanceId,payId,billCode,payMoney,payState,payWay,payUserid,payUserName,prePayTime,finishPayTime,businessOrderCode,paySeq,communityId,ncReceiptNum,ncReceiptMoney,rateFee,payType,thirdPartTransactionId=<%= view.getBalanceId() +":"+  view.getPayId() +":"+  view.getBillCode() +":"+  view.getPayMoney() +":"+  view.getPayState() +":"+  view.getPayWay() +":"+  view.getPayUserid() +":"+  view.getPayUserName() +":"+  view.getPrePayTime() +":"+  view.getFinishPayTime() +":"+  view.getBusinessOrderCode() +":"+  view.getPaySeq() +":"+  view.getCommunityId() +":"+  view.getNcReceiptNum() +":"+  view.getNcReceiptMoney() +":"+  view.getRateFee() +":"+  view.getPayType() +":"+  view.getThirdPartTransactionId() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTPmBillBalance('<%= view.getBalanceId() +":"+  view.getPayId() +":"+  view.getBillCode() +":"+  view.getPayMoney() +":"+  view.getPayState() +":"+  view.getPayWay() +":"+  view.getPayUserid() +":"+  view.getPayUserName() +":"+  view.getPrePayTime() +":"+  view.getFinishPayTime() +":"+  view.getBusinessOrderCode() +":"+  view.getPaySeq() +":"+  view.getCommunityId() +":"+  view.getNcReceiptNum() +":"+  view.getNcReceiptMoney() +":"+  view.getRateFee() +":"+  view.getPayType() +":"+  view.getThirdPartTransactionId() %>')" title="删除"></a>
											    <a class="o-view" href="TPmBillBalance.mc?method=detailTPmBillBalance&balanceId,payId,billCode,payMoney,payState,payWay,payUserid,payUserName,prePayTime,finishPayTime,businessOrderCode,paySeq,communityId,ncReceiptNum,ncReceiptMoney,rateFee,payType,thirdPartTransactionId=<%= view.getBalanceId() +":"+  view.getPayId() +":"+  view.getBillCode() +":"+  view.getPayMoney() +":"+  view.getPayState() +":"+  view.getPayWay() +":"+  view.getPayUserid() +":"+  view.getPayUserName() +":"+  view.getPrePayTime() +":"+  view.getFinishPayTime() +":"+  view.getBusinessOrderCode() +":"+  view.getPaySeq() +":"+  view.getCommunityId() +":"+  view.getNcReceiptNum() +":"+  view.getNcReceiptMoney() +":"+  view.getRateFee() +":"+  view.getPayType() +":"+  view.getThirdPartTransactionId() %>" title="详情"></a> 
												
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
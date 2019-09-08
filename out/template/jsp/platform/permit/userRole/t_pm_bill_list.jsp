<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBill" %>
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
	<TITLE>璐﹀崟琛?查询</TITLE>
	
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
		function deleteTPmBill(PK) {
			jQuery.ajax({
				url : "TPmBill.mc?method=deleteTPmBill",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TPmBill.mc?method=getAllPageTPmBill" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="bill_id" placeholder="璐﹀崟ID" value="${ param.bill_id }"/>
						    
						    	<input type='text' class="input-small" name="type_code" placeholder="璐﹀崟缂栧彿" value="${ param.type_code }"/>
						    
						    	<input type='text' class="input-small" name="community_id" placeholder="灏忓尯id" value="${ param.community_id }"/>
						    
						    	<input type='text' class="input-small" name="house_id" placeholder="鎴块棿ID" value="${ param.house_id }"/>
						    
						    	<input type='text' class="input-small" name="money" placeholder="搴旂即璐圭敤锛堝厓锛?" value="${ param.money }"/>
						    
						    	<input type='text' class="input-small" name="rev_money" placeholder="宸叉敹閲戦锛堝厓锛?" value="${ param.rev_money }"/>
						    
						    	<input type='text' class="input-small" name="pend_money" placeholder="寰呯即閲戦锛堝厓锛?" value="${ param.pend_money }"/>
						    
						    	<input type='text' class="input-small" name="overdue_money" placeholder="搴旂即婊炵撼閲戯紙鍏冿級" value="${ param.overdue_money }"/>
						    
						    	<input type='text' class="input-small" name="overdue_rev_money" placeholder="宸叉敹婊炵撼閲戯紙鍏冿級" value="${ param.overdue_rev_money }"/>
						    
						    	<input type='text' class="input-small" name="overdue_pend_money" placeholder="寰呯即婊炵撼閲戯紙鍏冿級" value="${ param.overdue_pend_money }"/>
						    
						    	<input type='text' class="input-small" name="nc_pay_money" placeholder="绾夸笅鏀粯鎬婚" value="${ param.nc_pay_money }"/>
						    
						    	<input type='text' class="input-small" name="pay_state" placeholder="缂寸撼鐘舵??" value="${ param.pay_state }"/>
						    
						    	<input type='text' class="input-small" name="year" placeholder="骞?" value="${ param.year }"/>
						    
						    	<input type='text' class="input-small" name="month" placeholder="鏈?" value="${ param.month }"/>
						    
						    	<input type='text' class="input-small" name="bank_bill_flag" placeholder="閾惰鍒掓墸鏍囪瘑" value="${ param.bank_bill_flag }"/>
						    
						    	<input type='text' class="input-small" name="company_id" placeholder="鐗╀笟鍏徃涓婚敭" value="${ param.company_id }"/>
						    
						    	<input type='text' class="input-small" name="nc_bill_id" placeholder="" value="${ param.nc_bill_id }"/>
						    
						    	<input type='text' class="input-small" name="nc_house_id" placeholder="鎴夸骇涓婚敭" value="${ param.nc_house_id }"/>
						    
						    	<input type='text' class="input-small" name="nc_manage_id" placeholder="绠＄悊澶勪富閿?" value="${ param.nc_manage_id }"/>
						    
						    	<input type='text' class="input-small" name="is_delete" placeholder="鏄惁鍒犻櫎" value="${ param.is_delete }"/>
						    
						    	<input type='text' class="input-small" name="bill_code" placeholder="璐﹀崟缂栧彿" value="${ param.bill_code }"/>
						    
						    	<input type='text' class="input-small" name="nc_ts" placeholder="" value="${ param.nc_ts }"/>
						    
						    	<input type='text' class="input-small" name="nc_pk_revfare" placeholder="" value="${ param.nc_pk_revfare }"/>
						    
						    	<input type='text' class="input-small" name="join_time" placeholder="鍚屾鏃堕棿" value="${ param.join_time }"/>
						    
						    	<input type='text' class="input-small" name="settlement_status" placeholder="缁撶畻鐘舵?侊紙0锛氭湭缁撶畻锛?1锛氱粨绠椾腑锛?2锛氬凡缁撶畻锛?9锛氶攣瀹氫腑锛?10锛氱瓑寰呯粨绠楋級" value="${ param.settlement_status }"/>

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
								<!-- 主键列{璐﹀崟ID}-->   
								<th align="center" rowName="bill_id" orderName="bill_id:DESC" title='璐﹀崟ID'>璐﹀崟ID</th>
								<!-- 主键列{璐﹀崟缂栧彿}-->   
								<th align="center" rowName="type_code" orderName="type_code:DESC" title='璐﹀崟缂栧彿'>璐﹀崟缂栧彿</th>
								<!-- 主键列{灏忓尯id}-->   
								<th align="center" rowName="community_id" orderName="community_id:DESC" title='灏忓尯id'>灏忓尯id</th>
								<!-- 主键列{鎴块棿ID}-->   
								<th align="center" rowName="house_id" orderName="house_id:DESC" title='鎴块棿ID'>鎴块棿ID</th>
								<!-- 主键列{搴旂即璐圭敤锛堝厓锛?}-->   
								<th align="center" rowName="money" orderName="money:DESC" title='搴旂即璐圭敤锛堝厓锛?'>搴旂即璐圭敤锛堝厓锛?</th>
								<!-- 主键列{宸叉敹閲戦锛堝厓锛?}-->   
								<th align="center" rowName="rev_money" orderName="rev_money:DESC" title='宸叉敹閲戦锛堝厓锛?'>宸叉敹閲戦锛堝厓锛?</th>
								<!-- 主键列{寰呯即閲戦锛堝厓锛?}-->   
								<th align="center" rowName="pend_money" orderName="pend_money:DESC" title='寰呯即閲戦锛堝厓锛?'>寰呯即閲戦锛堝厓锛?</th>
								<!-- 主键列{搴旂即婊炵撼閲戯紙鍏冿級}-->   
								<th align="center" rowName="overdue_money" orderName="overdue_money:DESC" title='搴旂即婊炵撼閲戯紙鍏冿級'>搴旂即婊炵撼閲戯紙鍏冿級</th>
								<!-- 主键列{宸叉敹婊炵撼閲戯紙鍏冿級}-->   
								<th align="center" rowName="overdue_rev_money" orderName="overdue_rev_money:DESC" title='宸叉敹婊炵撼閲戯紙鍏冿級'>宸叉敹婊炵撼閲戯紙鍏冿級</th>
								<!-- 主键列{寰呯即婊炵撼閲戯紙鍏冿級}-->   
								<th align="center" rowName="overdue_pend_money" orderName="overdue_pend_money:DESC" title='寰呯即婊炵撼閲戯紙鍏冿級'>寰呯即婊炵撼閲戯紙鍏冿級</th>
								<!-- 主键列{绾夸笅鏀粯鎬婚}-->   
								<th align="center" rowName="nc_pay_money" orderName="nc_pay_money:DESC" title='绾夸笅鏀粯鎬婚'>绾夸笅鏀粯鎬婚</th>
								<!-- 主键列{缂寸撼鐘舵??}-->   
								<th align="center" rowName="pay_state" orderName="pay_state:DESC" title='缂寸撼鐘舵??'>缂寸撼鐘舵??</th>
								<!-- 主键列{骞?}-->   
								<th align="center" rowName="year" orderName="year:DESC" title='骞?'>骞?</th>
								<!-- 主键列{鏈?}-->   
								<th align="center" rowName="month" orderName="month:DESC" title='鏈?'>鏈?</th>
								<!-- 主键列{閾惰鍒掓墸鏍囪瘑}-->   
								<th align="center" rowName="bank_bill_flag" orderName="bank_bill_flag:DESC" title='閾惰鍒掓墸鏍囪瘑'>閾惰鍒掓墸鏍囪瘑</th>
								<!-- 主键列{鐗╀笟鍏徃涓婚敭}-->   
								<th align="center" rowName="company_id" orderName="company_id:DESC" title='鐗╀笟鍏徃涓婚敭'>鐗╀笟鍏徃涓婚敭</th>
								<!-- 主键列{}-->   
								<th align="center" rowName="nc_bill_id" orderName="nc_bill_id:DESC" title=''></th>
								<!-- 主键列{鎴夸骇涓婚敭}-->   
								<th align="center" rowName="nc_house_id" orderName="nc_house_id:DESC" title='鎴夸骇涓婚敭'>鎴夸骇涓婚敭</th>
								<!-- 主键列{绠＄悊澶勪富閿?}-->   
								<th align="center" rowName="nc_manage_id" orderName="nc_manage_id:DESC" title='绠＄悊澶勪富閿?'>绠＄悊澶勪富閿?</th>
								<!-- 主键列{鏄惁鍒犻櫎}-->   
								<th align="center" rowName="is_delete" orderName="is_delete:DESC" title='鏄惁鍒犻櫎'>鏄惁鍒犻櫎</th>
								<!-- 主键列{璐﹀崟缂栧彿}-->   
								<th align="center" rowName="bill_code" orderName="bill_code:DESC" title='璐﹀崟缂栧彿'>璐﹀崟缂栧彿</th>
								<!-- 主键列{}-->   
								<th align="center" rowName="nc_ts" orderName="nc_ts:DESC" title=''></th>
								<!-- 主键列{}-->   
								<th align="center" rowName="nc_pk_revfare" orderName="nc_pk_revfare:DESC" title=''></th>
								<!-- 主键列{鍚屾鏃堕棿}-->   
								<th align="center" rowName="join_time" orderName="join_time:DESC" title='鍚屾鏃堕棿'>鍚屾鏃堕棿</th>
								<!-- 主键列{缁撶畻鐘舵?侊紙0锛氭湭缁撶畻锛?1锛氱粨绠椾腑锛?2锛氬凡缁撶畻锛?9锛氶攣瀹氫腑锛?10锛氱瓑寰呯粨绠楋級}-->   
								<th align="center" rowName="settlement_status" orderName="settlement_status:DESC" title='缁撶畻鐘舵?侊紙0锛氭湭缁撶畻锛?1锛氱粨绠椾腑锛?2锛氬凡缁撶畻锛?9锛氶攣瀹氫腑锛?10锛氱瓑寰呯粨绠楋級'>缁撶畻鐘舵?侊紙0锛氭湭缁撶畻锛?1锛氱粨绠椾腑锛?2锛氬凡缁撶畻锛?9锛氶攣瀹氫腑锛?10锛氱瓑寰呯粨绠楋級</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							TPmBill view = new TPmBill();
								for (int i = 0; i < list.size(); i++) {
									view = (TPmBill) list.get(i);
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
					
											<!-- 主键列{璐﹀崟ID}-->   
											<td><%=view.getBillId()%></td>
											<!-- 主键列{璐﹀崟缂栧彿}-->   
											<td><%=view.getTypeCode()%></td>
											<!-- 主键列{灏忓尯id}-->   
											<td><%=view.getCommunityId()%></td>
											<!-- 主键列{鎴块棿ID}-->   
											<td><%=view.getHouseId()%></td>
											<!-- 主键列{搴旂即璐圭敤锛堝厓锛?}-->   
											<td><%=view.getMoney()%></td>
											<!-- 主键列{宸叉敹閲戦锛堝厓锛?}-->   
											<td><%=view.getRevMoney()%></td>
											<!-- 主键列{寰呯即閲戦锛堝厓锛?}-->   
											<td><%=view.getPendMoney()%></td>
											<!-- 主键列{搴旂即婊炵撼閲戯紙鍏冿級}-->   
											<td><%=view.getOverdueMoney()%></td>
											<!-- 主键列{宸叉敹婊炵撼閲戯紙鍏冿級}-->   
											<td><%=view.getOverdueRevMoney()%></td>
											<!-- 主键列{寰呯即婊炵撼閲戯紙鍏冿級}-->   
											<td><%=view.getOverduePendMoney()%></td>
											<!-- 主键列{绾夸笅鏀粯鎬婚}-->   
											<td><%=view.getNcPayMoney()%></td>
											<!-- 主键列{缂寸撼鐘舵??}-->   
											<td><%=view.getPayState()%></td>
											<!-- 主键列{骞?}-->   
											<td><%=view.getYear()%></td>
											<!-- 主键列{鏈?}-->   
											<td><%=view.getMonth()%></td>
											<!-- 主键列{閾惰鍒掓墸鏍囪瘑}-->   
											<td><%=view.getBankBillFlag()%></td>
											<!-- 主键列{鐗╀笟鍏徃涓婚敭}-->   
											<td><%=view.getCompanyId()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getNcBillId()%></td>
											<!-- 主键列{鎴夸骇涓婚敭}-->   
											<td><%=view.getNcHouseId()%></td>
											<!-- 主键列{绠＄悊澶勪富閿?}-->   
											<td><%=view.getNcManageId()%></td>
											<!-- 主键列{鏄惁鍒犻櫎}-->   
											<td><%=view.getIsDelete()%></td>
											<!-- 主键列{璐﹀崟缂栧彿}-->   
											<td><%=view.getBillCode()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getNcTs()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getNcPkRevfare()%></td>
											<!-- 主键列{鍚屾鏃堕棿}-->   
											<td><%=view.getJoinTime()%></td>
											<!-- 主键列{缁撶畻鐘舵?侊紙0锛氭湭缁撶畻锛?1锛氱粨绠椾腑锛?2锛氬凡缁撶畻锛?9锛氶攣瀹氫腑锛?10锛氱瓑寰呯粨绠楋級}-->   
											<td><%=view.getSettlementStatus()%></td>

											<td>
												<a class="o-edit" href="TPmBill.mc?method=editTPmBill&billId,typeCode,communityId,houseId,money,revMoney,pendMoney,overdueMoney,overdueRevMoney,overduePendMoney,ncPayMoney,payState,year,month,bankBillFlag,companyId,ncBillId,ncHouseId,ncManageId,isDelete,billCode,ncTs,ncPkRevfare,joinTime,settlementStatus=<%= view.getBillId() +":"+  view.getTypeCode() +":"+  view.getCommunityId() +":"+  view.getHouseId() +":"+  view.getMoney() +":"+  view.getRevMoney() +":"+  view.getPendMoney() +":"+  view.getOverdueMoney() +":"+  view.getOverdueRevMoney() +":"+  view.getOverduePendMoney() +":"+  view.getNcPayMoney() +":"+  view.getPayState() +":"+  view.getYear() +":"+  view.getMonth() +":"+  view.getBankBillFlag() +":"+  view.getCompanyId() +":"+  view.getNcBillId() +":"+  view.getNcHouseId() +":"+  view.getNcManageId() +":"+  view.getIsDelete() +":"+  view.getBillCode() +":"+  view.getNcTs() +":"+  view.getNcPkRevfare() +":"+  view.getJoinTime() +":"+  view.getSettlementStatus() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTPmBill('<%= view.getBillId() +":"+  view.getTypeCode() +":"+  view.getCommunityId() +":"+  view.getHouseId() +":"+  view.getMoney() +":"+  view.getRevMoney() +":"+  view.getPendMoney() +":"+  view.getOverdueMoney() +":"+  view.getOverdueRevMoney() +":"+  view.getOverduePendMoney() +":"+  view.getNcPayMoney() +":"+  view.getPayState() +":"+  view.getYear() +":"+  view.getMonth() +":"+  view.getBankBillFlag() +":"+  view.getCompanyId() +":"+  view.getNcBillId() +":"+  view.getNcHouseId() +":"+  view.getNcManageId() +":"+  view.getIsDelete() +":"+  view.getBillCode() +":"+  view.getNcTs() +":"+  view.getNcPkRevfare() +":"+  view.getJoinTime() +":"+  view.getSettlementStatus() %>')" title="删除"></a>
											    <a class="o-view" href="TPmBill.mc?method=detailTPmBill&billId,typeCode,communityId,houseId,money,revMoney,pendMoney,overdueMoney,overdueRevMoney,overduePendMoney,ncPayMoney,payState,year,month,bankBillFlag,companyId,ncBillId,ncHouseId,ncManageId,isDelete,billCode,ncTs,ncPkRevfare,joinTime,settlementStatus=<%= view.getBillId() +":"+  view.getTypeCode() +":"+  view.getCommunityId() +":"+  view.getHouseId() +":"+  view.getMoney() +":"+  view.getRevMoney() +":"+  view.getPendMoney() +":"+  view.getOverdueMoney() +":"+  view.getOverdueRevMoney() +":"+  view.getOverduePendMoney() +":"+  view.getNcPayMoney() +":"+  view.getPayState() +":"+  view.getYear() +":"+  view.getMonth() +":"+  view.getBankBillFlag() +":"+  view.getCompanyId() +":"+  view.getNcBillId() +":"+  view.getNcHouseId() +":"+  view.getNcManageId() +":"+  view.getIsDelete() +":"+  view.getBillCode() +":"+  view.getNcTs() +":"+  view.getNcPkRevfare() +":"+  view.getJoinTime() +":"+  view.getSettlementStatus() %>" title="详情"></a> 
												
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBillJoinNc" %>
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
		function deleteTPmBillJoinNc(PK) {
			jQuery.ajax({
				url : "TPmBillJoinNc.mc?method=deleteTPmBillJoinNc",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TPmBillJoinNc.mc?method=getAllPageTPmBillJoinNc" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_join_nc_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="join_id" placeholder="账单结算ID" value="${ param.join_id }"/>
						    
						    	<input type='text' class="input-small" name="balance_id" placeholder="账单结算ID" value="${ param.balance_id }"/>
						    
						    	<input type='text' class="input-small" name="bill_code" placeholder="账单编号" value="${ param.bill_code }"/>
						    
						    	<input type='text' class="input-small" name="type_code" placeholder="账单类型编码" value="${ param.type_code }"/>
						    
						    	<input type='text' class="input-small" name="nrevmny" placeholder="缴费金额（元�?" value="${ param.nrevmny }"/>
						    
						    	<input type='text' class="input-small" name="nrevlfmny" placeholder="滞纳金（元）" value="${ param.nrevlfmny }"/>
						    
						    	<input type='text' class="input-small" name="pay_time" placeholder="支付时间" value="${ param.pay_time }"/>
						    
						    	<input type='text' class="input-small" name="company_account" placeholder="物业公司的资金账�?" value="${ param.company_account }"/>
						    
						    	<input type='text' class="input-small" name="nc_bill_id" placeholder="nc_bill_id" value="${ param.nc_bill_id }"/>
						    
						    	<input type='text' class="input-small" name="nc_company_id" placeholder="NC物业公司主键" value="${ param.nc_company_id }"/>
						    
						    	<input type='text' class="input-small" name="nc_manage_id" placeholder="管理处主�?" value="${ param.nc_manage_id }"/>
						    
						    	<input type='text' class="input-small" name="join_status" placeholder="缴纳状�?�（0-待同步，1-成功�?2-失败�?" value="${ param.join_status }"/>
						    
						    	<input type='text' class="input-small" name="join_time" placeholder="同步NC时间" value="${ param.join_time }"/>
						    
						    	<input type='text' class="input-small" name="nc_ts" placeholder="" value="${ param.nc_ts }"/>
						    
						    	<input type='text' class="input-small" name="nc_return_status" placeholder="同步NC失败后，NC返回的�??(0：未同步�? 1：执行错误； 2：未授权(安全�?验不通过)�? 3：服务已停止(不提供服�?)�? 4：费用在NC端发生变化； 5：传入的费用更新、查询参数有误； 6：NC端查询错�? �? 7：重复缴�?)�? 8：NC服务维护中；99：密蜜传入NC参数有误�?" value="${ param.nc_return_status }"/>
						    
						    	<input type='text' class="input-small" name="nc_return_message" placeholder="同步NC失败后，NC返回的失败描述信�?" value="${ param.nc_return_message }"/>
						    
						    	<input type='text' class="input-small" name="refund_user_id" placeholder="�?款人id" value="${ param.refund_user_id }"/>
						    
						    	<input type='text' class="input-small" name="refund_time" placeholder="�?款时�?" value="${ param.refund_time }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="记录添加时间" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="db_create_time" placeholder="创建时间" value="${ param.db_create_time }"/>
						    
						    	<input type='text' class="input-small" name="db_update_time" placeholder="更新时间" value="${ param.db_update_time }"/>
						    
						    	<input type='text' class="input-small" name="refund_status" placeholder="重复缴费，�??款状态（0:默认值；1:�?款中；已�?款）" value="${ param.refund_status }"/>
						    
						    	<input type='text' class="input-small" name="community_id" placeholder="小区ID" value="${ param.community_id }"/>
						    
						    	<input type='text' class="input-small" name="house_id" placeholder="房产ID" value="${ param.house_id }"/>
						    
						    	<input type='text' class="input-small" name="year" placeholder="账单年份" value="${ param.year }"/>
						    
						    	<input type='text' class="input-small" name="month" placeholder="账单月份" value="${ param.month }"/>
						    
						    	<input type='text' class="input-small" name="processing_status" placeholder="异常单处理状�?(0-未处�?,1-已处�?,2-人工�?款中,3-已确认�??�?,4-已确认转预存)" value="${ param.processing_status }"/>
						    
						    	<input type='text' class="input-small" name="unit_id" placeholder="单元ID" value="${ param.unit_id }"/>

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
								<th align="center" rowName="join_id" orderName="join_id:DESC" title='账单结算ID'>账单结算ID</th>
								<!-- ������{账单结算ID}-->   
								<th align="center" rowName="balance_id" orderName="balance_id:DESC" title='账单结算ID'>账单结算ID</th>
								<!-- ������{账单编号}-->   
								<th align="center" rowName="bill_code" orderName="bill_code:DESC" title='账单编号'>账单编号</th>
								<!-- ������{账单类型编码}-->   
								<th align="center" rowName="type_code" orderName="type_code:DESC" title='账单类型编码'>账单类型编码</th>
								<!-- ������{缴费金额（元�?}-->   
								<th align="center" rowName="nrevmny" orderName="nrevmny:DESC" title='缴费金额（元�?'>缴费金额（元�?</th>
								<!-- ������{滞纳金（元）}-->   
								<th align="center" rowName="nrevlfmny" orderName="nrevlfmny:DESC" title='滞纳金（元）'>滞纳金（元）</th>
								<!-- ������{支付时间}-->   
								<th align="center" rowName="pay_time" orderName="pay_time:DESC" title='支付时间'>支付时间</th>
								<!-- ������{物业公司的资金账�?}-->   
								<th align="center" rowName="company_account" orderName="company_account:DESC" title='物业公司的资金账�?'>物业公司的资金账�?</th>
								<!-- ������{nc_bill_id}-->   
								<th align="center" rowName="nc_bill_id" orderName="nc_bill_id:DESC" title='nc_bill_id'>nc_bill_id</th>
								<!-- ������{NC物业公司主键}-->   
								<th align="center" rowName="nc_company_id" orderName="nc_company_id:DESC" title='NC物业公司主键'>NC物业公司主键</th>
								<!-- ������{管理处主�?}-->   
								<th align="center" rowName="nc_manage_id" orderName="nc_manage_id:DESC" title='管理处主�?'>管理处主�?</th>
								<!-- ������{缴纳状�?�（0-待同步，1-成功�?2-失败�?}-->   
								<th align="center" rowName="join_status" orderName="join_status:DESC" title='缴纳状�?�（0-待同步，1-成功�?2-失败�?'>缴纳状�?�（0-待同步，1-成功�?2-失败�?</th>
								<!-- ������{同步NC时间}-->   
								<th align="center" rowName="join_time" orderName="join_time:DESC" title='同步NC时间'>同步NC时间</th>
								<!-- ������{}-->   
								<th align="center" rowName="nc_ts" orderName="nc_ts:DESC" title=''></th>
								<!-- ������{同步NC失败后，NC返回的�??(0：未同步�? 1：执行错误； 2：未授权(安全�?验不通过)�? 3：服务已停止(不提供服�?)�? 4：费用在NC端发生变化； 5：传入的费用更新、查询参数有误； 6：NC端查询错�? �? 7：重复缴�?)�? 8：NC服务维护中；99：密蜜传入NC参数有误�?}-->   
								<th align="center" rowName="nc_return_status" orderName="nc_return_status:DESC" title='同步NC失败后，NC返回的�??(0：未同步�? 1：执行错误； 2：未授权(安全�?验不通过)�? 3：服务已停止(不提供服�?)�? 4：费用在NC端发生变化； 5：传入的费用更新、查询参数有误； 6：NC端查询错�? �? 7：重复缴�?)�? 8：NC服务维护中；99：密蜜传入NC参数有误�?'>同步NC失败后，NC返回的�??(0：未同步�? 1：执行错误； 2：未授权(安全�?验不通过)�? 3：服务已停止(不提供服�?)�? 4：费用在NC端发生变化； 5：传入的费用更新、查询参数有误； 6：NC端查询错�? �? 7：重复缴�?)�? 8：NC服务维护中；99：密蜜传入NC参数有误�?</th>
								<!-- ������{同步NC失败后，NC返回的失败描述信�?}-->   
								<th align="center" rowName="nc_return_message" orderName="nc_return_message:DESC" title='同步NC失败后，NC返回的失败描述信�?'>同步NC失败后，NC返回的失败描述信�?</th>
								<!-- ������{�?款人id}-->   
								<th align="center" rowName="refund_user_id" orderName="refund_user_id:DESC" title='�?款人id'>�?款人id</th>
								<!-- ������{�?款时�?}-->   
								<th align="center" rowName="refund_time" orderName="refund_time:DESC" title='�?款时�?'>�?款时�?</th>
								<!-- ������{记录添加时间}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='记录添加时间'>记录添加时间</th>
								<!-- ������{创建时间}-->   
								<th align="center" rowName="db_create_time" orderName="db_create_time:DESC" title='创建时间'>创建时间</th>
								<!-- ������{更新时间}-->   
								<th align="center" rowName="db_update_time" orderName="db_update_time:DESC" title='更新时间'>更新时间</th>
								<!-- ������{重复缴费，�??款状态（0:默认值；1:�?款中；已�?款）}-->   
								<th align="center" rowName="refund_status" orderName="refund_status:DESC" title='重复缴费，�??款状态（0:默认值；1:�?款中；已�?款）'>重复缴费，�??款状态（0:默认值；1:�?款中；已�?款）</th>
								<!-- ������{小区ID}-->   
								<th align="center" rowName="community_id" orderName="community_id:DESC" title='小区ID'>小区ID</th>
								<!-- ������{房产ID}-->   
								<th align="center" rowName="house_id" orderName="house_id:DESC" title='房产ID'>房产ID</th>
								<!-- ������{账单年份}-->   
								<th align="center" rowName="year" orderName="year:DESC" title='账单年份'>账单年份</th>
								<!-- ������{账单月份}-->   
								<th align="center" rowName="month" orderName="month:DESC" title='账单月份'>账单月份</th>
								<!-- ������{异常单处理状�?(0-未处�?,1-已处�?,2-人工�?款中,3-已确认�??�?,4-已确认转预存)}-->   
								<th align="center" rowName="processing_status" orderName="processing_status:DESC" title='异常单处理状�?(0-未处�?,1-已处�?,2-人工�?款中,3-已确认�??�?,4-已确认转预存)'>异常单处理状�?(0-未处�?,1-已处�?,2-人工�?款中,3-已确认�??�?,4-已确认转预存)</th>
								<!-- ������{单元ID}-->   
								<th align="center" rowName="unit_id" orderName="unit_id:DESC" title='单元ID'>单元ID</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							TPmBillJoinNc view = new TPmBillJoinNc();
								for (int i = 0; i < list.size(); i++) {
									view = (TPmBillJoinNc) list.get(i);
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
											<td><%=view.getJoinId()%></td>
											<!-- ������{账单结算ID}-->   
											<td><%=view.getBalanceId()%></td>
											<!-- ������{账单编号}-->   
											<td><%=view.getBillCode()%></td>
											<!-- ������{账单类型编码}-->   
											<td><%=view.getTypeCode()%></td>
											<!-- ������{缴费金额（元�?}-->   
											<td><%=view.getNrevmny()%></td>
											<!-- ������{滞纳金（元）}-->   
											<td><%=view.getNrevlfmny()%></td>
											<!-- ������{支付时间}-->   
											<td><%=view.getPayTime()%></td>
											<!-- ������{物业公司的资金账�?}-->   
											<td><%=view.getCompanyAccount()%></td>
											<!-- ������{nc_bill_id}-->   
											<td><%=view.getNcBillId()%></td>
											<!-- ������{NC物业公司主键}-->   
											<td><%=view.getNcCompanyId()%></td>
											<!-- ������{管理处主�?}-->   
											<td><%=view.getNcManageId()%></td>
											<!-- ������{缴纳状�?�（0-待同步，1-成功�?2-失败�?}-->   
											<td><%=view.getJoinStatus()%></td>
											<!-- ������{同步NC时间}-->   
											<td><%=view.getJoinTime()%></td>
											<!-- ������{}-->   
											<td><%=view.getNcTs()%></td>
											<!-- ������{同步NC失败后，NC返回的�??(0：未同步�? 1：执行错误； 2：未授权(安全�?验不通过)�? 3：服务已停止(不提供服�?)�? 4：费用在NC端发生变化； 5：传入的费用更新、查询参数有误； 6：NC端查询错�? �? 7：重复缴�?)�? 8：NC服务维护中；99：密蜜传入NC参数有误�?}-->   
											<td><%=view.getNcReturnStatus()%></td>
											<!-- ������{同步NC失败后，NC返回的失败描述信�?}-->   
											<td><%=view.getNcReturnMessage()%></td>
											<!-- ������{�?款人id}-->   
											<td><%=view.getRefundUserId()%></td>
											<!-- ������{�?款时�?}-->   
											<td><%=view.getRefundTime()%></td>
											<!-- ������{记录添加时间}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{创建时间}-->   
											<td><%=view.getDbCreateTime()%></td>
											<!-- ������{更新时间}-->   
											<td><%=view.getDbUpdateTime()%></td>
											<!-- ������{重复缴费，�??款状态（0:默认值；1:�?款中；已�?款）}-->   
											<td><%=view.getRefundStatus()%></td>
											<!-- ������{小区ID}-->   
											<td><%=view.getCommunityId()%></td>
											<!-- ������{房产ID}-->   
											<td><%=view.getHouseId()%></td>
											<!-- ������{账单年份}-->   
											<td><%=view.getYear()%></td>
											<!-- ������{账单月份}-->   
											<td><%=view.getMonth()%></td>
											<!-- ������{异常单处理状�?(0-未处�?,1-已处�?,2-人工�?款中,3-已确认�??�?,4-已确认转预存)}-->   
											<td><%=view.getProcessingStatus()%></td>
											<!-- ������{单元ID}-->   
											<td><%=view.getUnitId()%></td>

											<td>
												<a class="o-edit" href="TPmBillJoinNc.mc?method=editTPmBillJoinNc&joinId,balanceId,billCode,typeCode,nrevmny,nrevlfmny,payTime,companyAccount,ncBillId,ncCompanyId,ncManageId,joinStatus,joinTime,ncTs,ncReturnStatus,ncReturnMessage,refundUserId,refundTime,createTime,dbCreateTime,dbUpdateTime,refundStatus,communityId,houseId,year,month,processingStatus,unitId=<%= view.getJoinId() +":"+  view.getBalanceId() +":"+  view.getBillCode() +":"+  view.getTypeCode() +":"+  view.getNrevmny() +":"+  view.getNrevlfmny() +":"+  view.getPayTime() +":"+  view.getCompanyAccount() +":"+  view.getNcBillId() +":"+  view.getNcCompanyId() +":"+  view.getNcManageId() +":"+  view.getJoinStatus() +":"+  view.getJoinTime() +":"+  view.getNcTs() +":"+  view.getNcReturnStatus() +":"+  view.getNcReturnMessage() +":"+  view.getRefundUserId() +":"+  view.getRefundTime() +":"+  view.getCreateTime() +":"+  view.getDbCreateTime() +":"+  view.getDbUpdateTime() +":"+  view.getRefundStatus() +":"+  view.getCommunityId() +":"+  view.getHouseId() +":"+  view.getYear() +":"+  view.getMonth() +":"+  view.getProcessingStatus() +":"+  view.getUnitId() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTPmBillJoinNc('<%= view.getJoinId() +":"+  view.getBalanceId() +":"+  view.getBillCode() +":"+  view.getTypeCode() +":"+  view.getNrevmny() +":"+  view.getNrevlfmny() +":"+  view.getPayTime() +":"+  view.getCompanyAccount() +":"+  view.getNcBillId() +":"+  view.getNcCompanyId() +":"+  view.getNcManageId() +":"+  view.getJoinStatus() +":"+  view.getJoinTime() +":"+  view.getNcTs() +":"+  view.getNcReturnStatus() +":"+  view.getNcReturnMessage() +":"+  view.getRefundUserId() +":"+  view.getRefundTime() +":"+  view.getCreateTime() +":"+  view.getDbCreateTime() +":"+  view.getDbUpdateTime() +":"+  view.getRefundStatus() +":"+  view.getCommunityId() +":"+  view.getHouseId() +":"+  view.getYear() +":"+  view.getMonth() +":"+  view.getProcessingStatus() +":"+  view.getUnitId() %>')" title="ɾ��"></a>
											    <a class="o-view" href="TPmBillJoinNc.mc?method=detailTPmBillJoinNc&joinId,balanceId,billCode,typeCode,nrevmny,nrevlfmny,payTime,companyAccount,ncBillId,ncCompanyId,ncManageId,joinStatus,joinTime,ncTs,ncReturnStatus,ncReturnMessage,refundUserId,refundTime,createTime,dbCreateTime,dbUpdateTime,refundStatus,communityId,houseId,year,month,processingStatus,unitId=<%= view.getJoinId() +":"+  view.getBalanceId() +":"+  view.getBillCode() +":"+  view.getTypeCode() +":"+  view.getNrevmny() +":"+  view.getNrevlfmny() +":"+  view.getPayTime() +":"+  view.getCompanyAccount() +":"+  view.getNcBillId() +":"+  view.getNcCompanyId() +":"+  view.getNcManageId() +":"+  view.getJoinStatus() +":"+  view.getJoinTime() +":"+  view.getNcTs() +":"+  view.getNcReturnStatus() +":"+  view.getNcReturnMessage() +":"+  view.getRefundUserId() +":"+  view.getRefundTime() +":"+  view.getCreateTime() +":"+  view.getDbCreateTime() +":"+  view.getDbUpdateTime() +":"+  view.getRefundStatus() +":"+  view.getCommunityId() +":"+  view.getHouseId() +":"+  view.getYear() +":"+  view.getMonth() +":"+  view.getProcessingStatus() +":"+  view.getUnitId() %>" title="����"></a> 
												
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBillJoinNc" %>
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
				edit:'TPmBillJoinNc.mc?method=editTPmBillJoinNc&joinId,balanceId,billCode,typeCode,nrevmny,nrevlfmny,payTime,companyAccount,ncBillId,ncCompanyId,ncManageId,joinStatus,joinTime,ncTs,ncReturnStatus,ncReturnMessage,refundUserId,refundTime,createTime,dbCreateTime,dbUpdateTime,refundStatus,communityId,houseId,year,month,processingStatus,unitId=',
				del:'TPmBillJoinNc.mc?method=deleteTPmBillJoinNc&PK=',
				view:'TPmBillJoinNc.mc?method=detailTPmBillJoinNc&joinId,balanceId,billCode,typeCode,nrevmny,nrevlfmny,payTime,companyAccount,ncBillId,ncCompanyId,ncManageId,joinStatus,joinTime,ncTs,ncReturnStatus,ncReturnMessage,refundUserId,refundTime,createTime,dbCreateTime,dbUpdateTime,refundStatus,communityId,houseId,year,month,processingStatus,unitId='
			};
			var options = {
				tableId:'pageTable',
				url:'TPmBillJoinNc.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'joinId,balanceId,billCode,typeCode,nrevmny,nrevlfmny,payTime,companyAccount,ncBillId,ncCompanyId,ncManageId,joinStatus,joinTime,ncTs,ncReturnStatus,ncReturnMessage,refundUserId,refundTime,createTime,dbCreateTime,dbUpdateTime,refundStatus,communityId,houseId,year,month,processingStatus,unitId'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_join_nc_edit.jsp'">����</button>
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
								<th align="center" rowName="joinId" orderName="join_id:DESC" title='账单结算ID'>账单结算ID</th>
								<!-- ������  账单结算ID-->   
								<th align="center" rowName="balanceId" orderName="balance_id:DESC" title='账单结算ID'>账单结算ID</th>
								<!-- ������  账单编号-->   
								<th align="center" rowName="billCode" orderName="bill_code:DESC" title='账单编号'>账单编号</th>
								<!-- ������  账单类型编码-->   
								<th align="center" rowName="typeCode" orderName="type_code:DESC" title='账单类型编码'>账单类型编码</th>
								<!-- ������  缴费金额（元�?-->   
								<th align="center" rowName="nrevmny" orderName="nrevmny:DESC" title='缴费金额（元�?'>缴费金额（元�?</th>
								<!-- ������  滞纳金（元）-->   
								<th align="center" rowName="nrevlfmny" orderName="nrevlfmny:DESC" title='滞纳金（元）'>滞纳金（元）</th>
								<!-- ������  支付时间-->   
								<th align="center" rowName="payTime" orderName="pay_time:DESC" title='支付时间'>支付时间</th>
								<!-- ������  物业公司的资金账�?-->   
								<th align="center" rowName="companyAccount" orderName="company_account:DESC" title='物业公司的资金账�?'>物业公司的资金账�?</th>
								<!-- ������  nc_bill_id-->   
								<th align="center" rowName="ncBillId" orderName="nc_bill_id:DESC" title='nc_bill_id'>nc_bill_id</th>
								<!-- ������  NC物业公司主键-->   
								<th align="center" rowName="ncCompanyId" orderName="nc_company_id:DESC" title='NC物业公司主键'>NC物业公司主键</th>
								<!-- ������  管理处主�?-->   
								<th align="center" rowName="ncManageId" orderName="nc_manage_id:DESC" title='管理处主�?'>管理处主�?</th>
								<!-- ������  缴纳状�?�（0-待同步，1-成功�?2-失败�?-->   
								<th align="center" rowName="joinStatus" orderName="join_status:DESC" title='缴纳状�?�（0-待同步，1-成功�?2-失败�?'>缴纳状�?�（0-待同步，1-成功�?2-失败�?</th>
								<!-- ������  同步NC时间-->   
								<th align="center" rowName="joinTime" orderName="join_time:DESC" title='同步NC时间'>同步NC时间</th>
								<!-- ������  -->   
								<th align="center" rowName="ncTs" orderName="nc_ts:DESC" title=''></th>
								<!-- ������  同步NC失败后，NC返回的�??(0：未同步�? 1：执行错误； 2：未授权(安全�?验不通过)�? 3：服务已停止(不提供服�?)�? 4：费用在NC端发生变化； 5：传入的费用更新、查询参数有误； 6：NC端查询错�? �? 7：重复缴�?)�? 8：NC服务维护中；99：密蜜传入NC参数有误�?-->   
								<th align="center" rowName="ncReturnStatus" orderName="nc_return_status:DESC" title='同步NC失败后，NC返回的�??(0：未同步�? 1：执行错误； 2：未授权(安全�?验不通过)�? 3：服务已停止(不提供服�?)�? 4：费用在NC端发生变化； 5：传入的费用更新、查询参数有误； 6：NC端查询错�? �? 7：重复缴�?)�? 8：NC服务维护中；99：密蜜传入NC参数有误�?'>同步NC失败后，NC返回的�??(0：未同步�? 1：执行错误； 2：未授权(安全�?验不通过)�? 3：服务已停止(不提供服�?)�? 4：费用在NC端发生变化； 5：传入的费用更新、查询参数有误； 6：NC端查询错�? �? 7：重复缴�?)�? 8：NC服务维护中；99：密蜜传入NC参数有误�?</th>
								<!-- ������  同步NC失败后，NC返回的失败描述信�?-->   
								<th align="center" rowName="ncReturnMessage" orderName="nc_return_message:DESC" title='同步NC失败后，NC返回的失败描述信�?'>同步NC失败后，NC返回的失败描述信�?</th>
								<!-- ������  �?款人id-->   
								<th align="center" rowName="refundUserId" orderName="refund_user_id:DESC" title='�?款人id'>�?款人id</th>
								<!-- ������  �?款时�?-->   
								<th align="center" rowName="refundTime" orderName="refund_time:DESC" title='�?款时�?'>�?款时�?</th>
								<!-- ������  记录添加时间-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='记录添加时间'>记录添加时间</th>
								<!-- ������  创建时间-->   
								<th align="center" rowName="dbCreateTime" orderName="db_create_time:DESC" title='创建时间'>创建时间</th>
								<!-- ������  更新时间-->   
								<th align="center" rowName="dbUpdateTime" orderName="db_update_time:DESC" title='更新时间'>更新时间</th>
								<!-- ������  重复缴费，�??款状态（0:默认值；1:�?款中；已�?款）-->   
								<th align="center" rowName="refundStatus" orderName="refund_status:DESC" title='重复缴费，�??款状态（0:默认值；1:�?款中；已�?款）'>重复缴费，�??款状态（0:默认值；1:�?款中；已�?款）</th>
								<!-- ������  小区ID-->   
								<th align="center" rowName="communityId" orderName="community_id:DESC" title='小区ID'>小区ID</th>
								<!-- ������  房产ID-->   
								<th align="center" rowName="houseId" orderName="house_id:DESC" title='房产ID'>房产ID</th>
								<!-- ������  账单年份-->   
								<th align="center" rowName="year" orderName="year:DESC" title='账单年份'>账单年份</th>
								<!-- ������  账单月份-->   
								<th align="center" rowName="month" orderName="month:DESC" title='账单月份'>账单月份</th>
								<!-- ������  异常单处理状�?(0-未处�?,1-已处�?,2-人工�?款中,3-已确认�??�?,4-已确认转预存)-->   
								<th align="center" rowName="processingStatus" orderName="processing_status:DESC" title='异常单处理状�?(0-未处�?,1-已处�?,2-人工�?款中,3-已确认�??�?,4-已确认转预存)'>异常单处理状�?(0-未处�?,1-已处�?,2-人工�?款中,3-已确认�??�?,4-已确认转预存)</th>
								<!-- ������  单元ID-->   
								<th align="center" rowName="unitId" orderName="unit_id:DESC" title='单元ID'>单元ID</th>
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
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
	<TITLE>账单�?��ѯ</TITLE>
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
 		
 		<!-- ��ѯ������ʾ����start -->
 		<div class="tabelist" style="border:1px solid gray;width:100%;padding:10px;margin:0 auto;">
			<div style="margin:0 auto;width:100%;">
			<div class="title-common">
				 	账单�?��ѯ
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="bill_id" placeholder="账单ID" value="${ param.bill_id }"/>
		<input type='text' class="input-small" name="type_code" placeholder="账单编号" value="${ param.type_code }"/>
		<input type='text' class="input-small" name="community_id" placeholder="小区id" value="${ param.community_id }"/>
		<input type='text' class="input-small" name="house_id" placeholder="房间ID" value="${ param.house_id }"/>
		<input type='text' class="input-small" name="money" placeholder="应缴费用（元�?" value="${ param.money }"/>
		<input type='text' class="input-small" name="rev_money" placeholder="已收金额（元�?" value="${ param.rev_money }"/>
		<input type='text' class="input-small" name="pend_money" placeholder="待缴金额（元�?" value="${ param.pend_money }"/>
		<input type='text' class="input-small" name="overdue_money" placeholder="应缴滞纳金（元）" value="${ param.overdue_money }"/>
		<input type='text' class="input-small" name="overdue_rev_money" placeholder="已收滞纳金（元）" value="${ param.overdue_rev_money }"/>
		<input type='text' class="input-small" name="overdue_pend_money" placeholder="待缴滞纳金（元）" value="${ param.overdue_pend_money }"/>
		<input type='text' class="input-small" name="nc_pay_money" placeholder="线下支付总额" value="${ param.nc_pay_money }"/>
		<input type='text' class="input-small" name="pay_state" placeholder="缴纳状�??" value="${ param.pay_state }"/>
		<input type='text' class="input-small" name="year" placeholder="�?" value="${ param.year }"/>
		<input type='text' class="input-small" name="month" placeholder="�?" value="${ param.month }"/>
		<input type='text' class="input-small" name="bank_bill_flag" placeholder="银行划扣标识" value="${ param.bank_bill_flag }"/>
		<input type='text' class="input-small" name="company_id" placeholder="物业公司主键" value="${ param.company_id }"/>
		<input type='text' class="input-small" name="nc_bill_id" placeholder="" value="${ param.nc_bill_id }"/>
		<input type='text' class="input-small" name="nc_house_id" placeholder="房产主键" value="${ param.nc_house_id }"/>
		<input type='text' class="input-small" name="nc_manage_id" placeholder="管理处主�?" value="${ param.nc_manage_id }"/>
		<input type='text' class="input-small" name="is_delete" placeholder="是否删除" value="${ param.is_delete }"/>
		<input type='text' class="input-small" name="bill_code" placeholder="账单编号" value="${ param.bill_code }"/>
		<input type='text' class="input-small" name="nc_ts" placeholder="" value="${ param.nc_ts }"/>
		<input type='text' class="input-small" name="nc_pk_revfare" placeholder="" value="${ param.nc_pk_revfare }"/>
		<input type='text' class="input-small" name="join_time" placeholder="同步时间" value="${ param.join_time }"/>
		<input type='text' class="input-small" name="settlement_status" placeholder="结算状�?�（0：未结算�?1：结算中�?2：已结算�?9：锁定中�?10：等待结算）" value="${ param.settlement_status }"/>
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
								<!-- ������  账单ID-->   
								<th align="center" rowName="billId" orderName="bill_id:DESC" title='账单ID'>账单ID</th>
								<!-- ������  账单编号-->   
								<th align="center" rowName="typeCode" orderName="type_code:DESC" title='账单编号'>账单编号</th>
								<!-- ������  小区id-->   
								<th align="center" rowName="communityId" orderName="community_id:DESC" title='小区id'>小区id</th>
								<!-- ������  房间ID-->   
								<th align="center" rowName="houseId" orderName="house_id:DESC" title='房间ID'>房间ID</th>
								<!-- ������  应缴费用（元�?-->   
								<th align="center" rowName="money" orderName="money:DESC" title='应缴费用（元�?'>应缴费用（元�?</th>
								<!-- ������  已收金额（元�?-->   
								<th align="center" rowName="revMoney" orderName="rev_money:DESC" title='已收金额（元�?'>已收金额（元�?</th>
								<!-- ������  待缴金额（元�?-->   
								<th align="center" rowName="pendMoney" orderName="pend_money:DESC" title='待缴金额（元�?'>待缴金额（元�?</th>
								<!-- ������  应缴滞纳金（元）-->   
								<th align="center" rowName="overdueMoney" orderName="overdue_money:DESC" title='应缴滞纳金（元）'>应缴滞纳金（元）</th>
								<!-- ������  已收滞纳金（元）-->   
								<th align="center" rowName="overdueRevMoney" orderName="overdue_rev_money:DESC" title='已收滞纳金（元）'>已收滞纳金（元）</th>
								<!-- ������  待缴滞纳金（元）-->   
								<th align="center" rowName="overduePendMoney" orderName="overdue_pend_money:DESC" title='待缴滞纳金（元）'>待缴滞纳金（元）</th>
								<!-- ������  线下支付总额-->   
								<th align="center" rowName="ncPayMoney" orderName="nc_pay_money:DESC" title='线下支付总额'>线下支付总额</th>
								<!-- ������  缴纳状�??-->   
								<th align="center" rowName="payState" orderName="pay_state:DESC" title='缴纳状�??'>缴纳状�??</th>
								<!-- ������  �?-->   
								<th align="center" rowName="year" orderName="year:DESC" title='�?'>�?</th>
								<!-- ������  �?-->   
								<th align="center" rowName="month" orderName="month:DESC" title='�?'>�?</th>
								<!-- ������  银行划扣标识-->   
								<th align="center" rowName="bankBillFlag" orderName="bank_bill_flag:DESC" title='银行划扣标识'>银行划扣标识</th>
								<!-- ������  物业公司主键-->   
								<th align="center" rowName="companyId" orderName="company_id:DESC" title='物业公司主键'>物业公司主键</th>
								<!-- ������  -->   
								<th align="center" rowName="ncBillId" orderName="nc_bill_id:DESC" title=''></th>
								<!-- ������  房产主键-->   
								<th align="center" rowName="ncHouseId" orderName="nc_house_id:DESC" title='房产主键'>房产主键</th>
								<!-- ������  管理处主�?-->   
								<th align="center" rowName="ncManageId" orderName="nc_manage_id:DESC" title='管理处主�?'>管理处主�?</th>
								<!-- ������  是否删除-->   
								<th align="center" rowName="isDelete" orderName="is_delete:DESC" title='是否删除'>是否删除</th>
								<!-- ������  账单编号-->   
								<th align="center" rowName="billCode" orderName="bill_code:DESC" title='账单编号'>账单编号</th>
								<!-- ������  -->   
								<th align="center" rowName="ncTs" orderName="nc_ts:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="ncPkRevfare" orderName="nc_pk_revfare:DESC" title=''></th>
								<!-- ������  同步时间-->   
								<th align="center" rowName="joinTime" orderName="join_time:DESC" title='同步时间'>同步时间</th>
								<!-- ������  结算状�?�（0：未结算�?1：结算中�?2：已结算�?9：锁定中�?10：等待结算）-->   
								<th align="center" rowName="settlementStatus" orderName="settlement_status:DESC" title='结算状�?�（0：未结算�?1：结算中�?2：已结算�?9：锁定中�?10：等待结算）'>结算状�?�（0：未结算�?1：结算中�?2：已结算�?9：锁定中�?10：等待结算）</th>
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
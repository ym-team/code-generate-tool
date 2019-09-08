<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.pm.bill.data.TPmBill" %>
<%@ page import="com.evergrande.pm.bill.view.TPmBillView" %>
<%@ page import="red.sea.commons.util.DateUtil" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>�鿴��Ϣ</title>
	<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>	
	<!-- �Զ�����ʽ -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css"> 
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>	
</head>
<body class="bgcolor3">
	<%
		TPmBillView vo = (TPmBillView) request.getAttribute("TPmBill");
		if (vo == null) {
			vo = new TPmBillView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>账单�?�鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="TPmBill.mc?method=updateTPmBillJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">账单ID ��</td>
					<td>
	                	<%=vo.getBillId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">账单编号 ��</td>
					<td>
	                	<%=vo.getTypeCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">小区id ��</td>
					<td>
	                	<%=vo.getCommunityId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">房间ID ��</td>
					<td>
	                	<%=vo.getHouseId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">应缴费用（元�? ��</td>
					<td>
	                	<%=vo.getMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">已收金额（元�? ��</td>
					<td>
	                	<%=vo.getRevMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">待缴金额（元�? ��</td>
					<td>
	                	<%=vo.getPendMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">应缴滞纳金（元） ��</td>
					<td>
	                	<%=vo.getOverdueMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">已收滞纳金（元） ��</td>
					<td>
	                	<%=vo.getOverdueRevMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">待缴滞纳金（元） ��</td>
					<td>
	                	<%=vo.getOverduePendMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">线下支付总额 ��</td>
					<td>
	                	<%=vo.getNcPayMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">缴纳状�?? ��</td>
					<td>
	                	<%=vo.getPayState()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�? ��</td>
					<td>
	                	<%=vo.getYear()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�? ��</td>
					<td>
	                	<%=vo.getMonth()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">银行划扣标识 ��</td>
					<td>
	                	<%=vo.getBankBillFlag()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">物业公司主键 ��</td>
					<td>
	                	<%=vo.getCompanyId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
	                	<%=vo.getNcBillId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">房产主键 ��</td>
					<td>
	                	<%=vo.getNcHouseId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">管理处主�? ��</td>
					<td>
	                	<%=vo.getNcManageId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">是否删除 ��</td>
					<td>
	                	<%=vo.getIsDelete()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">账单编号 ��</td>
					<td>
	                	<%=vo.getBillCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
	                	<%=vo.getNcTs()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
	                	<%=vo.getNcPkRevfare()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">同步时间 ��</td>
					<td>
	                	<%=vo.getJoinTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">结算状�?�（0：未结算�?1：结算中�?2：已结算�?9：锁定中�?10：等待结算） ��</td>
					<td>
	                	<%=vo.getSettlementStatus()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TPmBill.mc?method=getAllPageTPmBill&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
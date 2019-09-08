<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.pm.bill.data.TPmBillBalance" %>
<%@ page import="com.evergrande.pm.bill.view.TPmBillBalanceView" %>
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
		TPmBillBalanceView vo = (TPmBillBalanceView) request.getAttribute("TPmBillBalance");
		if (vo == null) {
			vo = new TPmBillBalanceView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>锟斤拷锟斤拷�鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="TPmBillBalance.mc?method=updateTPmBillBalanceJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">账单结算ID ��</td>
					<td>
	                	<%=vo.getBalanceId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">支付id ��</td>
					<td>
	                	<%=vo.getPayId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">账单编号 ��</td>
					<td>
	                	<%=vo.getBillCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">应缴费用（元�? ��</td>
					<td>
	                	<%=vo.getPayMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">缴纳状�?�（0-待缴纳，1-已缴纳） ��</td>
					<td>
	                	<%=vo.getPayState()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">支付方式（weixin,alipay,bank�? ��</td>
					<td>
	                	<%=vo.getPayWay()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">支付用户id ��</td>
					<td>
	                	<%=vo.getPayUserid()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">支付用户姓名 ��</td>
					<td>
	                	<%=vo.getPayUserName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">预支付时�? ��</td>
					<td>
	                	<%=vo.getPrePayTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">完成支付时间 ��</td>
					<td>
	                	<%=vo.getFinishPayTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">业务订单�? = 父单�? = 物业缴费推给支付模块的业务单�? ��</td>
					<td>
	                	<%=vo.getBusinessOrderCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">billCode支付次序 ��</td>
					<td>
	                	<%=vo.getPaySeq()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">小区ID ��</td>
					<td>
	                	<%=vo.getCommunityId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">NC收款单编�? ��</td>
					<td>
	                	<%=vo.getNcReceiptNum()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">NC收款单入账金�? ��</td>
					<td>
	                	<%=vo.getNcReceiptMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">手续�? ��</td>
					<td>
	                	<%=vo.getRateFee()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">支付类型�?0:物业缴费�?1:密蜜预缴费） ��</td>
					<td>
	                	<%=vo.getPayType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">第三方交易流水号 ��</td>
					<td>
	                	<%=vo.getThirdPartTransactionId()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TPmBillBalance.mc?method=getAllPageTPmBillBalance&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
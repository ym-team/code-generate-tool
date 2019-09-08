<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.AcctUserBalanceSummary" %>
<%@ page import="server1.AcctUserBalanceSummaryView" %>
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
		AcctUserBalanceSummaryView vo = (AcctUserBalanceSummaryView) request.getAttribute("AcctUserBalanceSummary");
		if (vo == null) {
			vo = new AcctUserBalanceSummaryView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>�����鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="AcctUserBalanceSummary.mc?method=updateAcctUserBalanceSummaryJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">����ID ��</td>
					<td>
						<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�Ӷ���ID-֧������ ��</td>
					<td>
						<%=vo.getSubOrderId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">֧���˻�ID ��</td>
					<td>
						<%=vo.getFromAccountId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����˻�ID ��</td>
					<td>
						<%=vo.getToAccountId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOrderType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">֧������ ��</td>
					<td>
						<%=vo.getPayFee()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���ܼ�¼��Դ��1 ������֧��¼��2�ڲ�ҵ����֧��¼�� ��</td>
					<td>
						<%=vo.getFlowType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getCreateDate()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1:  �����             2:  ȡ�� ��</td>
					<td>
						<%=vo.getResultType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOpTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">0:  ��Ч             1:  ��Ч ��</td>
					<td>
						<%=vo.getStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ע ��</td>
					<td>
						<%=vo.getRemark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ��� ��</td>
					<td>
						<%=vo.getOrderSource()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='AcctUserBalanceSummary.mc?method=getAllPageAcctUserBalanceSummary&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
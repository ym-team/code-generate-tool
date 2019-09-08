<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.AcctSettlement" %>
<%@ page import="server1.AcctSettlementView" %>
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
		AcctSettlementView vo = (AcctSettlementView) request.getAttribute("AcctSettlement");
		if (vo == null) {
			vo = new AcctSettlementView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>�����鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="AcctSettlement.mc?method=updateAcctSettlementJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">����ID ��</td>
					<td>
						<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ID ��</td>
					<td>
						<%=vo.getMainOrderId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�˻�ID ��</td>
					<td>
						<%=vo.getAccountId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����ʺ�ID ��</td>
					<td>
						<%=vo.getChannelAccountId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����·� ��ʾ:201501 ����6λ ��</td>
					<td>
						<%=vo.getSettlementMonth()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�˻���� = ������ - ƽ̨����� ��</td>
					<td>
						<%=vo.getAccountBalance()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ (δ��ƽ̨����ѣ�˰��) ��</td>
					<td>
						<%=vo.getSettleBalance()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��˰ ��</td>
					<td>
						<%=vo.getTaxFee()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">˰���� = �˻���� - ˰�� ��</td>
					<td>
						<%=vo.getAfterTaxBalance()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ƽ̨����� ��</td>
					<td>
						<%=vo.getMgntFee()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������������             1: ֧����             2: ΢��֧��             3: ���� ��</td>
					<td>
						<%=vo.getChannelType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����״̬             1:  �ѽ���             2:  δ����             3:  ƽ̨ת�� ��</td>
					<td>
						<%=vo.getSettlementType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getSettlementDate()%>
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
					<td class="titleright">���������շ� ��</td>
					<td>
						<%=vo.getChannelFee()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='AcctSettlement.mc?method=getAllPageAcctSettlement&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
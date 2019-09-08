<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.pm.bill.data.TPmExceptionToPreypayRecordTest" %>
<%@ page import="com.evergrande.pm.bill.view.TPmExceptionToPreypayRecordTestView" %>
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
		TPmExceptionToPreypayRecordTestView vo = (TPmExceptionToPreypayRecordTestView) request.getAttribute("TPmExceptionToPreypayRecordTest");
		if (vo == null) {
			vo = new TPmExceptionToPreypayRecordTestView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>异常单之重复缴费转预存表�鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="TPmExceptionToPreypayRecordTest.mc?method=updateTPmExceptionToPreypayRecordTestJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">异常转支付记录主�? ��</td>
					<td>
	                	<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">异常单表billcode ��</td>
					<td>
	                	<%=vo.getExceptionBillCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">预缴费单�? ��</td>
					<td>
	                	<%=vo.getNcPrepayId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">预缴费时�? ��</td>
					<td>
	                	<%=vo.getNcPrepayTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">预缴费方�? ��</td>
					<td>
	                	<%=vo.getNcPrepayName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">预缴金额 ��</td>
					<td>
	                	<%=vo.getNcPrepayMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">0:无效 1有效 默认1 ��</td>
					<td>
	                	<%=vo.getNcStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">操作者id ��</td>
					<td>
	                	<%=vo.getOptUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">更新时间 ��</td>
					<td>
	                	<%=vo.getUpdateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ��</td>
					<td>
	                	<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">备注 ��</td>
					<td>
	                	<%=vo.getRemark()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TPmExceptionToPreypayRecordTest.mc?method=getAllPageTPmExceptionToPreypayRecordTest&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
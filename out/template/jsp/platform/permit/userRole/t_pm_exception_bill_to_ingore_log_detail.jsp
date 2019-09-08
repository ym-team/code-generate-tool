<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.pm.bill.data.TPmExceptionBillToIngoreLog" %>
<%@ page import="com.evergrande.pm.bill.view.TPmExceptionBillToIngoreLogView" %>
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
		TPmExceptionBillToIngoreLogView vo = (TPmExceptionBillToIngoreLogView) request.getAttribute("TPmExceptionBillToIngoreLog");
		if (vo == null) {
			vo = new TPmExceptionBillToIngoreLogView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>异常单之忽略记录�?�鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="TPmExceptionBillToIngoreLog.mc?method=updateTPmExceptionBillToIngoreLogJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">主键 ��</td>
					<td>
	                	<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">异常账单表主�? ��</td>
					<td>
	                	<%=vo.getJoinId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">账单编号 ��</td>
					<td>
	                	<%=vo.getBillCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">操作时间 ��</td>
					<td>
	                	<%=vo.getOptTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">忽略原因 ��</td>
					<td>
	                	<%=vo.getIngoreReason()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1:无效 2有效 默认2 ��</td>
					<td>
	                	<%=vo.getStatus()%>
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
	                	<%=vo.getDbUpdateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ��</td>
					<td>
	                	<%=vo.getDbCreateTime()%>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TPmExceptionBillToIngoreLog.mc?method=getAllPageTPmExceptionBillToIngoreLog&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
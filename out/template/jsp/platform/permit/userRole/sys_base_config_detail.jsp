<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.SysBaseConfig" %>
<%@ page import="server1.SysBaseConfigView" %>
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
		SysBaseConfigView vo = (SysBaseConfigView) request.getAttribute("SysBaseConfig");
		if (vo == null) {
			vo = new SysBaseConfigView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>���Բ鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="SysBaseConfig.mc?method=updateSysBaseConfigJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʹ��              ����@�ֶ��� eg: TABLE_NAME@COLOUM_NAME ��</td>
					<td>
						<%=vo.getObjType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���ID ��</td>
					<td>
						<%=vo.getObjId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ ��</td>
					<td>
						<%=vo.getObjName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����չ���� ��</td>
					<td>
						<%=vo.getObjExt()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��� ��</td>
					<td>
						<%=vo.getRemark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">0:ʧЧ 1:����  ��</td>
					<td>
						<%=vo.getObjSts()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���ڵ� ��</td>
					<td>
						<%=vo.getPObjId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ڵ� ��</td>
					<td>
						<%=vo.getRootObjId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�㼶 ��</td>
					<td>
						<%=vo.getObjLevel()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='SysBaseConfig.mc?method=getAllPageSysBaseConfig&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
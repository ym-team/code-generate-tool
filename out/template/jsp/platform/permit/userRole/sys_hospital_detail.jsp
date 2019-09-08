<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.SysHospital" %>
<%@ page import="server1.SysHospitalView" %>
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
		SysHospitalView vo = (SysHospitalView) request.getAttribute("SysHospital");
		if (vo == null) {
			vo = new SysHospitalView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>旧医院表�鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="SysHospital.mc?method=updateSysHospitalJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">医院表示(主键) ��</td>
					<td>
						<%=vo.getHospitalId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">医院名称 ��</td>
					<td>
						<%=vo.getHospitalName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">地市编号 ��</td>
					<td>
						<%=vo.getCityCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1:在用 ;�?���?2 ��</td>
					<td>
						<%=vo.getHospitalSts()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='SysHospital.mc?method=getAllPageSysHospital&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
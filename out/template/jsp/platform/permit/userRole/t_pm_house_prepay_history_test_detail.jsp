<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.pm.bill.data.TPmHousePrepayHistoryTest" %>
<%@ page import="com.evergrande.pm.bill.view.TPmHousePrepayHistoryTestView" %>
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
	<title>查看信息</title>
	<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>	
	<!-- 自定义样式 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css"> 
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>	
</head>
<body class="bgcolor3">
	<%
		TPmHousePrepayHistoryTestView vo = (TPmHousePrepayHistoryTestView) request.getAttribute("TPmHousePrepayHistoryTest");
		if (vo == null) {
			vo = new TPmHousePrepayHistoryTestView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>娴嬭瘯查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="TPmHousePrepayHistoryTest.mc?method=updateTPmHousePrepayHistoryTestJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">涓婚敭 ：</td>
					<td>
	                	<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鎴夸骇涓婚敭 ：</td>
					<td>
	                	<%=vo.getHouseId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏀惰垂椤圭洰ID ：</td>
					<td>
	                	<%=vo.getPrepayCategoryId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">db鏇存柊鏃堕棿 ：</td>
					<td>
	                	<%=vo.getDbUpdateTime()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TPmHousePrepayHistoryTest.mc?method=getAllPageTPmHousePrepayHistoryTest&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
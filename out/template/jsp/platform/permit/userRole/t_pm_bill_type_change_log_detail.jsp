<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.pm.bill.data.TPmBillTypeChangeLog" %>
<%@ page import="com.evergrande.pm.bill.view.TPmBillTypeChangeLogView" %>
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
		TPmBillTypeChangeLogView vo = (TPmBillTypeChangeLogView) request.getAttribute("TPmBillTypeChangeLog");
		if (vo == null) {
			vo = new TPmBillTypeChangeLogView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>閿熸枻鎷烽敓鏂ゆ嫹查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="TPmBillTypeChangeLog.mc?method=updateTPmBillTypeChangeLogJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">涓婚敭 ：</td>
					<td>
	                	<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">璐﹀崟绫诲瀷琛ㄤ富閿? ：</td>
					<td>
	                	<%=vo.getTypeId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鎿嶄綔鏃堕棿 ：</td>
					<td>
	                	<%=vo.getOptTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鎿嶄綔浜嬮」 濡傚彉鏇翠竴绾х被鐩? 浜岀骇绫荤洰 鍙敤鐘舵?? ：</td>
					<td>
	                	<%=vo.getOptEvent()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1:鏃犳晥 2鏈夋晥 榛樿2 ：</td>
					<td>
	                	<%=vo.getStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鎿嶄綔鑰卛d ：</td>
					<td>
	                	<%=vo.getOptUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏇存柊鏃堕棿 ：</td>
					<td>
	                	<%=vo.getDbUpdateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鍒涘缓鏃堕棿 ：</td>
					<td>
	                	<%=vo.getDbCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">澶囨敞 ：</td>
					<td>
	                	<%=vo.getRemark()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TPmBillTypeChangeLog.mc?method=getAllPageTPmBillTypeChangeLog&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
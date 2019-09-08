<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.social.data.TAtActivityDetail" %>
<%@ page import="com.evergrande.social.view.TAtActivityDetailView" %>
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
		TAtActivityDetailView vo = (TAtActivityDetailView) request.getAttribute("TAtActivityDetail");
		if (vo == null) {
			vo = new TAtActivityDetailView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>閿熸枻鎷烽敓鏂ゆ嫹查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="TAtActivityDetail.mc?method=updateTAtActivityDetailJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">鏄庣粏id ：</td>
					<td>
	                	<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鐧诲綍鑰卛d 娌℃湁鍒欐槸0 ：</td>
					<td>
	                	<%=vo.getUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">瑙﹀彂鏃堕棿 ：</td>
					<td>
	                	<%=vo.getTriggerTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">瑙﹀彂绫诲瀷 1 鏌ョ湅 2 鍒嗕韩 ：</td>
					<td>
	                	<%=vo.getTriggerType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">璁惧绫诲瀷 1 ios  2 android 3 web ：</td>
					<td>
	                	<%=vo.getDeviceType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏉ユ簮娓犻亾 1 寰俊  2 app ：</td>
					<td>
	                	<%=vo.getChannelType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">娲诲姩id ：</td>
					<td>
	                	<%=vo.getActivityId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏇存柊鏃堕棿 ：</td>
					<td>
	                	<%=vo.getUpdateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鍒涘缓鏃堕棿 ：</td>
					<td>
	                	<%=vo.getCreateTime()%>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TAtActivityDetail.mc?method=getAllPageTAtActivityDetail&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
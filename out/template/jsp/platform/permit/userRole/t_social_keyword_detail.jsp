<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.social.data.TSocialKeyword" %>
<%@ page import="com.evergrande.social.view.TSocialKeywordView" %>
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
		TSocialKeywordView vo = (TSocialKeywordView) request.getAttribute("TSocialKeyword");
		if (vo == null) {
			vo = new TSocialKeywordView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>鏁忔劅璇?查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="TSocialKeyword.mc?method=updateTSocialKeywordJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright"> ：</td>
					<td>
	                	<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鍐呭 ：</td>
					<td>
	                	<%=vo.getContent()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">0-鍋滅敤 1-鍚敤 ：</td>
					<td>
	                	<%=vo.getStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">澶囨敞 ：</td>
					<td>
	                	<%=vo.getMark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鍒涘缓鏃堕棿 ：</td>
					<td>
	                	<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏈?鍚庝慨鏀规椂闂? ：</td>
					<td>
	                	<%=vo.getModifyTime()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TSocialKeyword.mc?method=getAllPageTSocialKeyword&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
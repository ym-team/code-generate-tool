<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.szjk.dhome.act.data.ActCommentSub" %>
<%@ page import="com.szjk.dhome.act.view.ActCommentSubView" %>
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
		ActCommentSubView vo = (ActCommentSubView) request.getAttribute("ActCommentSub");
		if (vo == null) {
			vo = new ActCommentSubView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>锟斤拷锟斤拷查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="ActCommentSub.mc?method=updateActCommentSubJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">主键 ：</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">跟贴者id ：</td>
					<td>
						<%=vo.getFromUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">回复内容 ：</td>
					<td>
						<%=vo.getCommentSubDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">被跟贴人id ：</td>
					<td>
						<%=vo.getToUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">暂未启用 ：</td>
					<td>
						<%=vo.getCommentSubStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 直接回复评论者  2 回复跟贴者 ：</td>
					<td>
						<%=vo.getCommentSubType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">评论id ：</td>
					<td>
						<%=vo.getCommentId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">评论者id ：</td>
					<td>
						<%=vo.getCommentUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ：</td>
					<td>
						<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">更新时间 ：</td>
					<td>
						<%=vo.getOptTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">备注 ：</td>
					<td>
						<%=vo.getRemark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">备注1 ：</td>
					<td>
						<%=vo.getChar1()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='ActCommentSub.mc?method=getAllPageActCommentSub&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
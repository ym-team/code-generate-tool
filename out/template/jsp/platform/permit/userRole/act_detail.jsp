<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.szjk.dhome.act.data.Act" %>
<%@ page import="com.szjk.dhome.act.view.ActView" %>
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
		ActView vo = (ActView) request.getAttribute("Act");
		if (vo == null) {
			vo = new ActView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>锟斤拷锟斤拷查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="Act.mc?method=updateActJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">主键 ：</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">活动标题 ：</td>
					<td>
						<%=vo.getTitle()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ：</td>
					<td>
						<%=vo.getActStarttime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">结束时间 ：</td>
					<td>
						<%=vo.getActEndtime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">活动地址 ：</td>
					<td>
						<%=vo.getActAddress()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">活动简介 ：</td>
					<td>
						<%=vo.getActDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">0 免费 1 收费 默认为0 ：</td>
					<td>
						<%=vo.getActType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">活动费用 ：</td>
					<td>
						<%=vo.getActMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">活动宣传图 ：</td>
					<td>
						<%=vo.getActPicUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建者id ：</td>
					<td>
						<%=vo.getActCreateUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">活动状态 1 审核中 2 成功 3 拒绝 4 结束 ：</td>
					<td>
						<%=vo.getActStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">成员数 默认为1 ：</td>
					<td>
						<%=vo.getActMemberCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">点赞数 默认为0 ：</td>
					<td>
						<%=vo.getActLikeCount()%>
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
						<%=vo.getChar2()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='Act.mc?method=getAllPageAct&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
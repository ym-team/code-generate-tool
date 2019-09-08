<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.szjk.dhome.act.data.ActMember" %>
<%@ page import="com.szjk.dhome.act.view.ActMemberView" %>
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
		ActMemberView vo = (ActMemberView) request.getAttribute("ActMember");
		if (vo == null) {
			vo = new ActMemberView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>锟斤拷锟斤拷查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="ActMember.mc?method=updateActMemberJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">主键 ：</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">成员id ：</td>
					<td>
						<%=vo.getMemberId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1.申请中  2.成功  3.拒绝  默认为2 ：</td>
					<td>
						<%=vo.getMemberStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1.活动创建者  2.普通参加成员 ：</td>
					<td>
						<%=vo.getMemberType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">活动id ：</td>
					<td>
						<%=vo.getActId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">参与人电话 ：</td>
					<td>
						<%=vo.getActPhone()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">跟随人数 默认为1 即本人 ：</td>
					<td>
						<%=vo.getMemberFollowCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">参与人姓名 ：</td>
					<td>
						<%=vo.getActMemberName()%>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='ActMember.mc?method=getAllPageActMember&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
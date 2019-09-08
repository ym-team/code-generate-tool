<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.szjk.dhome.discovers.data.DiscoverPushSocialAdvice" %>
<%@ page import="com.szjk.dhome.discovers.view.DiscoverPushSocialAdviceView" %>
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
		DiscoverPushSocialAdviceView vo = (DiscoverPushSocialAdviceView) request.getAttribute("DiscoverPushSocialAdvice");
		if (vo == null) {
			vo = new DiscoverPushSocialAdviceView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>锟斤拷锟斤拷查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="DiscoverPushSocialAdvice.mc?method=updateDiscoverPushSocialAdviceJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">主键 ：</td>
					<td>
						<%=vo.getDiscoverPushOfficeId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送者id ：</td>
					<td>
						<%=vo.getPushUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送者信息 ：</td>
					<td>
						<%=vo.getPushUserInfo()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">来自于哪个用户的id ：</td>
					<td>
						<%=vo.getFromUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">来自于哪个用户信息 ：</td>
					<td>
						<%=vo.getFromUserInfo()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">接收者id ：</td>
					<td>
						<%=vo.getToUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">接收者信息 ：</td>
					<td>
						<%=vo.getToUserInfo()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">父类型 ：</td>
					<td>
						<%=vo.getInnerPushType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">子类型 ：</td>
					<td>
						<%=vo.getInnerPushSubType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送标题 ：</td>
					<td>
						<%=vo.getPushServiceTitle()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送内容 ：</td>
					<td>
						<%=vo.getPushServiceMsg()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送业务id ：</td>
					<td>
						<%=vo.getPushServiceId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">事件状态 ：</td>
					<td>
						<%=vo.getPushServiceMsgStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ：</td>
					<td>
						<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">操作时间 ：</td>
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
					<td class="titleright">1已处理 2未处理 ：</td>
					<td>
						<%=vo.getPushStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">多少钱 *100 ：</td>
					<td>
						<%=vo.getPushServiceMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">该事件数量 ：</td>
					<td>
						<%=vo.getPushServiceCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">该事件类型 ：</td>
					<td>
						<%=vo.getPushServiceType()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='DiscoverPushSocialAdvice.mc?method=getAllPageDiscoverPushSocialAdvice&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
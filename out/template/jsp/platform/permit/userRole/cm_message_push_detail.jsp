<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.szjk.dhome.dhome.data.CmMessagePush" %>
<%@ page import="com.szjk.dhome.dhome.view.CmMessagePushView" %>
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
		CmMessagePushView vo = (CmMessagePushView) request.getAttribute("CmMessagePush");
		if (vo == null) {
			vo = new CmMessagePushView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>锟斤拷锟斤拷查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="CmMessagePush.mc?method=updateCmMessagePushJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">主键 ：</td>
					<td>
						<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">收件人 ：</td>
					<td>
						<%=vo.getReceiverUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">频道/类型（1：新闻，2：病例分享，3：疑难求助，4：好友申请，5：系统推送提醒，6：圈子申请通知，7：圈子邀请通知，8：圈子帖子通知，9：帖子评论，10：帖子转发，11：帖子点赞，12：私信聊天） ：</td>
					<td>
						<%=vo.getPushType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送人 ：</td>
					<td>
						<%=vo.getPushUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">圈子ID ：</td>
					<td>
						<%=vo.getPushCoterieId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getSubType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送内容 ：</td>
					<td>
						<%=vo.getPushContent()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送数量 ：</td>
					<td>
						<%=vo.getPushMsgCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ：</td>
					<td>
						<%=vo.getCreateDate()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送时间 ：</td>
					<td>
						<%=vo.getOpTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">时间戳（排序） ：</td>
					<td>
						<%=vo.getOpTimestamp()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">状态 ：</td>
					<td>
						<%=vo.getStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送说明 ：</td>
					<td>
						<%=vo.getPushDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送备注 ：</td>
					<td>
						<%=vo.getPushRemark()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='CmMessagePush.mc?method=getAllPageCmMessagePush&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
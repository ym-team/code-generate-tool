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
		TAtActivityDetailView vo = (TAtActivityDetailView) request.getAttribute("TAtActivityDetail");
		if (vo == null) {
			vo = new TAtActivityDetailView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>锟斤拷锟斤拷�鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="TAtActivityDetail.mc?method=updateTAtActivityDetailJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">明细id ��</td>
					<td>
	                	<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">登录者id 没有则是0 ��</td>
					<td>
	                	<%=vo.getUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">触发时间 ��</td>
					<td>
	                	<%=vo.getTriggerTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">触发类型 1 查看 2 分享 ��</td>
					<td>
	                	<%=vo.getTriggerType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">设备类型 1 ios  2 android 3 web ��</td>
					<td>
	                	<%=vo.getDeviceType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">来源渠道 1 微信  2 app ��</td>
					<td>
	                	<%=vo.getChannelType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">活动id ��</td>
					<td>
	                	<%=vo.getActivityId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">更新时间 ��</td>
					<td>
	                	<%=vo.getUpdateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ��</td>
					<td>
	                	<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">备注 ��</td>
					<td>
	                	<%=vo.getRemark()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TAtActivityDetail.mc?method=getAllPageTAtActivityDetail&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
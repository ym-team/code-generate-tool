<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.pm.bill.data.TAtActivityChristmas" %>
<%@ page import="com.evergrande.pm.bill.view.TAtActivityChristmasView" %>
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
		TAtActivityChristmasView vo = (TAtActivityChristmasView) request.getAttribute("TAtActivityChristmas");
		if (vo == null) {
			vo = new TAtActivityChristmasView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>圣诞活动�?�鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="TAtActivityChristmas.mc?method=updateTAtActivityChristmasJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">主键 ��</td>
					<td>
	                	<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">用户id 0为游�? ��</td>
					<td>
	                	<%=vo.getUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">卡片制作时间 ��</td>
					<td>
	                	<%=vo.getMakeTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">前端八种卡片id ��</td>
					<td>
	                	<%=vo.getCardId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1:无效 2有效 默认2 ��</td>
					<td>
	                	<%=vo.getStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">卡片制作者电�? 游客�?0 ��</td>
					<td>
	                	<%=vo.getUserPhone()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">卡片祝福�? ��</td>
					<td>
	                	<%=vo.getChristmasWord()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">分享�? ��</td>
					<td>
	                	<%=vo.getShareCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">打开次数 ��</td>
					<td>
	                	<%=vo.getOpenCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">更新时间 ��</td>
					<td>
	                	<%=vo.getDbUpdateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ��</td>
					<td>
	                	<%=vo.getDbCreateTime()%>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TAtActivityChristmas.mc?method=getAllPageTAtActivityChristmas&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
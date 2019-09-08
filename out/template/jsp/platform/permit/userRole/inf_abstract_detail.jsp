<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.InfAbstract" %>
<%@ page import="server1.InfAbstractView" %>
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
		InfAbstractView vo = (InfAbstractView) request.getAttribute("InfAbstract");
		if (vo == null) {
			vo = new InfAbstractView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>���Բ鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="InfAbstract.mc?method=updateInfAbstractJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getInfId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��Ѷ���� ��</td>
					<td>
						<%=vo.getInfTitle()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ѶͼƬ ��</td>
					<td>
						<%=vo.getInfImg()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ѶժҪ����ʱ�� ��</td>
					<td>
						<%=vo.getInfCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ժҪ���ʱ�� ��</td>
					<td>
						<%=vo.getInfGerTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ժҪ���ʱ�� ��</td>
					<td>
						<%=vo.getInfSignTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ժҪ��չͼƬ ��</td>
					<td>
						<%=vo.getImgExtend()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ժҪ��ǩ ��</td>
					<td>
						<%=vo.getInfTab()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ժҪ��ʾ���� ��</td>
					<td>
						<%=vo.getInfShowType()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='InfAbstract.mc?method=getAllPageInfAbstract&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
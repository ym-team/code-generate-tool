<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.UserCmccFamily" %>
<%@ page import="server1.UserCmccFamilyView" %>
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
		UserCmccFamilyView vo = (UserCmccFamilyView) request.getAttribute("UserCmccFamily");
		if (vo == null) {
			vo = new UserCmccFamilyView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>���Բ鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="UserCmccFamily.mc?method=updateUserCmccFamilyJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�û�Id ������ ��</td>
					<td>
						<%=vo.getUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�û�Id ������ ��</td>
					<td>
						<%=vo.getFamilyUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�Ա� 1���� 2��Ů ��</td>
					<td>
						<%=vo.getSex()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�ֻ���� ��</td>
					<td>
						<%=vo.getPhone()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա�� ��</td>
					<td>
						<%=vo.getType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ͷ�� ��</td>
					<td>
						<%=vo.getAvatar()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������� ��</td>
					<td>
						<%=vo.getBirthday()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�Ƿ�Ĭ�ϣ�1���ǣ�2���� ��</td>
					<td>
						<%=vo.getIsdefault()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�Ƿ���Ч��0����Ч��1����Ч�� ��</td>
					<td>
						<%=vo.getIsvalid()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ʱ�� ��</td>
					<td>
						<%=vo.getOptTime()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='UserCmccFamily.mc?method=getAllPageUserCmccFamily&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
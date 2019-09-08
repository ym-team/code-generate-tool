<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.SysPtUserRole" %>
<%@ page import="server1.SysPtUserRoleView" %>
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
		SysPtUserRoleView vo = (SysPtUserRoleView) request.getAttribute("SysPtUserRole");
		if (vo == null) {
			vo = new SysPtUserRoleView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>�û���ɫ��Ӧ�鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="SysPtUserRole.mc?method=updateSysPtUserRoleJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">�û��˻� ��</td>
					<td>
						<%=vo.getUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������Ľ�ɫ ��</td>
					<td>
						<%=vo.getRoleId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ɫ��� ��</td>
					<td>
						<%=vo.getRoleName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�û���� ��</td>
					<td>
						<%=vo.getUserName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">˵�� ��</td>
					<td>
						<%=vo.getNote()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ ��</td>
					<td>
						<%=vo.getOperator()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
	                	<%=vo.getOperatTime()%>
   					</td>
				</tr>
<%
request.setAttribute("SYS_PT_USER_ROLE.INUSE",CodeFactory.getCodeListByCodeType("SYS_PT_USER_ROLE.INUSE"));
%>
				<tr> 
					<!-- ����ö�ٿ�-->
    				<td class="titleright">ʹ�ñ�־ ��</td>
    										
    				<td><html:label name="in_use" collection="SYS_PT_USER_ROLE.INUSE"  value="<%=vo.getInUse()%>" labelKey="code" onlyName="true" labelProperty="name"/>
											</td>
    			</tr>                    
				<tr>
					<td class="titleright">�ַ��������ֶ�1 ��</td>
					<td>
						<%=vo.getChar1()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='SysPtUserRole.mc?method=getAllPageSysPtUserRole&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
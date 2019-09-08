<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.UserCmcc" %>
<%@ page import="server1.UserCmccView" %>
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
		UserCmccView vo = (UserCmccView) request.getAttribute("UserCmcc");
		if (vo == null) {
			vo = new UserCmccView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>���Բ鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="UserCmcc.mc?method=updateUserCmccJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���ƶ��û�id ��</td>
					<td>
						<%=vo.getCmccUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�û��� ��</td>
					<td>
						<%=vo.getUserName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">app(�Լ�app),cmcc(�й��ƶ�) ��</td>
					<td>
						<%=vo.getUserType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ͷ�� ��</td>
					<td>
						<%=vo.getFaceUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getPasswd()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�绰 ��</td>
					<td>
						<%=vo.getTelPhone()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getEmail()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getAge()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�Ա�1�� 2Ů ��</td>
					<td>
						<%=vo.getSex()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�ǳ� ��</td>
					<td>
						<%=vo.getNickName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��� ��</td>
					<td>
						<%=vo.getDescrib()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�ó� ��</td>
					<td>
						<%=vo.getGoodat()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����id ��</td>
					<td>
						<%=vo.getDeptId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ְ��id ��</td>
					<td>
						<%=vo.getJobId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ַ ��</td>
					<td>
						<%=vo.getAddress()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ʡ ��</td>
					<td>
						<%=vo.getProvinceCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�� ��</td>
					<td>
						<%=vo.getCityCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�� ��</td>
					<td>
						<%=vo.getDistrictCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getOptTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ע ��</td>
					<td>
						<%=vo.getRemark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ע1 ��</td>
					<td>
						<%=vo.getChar1()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ע2 ��</td>
					<td>
						<%=vo.getChar2()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='UserCmcc.mc?method=getAllPageUserCmcc&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
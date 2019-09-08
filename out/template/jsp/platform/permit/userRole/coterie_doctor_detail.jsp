<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.CoterieDoctor" %>
<%@ page import="server1.CoterieDoctorView" %>
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
		CoterieDoctorView vo = (CoterieDoctorView) request.getAttribute("CoterieDoctor");
		if (vo == null) {
			vo = new CoterieDoctorView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>�����鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="CoterieDoctor.mc?method=updateCoterieDoctorJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">Ȧ�����  ϵͳȦ��ο�deptname ��</td>
					<td>
						<%=vo.getName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">Ȧ�ӽ��� ��</td>
					<td>
						<%=vo.getCoterieDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">Ȧ��ͼ ���6��ͼ ��|�ָ� ��</td>
					<td>
						<%=vo.getPicUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 ��Ȧ 2 ˽Ȧ ��</td>
					<td>
						<%=vo.getCoterieType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">Ȧ��ҵ������ ��δ���� Ĭ��Ϊ0 ��</td>
					<td>
						<%=vo.getCoterieServiceType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 �����   2 �ɹ�   3 �ܾ�   4. ��ɢ ��</td>
					<td>
						<%=vo.getCoterieStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������id ��</td>
					<td>
						<%=vo.getCreateUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��Ա�� ��</td>
					<td>
						<%=vo.getMemberCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ϵͳȦ Ϊ deptId    �Խ�ȦΪ 0 ��</td>
					<td>
						<%=vo.getSubSystemType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 ϵͳĬ��Ȧ  2 �Խ�Ȧ ��</td>
					<td>
						<%=vo.getSystemType()%>
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
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='CoterieDoctor.mc?method=getAllPageCoterieDoctor&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
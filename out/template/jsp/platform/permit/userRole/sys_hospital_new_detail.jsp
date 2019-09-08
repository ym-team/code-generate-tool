<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.SysHospitalNew" %>
<%@ page import="server1.SysHospitalNewView" %>
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
		SysHospitalNewView vo = (SysHospitalNewView) request.getAttribute("SysHospitalNew");
		if (vo == null) {
			vo = new SysHospitalNewView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>���Բ鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="SysHospitalNew.mc?method=updateSysHospitalNewJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ҽԺ��� ��</td>
					<td>
						<%=vo.getHospitalName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ʡ��� ��</td>
					<td>
						<%=vo.getProvinceCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���б�� ��</td>
					<td>
						<%=vo.getCityCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ�  ��</td>
					<td>
						<%=vo.getHospitalLevel()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������  ��</td>
					<td>
						<%=vo.getHospitalLevelName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪ ��</td>
					<td>
						<%=vo.getHospitalPro()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ҽԺ���� ��� ��</td>
					<td>
						<%=vo.getHospitalProName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 ���Ϲ��� 2 ���߳��� 3 ���߳��� ��</td>
					<td>
						<%=vo.getCtityLevel()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1:���� 2������ ��</td>
					<td>
						<%=vo.getHospitalSts()%>
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
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='SysHospitalNew.mc?method=getAllPageSysHospitalNew&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.SysSmsRecordNew" %>
<%@ page import="server1.SysSmsRecordNewView" %>
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
		SysSmsRecordNewView vo = (SysSmsRecordNewView) request.getAttribute("SysSmsRecordNew");
		if (vo == null) {
			vo = new SysSmsRecordNewView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>���Բ鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="SysSmsRecordNew.mc?method=updateSysSmsRecordNewJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������豸ID ��</td>
					<td>
						<%=vo.getSendUserDeviceId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ ��</td>
					<td>
						<%=vo.getSendUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������� ��</td>
					<td>
						<%=vo.getSmsContent()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���պ��� ��</td>
					<td>
						<%=vo.getRecievePhoneNum()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ҵ������ 1:ע��(��֤��) 2�һ�����(��֤��)  ��</td>
					<td>
						<%=vo.getBusiType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ƽ̨�������� ��</td>
					<td>
						<%=vo.getReturnCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ƽ̨���ر��� ��</td>
					<td>
						<%=vo.getReturnMsg()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������κ� ��</td>
					<td>
						<%=vo.getBatchId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getCreateDate()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getOpTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ע ��</td>
					<td>
						<%=vo.getRemark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ϵͳ���� 1:���߰� 2:ҽ��� ��</td>
					<td>
						<%=vo.getSysType()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='SysSmsRecordNew.mc?method=getAllPageSysSmsRecordNew&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
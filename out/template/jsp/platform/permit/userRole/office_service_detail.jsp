<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.OfficeService" %>
<%@ page import="server1.OfficeServiceView" %>
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
		OfficeServiceView vo = (OfficeServiceView) request.getAttribute("OfficeService");
		if (vo == null) {
			vo = new OfficeServiceView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>���Բ鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="OfficeService.mc?method=updateOfficeServiceJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">�����ҷ���������id ��</td>
					<td>
						<%=vo.getOfficeServiceId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������Ŀ��� ��</td>
					<td>
						<%=vo.getOfficeServiceName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������url,ƴ���ַ� ��</td>
					<td>
						<%=vo.getOfficeServiceUrls()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵����� ��</td>
					<td>
						<%=vo.getOfficeServiceType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1�����ߣ�2���ߣ�3������ ��ʱĬ���������� ��</td>
					<td>
						<%=vo.getOfficeServiceStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����������� ����һ�����������¼ʱ�����1 ��</td>
					<td>
						<%=vo.getOfficeServiceAttrCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��С��� (������������ʱ����Ҫ�б�) ��</td>
					<td>
						<%=vo.getOfficeServiceAttrMinprice()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����(������������ʱ����Ҫ�б�) ��</td>
					<td>
						<%=vo.getOfficeServiceAttrMaxprice()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������������ ��</td>
					<td>
						<%=vo.getOfficeServiceCommentCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽���������� ��</td>
					<td>
						<%=vo.getSystemType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������id ��</td>
					<td>
						<%=vo.getOfficeId()%>
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
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getRemark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���۷��� ��</td>
					<td>
						<%=vo.getOfficeServiceSold()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getPeopleNum()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�Ű����ñ�� ��</td>
					<td>
						<%=vo.getSchedualIsopen()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ϵͳ������ ��</td>
					<td>
						<%=vo.getSubSystemType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʼʱ�� ��</td>
					<td>
						<%=vo.getOfficeServiceAttrStarttime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������ʱ�� ��</td>
					<td>
						<%=vo.getOfficeServiceAttrEndtime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����ֶ� ��</td>
					<td>
						<%=vo.getChar1()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����ֶ� ��</td>
					<td>
						<%=vo.getChar2()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='OfficeService.mc?method=getAllPageOfficeService&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
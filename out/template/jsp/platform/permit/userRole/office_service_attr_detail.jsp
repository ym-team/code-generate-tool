<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.OfficeServiceAttr" %>
<%@ page import="server1.OfficeServiceAttrView" %>
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
		OfficeServiceAttrView vo = (OfficeServiceAttrView) request.getAttribute("OfficeServiceAttr");
		if (vo == null) {
			vo = new OfficeServiceAttrView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>���Բ鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="OfficeServiceAttr.mc?method=updateOfficeServiceAttrJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">�������id���� ��</td>
					<td>
						<%=vo.getOfficeServiceAttrId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�۸� ��</td>
					<td>
						<%=vo.getOfficeServiceAttrPrice()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������ԤԼ�Ƿ�ͨ��1��ͨ 2δ��ͨ ��</td>
					<td>
						<%=vo.getOfficeServiceAttrIsopen()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOfficeServiceAttrTitle()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������� ��</td>
					<td>
						<%=vo.getOfficeServiceAttrDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������ͼ ���ƴװ ��</td>
					<td>
						<%=vo.getOfficeServiceAttrUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
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
					<td class="titleright">1 ����ʱ�� ����ԤԼ  ר��ԤԼ 2Ϊ�Լ������ķ������ ��</td>
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
					<td class="titleright">����id ��</td>
					<td>
						<%=vo.getOfficeServiceId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������id ��</td>
					<td>
						<%=vo.getOfficeId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">101Ϊ����ʱ�� 102Ϊ����ԤԼ 103Ϊר��ԤԼ ��</td>
					<td>
						<%=vo.getSubSystemType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOfficeServiceAttrProficientcard()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='OfficeServiceAttr.mc?method=getAllPageOfficeServiceAttr&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
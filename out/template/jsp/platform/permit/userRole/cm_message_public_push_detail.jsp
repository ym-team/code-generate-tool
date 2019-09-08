<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.szjk.dhome.discovers.data.CmMessagePublicPush" %>
<%@ page import="com.szjk.dhome.discovers.view.CmMessagePublicPushView" %>
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
		CmMessagePublicPushView vo = (CmMessagePublicPushView) request.getAttribute("CmMessagePublicPush");
		if (vo == null) {
			vo = new CmMessagePublicPushView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>�����鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="CmMessagePublicPush.mc?method=updateCmMessagePublicPushJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getPkId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">Ƶ��/����             1: ����             2:��������             3:��������             4:��������             5:ϵͳ��������             6:Ȧ������֪ͨ             7:Ȧ������֪ͨ             8:Ȧ������֪ͨ             9:��������             10:����ת��             11:���ӵ��             12:˽��/���� ��</td>
					<td>
						<%=vo.getPushType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ ��</td>
					<td>
						<%=vo.getPushUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���������� ��</td>
					<td>
						<%=vo.getSubType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������� ��</td>
					<td>
						<%=vo.getPushContent()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���Ӵ���ʱ�� ��</td>
					<td>
						<%=vo.getCreateDate()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����˵��, ����ʹ�� ��</td>
					<td>
						<%=vo.getOpTimestamp()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getOpTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">0:  ��Ч             1:  ��Ч              ��</td>
					<td>
						<%=vo.getStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����˵�� ��</td>
					<td>
						<%=vo.getPushDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���ͱ�ע ��</td>
					<td>
						<%=vo.getPushRemark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�û�δ����:�ñ���pkid��ȥ������Ϣ�����û��Ķ����PUBLIC_PUSH_ID���ڸ�δ����,�����ֶ�д���ڳ�����ֱ�Ӵ�����ǰ̨ ��</td>
					<td>
						<%=vo.getPushMsgCount()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='CmMessagePublicPush.mc?method=getAllPageCmMessagePublicPush&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.DiscoverPushPatientAdvice" %>
<%@ page import="server1.DiscoverPushPatientAdviceView" %>
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
		DiscoverPushPatientAdviceView vo = (DiscoverPushPatientAdviceView) request.getAttribute("DiscoverPushPatientAdvice");
		if (vo == null) {
			vo = new DiscoverPushPatientAdviceView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>�����鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="DiscoverPushPatientAdvice.mc?method=updateDiscoverPushPatientAdviceJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getDiscoverPushOfficeId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������id ��</td>
					<td>
						<%=vo.getPushUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��������Ϣ ��</td>
					<td>
						<%=vo.getPushUserInfo()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������ĸ��û���id ��</td>
					<td>
						<%=vo.getFromUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������ĸ��û���Ϣ ��</td>
					<td>
						<%=vo.getFromUserInfo()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������id ��</td>
					<td>
						<%=vo.getToUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��������Ϣ ��</td>
					<td>
						<%=vo.getToUserInfo()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ ��</td>
					<td>
						<%=vo.getInnerPushType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ ��</td>
					<td>
						<%=vo.getInnerPushSubType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���ͱ��� ��</td>
					<td>
						<%=vo.getPushServiceTitle()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������� ��</td>
					<td>
						<%=vo.getPushServiceMsg()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ҵ��id ��</td>
					<td>
						<%=vo.getPushServiceId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�¼�״̬ ��</td>
					<td>
						<%=vo.getPushServiceMsgStatus()%>
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
					<td class="titleright">1�Ѵ��� 2δ���� ��</td>
					<td>
						<%=vo.getPushStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����Ǯ *100 ��</td>
					<td>
						<%=vo.getPushServiceMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���¼����� ��</td>
					<td>
						<%=vo.getPushServiceCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���¼����� ��</td>
					<td>
						<%=vo.getPushServiceType()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='DiscoverPushPatientAdvice.mc?method=getAllPageDiscoverPushPatientAdvice&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
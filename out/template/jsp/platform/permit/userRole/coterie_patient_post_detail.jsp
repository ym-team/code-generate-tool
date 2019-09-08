<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.CoteriePatientPost" %>
<%@ page import="server1.CoteriePatientPostView" %>
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
		CoteriePatientPostView vo = (CoteriePatientPostView) request.getAttribute("CoteriePatientPost");
		if (vo == null) {
			vo = new CoteriePatientPostView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>�����鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="CoteriePatientPost.mc?method=updateCoteriePatientPostJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������� ��</td>
					<td>
						<%=vo.getTitle()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������� ��</td>
					<td>
						<%=vo.getPostDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ͼƬ ���6�� ��|�ָ� ��</td>
					<td>
						<%=vo.getPicUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��Ƶurl ��</td>
					<td>
						<%=vo.getVedioUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 ���� 2 ���� ������Ӫ���� ��</td>
					<td>
						<%=vo.getPostType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 ����� 2 ͨ�� 3��ͨ�� ��</td>
					<td>
						<%=vo.getPostStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> 1 ȫƽ̨ͨ�� 2 ľ��ҽ���� 3 ľ�޽������� 4.��У����app ���� 5.��Уh5 ����  6Ȧ���� Ĭ��Ϊ6 ֻ����Ӫƽ̨���ܷ�1-5  ��</td>
					<td>
						<%=vo.getPostChannelType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">Ȧ��id ��</td>
					<td>
						<%=vo.getCoterieId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���������� ��</td>
					<td>
						<%=vo.getPostCommentCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ ��</td>
					<td>
						<%=vo.getLikeCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ת���� ��</td>
					<td>
						<%=vo.getForwardCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ ��</td>
					<td>
						<%=vo.getPostUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp ��</td>
					<td>
						<%=vo.getChannelType()%>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='CoteriePatientPost.mc?method=getAllPageCoteriePatientPost&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
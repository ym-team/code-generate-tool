<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.CoteriePostCommentSub" %>
<%@ page import="server1.CoteriePostCommentSubView" %>
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
		CoteriePostCommentSubView vo = (CoteriePostCommentSubView) request.getAttribute("CoteriePostCommentSub");
		if (vo == null) {
			vo = new CoteriePostCommentSubView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>�����鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="CoteriePostCommentSub.mc?method=updateCoteriePostCommentSubJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������id ��</td>
					<td>
						<%=vo.getFromUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�ظ����� ��</td>
					<td>
						<%=vo.getCommentSubDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��������id ��</td>
					<td>
						<%=vo.getToUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��δ���� ��</td>
					<td>
						<%=vo.getCommentSubStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 ֱ�ӻظ�������  2 �ظ������� ��</td>
					<td>
						<%=vo.getCommentSubType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����id ��</td>
					<td>
						<%=vo.getPostId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 Ȧ�� 2ƽ̨ ��</td>
					<td>
						<%=vo.getPostChannelType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����id ��</td>
					<td>
						<%=vo.getCommentId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������id ��</td>
					<td>
						<%=vo.getCommentUserId()%>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='CoteriePostCommentSub.mc?method=getAllPageCoteriePostCommentSub&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
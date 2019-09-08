<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.CoteriePostComment" %>
<%@ page import="server1.CoteriePostCommentView" %>
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
		CoteriePostCommentView vo = (CoteriePostCommentView) request.getAttribute("CoteriePostComment");
		if (vo == null) {
			vo = new CoteriePostCommentView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>�����鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="CoteriePostComment.mc?method=updateCoteriePostCommentJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���ӻظ����� ��</td>
					<td>
						<%=vo.getCommentDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 ΪȦ�ӻظ� 2 ƽ̨����ظ� ���coterie_post_public.POST_CHANNEL_TYPEֵ  ��</td>
					<td>
						<%=vo.getCommentType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�ظ�״̬ 1 ����� 2 ͨ��  3 ��ͨ�� Ĭ��Ϊ2 ��</td>
					<td>
						<%=vo.getCommentStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����û�id ��</td>
					<td>
						<%=vo.getMemberId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����id ��</td>
					<td>
						<%=vo.getPostId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">Ȧ��id ��</td>
					<td>
						<%=vo.getCoterieId()%>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='CoteriePostComment.mc?method=getAllPageCoteriePostComment&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
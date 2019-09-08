<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.szjk.dhome.coteriepatient.data.CoteriePatientRecommend" %>
<%@ page import="com.szjk.dhome.coteriepatient.view.CoteriePatientRecommendView" %>
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
	<title>查看信息</title>
	<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>	
	<!-- 自定义样式 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css"> 
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>	
</head>
<body class="bgcolor3">
	<%
		CoteriePatientRecommendView vo = (CoteriePatientRecommendView) request.getAttribute("CoteriePatientRecommend");
		if (vo == null) {
			vo = new CoteriePatientRecommendView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>锟斤拷锟斤拷查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="CoteriePatientRecommend.mc?method=updateCoteriePatientRecommendJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">主键 ：</td>
					<td>
						<%=vo.getId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">圈子名称  系统圈名参考deptname ：</td>
					<td>
						<%=vo.getName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">圈子介绍 ：</td>
					<td>
						<%=vo.getCoterieDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">圈子图 最多6张图 以|分隔 ：</td>
					<td>
						<%=vo.getPicUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 公圈 2 私圈 ：</td>
					<td>
						<%=vo.getCoterieType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">圈子业务类型 暂未启用 默认为0 ：</td>
					<td>
						<%=vo.getCoterieServiceType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 审核中   2 成功   3 拒绝   4. 解散 ：</td>
					<td>
						<%=vo.getCoterieStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建者id ：</td>
					<td>
						<%=vo.getCreateUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">用户类型 1 木棉健康 2 家校健康 3 家校app ：</td>
					<td>
						<%=vo.getChannelType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">成员数 ：</td>
					<td>
						<%=vo.getMemberCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">帖子数 ：</td>
					<td>
						<%=vo.getPostCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">系统圈 为 deptId    自建圈为 0 ：</td>
					<td>
						<%=vo.getSubSystemType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 系统默认圈  2 自建圈 ：</td>
					<td>
						<%=vo.getSystemType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ：</td>
					<td>
						<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">更新时间 ：</td>
					<td>
						<%=vo.getOptTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">备注 ：</td>
					<td>
						<%=vo.getRemark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">备注1 ：</td>
					<td>
						<%=vo.getOrder1()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1 系统数据统计来源 2 运营推荐 ：</td>
					<td>
						<%=vo.getSource()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">头像 ：</td>
					<td>
						<%=vo.getFaceUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">圈子id ：</td>
					<td>
						<%=vo.getCoterieId()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='CoteriePatientRecommend.mc?method=getAllPageCoteriePatientRecommend&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
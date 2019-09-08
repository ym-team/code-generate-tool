<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.szjk.dhome.offices.data.OfficeCopy" %>
<%@ page import="com.szjk.dhome.offices.view.OfficeCopyView" %>
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
		OfficeCopyView vo = (OfficeCopyView) request.getAttribute("OfficeCopy");
		if (vo == null) {
			vo = new OfficeCopyView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>测试查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="OfficeCopy.mc?method=updateOfficeCopyJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">主键 ：</td>
					<td>
						<%=vo.getOfficeCopyId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">工作室id ：</td>
					<td>
						<%=vo.getOfficeId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">身份证 ：</td>
					<td>
						<%=vo.getOffficeIdentifyUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">执业资格照 ：</td>
					<td>
						<%=vo.getOfficeQualificationUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">上半身照 ：</td>
					<td>
						<%=vo.getOfficeHalfbodyUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">营业执照等有多个则用， ：</td>
					<td>
						<%=vo.getOfficeBusinesslicenceUrls()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">认证人姓名 ：</td>
					<td>
						<%=vo.getOfficeMasterName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">认证人电话 ：</td>
					<td>
						<%=vo.getOfficeMasterPhone()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过 ：</td>
					<td>
						<%=vo.getOfficeStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ：</td>
					<td>
						<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">操作时间 ：</td>
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
					<td class="titleright">工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室 ：</td>
					<td>
						<%=vo.getOfficeType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">使用的邀请码 ：</td>
					<td>
						<%=vo.getInviteCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getInviteCodePhone()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='OfficeCopy.mc?method=getAllPageOfficeCopy&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
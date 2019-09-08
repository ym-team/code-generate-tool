<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.szjk.dhome.offices.data.Office" %>
<%@ page import="com.szjk.dhome.offices.view.OfficeView" %>
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
		OfficeView vo = (OfficeView) request.getAttribute("Office");
		if (vo == null) {
			vo = new OfficeView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>测试查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="Office.mc?method=updateOfficeJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">工作室主键 ：</td>
					<td>
						<%=vo.getOfficeId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">上半身照 ：</td>
					<td>
						<%=vo.getOfficeHalfbodyUrl()%>
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
					<td class="titleright">营业执照等有多个则用， ：</td>
					<td>
						<%=vo.getOfficeBusinesslicenceUrls()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">工作室手写地址默认等于高德地址 ：</td>
					<td>
						<%=vo.getOfficeHandAddress()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">工作室高德地址 ：</td>
					<td>
						<%=vo.getOfficeGaodeAddress()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">工作室高德地址gps经度 ：</td>
					<td>
						<%=vo.getOfficeGaodeAddrGpsLng()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">工作室高德地址gps纬 度 ：</td>
					<td>
						<%=vo.getOfficeGaodeAddrGpsLat()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">工作室规模(1.个人,2.3-10人 3.10-50人. 4.50-100人 ) ：</td>
					<td>
						<%=vo.getOfficeScope()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室 ：</td>
					<td>
						<%=vo.getOfficeType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">工作室名称 ：</td>
					<td>
						<%=vo.getOfficeName()%>
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
					<td class="titleright">工作室头图 ：</td>
					<td>
						<%=vo.getOfficeFaceUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">工作室背景图　最多六个url,拼成字符串 ：</td>
					<td>
						<%=vo.getOfficeBackgroundUrls()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getOfficeDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">几星评价 最多5星 ：</td>
					<td>
						<%=vo.getOfficeCommentStar()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">服务态度(分数) 最多100 ：</td>
					<td>
						<%=vo.getOfficeServiceAttitude()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">服务质量(分数) 最多100 ：</td>
					<td>
						<%=vo.getOfficeServiceQuality()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">响应速度(分数) ：</td>
					<td>
						<%=vo.getOfficeResponseSpeed()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">推送动态数 发一条推文这个字段加1 ：</td>
					<td>
						<%=vo.getOfficePushmessagetxtcount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">服务项总数 每新增一项目服务这个字段加1 ：</td>
					<td>
						<%=vo.getOfficeServicesCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">粉丝数 每新增一个粉丝，这里加1 ：</td>
					<td>
						<%=vo.getOfficeFollowersCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">工作室创建者 这里写了这个创建者成员,成员表也同时把这个创建者的userid写进去 ：</td>
					<td>
						<%=vo.getOfficeCreateUserId()%>
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
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getOfficeProficientcount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getOfficeIsSetGoodat()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getInviteCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getOfficeCopyId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getOfficeCopyStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getOfficeBusinesslicenceUrlsStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getInviteCodePhone()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
						<%=vo.getOfficeDoctorVisitSchedual()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='Office.mc?method=getAllPageOffice&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
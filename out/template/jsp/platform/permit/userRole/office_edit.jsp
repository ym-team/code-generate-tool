<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.szjk.dhome.offices.data.Office" %>
<%@ page import="com.szjk.dhome.offices.view.OfficeView" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>
		<%
			if (request.getAttribute("Office") == null) {
				out.print( "新增信息" );
			} else {
				out.print( "修改信息" );
			}
		%>
	</title>
	
	
	<!--jquery 放最上面，否则可能样式冲突导致效果丢失  -->
	<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
 
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>	
	<!-- 自定义样式 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css"> 
	<!-- 开关 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap-switch.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap-switch.min.js"></script>	
 
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
	<!-- 需要引入的js -->
	<script type="text/javascript" src="${contextPath}/skins/library/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${contextPath}/skins/js/common/jLayer/jLayer.js"></script>	
	<script type="text/javascript" src="${contextPath}/skins/js/common/jValidation/jValidate.js"></script>

	<script type="text/javascript"> 
		function updateOffice() {
			jQuery.ajax({
				url : "${contextPath}/Office.mc?method=updateOffice",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/Office.mc?method=getAllPageOffice";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
				}
	
			});
		}
	
		function insertOffice() {
			jQuery.ajax({
				url : "${contextPath}/Office.mc?method=insertOffice",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual != "") {
						alert("新增成功！");
						window.location.href = "${contextPath}/Office.mc?method=getAllPageOffice";
					} else {
						alert("新增失败！");
					}
				},
				error : function(result) {
					alert("新增失败！");
				}
	
			});
		}
		function submitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			var val = $g("PK").value;
			if ( val == "" || val == null ) {
				$("#form1").attr("action", "${contextPath}/Office.mc?method=insertOfficeJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/Office.mc?method=updateOfficeJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertOffice();
			} else {
				updateOffice();
			}
		}
		}
			$(function(){
			//时间控件调用
			$('input[class^=date]').focus(function(){
				WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd'});
			});
		});
		
	</script>
</head>
<body class="bg-fd">
<ul class="breadcrumb">
  <li class="active">测试修改</li>
</ul>


	<%
		OfficeView view = (OfficeView) request.getAttribute("Office");
		if (view == null) {
			view = new OfficeView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/Office.mc?method=updateOfficeJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">工作室主键 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeId" value="<%=view.getOfficeId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">上半身照 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeHalfbodyUrl" value="<%=view.getOfficeHalfbodyUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">身份证 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="offficeIdentifyUrl" value="<%=view.getOffficeIdentifyUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">执业资格照 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeQualificationUrl" value="<%=view.getOfficeQualificationUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">营业执照等有多个则用， ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeBusinesslicenceUrls" value="<%=view.getOfficeBusinesslicenceUrls()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">工作室手写地址默认等于高德地址 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeHandAddress" value="<%=view.getOfficeHandAddress()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">工作室高德地址 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeGaodeAddress" value="<%=view.getOfficeGaodeAddress()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">工作室高德地址gps经度 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeGaodeAddrGpsLng" value="<%=view.getOfficeGaodeAddrGpsLng()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">工作室高德地址gps纬 度 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeGaodeAddrGpsLat" value="<%=view.getOfficeGaodeAddrGpsLat()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">工作室规模(1.个人,2.3-10人 3.10-50人. 4.50-100人 ) ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeScope" value="<%=view.getOfficeScope()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeType" value="<%=view.getOfficeType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">工作室名称 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeName" value="<%=view.getOfficeName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">认证人姓名 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeMasterName" value="<%=view.getOfficeMasterName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">认证人电话 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeMasterPhone" value="<%=view.getOfficeMasterPhone()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeStatus" value="<%=view.getOfficeStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">工作室头图 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeFaceUrl" value="<%=view.getOfficeFaceUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">工作室背景图　最多六个url,拼成字符串 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeBackgroundUrls" value="<%=view.getOfficeBackgroundUrls()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeDesc" value="<%=view.getOfficeDesc()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">几星评价 最多5星 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeCommentStar" value="<%=view.getOfficeCommentStar()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">服务态度(分数) 最多100 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttitude" value="<%=view.getOfficeServiceAttitude()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">服务质量(分数) 最多100 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceQuality" value="<%=view.getOfficeServiceQuality()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">响应速度(分数) ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeResponseSpeed" value="<%=view.getOfficeResponseSpeed()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送动态数 发一条推文这个字段加1 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officePushmessagetxtcount" value="<%=view.getOfficePushmessagetxtcount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">服务项总数 每新增一项目服务这个字段加1 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServicesCount" value="<%=view.getOfficeServicesCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">粉丝数 每新增一个粉丝，这里加1 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeFollowersCount" value="<%=view.getOfficeFollowersCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">工作室创建者 这里写了这个创建者成员,成员表也同时把这个创建者的userid写进去 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeCreateUserId" value="<%=view.getOfficeCreateUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">创建时间 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="createTime" value="<%=view.getCreateTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">操作时间 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="optTime" value="<%=view.getOptTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">备注 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="remark" value="<%=view.getRemark()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeProficientcount" value="<%=view.getOfficeProficientcount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeIsSetGoodat" value="<%=view.getOfficeIsSetGoodat()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="inviteCode" value="<%=view.getInviteCode()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeCopyId" value="<%=view.getOfficeCopyId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeCopyStatus" value="<%=view.getOfficeCopyStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeBusinesslicenceUrlsStatus" value="<%=view.getOfficeBusinesslicenceUrlsStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="inviteCodePhone" value="<%=view.getInviteCodePhone()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeDoctorVisitSchedual" value="<%=view.getOfficeDoctorVisitSchedual()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form提交"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax提交"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/Office.mc?method=getAllPageOffice'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.szjk.dhome.discovers.data.DiscoverPushSocialAdvice" %>
<%@ page import="com.szjk.dhome.discovers.view.DiscoverPushSocialAdviceView" %>
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
			if (request.getAttribute("DiscoverPushSocialAdvice") == null) {
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
		function updateDiscoverPushSocialAdvice() {
			jQuery.ajax({
				url : "${contextPath}/DiscoverPushSocialAdvice.mc?method=updateDiscoverPushSocialAdvice",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/DiscoverPushSocialAdvice.mc?method=getAllPageDiscoverPushSocialAdvice";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
				}
	
			});
		}
	
		function insertDiscoverPushSocialAdvice() {
			jQuery.ajax({
				url : "${contextPath}/DiscoverPushSocialAdvice.mc?method=insertDiscoverPushSocialAdvice",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType != "") {
						alert("新增成功！");
						window.location.href = "${contextPath}/DiscoverPushSocialAdvice.mc?method=getAllPageDiscoverPushSocialAdvice";
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
				$("#form1").attr("action", "${contextPath}/DiscoverPushSocialAdvice.mc?method=insertDiscoverPushSocialAdviceJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/DiscoverPushSocialAdvice.mc?method=updateDiscoverPushSocialAdviceJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertDiscoverPushSocialAdvice();
			} else {
				updateDiscoverPushSocialAdvice();
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
  <li class="active">锟斤拷锟斤拷修改</li>
</ul>


	<%
		DiscoverPushSocialAdviceView view = (DiscoverPushSocialAdviceView) request.getAttribute("DiscoverPushSocialAdvice");
		if (view == null) {
			view = new DiscoverPushSocialAdviceView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/DiscoverPushSocialAdvice.mc?method=updateDiscoverPushSocialAdviceJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">主键 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="discoverPushOfficeId" value="<%=view.getDiscoverPushOfficeId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送者id ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushUserId" value="<%=view.getPushUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送者信息 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushUserInfo" value="<%=view.getPushUserInfo()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">来自于哪个用户的id ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="fromUserId" value="<%=view.getFromUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">来自于哪个用户信息 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="fromUserInfo" value="<%=view.getFromUserInfo()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">接收者id ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="toUserId" value="<%=view.getToUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">接收者信息 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="toUserInfo" value="<%=view.getToUserInfo()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">父类型 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="innerPushType" value="<%=view.getInnerPushType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">子类型 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="innerPushSubType" value="<%=view.getInnerPushSubType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送标题 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceTitle" value="<%=view.getPushServiceTitle()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送内容 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceMsg" value="<%=view.getPushServiceMsg()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送业务id ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceId" value="<%=view.getPushServiceId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">事件状态 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceMsgStatus" value="<%=view.getPushServiceMsgStatus()%>"/>
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
					<td class="textr">1已处理 2未处理 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushStatus" value="<%=view.getPushStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">多少钱 *100 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceMoney" value="<%=view.getPushServiceMoney()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">该事件数量 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceCount" value="<%=view.getPushServiceCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">该事件类型 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceType" value="<%=view.getPushServiceType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form提交"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax提交"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/DiscoverPushSocialAdvice.mc?method=getAllPageDiscoverPushSocialAdvice'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
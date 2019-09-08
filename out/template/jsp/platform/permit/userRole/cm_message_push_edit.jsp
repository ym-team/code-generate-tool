<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.szjk.dhome.dhome.data.CmMessagePush" %>
<%@ page import="com.szjk.dhome.dhome.view.CmMessagePushView" %>
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
			if (request.getAttribute("CmMessagePush") == null) {
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
		function updateCmMessagePush() {
			jQuery.ajax({
				url : "${contextPath}/CmMessagePush.mc?method=updateCmMessagePush",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/CmMessagePush.mc?method=getAllPageCmMessagePush";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
				}
	
			});
		}
	
		function insertCmMessagePush() {
			jQuery.ajax({
				url : "${contextPath}/CmMessagePush.mc?method=insertCmMessagePush",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark != "") {
						alert("新增成功！");
						window.location.href = "${contextPath}/CmMessagePush.mc?method=getAllPageCmMessagePush";
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
				$("#form1").attr("action", "${contextPath}/CmMessagePush.mc?method=insertCmMessagePushJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/CmMessagePush.mc?method=updateCmMessagePushJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertCmMessagePush();
			} else {
				updateCmMessagePush();
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
		CmMessagePushView view = (CmMessagePushView) request.getAttribute("CmMessagePush");
		if (view == null) {
			view = new CmMessagePushView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/CmMessagePush.mc?method=updateCmMessagePushJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">主键 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pkId" value="<%=view.getPkId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">收件人 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="receiverUserId" value="<%=view.getReceiverUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">频道/类型（1：新闻，2：病例分享，3：疑难求助，4：好友申请，5：系统推送提醒，6：圈子申请通知，7：圈子邀请通知，8：圈子帖子通知，9：帖子评论，10：帖子转发，11：帖子点赞，12：私信聊天） ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushType" value="<%=view.getPushType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送人 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushUserId" value="<%=view.getPushUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">圈子ID ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushCoterieId" value="<%=view.getPushCoterieId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="subType" value="<%=view.getSubType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送内容 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushContent" value="<%=view.getPushContent()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送数量 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushMsgCount" value="<%=view.getPushMsgCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">创建时间 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="createDate" value="<%=view.getCreateDate()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送时间 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="opTime" value="<%=view.getOpTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">时间戳（排序） ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="opTimestamp" value="<%=view.getOpTimestamp()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">状态 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="status" value="<%=view.getStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送说明 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushDesc" value="<%=view.getPushDesc()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">推送备注 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushRemark" value="<%=view.getPushRemark()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form提交"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax提交"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/CmMessagePush.mc?method=getAllPageCmMessagePush'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
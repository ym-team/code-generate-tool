<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.szjk.dhome.act.data.ActMember" %>
<%@ page import="com.szjk.dhome.act.view.ActMemberView" %>
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
			if (request.getAttribute("ActMember") == null) {
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
		function updateActMember() {
			jQuery.ajax({
				url : "${contextPath}/ActMember.mc?method=updateActMember",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/ActMember.mc?method=getAllPageActMember";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
				}
	
			});
		}
	
		function insertActMember() {
			jQuery.ajax({
				url : "${contextPath}/ActMember.mc?method=insertActMember",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.id,memberId,memberStatus,memberType,actId,actPhone,memberFollowCount,actMemberName,createTime,optTime,remark,char1 != "") {
						alert("新增成功！");
						window.location.href = "${contextPath}/ActMember.mc?method=getAllPageActMember";
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
				$("#form1").attr("action", "${contextPath}/ActMember.mc?method=insertActMemberJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/ActMember.mc?method=updateActMemberJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertActMember();
			} else {
				updateActMember();
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
		ActMemberView view = (ActMemberView) request.getAttribute("ActMember");
		if (view == null) {
			view = new ActMemberView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/ActMember.mc?method=updateActMemberJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "id,memberId,memberStatus,memberType,actId,actPhone,memberFollowCount,actMemberName,createTime,optTime,remark,char1" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">主键 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="id" value="<%=view.getId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">成员id ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="memberId" value="<%=view.getMemberId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1.申请中  2.成功  3.拒绝  默认为2 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="memberStatus" value="<%=view.getMemberStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1.活动创建者  2.普通参加成员 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="memberType" value="<%=view.getMemberType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">活动id ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="actId" value="<%=view.getActId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">参与人电话 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="actPhone" value="<%=view.getActPhone()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">跟随人数 默认为1 即本人 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="memberFollowCount" value="<%=view.getMemberFollowCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">参与人姓名 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="actMemberName" value="<%=view.getActMemberName()%>"/>
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
					<td class="textr">更新时间 ：</td>
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
					<td class="textr">备注1 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="char1" value="<%=view.getChar1()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form提交"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax提交"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/ActMember.mc?method=getAllPageActMember'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
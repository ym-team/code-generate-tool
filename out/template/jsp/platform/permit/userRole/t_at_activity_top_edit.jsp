<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.evergrande.pm.bill.data.TAtActivityTop" %>
<%@ page import="com.evergrande.pm.bill.view.TAtActivityTopView" %>
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
			if (request.getAttribute("TAtActivityTop") == null) {
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
		function updateTAtActivityTop() {
			jQuery.ajax({
				url : "${contextPath}/TAtActivityTop.mc?method=updateTAtActivityTop",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/TAtActivityTop.mc?method=getAllPageTAtActivityTop";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
				}
	
			});
		}
	
		function insertTAtActivityTop() {
			jQuery.ajax({
				url : "${contextPath}/TAtActivityTop.mc?method=insertTAtActivityTop",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.pkId,activityName,activityDesc,activityStartTime,activityEndTime,status,updateTime,createTime,remark != "") {
						alert("新增成功！");
						window.location.href = "${contextPath}/TAtActivityTop.mc?method=getAllPageTAtActivityTop";
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
				$("#form1").attr("action", "${contextPath}/TAtActivityTop.mc?method=insertTAtActivityTopJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/TAtActivityTop.mc?method=updateTAtActivityTopJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertTAtActivityTop();
			} else {
				updateTAtActivityTop();
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
  <li class="active">娲诲姩琛?修改</li>
</ul>


	<%
		TAtActivityTopView view = (TAtActivityTopView) request.getAttribute("TAtActivityTop");
		if (view == null) {
			view = new TAtActivityTopView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/TAtActivityTop.mc?method=updateTAtActivityTopJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "pkId,activityName,activityDesc,activityStartTime,activityEndTime,status,updateTime,createTime,remark" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">娲诲姩id ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="pkId" value="<%=view.getPkId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">娲诲姩鍚嶇О ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="activityName" value="<%=view.getActivityName()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">娲诲姩鎻忚堪 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="activityDesc" value="<%=view.getActivityDesc()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">娲诲姩寮?濮嬫椂闂? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="activityStartTime" value="<%=view.getActivityStartTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">娲诲姩缁撴潫鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="activityEndTime" value="<%=view.getActivityEndTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">1 姝ｅ父 2 鍋滅敤 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="status" value="<%=view.getStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏇存柊鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="updateTime" value="<%=view.getUpdateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍒涘缓鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="createTime" value="<%=view.getCreateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">澶囨敞 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="remark" value="<%=view.getRemark()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form提交"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax提交"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TAtActivityTop.mc?method=getAllPageTAtActivityTop'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.evergrande.pm.bill.data.TPmExceptionToPreypayRecord" %>
<%@ page import="com.evergrande.pm.bill.view.TPmExceptionToPreypayRecordView" %>
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
			if (request.getAttribute("TPmExceptionToPreypayRecord") == null) {
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
		function updateTPmExceptionToPreypayRecord() {
			jQuery.ajax({
				url : "${contextPath}/TPmExceptionToPreypayRecord.mc?method=updateTPmExceptionToPreypayRecord",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/TPmExceptionToPreypayRecord.mc?method=getAllPageTPmExceptionToPreypayRecord";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
				}
	
			});
		}
	
		function insertTPmExceptionToPreypayRecord() {
			jQuery.ajax({
				url : "${contextPath}/TPmExceptionToPreypayRecord.mc?method=insertTPmExceptionToPreypayRecord",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.exceptionPrepayId,exceptionBillCode,ncPrepayId,ncPrepayTime,ncPrepayName,ncPrepayMoney,ncStatus,optUserId,updateTime,createTime,remark != "") {
						alert("新增成功！");
						window.location.href = "${contextPath}/TPmExceptionToPreypayRecord.mc?method=getAllPageTPmExceptionToPreypayRecord";
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
				$("#form1").attr("action", "${contextPath}/TPmExceptionToPreypayRecord.mc?method=insertTPmExceptionToPreypayRecordJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/TPmExceptionToPreypayRecord.mc?method=updateTPmExceptionToPreypayRecordJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertTPmExceptionToPreypayRecord();
			} else {
				updateTPmExceptionToPreypayRecord();
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
  <li class="active">閿熸枻鎷烽敓鏂ゆ嫹修改</li>
</ul>


	<%
		TPmExceptionToPreypayRecordView view = (TPmExceptionToPreypayRecordView) request.getAttribute("TPmExceptionToPreypayRecord");
		if (view == null) {
			view = new TPmExceptionToPreypayRecordView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/TPmExceptionToPreypayRecord.mc?method=updateTPmExceptionToPreypayRecordJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "exceptionPrepayId,exceptionBillCode,ncPrepayId,ncPrepayTime,ncPrepayName,ncPrepayMoney,ncStatus,optUserId,updateTime,createTime,remark" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">寮傚父杞敮浠樿褰曚富閿? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="exceptionPrepayId" value="<%=view.getExceptionPrepayId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">寮傚父鍗曡〃billcode ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="exceptionBillCode" value="<%=view.getExceptionBillCode()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">棰勭即璐瑰崟鍙? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPrepayId" value="<%=view.getNcPrepayId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">棰勭即璐规椂闂? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPrepayTime" value="<%=view.getNcPrepayTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">棰勭即璐规柟妗? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPrepayName" value="<%=view.getNcPrepayName()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">棰勭即閲戦 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPrepayMoney" value="<%=view.getNcPrepayMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">0:鏃犳晥 1鏈夋晥 榛樿1 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncStatus" value="<%=view.getNcStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鎿嶄綔鑰卛d ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="optUserId" value="<%=view.getOptUserId()%>"/>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TPmExceptionToPreypayRecord.mc?method=getAllPageTPmExceptionToPreypayRecord'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
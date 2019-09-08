<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.evergrande.pm.bill.data.TPmHousePrepayHistoryTest" %>
<%@ page import="com.evergrande.pm.bill.view.TPmHousePrepayHistoryTestView" %>
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
			if (request.getAttribute("TPmHousePrepayHistoryTest") == null) {
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
		function updateTPmHousePrepayHistoryTest() {
			jQuery.ajax({
				url : "${contextPath}/TPmHousePrepayHistoryTest.mc?method=updateTPmHousePrepayHistoryTest",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/TPmHousePrepayHistoryTest.mc?method=getAllPageTPmHousePrepayHistoryTest";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
				}
	
			});
		}
	
		function insertTPmHousePrepayHistoryTest() {
			jQuery.ajax({
				url : "${contextPath}/TPmHousePrepayHistoryTest.mc?method=insertTPmHousePrepayHistoryTest",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.pkId,houseId,prepayCategoryId,dbUpdateTime != "") {
						alert("新增成功！");
						window.location.href = "${contextPath}/TPmHousePrepayHistoryTest.mc?method=getAllPageTPmHousePrepayHistoryTest";
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
				$("#form1").attr("action", "${contextPath}/TPmHousePrepayHistoryTest.mc?method=insertTPmHousePrepayHistoryTestJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/TPmHousePrepayHistoryTest.mc?method=updateTPmHousePrepayHistoryTestJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertTPmHousePrepayHistoryTest();
			} else {
				updateTPmHousePrepayHistoryTest();
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
  <li class="active">娴嬭瘯修改</li>
</ul>


	<%
		TPmHousePrepayHistoryTestView view = (TPmHousePrepayHistoryTestView) request.getAttribute("TPmHousePrepayHistoryTest");
		if (view == null) {
			view = new TPmHousePrepayHistoryTestView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/TPmHousePrepayHistoryTest.mc?method=updateTPmHousePrepayHistoryTestJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "pkId,houseId,prepayCategoryId,dbUpdateTime" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">涓婚敭 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="pkId" value="<%=view.getPkId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鎴夸骇涓婚敭 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="houseId" value="<%=view.getHouseId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏀惰垂椤圭洰ID ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="prepayCategoryId" value="<%=view.getPrepayCategoryId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">db鏇存柊鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="dbUpdateTime" value="<%=view.getDbUpdateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form提交"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax提交"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TPmHousePrepayHistoryTest.mc?method=getAllPageTPmHousePrepayHistoryTest'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
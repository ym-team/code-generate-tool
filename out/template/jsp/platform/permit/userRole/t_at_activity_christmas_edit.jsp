<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.evergrande.pm.bill.data.TAtActivityChristmas" %>
<%@ page import="com.evergrande.pm.bill.view.TAtActivityChristmasView" %>
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
			if (request.getAttribute("TAtActivityChristmas") == null) {
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
		function updateTAtActivityChristmas() {
			jQuery.ajax({
				url : "${contextPath}/TAtActivityChristmas.mc?method=updateTAtActivityChristmas",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/TAtActivityChristmas.mc?method=getAllPageTAtActivityChristmas";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
				}
	
			});
		}
	
		function insertTAtActivityChristmas() {
			jQuery.ajax({
				url : "${contextPath}/TAtActivityChristmas.mc?method=insertTAtActivityChristmas",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.pkId,userId,makeTime,cardId,status,userPhone,christmasWord,shareCount,openCount,dbUpdateTime,dbCreateTime,remark != "") {
						alert("新增成功！");
						window.location.href = "${contextPath}/TAtActivityChristmas.mc?method=getAllPageTAtActivityChristmas";
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
				$("#form1").attr("action", "${contextPath}/TAtActivityChristmas.mc?method=insertTAtActivityChristmasJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/TAtActivityChristmas.mc?method=updateTAtActivityChristmasJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertTAtActivityChristmas();
			} else {
				updateTAtActivityChristmas();
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
  <li class="active">鍦ｈ癁娲诲姩琛?修改</li>
</ul>


	<%
		TAtActivityChristmasView view = (TAtActivityChristmasView) request.getAttribute("TAtActivityChristmas");
		if (view == null) {
			view = new TAtActivityChristmasView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/TAtActivityChristmas.mc?method=updateTAtActivityChristmasJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "pkId,userId,makeTime,cardId,status,userPhone,christmasWord,shareCount,openCount,dbUpdateTime,dbCreateTime,remark" )%>" />
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
					<td class="textr">鐢ㄦ埛id 0涓烘父瀹? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="userId" value="<%=view.getUserId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍗＄墖鍒朵綔鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="makeTime" value="<%=view.getMakeTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍓嶇鍏鍗＄墖id ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="cardId" value="<%=view.getCardId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">1:鏃犳晥 2鏈夋晥 榛樿2 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="status" value="<%=view.getStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍗＄墖鍒朵綔鑰呯數璇? 娓稿涓?0 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="userPhone" value="<%=view.getUserPhone()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍗＄墖绁濈璇? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="christmasWord" value="<%=view.getChristmasWord()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍒嗕韩鏁? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="shareCount" value="<%=view.getShareCount()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鎵撳紑娆℃暟 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="openCount" value="<%=view.getOpenCount()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏇存柊鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="dbUpdateTime" value="<%=view.getDbUpdateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍒涘缓鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="dbCreateTime" value="<%=view.getDbCreateTime()%>"/>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TAtActivityChristmas.mc?method=getAllPageTAtActivityChristmas'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
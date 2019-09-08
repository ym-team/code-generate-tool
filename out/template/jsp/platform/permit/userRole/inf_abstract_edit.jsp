<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.InfAbstract" %>
<%@ page import="server1.InfAbstractView" %>
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
			if (request.getAttribute("InfAbstract") == null) {
				out.print( "������Ϣ" );
			} else {
				out.print( "�޸���Ϣ" );
			}
		%>
	</title>
	
	
	<!--jquery �������棬���������ʽ��ͻ����Ч��ʧ  -->
	<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
 
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>	
	<!-- �Զ�����ʽ -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css"> 
	<!-- ���� -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap-switch.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap-switch.min.js"></script>	
 
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
	<!-- ��Ҫ�����js -->
	<script type="text/javascript" src="${contextPath}/skins/library/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${contextPath}/skins/js/common/jLayer/jLayer.js"></script>	
	<script type="text/javascript" src="${contextPath}/skins/js/common/jValidation/jValidate.js"></script>

	<script type="text/javascript"> 
		function updateInfAbstract() {
			jQuery.ajax({
				url : "${contextPath}/InfAbstract.mc?method=updateInfAbstract",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/InfAbstract.mc?method=getAllPageInfAbstract";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertInfAbstract() {
			jQuery.ajax({
				url : "${contextPath}/InfAbstract.mc?method=insertInfAbstract",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.infId,infTitle,infImg,infCreateTime,infGerTime,infSignTime,imgExtend,infTab,infShowType != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/InfAbstract.mc?method=getAllPageInfAbstract";
					} else {
						alert("����ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("����ʧ�ܣ�");
				}
	
			});
		}
		function submitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			var val = $g("PK").value;
			if ( val == "" || val == null ) {
				$("#form1").attr("action", "${contextPath}/InfAbstract.mc?method=insertInfAbstractJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/InfAbstract.mc?method=updateInfAbstractJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertInfAbstract();
			} else {
				updateInfAbstract();
			}
		}
		}
			$(function(){
			//ʱ��ؼ�����
			$('input[class^=date]').focus(function(){
				WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd'});
			});
		});
		
	</script>
</head>
<body class="bg-fd">
<ul class="breadcrumb">
  <li class="active">�����޸�</li>
</ul>


	<%
		InfAbstractView view = (InfAbstractView) request.getAttribute("InfAbstract");
		if (view == null) {
			view = new InfAbstractView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/InfAbstract.mc?method=updateInfAbstractJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "infId,infTitle,infImg,infCreateTime,infGerTime,infSignTime,imgExtend,infTab,infShowType" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="infId" value="<%=view.getInfId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��Ѷ���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="infTitle" value="<%=view.getInfTitle()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ѶͼƬ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="infImg" value="<%=view.getInfImg()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ѶժҪ����ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="infCreateTime" value="<%=view.getInfCreateTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ժҪ���ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="infGerTime" value="<%=view.getInfGerTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ժҪ���ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="infSignTime" value="<%=view.getInfSignTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ժҪ��չͼƬ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="imgExtend" value="<%=view.getImgExtend()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ժҪ��ǩ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="infTab" value="<%=view.getInfTab()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ժҪ��ʾ���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="infShowType" value="<%=view.getInfShowType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/InfAbstract.mc?method=getAllPageInfAbstract'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
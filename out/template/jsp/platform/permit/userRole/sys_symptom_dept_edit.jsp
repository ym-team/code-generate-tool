<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.SysSymptomDept" %>
<%@ page import="server1.SysSymptomDeptView" %>
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
			if (request.getAttribute("SysSymptomDept") == null) {
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
		function updateSysSymptomDept() {
			jQuery.ajax({
				url : "${contextPath}/SysSymptomDept.mc?method=updateSysSymptomDept",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/SysSymptomDept.mc?method=getAllPageSysSymptomDept";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertSysSymptomDept() {
			jQuery.ajax({
				url : "${contextPath}/SysSymptomDept.mc?method=insertSysSymptomDept",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.partId,partName,sex,symptomId,symptomKeyWord,symptomDesc,deptId != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/SysSymptomDept.mc?method=getAllPageSysSymptomDept";
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
				$("#form1").attr("action", "${contextPath}/SysSymptomDept.mc?method=insertSysSymptomDeptJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/SysSymptomDept.mc?method=updateSysSymptomDeptJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertSysSymptomDept();
			} else {
				updateSysSymptomDept();
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
		SysSymptomDeptView view = (SysSymptomDeptView) request.getAttribute("SysSymptomDept");
		if (view == null) {
			view = new SysSymptomDeptView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/SysSymptomDept.mc?method=updateSysSymptomDeptJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "partId,partName,sex,symptomId,symptomKeyWord,symptomDesc,deptId" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">��λID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="partId" value="<%=view.getPartId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��λ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="partName" value="<%=view.getPartName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�Ա� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="sex" value="<%=view.getSex()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">֢״ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="symptomId" value="<%=view.getSymptomId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">֢״�ؼ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="symptomKeyWord" value="<%=view.getSymptomKeyWord()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">֢״���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="symptomDesc" value="<%=view.getSymptomDesc()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="deptId" value="<%=view.getDeptId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/SysSymptomDept.mc?method=getAllPageSysSymptomDept'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
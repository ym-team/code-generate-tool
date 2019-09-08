<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.SysPtUserRole" %>
<%@ page import="server1.SysPtUserRoleView" %>
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
			if (request.getAttribute("SysPtUserRole") == null) {
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
		function updateSysPtUserRole() {
			jQuery.ajax({
				url : "${contextPath}/SysPtUserRole.mc?method=updateSysPtUserRole",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/SysPtUserRole.mc?method=getAllPageSysPtUserRole";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertSysPtUserRole() {
			jQuery.ajax({
				url : "${contextPath}/SysPtUserRole.mc?method=insertSysPtUserRole",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.userId,roleId != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/SysPtUserRole.mc?method=getAllPageSysPtUserRole";
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
				$("#form1").attr("action", "${contextPath}/SysPtUserRole.mc?method=insertSysPtUserRoleJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/SysPtUserRole.mc?method=updateSysPtUserRoleJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertSysPtUserRole();
			} else {
				updateSysPtUserRole();
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
  <li class="active">�û���ɫ��Ӧ�޸�</li>
</ul>


	<%
		SysPtUserRoleView view = (SysPtUserRoleView) request.getAttribute("SysPtUserRole");
		if (view == null) {
			view = new SysPtUserRoleView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/SysPtUserRole.mc?method=updateSysPtUserRoleJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "userId,roleId" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">�û��˻� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userId" value="<%=view.getUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������Ľ�ɫ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="roleId" value="<%=view.getRoleId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ɫ��� ��</td>
					<td>

      
          <input type="text" class="input" name="roleName" value="<%=view.getRoleName()%>"/>
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û���� ��</td>
					<td>

      
          <input type="text" class="input" name="userName" value="<%=view.getUserName()%>"/>
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">˵�� ��</td>
					<td>

      
          <input type="text" class="input" name="note" value="<%=view.getNote()%>"/>
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="operator" value="<%=view.getOperator()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ʱ�� ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="operatTime" value="<%=view.getOperatTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr> 
					<!-- ����ö�ٿ�-->
    				<td class="textr">ʹ�ñ�־ ��</td>
    				<td>
						<select name="inUse" >
							<option value="1">ʹ����</option>
							<option value="0">�Ѿ���ɾ��</option>
     					</select>
    				</td>
    			</tr>                    
				<tr>
					<td class="textr">�ַ��������ֶ�1 ��</td>
					<td>

      
          <input type="text" class="input" name="char1" value="<%=view.getChar1()%>"/>
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/SysPtUserRole.mc?method=getAllPageSysPtUserRole'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
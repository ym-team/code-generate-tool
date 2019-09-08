<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.UserCmccFamily" %>
<%@ page import="server1.UserCmccFamilyView" %>
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
			if (request.getAttribute("UserCmccFamily") == null) {
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
		function updateUserCmccFamily() {
			jQuery.ajax({
				url : "${contextPath}/UserCmccFamily.mc?method=updateUserCmccFamily",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/UserCmccFamily.mc?method=getAllPageUserCmccFamily";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertUserCmccFamily() {
			jQuery.ajax({
				url : "${contextPath}/UserCmccFamily.mc?method=insertUserCmccFamily",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.id,userId,familyUserId,name,sex,phone,type,avatar,birthday,isdefault,isvalid,createTime,optTime != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/UserCmccFamily.mc?method=getAllPageUserCmccFamily";
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
				$("#form1").attr("action", "${contextPath}/UserCmccFamily.mc?method=insertUserCmccFamilyJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/UserCmccFamily.mc?method=updateUserCmccFamilyJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertUserCmccFamily();
			} else {
				updateUserCmccFamily();
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
		UserCmccFamilyView view = (UserCmccFamilyView) request.getAttribute("UserCmccFamily");
		if (view == null) {
			view = new UserCmccFamilyView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/UserCmccFamily.mc?method=updateUserCmccFamilyJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "id,userId,familyUserId,name,sex,phone,type,avatar,birthday,isdefault,isvalid,createTime,optTime" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="id" value="<%=view.getId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û�Id ������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userId" value="<%=view.getUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û�Id ������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="familyUserId" value="<%=view.getFamilyUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="name" value="<%=view.getName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�Ա� 1���� 2��Ů ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="sex" value="<%=view.getSex()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�ֻ���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="phone" value="<%=view.getPhone()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="type" value="<%=view.getType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ͷ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="avatar" value="<%=view.getAvatar()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="birthday" value="<%=view.getBirthday()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�Ƿ�Ĭ�ϣ�1���ǣ�2���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="isdefault" value="<%=view.getIsdefault()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�Ƿ���Ч��0����Ч��1����Ч�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="isvalid" value="<%=view.getIsvalid()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="createTime" value="<%=view.getCreateTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="optTime" value="<%=view.getOptTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/UserCmccFamily.mc?method=getAllPageUserCmccFamily'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.UserCmccAdviceDoctor" %>
<%@ page import="server1.UserCmccAdviceDoctorView" %>
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
			if (request.getAttribute("UserCmccAdviceDoctor") == null) {
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
		function updateUserCmccAdviceDoctor() {
			jQuery.ajax({
				url : "${contextPath}/UserCmccAdviceDoctor.mc?method=updateUserCmccAdviceDoctor",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/UserCmccAdviceDoctor.mc?method=getAllPageUserCmccAdviceDoctor";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertUserCmccAdviceDoctor() {
			jQuery.ajax({
				url : "${contextPath}/UserCmccAdviceDoctor.mc?method=insertUserCmccAdviceDoctor",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.id,adviceTitle,adviceId,diseaseId,adviceType,patientId,doctorId,comboId,moeney,adviceStatus,chnanelType,payChannelType,isOpen,createTime,optTime,expireTime,remark,char1,char2,adviceStartTime,adviceValidTime != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/UserCmccAdviceDoctor.mc?method=getAllPageUserCmccAdviceDoctor";
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
				$("#form1").attr("action", "${contextPath}/UserCmccAdviceDoctor.mc?method=insertUserCmccAdviceDoctorJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/UserCmccAdviceDoctor.mc?method=updateUserCmccAdviceDoctorJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertUserCmccAdviceDoctor();
			} else {
				updateUserCmccAdviceDoctor();
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
		UserCmccAdviceDoctorView view = (UserCmccAdviceDoctorView) request.getAttribute("UserCmccAdviceDoctor");
		if (view == null) {
			view = new UserCmccAdviceDoctorView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/UserCmccAdviceDoctor.mc?method=updateUserCmccAdviceDoctorJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "id,adviceTitle,adviceId,diseaseId,adviceType,patientId,doctorId,comboId,moeney,adviceStatus,chnanelType,payChannelType,isOpen,createTime,optTime,expireTime,remark,char1,char2,adviceStartTime,adviceValidTime" )%>" />
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
					<td class="textr">��ѯ������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="adviceTitle" value="<%=view.getAdviceTitle()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ѯ��id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="adviceId" value="<%=view.getAdviceId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">֢״�򼲲�id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="diseaseId" value="<%=view.getDiseaseId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ר�ҵ�����ͨ�� 1  2   ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="adviceType" value="<%=view.getAdviceType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û�id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="patientId" value="<%=view.getPatientId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ҽ��id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="doctorId" value="<%=view.getDoctorId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�ײ�id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="comboId" value="<%=view.getComboId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ѯ���۸� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="moeney" value="<%=view.getMoeney()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ѯ��״̬ 1 ����ѯ 2 ������ 3 ��� 4 �ܾ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="adviceStatus" value="<%=view.getAdviceStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="chnanelType" value="<%=view.getChnanelType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����֧������ 1 ΢�� 2 ֧���� 3���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="payChannelType" value="<%=view.getPayChannelType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�Ƿ��ڴ���չ�� 1 �� 2���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="isOpen" value="<%=view.getIsOpen()%>"/>
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
					<td class="textr">����ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="optTime" value="<%=view.getOptTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="expireTime" value="<%=view.getExpireTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ע ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="remark" value="<%=view.getRemark()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ע1 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="char1" value="<%=view.getChar1()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ע2 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="char2" value="<%=view.getChar2()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ѯ�����쿪ʼʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="adviceStartTime" value="<%=view.getAdviceStartTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ѯ������ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="adviceValidTime" value="<%=view.getAdviceValidTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/UserCmccAdviceDoctor.mc?method=getAllPageUserCmccAdviceDoctor'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
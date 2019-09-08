<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.UserCmccDoctorMoney" %>
<%@ page import="server1.UserCmccDoctorMoneyView" %>
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
			if (request.getAttribute("UserCmccDoctorMoney") == null) {
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
		function updateUserCmccDoctorMoney() {
			jQuery.ajax({
				url : "${contextPath}/UserCmccDoctorMoney.mc?method=updateUserCmccDoctorMoney",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/UserCmccDoctorMoney.mc?method=getAllPageUserCmccDoctorMoney";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertUserCmccDoctorMoney() {
			jQuery.ajax({
				url : "${contextPath}/UserCmccDoctorMoney.mc?method=insertUserCmccDoctorMoney",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.id,adviceId,patientId,doctorId,comboId,income,moneyStatus,payChannelType,channelType,createTime,optTime,remark,char1,char2 != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/UserCmccDoctorMoney.mc?method=getAllPageUserCmccDoctorMoney";
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
				$("#form1").attr("action", "${contextPath}/UserCmccDoctorMoney.mc?method=insertUserCmccDoctorMoneyJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/UserCmccDoctorMoney.mc?method=updateUserCmccDoctorMoneyJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertUserCmccDoctorMoney();
			} else {
				updateUserCmccDoctorMoney();
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
		UserCmccDoctorMoneyView view = (UserCmccDoctorMoneyView) request.getAttribute("UserCmccDoctorMoney");
		if (view == null) {
			view = new UserCmccDoctorMoneyView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/UserCmccDoctorMoney.mc?method=updateUserCmccDoctorMoneyJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "id,adviceId,patientId,doctorId,comboId,income,moneyStatus,payChannelType,channelType,createTime,optTime,remark,char1,char2" )%>" />
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
					<td class="textr">��ѯid ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="adviceId" value="<%=view.getAdviceId()%>"/>
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
					<td class="textr">���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="income" value="<%=view.getIncome()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����״̬ 1 �ѽ��� 2 δ���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="moneyStatus" value="<%=view.getMoneyStatus()%>"/>
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
					<td class="textr">������Դ APP,CMCC,BOC ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="channelType" value="<%=view.getChannelType()%>"/>
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
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/UserCmccDoctorMoney.mc?method=getAllPageUserCmccDoctorMoney'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
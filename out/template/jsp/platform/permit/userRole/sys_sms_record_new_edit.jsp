<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.SysSmsRecordNew" %>
<%@ page import="server1.SysSmsRecordNewView" %>
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
			if (request.getAttribute("SysSmsRecordNew") == null) {
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
		function updateSysSmsRecordNew() {
			jQuery.ajax({
				url : "${contextPath}/SysSmsRecordNew.mc?method=updateSysSmsRecordNew",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/SysSmsRecordNew.mc?method=getAllPageSysSmsRecordNew";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertSysSmsRecordNew() {
			jQuery.ajax({
				url : "${contextPath}/SysSmsRecordNew.mc?method=insertSysSmsRecordNew",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.pkId,sendUserDeviceId,sendUserId,smsContent,recievePhoneNum,busiType,returnCode,returnMsg,batchId,createDate,opTime,remark,sysType != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/SysSmsRecordNew.mc?method=getAllPageSysSmsRecordNew";
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
				$("#form1").attr("action", "${contextPath}/SysSmsRecordNew.mc?method=insertSysSmsRecordNewJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/SysSmsRecordNew.mc?method=updateSysSmsRecordNewJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertSysSmsRecordNew();
			} else {
				updateSysSmsRecordNew();
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
		SysSmsRecordNewView view = (SysSmsRecordNewView) request.getAttribute("SysSmsRecordNew");
		if (view == null) {
			view = new SysSmsRecordNewView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/SysSmsRecordNew.mc?method=updateSysSmsRecordNewJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "pkId,sendUserDeviceId,sendUserId,smsContent,recievePhoneNum,busiType,returnCode,returnMsg,batchId,createDate,opTime,remark,sysType" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pkId" value="<%=view.getPkId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������豸ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="sendUserDeviceId" value="<%=view.getSendUserDeviceId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="sendUserId" value="<%=view.getSendUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="smsContent" value="<%=view.getSmsContent()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���պ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="recievePhoneNum" value="<%=view.getRecievePhoneNum()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ҵ������ 1:ע��(��֤��) 2�һ�����(��֤��)  ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="busiType" value="<%=view.getBusiType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ƽ̨�������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="returnCode" value="<%=view.getReturnCode()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ƽ̨���ر��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="returnMsg" value="<%=view.getReturnMsg()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������κ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="batchId" value="<%=view.getBatchId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="createDate" value="<%=view.getCreateDate()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="opTime" value="<%=view.getOpTime()%>"/>
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
					<td class="textr">ϵͳ���� 1:���߰� 2:ҽ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="sysType" value="<%=view.getSysType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/SysSmsRecordNew.mc?method=getAllPageSysSmsRecordNew'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
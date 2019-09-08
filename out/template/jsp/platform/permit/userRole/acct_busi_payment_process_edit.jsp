<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.AcctBusiPaymentProcess" %>
<%@ page import="server1.AcctBusiPaymentProcessView" %>
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
			if (request.getAttribute("AcctBusiPaymentProcess") == null) {
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
		function updateAcctBusiPaymentProcess() {
			jQuery.ajax({
				url : "${contextPath}/AcctBusiPaymentProcess.mc?method=updateAcctBusiPaymentProcess",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/AcctBusiPaymentProcess.mc?method=getAllPageAcctBusiPaymentProcess";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertAcctBusiPaymentProcess() {
			jQuery.ajax({
				url : "${contextPath}/AcctBusiPaymentProcess.mc?method=insertAcctBusiPaymentProcess",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.pkId,subOrderId,fromAccountId,toAccountId,payFee,payStatus,payDesc,createDate,opTime,status,remark,orderSource != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/AcctBusiPaymentProcess.mc?method=getAllPageAcctBusiPaymentProcess";
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
				$("#form1").attr("action", "${contextPath}/AcctBusiPaymentProcess.mc?method=insertAcctBusiPaymentProcessJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/AcctBusiPaymentProcess.mc?method=updateAcctBusiPaymentProcessJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertAcctBusiPaymentProcess();
			} else {
				updateAcctBusiPaymentProcess();
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
		AcctBusiPaymentProcessView view = (AcctBusiPaymentProcessView) request.getAttribute("AcctBusiPaymentProcess");
		if (view == null) {
			view = new AcctBusiPaymentProcessView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/AcctBusiPaymentProcess.mc?method=updateAcctBusiPaymentProcessJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "pkId,subOrderId,fromAccountId,toAccountId,payFee,payStatus,payDesc,createDate,opTime,status,remark,orderSource" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">����ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pkId" value="<%=view.getPkId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�Ӷ���ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="subOrderId" value="<%=view.getSubOrderId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">֧���˻�ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="fromAccountId" value="<%=view.getFromAccountId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����˻�ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="toAccountId" value="<%=view.getToAccountId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">֧������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="payFee" value="<%=view.getPayFee()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">11-�½�Ԥ���� 88-ȡ��  99-����� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="payStatus" value="<%=view.getPayStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���ѻ���˵�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="payDesc" value="<%=view.getPayDesc()%>"/>
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
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="opTime" value="<%=view.getOpTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">0:  ��Ч             1:  ��Ч ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="status" value="<%=view.getStatus()%>"/>
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
					<td class="textr">������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="orderSource" value="<%=view.getOrderSource()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/AcctBusiPaymentProcess.mc?method=getAllPageAcctBusiPaymentProcess'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
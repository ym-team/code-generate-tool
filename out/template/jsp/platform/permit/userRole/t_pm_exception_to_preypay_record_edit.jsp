<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.evergrande.pm.bill.data.TPmExceptionToPreypayRecord" %>
<%@ page import="com.evergrande.pm.bill.view.TPmExceptionToPreypayRecordView" %>
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
			if (request.getAttribute("TPmExceptionToPreypayRecord") == null) {
				out.print( "������Ϣ" );
			} else {
				out.print( "�޸���Ϣ" );
			}
		%>
	</title>
	
	
	<!--jquery �������棬���������ʽ��ͻ����Ч����ʧ  -->
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
		function updateTPmExceptionToPreypayRecord() {
			jQuery.ajax({
				url : "${contextPath}/TPmExceptionToPreypayRecord.mc?method=updateTPmExceptionToPreypayRecord",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/TPmExceptionToPreypayRecord.mc?method=getAllPageTPmExceptionToPreypayRecord";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertTPmExceptionToPreypayRecord() {
			jQuery.ajax({
				url : "${contextPath}/TPmExceptionToPreypayRecord.mc?method=insertTPmExceptionToPreypayRecord",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.exceptionPrepayId,exceptionBillCode,ncPrepayId,ncPrepayTime,ncPrepayName,ncPrepayMoney,ncStatus,optUserId,updateTime,createTime,remark != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/TPmExceptionToPreypayRecord.mc?method=getAllPageTPmExceptionToPreypayRecord";
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
				$("#form1").attr("action", "${contextPath}/TPmExceptionToPreypayRecord.mc?method=insertTPmExceptionToPreypayRecordJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/TPmExceptionToPreypayRecord.mc?method=updateTPmExceptionToPreypayRecordJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertTPmExceptionToPreypayRecord();
			} else {
				updateTPmExceptionToPreypayRecord();
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
  <li class="active">锟斤拷锟斤拷�޸�</li>
</ul>


	<%
		TPmExceptionToPreypayRecordView view = (TPmExceptionToPreypayRecordView) request.getAttribute("TPmExceptionToPreypayRecord");
		if (view == null) {
			view = new TPmExceptionToPreypayRecordView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/TPmExceptionToPreypayRecord.mc?method=updateTPmExceptionToPreypayRecordJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "exceptionPrepayId,exceptionBillCode,ncPrepayId,ncPrepayTime,ncPrepayName,ncPrepayMoney,ncStatus,optUserId,updateTime,createTime,remark" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">异常转支付记录主�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="exceptionPrepayId" value="<%=view.getExceptionPrepayId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">异常单表billcode ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="exceptionBillCode" value="<%=view.getExceptionBillCode()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">预缴费单�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPrepayId" value="<%=view.getNcPrepayId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">预缴费时�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPrepayTime" value="<%=view.getNcPrepayTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">预缴费方�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPrepayName" value="<%=view.getNcPrepayName()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">预缴金额 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPrepayMoney" value="<%=view.getNcPrepayMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">0:无效 1有效 默认1 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncStatus" value="<%=view.getNcStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">操作者id ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="optUserId" value="<%=view.getOptUserId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">更新时间 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="updateTime" value="<%=view.getUpdateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">创建时间 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="createTime" value="<%=view.getCreateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">备注 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="remark" value="<%=view.getRemark()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TPmExceptionToPreypayRecord.mc?method=getAllPageTPmExceptionToPreypayRecord'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
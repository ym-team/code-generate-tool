<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.DiscoverPushPatientJxjkAdvice" %>
<%@ page import="server1.DiscoverPushPatientJxjkAdviceView" %>
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
			if (request.getAttribute("DiscoverPushPatientJxjkAdvice") == null) {
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
		function updateDiscoverPushPatientJxjkAdvice() {
			jQuery.ajax({
				url : "${contextPath}/DiscoverPushPatientJxjkAdvice.mc?method=updateDiscoverPushPatientJxjkAdvice",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/DiscoverPushPatientJxjkAdvice.mc?method=getAllPageDiscoverPushPatientJxjkAdvice";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertDiscoverPushPatientJxjkAdvice() {
			jQuery.ajax({
				url : "${contextPath}/DiscoverPushPatientJxjkAdvice.mc?method=insertDiscoverPushPatientJxjkAdvice",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/DiscoverPushPatientJxjkAdvice.mc?method=getAllPageDiscoverPushPatientJxjkAdvice";
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
				$("#form1").attr("action", "${contextPath}/DiscoverPushPatientJxjkAdvice.mc?method=insertDiscoverPushPatientJxjkAdviceJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/DiscoverPushPatientJxjkAdvice.mc?method=updateDiscoverPushPatientJxjkAdviceJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertDiscoverPushPatientJxjkAdvice();
			} else {
				updateDiscoverPushPatientJxjkAdvice();
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
		DiscoverPushPatientJxjkAdviceView view = (DiscoverPushPatientJxjkAdviceView) request.getAttribute("DiscoverPushPatientJxjkAdvice");
		if (view == null) {
			view = new DiscoverPushPatientJxjkAdviceView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/DiscoverPushPatientJxjkAdvice.mc?method=updateDiscoverPushPatientJxjkAdviceJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="discoverPushOfficeId" value="<%=view.getDiscoverPushOfficeId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushUserId" value="<%=view.getPushUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��������Ϣ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushUserInfo" value="<%=view.getPushUserInfo()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������ĸ��û���id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="fromUserId" value="<%=view.getFromUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������ĸ��û���Ϣ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="fromUserInfo" value="<%=view.getFromUserInfo()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="toUserId" value="<%=view.getToUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��������Ϣ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="toUserInfo" value="<%=view.getToUserInfo()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="innerPushType" value="<%=view.getInnerPushType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="innerPushSubType" value="<%=view.getInnerPushSubType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���ͱ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceTitle" value="<%=view.getPushServiceTitle()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceMsg" value="<%=view.getPushServiceMsg()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ҵ��id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceId" value="<%=view.getPushServiceId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�¼�״̬ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceMsgStatus" value="<%=view.getPushServiceMsgStatus()%>"/>
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
					<td class="textr">1�Ѵ��� 2δ���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushStatus" value="<%=view.getPushStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����Ǯ *100 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceMoney" value="<%=view.getPushServiceMoney()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���¼����� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceCount" value="<%=view.getPushServiceCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���¼����� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushServiceType" value="<%=view.getPushServiceType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/DiscoverPushPatientJxjkAdvice.mc?method=getAllPageDiscoverPushPatientJxjkAdvice'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
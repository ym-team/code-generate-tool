<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.szjk.dhome.dhome.data.CmMessagePush" %>
<%@ page import="com.szjk.dhome.dhome.view.CmMessagePushView" %>
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
			if (request.getAttribute("CmMessagePush") == null) {
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
		function updateCmMessagePush() {
			jQuery.ajax({
				url : "${contextPath}/CmMessagePush.mc?method=updateCmMessagePush",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/CmMessagePush.mc?method=getAllPageCmMessagePush";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertCmMessagePush() {
			jQuery.ajax({
				url : "${contextPath}/CmMessagePush.mc?method=insertCmMessagePush",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/CmMessagePush.mc?method=getAllPageCmMessagePush";
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
				$("#form1").attr("action", "${contextPath}/CmMessagePush.mc?method=insertCmMessagePushJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/CmMessagePush.mc?method=updateCmMessagePushJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertCmMessagePush();
			} else {
				updateCmMessagePush();
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
		CmMessagePushView view = (CmMessagePushView) request.getAttribute("CmMessagePush");
		if (view == null) {
			view = new CmMessagePushView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/CmMessagePush.mc?method=updateCmMessagePushJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark" )%>" />
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
					<td class="textr">�ռ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="receiverUserId" value="<%=view.getReceiverUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ƶ��/���ͣ�1�����ţ�2����������3������������4���������룬5��ϵͳ�������ѣ�6��Ȧ������֪ͨ��7��Ȧ������֪ͨ��8��Ȧ������֪ͨ��9���������ۣ�10������ת����11�����ӵ��ޣ�12��˽�����죩 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushType" value="<%=view.getPushType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushUserId" value="<%=view.getPushUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ȧ��ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushCoterieId" value="<%=view.getPushCoterieId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="subType" value="<%=view.getSubType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushContent" value="<%=view.getPushContent()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushMsgCount" value="<%=view.getPushMsgCount()%>"/>
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
					<td class="textr">ʱ��������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="opTimestamp" value="<%=view.getOpTimestamp()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">״̬ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="status" value="<%=view.getStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����˵�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushDesc" value="<%=view.getPushDesc()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���ͱ�ע ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushRemark" value="<%=view.getPushRemark()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/CmMessagePush.mc?method=getAllPageCmMessagePush'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
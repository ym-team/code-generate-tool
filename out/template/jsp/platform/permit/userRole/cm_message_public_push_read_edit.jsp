<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.CmMessagePublicPushRead" %>
<%@ page import="server1.CmMessagePublicPushReadView" %>
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
			if (request.getAttribute("CmMessagePublicPushRead") == null) {
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
		function updateCmMessagePublicPushRead() {
			jQuery.ajax({
				url : "${contextPath}/CmMessagePublicPushRead.mc?method=updateCmMessagePublicPushRead",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/CmMessagePublicPushRead.mc?method=getAllPageCmMessagePublicPushRead";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertCmMessagePublicPushRead() {
			jQuery.ajax({
				url : "${contextPath}/CmMessagePublicPushRead.mc?method=insertCmMessagePublicPushRead",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.userid,publicPushId,publicMessageDate,createtime,opTime,pushType,subType != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/CmMessagePublicPushRead.mc?method=getAllPageCmMessagePublicPushRead";
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
				$("#form1").attr("action", "${contextPath}/CmMessagePublicPushRead.mc?method=insertCmMessagePublicPushReadJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/CmMessagePublicPushRead.mc?method=updateCmMessagePublicPushReadJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertCmMessagePublicPushRead();
			} else {
				updateCmMessagePublicPushRead();
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
		CmMessagePublicPushReadView view = (CmMessagePublicPushReadView) request.getAttribute("CmMessagePublicPushRead");
		if (view == null) {
			view = new CmMessagePublicPushReadView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/CmMessagePublicPushRead.mc?method=updateCmMessagePublicPushReadJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "userid,publicPushId,publicMessageDate,createtime,opTime,pushType,subType" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">�û�ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userid" value="<%=view.getUserid()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����������ϢID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="publicPushId" value="<%=view.getPublicPushId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������Ϣʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="publicMessageDate" value="<%=view.getPublicMessageDate()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="createtime" value="<%=view.getCreatetime()%>"/>
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
					<td class="textr">Ƶ��/����             1: ����             2:�������             3:��������             4:��������             5:ϵͳ��������             6:Ȧ������֪ͨ             7:Ȧ������֪ͨ             8:Ȧ������֪ͨ             9:��������             10:����ת��             11:���ӵ��             12:˽��/���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pushType" value="<%=view.getPushType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="subType" value="<%=view.getSubType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/CmMessagePublicPushRead.mc?method=getAllPageCmMessagePublicPushRead'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
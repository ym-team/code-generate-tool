<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.CmUserCertInfo" %>
<%@ page import="server1.CmUserCertInfoView" %>
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
			if (request.getAttribute("CmUserCertInfo") == null) {
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
		function updateCmUserCertInfo() {
			jQuery.ajax({
				url : "${contextPath}/CmUserCertInfo.mc?method=updateCmUserCertInfo",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/CmUserCertInfo.mc?method=getAllPageCmUserCertInfo";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertCmUserCertInfo() {
			jQuery.ajax({
				url : "${contextPath}/CmUserCertInfo.mc?method=insertCmUserCertInfo",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.certAppId,userSeqId,certType,certId,certName,certPicUrl,createDate,verifyStatus,verifyTime,opTime,batchNumber != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/CmUserCertInfo.mc?method=getAllPageCmUserCertInfo";
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
				$("#form1").attr("action", "${contextPath}/CmUserCertInfo.mc?method=insertCmUserCertInfoJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/CmUserCertInfo.mc?method=updateCmUserCertInfoJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertCmUserCertInfo();
			} else {
				updateCmUserCertInfo();
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
		CmUserCertInfoView view = (CmUserCertInfoView) request.getAttribute("CmUserCertInfo");
		if (view == null) {
			view = new CmUserCertInfoView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/CmUserCertInfo.mc?method=updateCmUserCertInfoJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "certAppId,userSeqId,certType,certId,certName,certPicUrl,createDate,verifyStatus,verifyTime,opTime,batchNumber" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">����ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="certAppId" value="<%=view.getCertAppId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û�ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userSeqId" value="<%=view.getUserSeqId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��֤����:  1:���֤  2:ְҵ�ʸ�֤ 3:����֤ 4:��ҵ֤ 5:ѧ��֤ 6:����֤�� 7: ��֤�� 8: ��Ӫ��֤ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="certType" value="<%=view.getCertType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">֤��ID��,��ʱ���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="certId" value="<%=view.getCertId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">֤�����, ��CERT_ID���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="certName" value="<%=view.getCertName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ͼƬURL ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="certPicUrl" value="<%=view.getCertPicUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�ϴ�ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="createDate" value="<%=view.getCreateDate()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��֤״̬: 0-δ��֤ 1-�Ѿ���֤  2:��֤��ͨ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="verifyStatus" value="<%=view.getVerifyStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��֤ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="verifyTime" value="<%=view.getVerifyTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ʱ�䣨������ʱ�䣩 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="opTime" value="<%=view.getOpTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��κ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="batchNumber" value="<%=view.getBatchNumber()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/CmUserCertInfo.mc?method=getAllPageCmUserCertInfo'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
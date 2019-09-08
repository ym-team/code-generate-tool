<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.OfficeServiceAttr" %>
<%@ page import="server1.OfficeServiceAttrView" %>
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
			if (request.getAttribute("OfficeServiceAttr") == null) {
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
		function updateOfficeServiceAttr() {
			jQuery.ajax({
				url : "${contextPath}/OfficeServiceAttr.mc?method=updateOfficeServiceAttr",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/OfficeServiceAttr.mc?method=getAllPageOfficeServiceAttr";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertOfficeServiceAttr() {
			jQuery.ajax({
				url : "${contextPath}/OfficeServiceAttr.mc?method=insertOfficeServiceAttr",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.officeServiceAttrId,officeServiceAttrPrice,officeServiceAttrIsopen,officeServiceAttrTitle,officeServiceAttrDesc,officeServiceAttrUrl,officeServiceAttrStarttime,officeServiceAttrEndtime,systemType,createTime,optTime,remark,officeServiceId,officeId,subSystemType,officeServiceAttrProficientcard != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/OfficeServiceAttr.mc?method=getAllPageOfficeServiceAttr";
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
				$("#form1").attr("action", "${contextPath}/OfficeServiceAttr.mc?method=insertOfficeServiceAttrJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/OfficeServiceAttr.mc?method=updateOfficeServiceAttrJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertOfficeServiceAttr();
			} else {
				updateOfficeServiceAttr();
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
		OfficeServiceAttrView view = (OfficeServiceAttrView) request.getAttribute("OfficeServiceAttr");
		if (view == null) {
			view = new OfficeServiceAttrView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/OfficeServiceAttr.mc?method=updateOfficeServiceAttrJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "officeServiceAttrId,officeServiceAttrPrice,officeServiceAttrIsopen,officeServiceAttrTitle,officeServiceAttrDesc,officeServiceAttrUrl,officeServiceAttrStarttime,officeServiceAttrEndtime,systemType,createTime,optTime,remark,officeServiceId,officeId,subSystemType,officeServiceAttrProficientcard" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">�������id���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrId" value="<%=view.getOfficeServiceAttrId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�۸� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrPrice" value="<%=view.getOfficeServiceAttrPrice()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������ԤԼ�Ƿ�ͨ��1��ͨ 2δ��ͨ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrIsopen" value="<%=view.getOfficeServiceAttrIsopen()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrTitle" value="<%=view.getOfficeServiceAttrTitle()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrDesc" value="<%=view.getOfficeServiceAttrDesc()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������ͼ ���ƴװ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrUrl" value="<%=view.getOfficeServiceAttrUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrStarttime" value="<%=view.getOfficeServiceAttrStarttime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrEndtime" value="<%=view.getOfficeServiceAttrEndtime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 ����ʱ�� ����ԤԼ  ר��ԤԼ 2Ϊ�Լ������ķ������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="systemType" value="<%=view.getSystemType()%>"/>
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
					<td class="textr">����id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceId" value="<%=view.getOfficeServiceId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeId" value="<%=view.getOfficeId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">101Ϊ����ʱ�� 102Ϊ����ԤԼ 103Ϊר��ԤԼ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="subSystemType" value="<%=view.getSubSystemType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrProficientcard" value="<%=view.getOfficeServiceAttrProficientcard()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/OfficeServiceAttr.mc?method=getAllPageOfficeServiceAttr'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
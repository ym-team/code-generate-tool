<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.OfficeService" %>
<%@ page import="server1.OfficeServiceView" %>
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
			if (request.getAttribute("OfficeService") == null) {
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
		function updateOfficeService() {
			jQuery.ajax({
				url : "${contextPath}/OfficeService.mc?method=updateOfficeService",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/OfficeService.mc?method=getAllPageOfficeService";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertOfficeService() {
			jQuery.ajax({
				url : "${contextPath}/OfficeService.mc?method=insertOfficeService",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.officeServiceId,officeServiceName,officeServiceUrls,officeServiceType,officeServiceStatus,officeServiceAttrCount,officeServiceAttrMinprice,officeServiceAttrMaxprice,officeServiceCommentCount,systemType,officeId,createTime,optTime,remark,officeServiceSold,peopleNum,schedualIsopen,subSystemType,officeServiceAttrStarttime,officeServiceAttrEndtime,char1,char2 != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/OfficeService.mc?method=getAllPageOfficeService";
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
				$("#form1").attr("action", "${contextPath}/OfficeService.mc?method=insertOfficeServiceJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/OfficeService.mc?method=updateOfficeServiceJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertOfficeService();
			} else {
				updateOfficeService();
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
		OfficeServiceView view = (OfficeServiceView) request.getAttribute("OfficeService");
		if (view == null) {
			view = new OfficeServiceView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/OfficeService.mc?method=updateOfficeServiceJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "officeServiceId,officeServiceName,officeServiceUrls,officeServiceType,officeServiceStatus,officeServiceAttrCount,officeServiceAttrMinprice,officeServiceAttrMaxprice,officeServiceCommentCount,systemType,officeId,createTime,optTime,remark,officeServiceSold,peopleNum,schedualIsopen,subSystemType,officeServiceAttrStarttime,officeServiceAttrEndtime,char1,char2" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">�����ҷ���������id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceId" value="<%=view.getOfficeServiceId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������Ŀ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceName" value="<%=view.getOfficeServiceName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������url,ƴ���ַ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceUrls" value="<%=view.getOfficeServiceUrls()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵����� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceType" value="<%=view.getOfficeServiceType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1�����ߣ�2���ߣ�3������ ��ʱĬ���������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceStatus" value="<%=view.getOfficeServiceStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����������� ����һ�����������¼ʱ�����1 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrCount" value="<%=view.getOfficeServiceAttrCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��С��� (������������ʱ����Ҫ�б�) ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrMinprice" value="<%=view.getOfficeServiceAttrMinprice()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����(������������ʱ����Ҫ�б�) ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttrMaxprice" value="<%=view.getOfficeServiceAttrMaxprice()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceCommentCount" value="<%=view.getOfficeServiceCommentCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽���������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="systemType" value="<%=view.getSystemType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeId" value="<%=view.getOfficeId()%>"/>
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
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="remark" value="<%=view.getRemark()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���۷��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceSold" value="<%=view.getOfficeServiceSold()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="peopleNum" value="<%=view.getPeopleNum()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�Ű����ñ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="schedualIsopen" value="<%=view.getSchedualIsopen()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ϵͳ������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="subSystemType" value="<%=view.getSubSystemType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ʼʱ�� ��</td>
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
					<td class="textr">�����ֶ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="char1" value="<%=view.getChar1()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����ֶ� ��</td>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/OfficeService.mc?method=getAllPageOfficeService'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
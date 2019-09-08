<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.SysHospitalNew" %>
<%@ page import="server1.SysHospitalNewView" %>
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
			if (request.getAttribute("SysHospitalNew") == null) {
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
		function updateSysHospitalNew() {
			jQuery.ajax({
				url : "${contextPath}/SysHospitalNew.mc?method=updateSysHospitalNew",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/SysHospitalNew.mc?method=getAllPageSysHospitalNew";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertSysHospitalNew() {
			jQuery.ajax({
				url : "${contextPath}/SysHospitalNew.mc?method=insertSysHospitalNew",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.id,hospitalName,provinceCode,cityCode,hospitalLevel,hospitalLevelName,hospitalPro,hospitalProName,ctityLevel,hospitalSts,createTime,optTime,remark != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/SysHospitalNew.mc?method=getAllPageSysHospitalNew";
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
				$("#form1").attr("action", "${contextPath}/SysHospitalNew.mc?method=insertSysHospitalNewJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/SysHospitalNew.mc?method=updateSysHospitalNewJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertSysHospitalNew();
			} else {
				updateSysHospitalNew();
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
		SysHospitalNewView view = (SysHospitalNewView) request.getAttribute("SysHospitalNew");
		if (view == null) {
			view = new SysHospitalNewView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/SysHospitalNew.mc?method=updateSysHospitalNewJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "id,hospitalName,provinceCode,cityCode,hospitalLevel,hospitalLevelName,hospitalPro,hospitalProName,ctityLevel,hospitalSts,createTime,optTime,remark" )%>" />
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
					<td class="textr">ҽԺ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="hospitalName" value="<%=view.getHospitalName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ʡ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="provinceCode" value="<%=view.getProvinceCode()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���б�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="cityCode" value="<%=view.getCityCode()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ�  ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="hospitalLevel" value="<%=view.getHospitalLevel()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������  ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="hospitalLevelName" value="<%=view.getHospitalLevelName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="hospitalPro" value="<%=view.getHospitalPro()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ҽԺ���� ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="hospitalProName" value="<%=view.getHospitalProName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 ���Ϲ��� 2 ���߳��� 3 ���߳��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="ctityLevel" value="<%=view.getCtityLevel()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1:���� 2������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="hospitalSts" value="<%=view.getHospitalSts()%>"/>
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
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/SysHospitalNew.mc?method=getAllPageSysHospitalNew'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
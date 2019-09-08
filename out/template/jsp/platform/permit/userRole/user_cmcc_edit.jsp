<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.UserCmcc" %>
<%@ page import="server1.UserCmccView" %>
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
			if (request.getAttribute("UserCmcc") == null) {
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
		function updateUserCmcc() {
			jQuery.ajax({
				url : "${contextPath}/UserCmcc.mc?method=updateUserCmcc",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/UserCmcc.mc?method=getAllPageUserCmcc";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertUserCmcc() {
			jQuery.ajax({
				url : "${contextPath}/UserCmcc.mc?method=insertUserCmcc",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.id,cmccUserId,userName,userType,faceUrl,passwd,telPhone,email,age,sex,nickName,describ,goodat,deptId,jobId,address,provinceCode,cityCode,districtCode,createTime,optTime,remark,char1,char2 != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/UserCmcc.mc?method=getAllPageUserCmcc";
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
				$("#form1").attr("action", "${contextPath}/UserCmcc.mc?method=insertUserCmccJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/UserCmcc.mc?method=updateUserCmccJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertUserCmcc();
			} else {
				updateUserCmcc();
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
		UserCmccView view = (UserCmccView) request.getAttribute("UserCmcc");
		if (view == null) {
			view = new UserCmccView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/UserCmcc.mc?method=updateUserCmccJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "id,cmccUserId,userName,userType,faceUrl,passwd,telPhone,email,age,sex,nickName,describ,goodat,deptId,jobId,address,provinceCode,cityCode,districtCode,createTime,optTime,remark,char1,char2" )%>" />
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
					<td class="textr">���ƶ��û�id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="cmccUserId" value="<%=view.getCmccUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userName" value="<%=view.getUserName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">app(�Լ�app),cmcc(�й��ƶ�) ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userType" value="<%=view.getUserType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ͷ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="faceUrl" value="<%=view.getFaceUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="passwd" value="<%=view.getPasswd()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�绰 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="telPhone" value="<%=view.getTelPhone()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="email" value="<%=view.getEmail()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="age" value="<%=view.getAge()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�Ա�1�� 2Ů ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="sex" value="<%=view.getSex()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�ǳ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="nickName" value="<%=view.getNickName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="describ" value="<%=view.getDescrib()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�ó� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="goodat" value="<%=view.getGoodat()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="deptId" value="<%=view.getDeptId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ְ��id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="jobId" value="<%=view.getJobId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ַ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="address" value="<%=view.getAddress()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ʡ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="provinceCode" value="<%=view.getProvinceCode()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="cityCode" value="<%=view.getCityCode()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="districtCode" value="<%=view.getDistrictCode()%>"/>
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
					<td class="textr">��ע1 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="char1" value="<%=view.getChar1()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ע2 ��</td>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/UserCmcc.mc?method=getAllPageUserCmcc'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
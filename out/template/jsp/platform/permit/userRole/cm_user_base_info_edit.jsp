<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.CmUserBaseInfo" %>
<%@ page import="server1.CmUserBaseInfoView" %>
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
			if (request.getAttribute("CmUserBaseInfo") == null) {
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
		function updateCmUserBaseInfo() {
			jQuery.ajax({
				url : "${contextPath}/CmUserBaseInfo.mc?method=updateCmUserBaseInfo",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/CmUserBaseInfo.mc?method=getAllPageCmUserBaseInfo";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertCmUserBaseInfo() {
			jQuery.ajax({
				url : "${contextPath}/CmUserBaseInfo.mc?method=insertCmUserBaseInfo",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.userSeqId,userName,userType,sex,birthdate,province,cityCode,companyId,companyName,deptId,deptName,educationLevel,entrySchoolDate,mediaType,professionalTitle,jobTitle,userLevel,userFaceUrl,opTime,remark != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/CmUserBaseInfo.mc?method=getAllPageCmUserBaseInfo";
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
				$("#form1").attr("action", "${contextPath}/CmUserBaseInfo.mc?method=insertCmUserBaseInfoJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/CmUserBaseInfo.mc?method=updateCmUserBaseInfoJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertCmUserBaseInfo();
			} else {
				updateCmUserBaseInfo();
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
		CmUserBaseInfoView view = (CmUserBaseInfoView) request.getAttribute("CmUserBaseInfo");
		if (view == null) {
			view = new CmUserBaseInfoView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/CmUserBaseInfo.mc?method=updateCmUserBaseInfoJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "userSeqId,userName,userType,sex,birthdate,province,cityCode,companyId,companyName,deptId,deptName,educationLevel,entrySchoolDate,mediaType,professionalTitle,jobTitle,userLevel,userFaceUrl,opTime,remark" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">�û�ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userSeqId" value="<%=view.getUserSeqId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userName" value="<%=view.getUserName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û����  0:δ֪����(Ĭ��) 1:����Ա 2:ҽ��   3:ѧ�� 4:ҩ���ҵ��Ա  5:ý���ҵ��Ա  6:���� 7:���� 8:��ʿ 9:ҩ��ʦ 10:���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userType" value="<%=view.getUserType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1: ��  2:Ů ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="sex" value="<%=view.getSex()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="birthdate" value="<%=view.getBirthdate()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ʡ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="province" value="<%=view.getProvince()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="cityCode" value="<%=view.getCityCode()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��˾ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="companyId" value="<%=view.getCompanyId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��λ���(ҽԺ,ѧУ) ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="companyName" value="<%=view.getCompanyName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="deptId" value="<%=view.getDeptId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����(����)��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="deptName" value="<%=view.getDeptName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ѧ��             0:�� 1:Сѧ, 2:����,  3:��ר/����,  4:��ר/����  5:ר�� 6:ѧʿ 7:˶ʿ�о��� 8:��ʿ�о��� 9:��ʿ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="educationLevel" value="<%=view.getEducationLevel()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��ѧʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="entrySchoolDate" value="<%=view.getEntrySchoolDate()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ý������ 1:�ڿ�,  2:��ֽ  3:���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="mediaType" value="<%=view.getMediaType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ְ��             0��ְ��(��) 1.����ҽʦ��2������ҽʦ��3.����ҽʦ��4.ҽʦ, 5סԺҽʦ, 6ҽʿ,7 ����ҽʦ��8���ڣ�9������  10��ʦ��11��̣�                          ---20151105 lihui             ҽ��ְ��: 101-����ҽʦ  102-������ҽʦ 103-����ҽʦ 104-סԺҽʦ  105-����ҽʦ  106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���  111-ҽʦ 112-ҽʿ             ҩʦְ��: 201-����ҩʦ  202-������ҩʦ 203-����ҩʦ 204-ҩʦ 205-ҩʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���             ��ʿְ��: 301-���λ�ʦ  302-�����λ�ʦ 303-���ܻ�ʦ 304-��ʦ 305-��ʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���              ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="professionalTitle" value="<%=view.getProfessionalTitle()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ְλ: ����������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="jobTitle" value="<%=view.getJobTitle()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">---- 20160303  maohc             ������ÿλ���α�ʾ:�û���V|��λ��V|������֤             0ΪĬ��(δ��֤) 1Ϊͨ����֤ 2Ϊ����ͨ��             ��:             Ĭ��Ϊ 00000000             �û���Vͨ�� 10000000             �û���V����ͨ�� 20000000 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userLevel" value="<%=view.getUserLevel()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ͷ��URL ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="userFaceUrl" value="<%=view.getUserFaceUrl()%>"/>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/CmUserBaseInfo.mc?method=getAllPageCmUserBaseInfo'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.CmCoterieBase" %>
<%@ page import="server1.CmCoterieBaseView" %>
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
			if (request.getAttribute("CmCoterieBase") == null) {
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
		function updateCmCoterieBase() {
			jQuery.ajax({
				url : "${contextPath}/CmCoterieBase.mc?method=updateCmCoterieBase",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/CmCoterieBase.mc?method=getAllPageCmCoterieBase";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertCmCoterieBase() {
			jQuery.ajax({
				url : "${contextPath}/CmCoterieBase.mc?method=insertCmCoterieBase",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.coterieId,isOpen,coterieDesc,userSeqId,coterieName,coterieType,coterieFaceUrl,memberNum,coterieLevel,status,createDate,verifyTime,opTime,remark != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/CmCoterieBase.mc?method=getAllPageCmCoterieBase";
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
				$("#form1").attr("action", "${contextPath}/CmCoterieBase.mc?method=insertCmCoterieBaseJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/CmCoterieBase.mc?method=updateCmCoterieBaseJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertCmCoterieBase();
			} else {
				updateCmCoterieBase();
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
		CmCoterieBaseView view = (CmCoterieBaseView) request.getAttribute("CmCoterieBase");
		if (view == null) {
			view = new CmCoterieBaseView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/CmCoterieBase.mc?method=updateCmCoterieBaseJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "coterieId,isOpen,coterieDesc,userSeqId,coterieName,coterieType,coterieFaceUrl,memberNum,coterieLevel,status,createDate,verifyTime,opTime,remark" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">Ȧ��ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieId" value="<%=view.getCoterieId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1:����, 2�������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="isOpen" value="<%=view.getIsOpen()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ȧ������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieDesc" value="<%=view.getCoterieDesc()%>"/>
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
					<td class="textr">Ȧ�����, �����ظ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieName" value="<%=view.getCoterieName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ȧ������, 1:���� 2:��/��֯ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieType" value="<%=view.getCoterieType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ȧ��ͷ���url��ַ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieFaceUrl" value="<%=view.getCoterieFaceUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ȧ������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="memberNum" value="<%=view.getMemberNum()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ȧ�ӵȼ�V�ĵȼ� 1:δ��֤(Ĭ��) 2����ͨ��  3: Ȧ�Ӽ�V (��V) ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieLevel" value="<%=view.getCoterieLevel()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">0:  ��Ч 1:  ��Ч ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="status" value="<%=view.getStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���Ӵ���ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="createDate" value="<%=view.getCreateDate()%>"/>
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
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/CmCoterieBase.mc?method=getAllPageCmCoterieBase'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
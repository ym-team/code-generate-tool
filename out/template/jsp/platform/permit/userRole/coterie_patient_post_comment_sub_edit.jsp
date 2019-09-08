<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.CoteriePatientPostCommentSub" %>
<%@ page import="server1.CoteriePatientPostCommentSubView" %>
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
			if (request.getAttribute("CoteriePatientPostCommentSub") == null) {
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
		function updateCoteriePatientPostCommentSub() {
			jQuery.ajax({
				url : "${contextPath}/CoteriePatientPostCommentSub.mc?method=updateCoteriePatientPostCommentSub",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/CoteriePatientPostCommentSub.mc?method=getAllPageCoteriePatientPostCommentSub";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertCoteriePatientPostCommentSub() {
			jQuery.ajax({
				url : "${contextPath}/CoteriePatientPostCommentSub.mc?method=insertCoteriePatientPostCommentSub",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.id,fromUserId,fromChannelType,commentSubDesc,toUserId,toChannelType,commentSubStatus,commentSubType,postId,postChannelType,commentId,commentUserId,commentChannelType,createTime,optTime,remark,char1 != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/CoteriePatientPostCommentSub.mc?method=getAllPageCoteriePatientPostCommentSub";
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
				$("#form1").attr("action", "${contextPath}/CoteriePatientPostCommentSub.mc?method=insertCoteriePatientPostCommentSubJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/CoteriePatientPostCommentSub.mc?method=updateCoteriePatientPostCommentSubJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertCoteriePatientPostCommentSub();
			} else {
				updateCoteriePatientPostCommentSub();
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
		CoteriePatientPostCommentSubView view = (CoteriePatientPostCommentSubView) request.getAttribute("CoteriePatientPostCommentSub");
		if (view == null) {
			view = new CoteriePatientPostCommentSubView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/CoteriePatientPostCommentSub.mc?method=updateCoteriePatientPostCommentSubJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "id,fromUserId,fromChannelType,commentSubDesc,toUserId,toChannelType,commentSubStatus,commentSubType,postId,postChannelType,commentId,commentUserId,commentChannelType,createTime,optTime,remark,char1" )%>" />
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
					<td class="textr">������id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="fromUserId" value="<%=view.getFromUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="fromChannelType" value="<%=view.getFromChannelType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�ظ����� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="commentSubDesc" value="<%=view.getCommentSubDesc()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��������id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="toUserId" value="<%=view.getToUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="toChannelType" value="<%=view.getToChannelType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��δ���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="commentSubStatus" value="<%=view.getCommentSubStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 ֱ�ӻظ�������  2 �ظ������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="commentSubType" value="<%=view.getCommentSubType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="postId" value="<%=view.getPostId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 Ȧ�� 2ƽ̨ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="postChannelType" value="<%=view.getPostChannelType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="commentId" value="<%=view.getCommentId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="commentUserId" value="<%=view.getCommentUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="commentChannelType" value="<%=view.getCommentChannelType()%>"/>
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
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/CoteriePatientPostCommentSub.mc?method=getAllPageCoteriePatientPostCommentSub'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
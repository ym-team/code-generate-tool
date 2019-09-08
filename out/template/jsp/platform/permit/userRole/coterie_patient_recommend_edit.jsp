<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.szjk.dhome.coteriepatient.data.CoteriePatientRecommend" %>
<%@ page import="com.szjk.dhome.coteriepatient.view.CoteriePatientRecommendView" %>
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
			if (request.getAttribute("CoteriePatientRecommend") == null) {
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
		function updateCoteriePatientRecommend() {
			jQuery.ajax({
				url : "${contextPath}/CoteriePatientRecommend.mc?method=updateCoteriePatientRecommend",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/CoteriePatientRecommend.mc?method=getAllPageCoteriePatientRecommend";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertCoteriePatientRecommend() {
			jQuery.ajax({
				url : "${contextPath}/CoteriePatientRecommend.mc?method=insertCoteriePatientRecommend",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,order1,source,faceUrl,coterieId != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/CoteriePatientRecommend.mc?method=getAllPageCoteriePatientRecommend";
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
				$("#form1").attr("action", "${contextPath}/CoteriePatientRecommend.mc?method=insertCoteriePatientRecommendJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/CoteriePatientRecommend.mc?method=updateCoteriePatientRecommendJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertCoteriePatientRecommend();
			} else {
				updateCoteriePatientRecommend();
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
		CoteriePatientRecommendView view = (CoteriePatientRecommendView) request.getAttribute("CoteriePatientRecommend");
		if (view == null) {
			view = new CoteriePatientRecommendView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/CoteriePatientRecommend.mc?method=updateCoteriePatientRecommendJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,order1,source,faceUrl,coterieId" )%>" />
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
					<td class="textr">Ȧ������  ϵͳȦ���ο�deptname ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="name" value="<%=view.getName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ȧ�ӽ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieDesc" value="<%=view.getCoterieDesc()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ȧ��ͼ ���6��ͼ ��|�ָ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="picUrl" value="<%=view.getPicUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 ��Ȧ 2 ˽Ȧ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieType" value="<%=view.getCoterieType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ȧ��ҵ������ ��δ���� Ĭ��Ϊ0 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieServiceType" value="<%=view.getCoterieServiceType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 �����   2 �ɹ�   3 �ܾ�   4. ��ɢ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieStatus" value="<%=view.getCoterieStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="createUserId" value="<%=view.getCreateUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="channelType" value="<%=view.getChannelType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��Ա�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="memberCount" value="<%=view.getMemberCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="postCount" value="<%=view.getPostCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ϵͳȦ Ϊ deptId    �Խ�ȦΪ 0 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="subSystemType" value="<%=view.getSubSystemType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 ϵͳĬ��Ȧ  2 �Խ�Ȧ ��</td>
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
					<td class="textr">��ע1 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="order1" value="<%=view.getOrder1()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 ϵͳ����ͳ����Դ 2 ��Ӫ�Ƽ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="source" value="<%=view.getSource()%>"/>
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
					<td class="textr">Ȧ��id ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieId" value="<%=view.getCoterieId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/CoteriePatientRecommend.mc?method=getAllPageCoteriePatientRecommend'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
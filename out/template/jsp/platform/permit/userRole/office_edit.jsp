<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.szjk.dhome.offices.data.Office" %>
<%@ page import="com.szjk.dhome.offices.view.OfficeView" %>
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
			if (request.getAttribute("Office") == null) {
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
		function updateOffice() {
			jQuery.ajax({
				url : "${contextPath}/Office.mc?method=updateOffice",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/Office.mc?method=getAllPageOffice";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertOffice() {
			jQuery.ajax({
				url : "${contextPath}/Office.mc?method=insertOffice",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/Office.mc?method=getAllPageOffice";
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
				$("#form1").attr("action", "${contextPath}/Office.mc?method=insertOfficeJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/Office.mc?method=updateOfficeJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertOffice();
			} else {
				updateOffice();
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
		OfficeView view = (OfficeView) request.getAttribute("Office");
		if (view == null) {
			view = new OfficeView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/Office.mc?method=updateOfficeJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">���������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeId" value="<%=view.getOfficeId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�ϰ����� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeHalfbodyUrl" value="<%=view.getOfficeHalfbodyUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���֤ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="offficeIdentifyUrl" value="<%=view.getOffficeIdentifyUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ִҵ�ʸ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeQualificationUrl" value="<%=view.getOfficeQualificationUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">Ӫҵִ�յ��ж�����ã� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeBusinesslicenceUrls" value="<%=view.getOfficeBusinesslicenceUrls()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��������д��ַĬ�ϵ��ڸߵµ�ַ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeHandAddress" value="<%=view.getOfficeHandAddress()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����Ҹߵµ�ַ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeGaodeAddress" value="<%=view.getOfficeGaodeAddress()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����Ҹߵµ�ַgps���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeGaodeAddrGpsLng" value="<%=view.getOfficeGaodeAddrGpsLng()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����Ҹߵµ�ַgpsγ �� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeGaodeAddrGpsLat" value="<%=view.getOfficeGaodeAddrGpsLat()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����ҹ�ģ(1.����,2.3-10�� 3.10-50��. 4.50-100�� ) ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeScope" value="<%=view.getOfficeScope()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù����� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeType" value="<%=view.getOfficeType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���������� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeName" value="<%=view.getOfficeName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��֤������ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeMasterName" value="<%=view.getOfficeMasterName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��֤�˵绰 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeMasterPhone" value="<%=view.getOfficeMasterPhone()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeStatus" value="<%=view.getOfficeStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ͷͼ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeFaceUrl" value="<%=view.getOfficeFaceUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����ұ���ͼ���������url,ƴ���ַ��� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeBackgroundUrls" value="<%=view.getOfficeBackgroundUrls()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeDesc" value="<%=view.getOfficeDesc()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�������� ���5�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeCommentStar" value="<%=view.getOfficeCommentStar()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����̬��(����) ���100 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceAttitude" value="<%=view.getOfficeServiceAttitude()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��������(����) ���100 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServiceQuality" value="<%=view.getOfficeServiceQuality()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��Ӧ�ٶ�(����) ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeResponseSpeed" value="<%=view.getOfficeResponseSpeed()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���Ͷ�̬�� ��һ����������ֶμ�1 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officePushmessagetxtcount" value="<%=view.getOfficePushmessagetxtcount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">���������� ÿ����һ��Ŀ��������ֶμ�1 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeServicesCount" value="<%=view.getOfficeServicesCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��˿�� ÿ����һ����˿�������1 ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeFollowersCount" value="<%=view.getOfficeFollowersCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����Ҵ����� ����д����������߳�Ա,��Ա��Ҳͬʱ����������ߵ�useridд��ȥ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeCreateUserId" value="<%=view.getOfficeCreateUserId()%>"/>
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
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeProficientcount" value="<%=view.getOfficeProficientcount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeIsSetGoodat" value="<%=view.getOfficeIsSetGoodat()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="inviteCode" value="<%=view.getInviteCode()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeCopyId" value="<%=view.getOfficeCopyId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeCopyStatus" value="<%=view.getOfficeCopyStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeBusinesslicenceUrlsStatus" value="<%=view.getOfficeBusinesslicenceUrlsStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="inviteCodePhone" value="<%=view.getInviteCodePhone()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="officeDoctorVisitSchedual" value="<%=view.getOfficeDoctorVisitSchedual()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/Office.mc?method=getAllPageOffice'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
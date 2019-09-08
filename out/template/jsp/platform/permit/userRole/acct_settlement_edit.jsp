<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="server1.AcctSettlement" %>
<%@ page import="server1.AcctSettlementView" %>
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
			if (request.getAttribute("AcctSettlement") == null) {
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
		function updateAcctSettlement() {
			jQuery.ajax({
				url : "${contextPath}/AcctSettlement.mc?method=updateAcctSettlement",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/AcctSettlement.mc?method=getAllPageAcctSettlement";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertAcctSettlement() {
			jQuery.ajax({
				url : "${contextPath}/AcctSettlement.mc?method=insertAcctSettlement",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.pkId,mainOrderId,accountId,channelAccountId,settlementMonth,accountBalance,settleBalance,taxFee,afterTaxBalance,mgntFee,channelType,settlementType,settlementDate,opTime,status,remark,channelFee != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/AcctSettlement.mc?method=getAllPageAcctSettlement";
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
				$("#form1").attr("action", "${contextPath}/AcctSettlement.mc?method=insertAcctSettlementJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/AcctSettlement.mc?method=updateAcctSettlementJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertAcctSettlement();
			} else {
				updateAcctSettlement();
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
		AcctSettlementView view = (AcctSettlementView) request.getAttribute("AcctSettlement");
		if (view == null) {
			view = new AcctSettlementView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/AcctSettlement.mc?method=updateAcctSettlementJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "pkId,mainOrderId,accountId,channelAccountId,settlementMonth,accountBalance,settleBalance,taxFee,afterTaxBalance,mgntFee,channelType,settlementType,settlementDate,opTime,status,remark,channelFee" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">����ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="pkId" value="<%=view.getPkId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="mainOrderId" value="<%=view.getMainOrderId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�˻�ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="accountId" value="<%=view.getAccountId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����ʺ�ID ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="channelAccountId" value="<%=view.getChannelAccountId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�����·� ��ʾ:201501 ����6λ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="settlementMonth" value="<%=view.getSettlementMonth()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">�˻���� = ������ - ƽ̨����� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="accountBalance" value="<%=view.getAccountBalance()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������ (δ��ƽ̨����ѣ�˰��) ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="settleBalance" value="<%=view.getSettleBalance()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">��˰ ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="taxFee" value="<%=view.getTaxFee()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">˰���� = �˻���� - ˰�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="afterTaxBalance" value="<%=view.getAfterTaxBalance()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">ƽ̨����� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="mgntFee" value="<%=view.getMgntFee()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">������������             1: ֧����             2: ΢��֧��             3: ���� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="channelType" value="<%=view.getChannelType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����״̬             1:  �ѽ���             2:  δ����             3:  ƽ̨ת�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="settlementType" value="<%=view.getSettlementType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">����ʱ�� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="settlementDate" value="<%=view.getSettlementDate()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="opTime" value="<%=view.getOpTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">0:  ��Ч             1:  ��Ч ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="status" value="<%=view.getStatus()%>"/>
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
					<td class="textr">���������շ� ��</td>
					<td>

      
          <input type="text" class="input" validate="required" name="channelFee" value="<%=view.getChannelFee()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/AcctSettlement.mc?method=getAllPageAcctSettlement'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
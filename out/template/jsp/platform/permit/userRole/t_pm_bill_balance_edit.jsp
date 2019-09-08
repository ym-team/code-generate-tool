<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBillBalance" %>
<%@ page import="com.evergrande.pm.bill.view.TPmBillBalanceView" %>
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
			if (request.getAttribute("TPmBillBalance") == null) {
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
		function updateTPmBillBalance() {
			jQuery.ajax({
				url : "${contextPath}/TPmBillBalance.mc?method=updateTPmBillBalance",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/TPmBillBalance.mc?method=getAllPageTPmBillBalance";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertTPmBillBalance() {
			jQuery.ajax({
				url : "${contextPath}/TPmBillBalance.mc?method=insertTPmBillBalance",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.balanceId,payId,billCode,payMoney,payState,payWay,payUserid,payUserName,prePayTime,finishPayTime,businessOrderCode,paySeq,communityId,ncReceiptNum,ncReceiptMoney,rateFee,payType,thirdPartTransactionId != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/TPmBillBalance.mc?method=getAllPageTPmBillBalance";
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
				$("#form1").attr("action", "${contextPath}/TPmBillBalance.mc?method=insertTPmBillBalanceJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/TPmBillBalance.mc?method=updateTPmBillBalanceJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertTPmBillBalance();
			} else {
				updateTPmBillBalance();
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
  <li class="active">锟斤拷锟斤拷�޸�</li>
</ul>


	<%
		TPmBillBalanceView view = (TPmBillBalanceView) request.getAttribute("TPmBillBalance");
		if (view == null) {
			view = new TPmBillBalanceView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/TPmBillBalance.mc?method=updateTPmBillBalanceJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "balanceId,payId,billCode,payMoney,payState,payWay,payUserid,payUserName,prePayTime,finishPayTime,businessOrderCode,paySeq,communityId,ncReceiptNum,ncReceiptMoney,rateFee,payType,thirdPartTransactionId" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">账单结算ID ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="balanceId" value="<%=view.getBalanceId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">支付id ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="payId" value="<%=view.getPayId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">账单编号 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="billCode" value="<%=view.getBillCode()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">应缴费用（元�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="payMoney" value="<%=view.getPayMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">缴纳状�?�（0-待缴纳，1-已缴纳） ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="payState" value="<%=view.getPayState()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">支付方式（weixin,alipay,bank�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="payWay" value="<%=view.getPayWay()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">支付用户id ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="payUserid" value="<%=view.getPayUserid()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">支付用户姓名 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="payUserName" value="<%=view.getPayUserName()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">预支付时�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="prePayTime" value="<%=view.getPrePayTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">完成支付时间 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="finishPayTime" value="<%=view.getFinishPayTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">业务订单�? = 父单�? = 物业缴费推给支付模块的业务单�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="businessOrderCode" value="<%=view.getBusinessOrderCode()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">billCode支付次序 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="paySeq" value="<%=view.getPaySeq()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">小区ID ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="communityId" value="<%=view.getCommunityId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">NC收款单编�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncReceiptNum" value="<%=view.getNcReceiptNum()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">NC收款单入账金�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncReceiptMoney" value="<%=view.getNcReceiptMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">手续�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="rateFee" value="<%=view.getRateFee()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">支付类型�?0:物业缴费�?1:密蜜预缴费） ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="payType" value="<%=view.getPayType()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">第三方交易流水号 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="thirdPartTransactionId" value="<%=view.getThirdPartTransactionId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TPmBillBalance.mc?method=getAllPageTPmBillBalance'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBill" %>
<%@ page import="com.evergrande.pm.bill.view.TPmBillView" %>
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
			if (request.getAttribute("TPmBill") == null) {
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
		function updateTPmBill() {
			jQuery.ajax({
				url : "${contextPath}/TPmBill.mc?method=updateTPmBill",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/TPmBill.mc?method=getAllPageTPmBill";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertTPmBill() {
			jQuery.ajax({
				url : "${contextPath}/TPmBill.mc?method=insertTPmBill",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.billId,typeCode,communityId,houseId,money,revMoney,pendMoney,overdueMoney,overdueRevMoney,overduePendMoney,ncPayMoney,payState,year,month,bankBillFlag,companyId,ncBillId,ncHouseId,ncManageId,isDelete,billCode,ncTs,ncPkRevfare,joinTime,settlementStatus != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/TPmBill.mc?method=getAllPageTPmBill";
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
				$("#form1").attr("action", "${contextPath}/TPmBill.mc?method=insertTPmBillJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/TPmBill.mc?method=updateTPmBillJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertTPmBill();
			} else {
				updateTPmBill();
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
  <li class="active">账单�?�޸�</li>
</ul>


	<%
		TPmBillView view = (TPmBillView) request.getAttribute("TPmBill");
		if (view == null) {
			view = new TPmBillView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/TPmBill.mc?method=updateTPmBillJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "billId,typeCode,communityId,houseId,money,revMoney,pendMoney,overdueMoney,overdueRevMoney,overduePendMoney,ncPayMoney,payState,year,month,bankBillFlag,companyId,ncBillId,ncHouseId,ncManageId,isDelete,billCode,ncTs,ncPkRevfare,joinTime,settlementStatus" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">账单ID ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="billId" value="<%=view.getBillId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">账单编号 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="typeCode" value="<%=view.getTypeCode()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">小区id ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="communityId" value="<%=view.getCommunityId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">房间ID ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="houseId" value="<%=view.getHouseId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">应缴费用（元�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="money" value="<%=view.getMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">已收金额（元�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="revMoney" value="<%=view.getRevMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">待缴金额（元�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="pendMoney" value="<%=view.getPendMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">应缴滞纳金（元） ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="overdueMoney" value="<%=view.getOverdueMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">已收滞纳金（元） ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="overdueRevMoney" value="<%=view.getOverdueRevMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">待缴滞纳金（元） ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="overduePendMoney" value="<%=view.getOverduePendMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">线下支付总额 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPayMoney" value="<%=view.getNcPayMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">缴纳状�?? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="payState" value="<%=view.getPayState()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="year" value="<%=view.getYear()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="month" value="<%=view.getMonth()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">银行划扣标识 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="bankBillFlag" value="<%=view.getBankBillFlag()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">物业公司主键 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="companyId" value="<%=view.getCompanyId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncBillId" value="<%=view.getNcBillId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">房产主键 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncHouseId" value="<%=view.getNcHouseId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">管理处主�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncManageId" value="<%=view.getNcManageId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">是否删除 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="isDelete" value="<%=view.getIsDelete()%>"/>
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
					<td class="textr"> ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncTs" value="<%=view.getNcTs()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr"> ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPkRevfare" value="<%=view.getNcPkRevfare()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">同步时间 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="joinTime" value="<%=view.getJoinTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">结算状�?�（0：未结算�?1：结算中�?2：已结算�?9：锁定中�?10：等待结算） ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="settlementStatus" value="<%=view.getSettlementStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TPmBill.mc?method=getAllPageTPmBill'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
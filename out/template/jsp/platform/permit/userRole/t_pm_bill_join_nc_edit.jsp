<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBillJoinNc" %>
<%@ page import="com.evergrande.pm.bill.view.TPmBillJoinNcView" %>
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
			if (request.getAttribute("TPmBillJoinNc") == null) {
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
		function updateTPmBillJoinNc() {
			jQuery.ajax({
				url : "${contextPath}/TPmBillJoinNc.mc?method=updateTPmBillJoinNc",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("�༭�ɹ���");
						window.location.href = "${contextPath}/TPmBillJoinNc.mc?method=getAllPageTPmBillJoinNc";
					} else {
						alert("�༭ʧ�ܣ�");
					}
				},
				error : function(result) {
					alert("�༭ʧ�ܣ�");
				}
	
			});
		}
	
		function insertTPmBillJoinNc() {
			jQuery.ajax({
				url : "${contextPath}/TPmBillJoinNc.mc?method=insertTPmBillJoinNc",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.joinId,balanceId,billCode,typeCode,nrevmny,nrevlfmny,payTime,companyAccount,ncBillId,ncCompanyId,ncManageId,joinStatus,joinTime,ncTs,ncReturnStatus,ncReturnMessage,refundUserId,refundTime,createTime,dbCreateTime,dbUpdateTime,refundStatus,communityId,houseId,year,month,processingStatus,unitId != "") {
						alert("�����ɹ���");
						window.location.href = "${contextPath}/TPmBillJoinNc.mc?method=getAllPageTPmBillJoinNc";
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
				$("#form1").attr("action", "${contextPath}/TPmBillJoinNc.mc?method=insertTPmBillJoinNcJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/TPmBillJoinNc.mc?method=updateTPmBillJoinNcJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertTPmBillJoinNc();
			} else {
				updateTPmBillJoinNc();
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
		TPmBillJoinNcView view = (TPmBillJoinNcView) request.getAttribute("TPmBillJoinNc");
		if (view == null) {
			view = new TPmBillJoinNcView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/TPmBillJoinNc.mc?method=updateTPmBillJoinNcJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "joinId,balanceId,billCode,typeCode,nrevmny,nrevlfmny,payTime,companyAccount,ncBillId,ncCompanyId,ncManageId,joinStatus,joinTime,ncTs,ncReturnStatus,ncReturnMessage,refundUserId,refundTime,createTime,dbCreateTime,dbUpdateTime,refundStatus,communityId,houseId,year,month,processingStatus,unitId" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:��Ϣ¼�벿��-->
				<tr>
					<td class="textr">账单结算ID ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="joinId" value="<%=view.getJoinId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">账单结算ID ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="balanceId" value="<%=view.getBalanceId()%>"/>
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
					<td class="textr">账单类型编码 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="typeCode" value="<%=view.getTypeCode()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">缴费金额（元�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="nrevmny" value="<%=view.getNrevmny()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">滞纳金（元） ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="nrevlfmny" value="<%=view.getNrevlfmny()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">支付时间 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="payTime" value="<%=view.getPayTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">物业公司的资金账�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="companyAccount" value="<%=view.getCompanyAccount()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">nc_bill_id ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncBillId" value="<%=view.getNcBillId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">NC物业公司主键 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncCompanyId" value="<%=view.getNcCompanyId()%>"/>
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
					<td class="textr">缴纳状�?�（0-待同步，1-成功�?2-失败�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="joinStatus" value="<%=view.getJoinStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">同步NC时间 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="joinTime" value="<%=view.getJoinTime()%>"/>
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
					<td class="textr">同步NC失败后，NC返回的�??(0：未同步�? 1：执行错误； 2：未授权(安全�?验不通过)�? 3：服务已停止(不提供服�?)�? 4：费用在NC端发生变化； 5：传入的费用更新、查询参数有误； 6：NC端查询错�? �? 7：重复缴�?)�? 8：NC服务维护中；99：密蜜传入NC参数有误�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncReturnStatus" value="<%=view.getNcReturnStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">同步NC失败后，NC返回的失败描述信�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncReturnMessage" value="<%=view.getNcReturnMessage()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">�?款人id ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="refundUserId" value="<%=view.getRefundUserId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">�?款时�? ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="refundTime" value="<%=view.getRefundTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">记录添加时间 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="createTime" value="<%=view.getCreateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">创建时间 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="dbCreateTime" value="<%=view.getDbCreateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">更新时间 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="dbUpdateTime" value="<%=view.getDbUpdateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">重复缴费，�??款状态（0:默认值；1:�?款中；已�?款） ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="refundStatus" value="<%=view.getRefundStatus()%>"/>
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
					<td class="textr">房产ID ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="houseId" value="<%=view.getHouseId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">账单年份 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="year" value="<%=view.getYear()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">账单月份 ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="month" value="<%=view.getMonth()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">异常单处理状�?(0-未处�?,1-已处�?,2-人工�?款中,3-已确认�??�?,4-已确认转预存) ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="processingStatus" value="<%=view.getProcessingStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">单元ID ��</td>
					<td>
	      <input type="text" class="input" validate="required" name="unitId" value="<%=view.getUnitId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax�ύ"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TPmBillJoinNc.mc?method=getAllPageTPmBillJoinNc'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
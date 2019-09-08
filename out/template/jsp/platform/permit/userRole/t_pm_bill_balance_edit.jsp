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
				out.print( "新增信息" );
			} else {
				out.print( "修改信息" );
			}
		%>
	</title>
	
	
	<!--jquery 放最上面，否则可能样式冲突导致效果丢失  -->
	<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
 
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>	
	<!-- 自定义样式 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css"> 
	<!-- 开关 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap-switch.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap-switch.min.js"></script>	
 
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
	<!-- 需要引入的js -->
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
						alert("编辑成功！");
						window.location.href = "${contextPath}/TPmBillBalance.mc?method=getAllPageTPmBillBalance";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
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
						alert("新增成功！");
						window.location.href = "${contextPath}/TPmBillBalance.mc?method=getAllPageTPmBillBalance";
					} else {
						alert("新增失败！");
					}
				},
				error : function(result) {
					alert("新增失败！");
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
			//时间控件调用
			$('input[class^=date]').focus(function(){
				WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd'});
			});
		});
		
	</script>
</head>
<body class="bg-fd">
<ul class="breadcrumb">
  <li class="active">閿熸枻鎷烽敓鏂ゆ嫹修改</li>
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
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">璐﹀崟缁撶畻ID ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="balanceId" value="<%=view.getBalanceId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏀粯id ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="payId" value="<%=view.getPayId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">璐﹀崟缂栧彿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="billCode" value="<%=view.getBillCode()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">搴旂即璐圭敤锛堝厓锛? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="payMoney" value="<%=view.getPayMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">缂寸撼鐘舵?侊紙0-寰呯即绾筹紝1-宸茬即绾筹級 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="payState" value="<%=view.getPayState()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏀粯鏂瑰紡锛坵eixin,alipay,bank锛? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="payWay" value="<%=view.getPayWay()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏀粯鐢ㄦ埛id ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="payUserid" value="<%=view.getPayUserid()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏀粯鐢ㄦ埛濮撳悕 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="payUserName" value="<%=view.getPayUserName()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">棰勬敮浠樻椂闂? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="prePayTime" value="<%=view.getPrePayTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">瀹屾垚鏀粯鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="finishPayTime" value="<%=view.getFinishPayTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">涓氬姟璁㈠崟鍙? = 鐖跺崟鍙? = 鐗╀笟缂磋垂鎺ㄧ粰鏀粯妯″潡鐨勪笟鍔″崟鍙? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="businessOrderCode" value="<%=view.getBusinessOrderCode()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">billCode鏀粯娆″簭 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="paySeq" value="<%=view.getPaySeq()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">灏忓尯ID ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="communityId" value="<%=view.getCommunityId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">NC鏀舵鍗曠紪鍙? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncReceiptNum" value="<%=view.getNcReceiptNum()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">NC鏀舵鍗曞叆璐﹂噾棰? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncReceiptMoney" value="<%=view.getNcReceiptMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鎵嬬画璐? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="rateFee" value="<%=view.getRateFee()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏀粯绫诲瀷锛?0:鐗╀笟缂磋垂锛?1:瀵嗚湝棰勭即璐癸級 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="payType" value="<%=view.getPayType()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">绗笁鏂逛氦鏄撴祦姘村彿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="thirdPartTransactionId" value="<%=view.getThirdPartTransactionId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form提交"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax提交"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TPmBillBalance.mc?method=getAllPageTPmBillBalance'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
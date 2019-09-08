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
		function updateTPmBill() {
			jQuery.ajax({
				url : "${contextPath}/TPmBill.mc?method=updateTPmBill",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/TPmBill.mc?method=getAllPageTPmBill";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
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
						alert("新增成功！");
						window.location.href = "${contextPath}/TPmBill.mc?method=getAllPageTPmBill";
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
			//时间控件调用
			$('input[class^=date]').focus(function(){
				WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd'});
			});
		});
		
	</script>
</head>
<body class="bg-fd">
<ul class="breadcrumb">
  <li class="active">璐﹀崟琛?修改</li>
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
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">璐﹀崟ID ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="billId" value="<%=view.getBillId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">璐﹀崟缂栧彿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="typeCode" value="<%=view.getTypeCode()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">灏忓尯id ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="communityId" value="<%=view.getCommunityId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鎴块棿ID ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="houseId" value="<%=view.getHouseId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">搴旂即璐圭敤锛堝厓锛? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="money" value="<%=view.getMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">宸叉敹閲戦锛堝厓锛? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="revMoney" value="<%=view.getRevMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">寰呯即閲戦锛堝厓锛? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="pendMoney" value="<%=view.getPendMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">搴旂即婊炵撼閲戯紙鍏冿級 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="overdueMoney" value="<%=view.getOverdueMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">宸叉敹婊炵撼閲戯紙鍏冿級 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="overdueRevMoney" value="<%=view.getOverdueRevMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">寰呯即婊炵撼閲戯紙鍏冿級 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="overduePendMoney" value="<%=view.getOverduePendMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">绾夸笅鏀粯鎬婚 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPayMoney" value="<%=view.getNcPayMoney()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">缂寸撼鐘舵?? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="payState" value="<%=view.getPayState()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">骞? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="year" value="<%=view.getYear()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏈? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="month" value="<%=view.getMonth()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">閾惰鍒掓墸鏍囪瘑 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="bankBillFlag" value="<%=view.getBankBillFlag()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鐗╀笟鍏徃涓婚敭 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="companyId" value="<%=view.getCompanyId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncBillId" value="<%=view.getNcBillId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鎴夸骇涓婚敭 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncHouseId" value="<%=view.getNcHouseId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">绠＄悊澶勪富閿? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncManageId" value="<%=view.getNcManageId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏄惁鍒犻櫎 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="isDelete" value="<%=view.getIsDelete()%>"/>
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
					<td class="textr"> ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncTs" value="<%=view.getNcTs()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr"> ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncPkRevfare" value="<%=view.getNcPkRevfare()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍚屾鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="joinTime" value="<%=view.getJoinTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">缁撶畻鐘舵?侊紙0锛氭湭缁撶畻锛?1锛氱粨绠椾腑锛?2锛氬凡缁撶畻锛?9锛氶攣瀹氫腑锛?10锛氱瓑寰呯粨绠楋級 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="settlementStatus" value="<%=view.getSettlementStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form提交"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax提交"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TPmBill.mc?method=getAllPageTPmBill'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
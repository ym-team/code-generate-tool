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
		function updateTPmBillJoinNc() {
			jQuery.ajax({
				url : "${contextPath}/TPmBillJoinNc.mc?method=updateTPmBillJoinNc",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/TPmBillJoinNc.mc?method=getAllPageTPmBillJoinNc";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
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
						alert("新增成功！");
						window.location.href = "${contextPath}/TPmBillJoinNc.mc?method=getAllPageTPmBillJoinNc";
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
		TPmBillJoinNcView view = (TPmBillJoinNcView) request.getAttribute("TPmBillJoinNc");
		if (view == null) {
			view = new TPmBillJoinNcView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/TPmBillJoinNc.mc?method=updateTPmBillJoinNcJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "joinId,balanceId,billCode,typeCode,nrevmny,nrevlfmny,payTime,companyAccount,ncBillId,ncCompanyId,ncManageId,joinStatus,joinTime,ncTs,ncReturnStatus,ncReturnMessage,refundUserId,refundTime,createTime,dbCreateTime,dbUpdateTime,refundStatus,communityId,houseId,year,month,processingStatus,unitId" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">璐﹀崟缁撶畻ID ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="joinId" value="<%=view.getJoinId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">璐﹀崟缁撶畻ID ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="balanceId" value="<%=view.getBalanceId()%>"/>
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
					<td class="textr">璐﹀崟绫诲瀷缂栫爜 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="typeCode" value="<%=view.getTypeCode()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">缂磋垂閲戦锛堝厓锛? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="nrevmny" value="<%=view.getNrevmny()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">婊炵撼閲戯紙鍏冿級 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="nrevlfmny" value="<%=view.getNrevlfmny()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏀粯鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="payTime" value="<%=view.getPayTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鐗╀笟鍏徃鐨勮祫閲戣处鎴? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="companyAccount" value="<%=view.getCompanyAccount()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">nc_bill_id ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncBillId" value="<%=view.getNcBillId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">NC鐗╀笟鍏徃涓婚敭 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncCompanyId" value="<%=view.getNcCompanyId()%>"/>
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
					<td class="textr">缂寸撼鐘舵?侊紙0-寰呭悓姝ワ紝1-鎴愬姛锛?2-澶辫触锛? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="joinStatus" value="<%=view.getJoinStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍚屾NC鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="joinTime" value="<%=view.getJoinTime()%>"/>
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
					<td class="textr">鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫??(0锛氭湭鍚屾锛? 1锛氭墽琛岄敊璇紱 2锛氭湭鎺堟潈(瀹夊叏妫?楠屼笉閫氳繃)锛? 3锛氭湇鍔″凡鍋滄(涓嶆彁渚涙湇鍔?)锛? 4锛氳垂鐢ㄥ湪NC绔彂鐢熷彉鍖栵紱 5锛氫紶鍏ョ殑璐圭敤鏇存柊銆佹煡璇㈠弬鏁版湁璇紱 6锛歂C绔煡璇㈤敊璇? 锛? 7锛氶噸澶嶇即璐?)锛? 8锛歂C鏈嶅姟缁存姢涓紱99锛氬瘑铚滀紶鍏C鍙傛暟鏈夎銆? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncReturnStatus" value="<%=view.getNcReturnStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫け璐ユ弿杩颁俊鎭? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="ncReturnMessage" value="<%=view.getNcReturnMessage()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">閫?娆句汉id ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="refundUserId" value="<%=view.getRefundUserId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">閫?娆炬椂闂? ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="refundTime" value="<%=view.getRefundTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">璁板綍娣诲姞鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="createTime" value="<%=view.getCreateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍒涘缓鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="dbCreateTime" value="<%=view.getDbCreateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鏇存柊鏃堕棿 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="dbUpdateTime" value="<%=view.getDbUpdateTime()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">閲嶅缂磋垂锛岄??娆剧姸鎬侊紙0:榛樿鍊硷紱1:閫?娆句腑锛涘凡閫?娆撅級 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="refundStatus" value="<%=view.getRefundStatus()%>"/>
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
					<td class="textr">鎴夸骇ID ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="houseId" value="<%=view.getHouseId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">璐﹀崟骞翠唤 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="year" value="<%=view.getYear()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">璐﹀崟鏈堜唤 ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="month" value="<%=view.getMonth()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">寮傚父鍗曞鐞嗙姸鎬?(0-鏈鐞?,1-宸插鐞?,2-浜哄伐閫?娆句腑,3-宸茬‘璁ら??娆?,4-宸茬‘璁よ浆棰勫瓨) ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="processingStatus" value="<%=view.getProcessingStatus()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<tr>
					<td class="textr">鍗曞厓ID ：</td>
					<td>
	      <input type="text" class="input" validate="required" name="unitId" value="<%=view.getUnitId()%>"/>
     <span class="red1">*</span> 
                        </td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form提交"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax提交"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/TPmBillJoinNc.mc?method=getAllPageTPmBillJoinNc'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
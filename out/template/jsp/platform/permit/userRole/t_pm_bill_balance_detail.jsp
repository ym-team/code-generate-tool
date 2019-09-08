<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.pm.bill.data.TPmBillBalance" %>
<%@ page import="com.evergrande.pm.bill.view.TPmBillBalanceView" %>
<%@ page import="red.sea.commons.util.DateUtil" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>查看信息</title>
	<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>	
	<!-- 自定义样式 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css"> 
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>	
</head>
<body class="bgcolor3">
	<%
		TPmBillBalanceView vo = (TPmBillBalanceView) request.getAttribute("TPmBillBalance");
		if (vo == null) {
			vo = new TPmBillBalanceView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>閿熸枻鎷烽敓鏂ゆ嫹查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="TPmBillBalance.mc?method=updateTPmBillBalanceJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">璐﹀崟缁撶畻ID ：</td>
					<td>
	                	<%=vo.getBalanceId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏀粯id ：</td>
					<td>
	                	<%=vo.getPayId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">璐﹀崟缂栧彿 ：</td>
					<td>
	                	<%=vo.getBillCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">搴旂即璐圭敤锛堝厓锛? ：</td>
					<td>
	                	<%=vo.getPayMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">缂寸撼鐘舵?侊紙0-寰呯即绾筹紝1-宸茬即绾筹級 ：</td>
					<td>
	                	<%=vo.getPayState()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏀粯鏂瑰紡锛坵eixin,alipay,bank锛? ：</td>
					<td>
	                	<%=vo.getPayWay()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏀粯鐢ㄦ埛id ：</td>
					<td>
	                	<%=vo.getPayUserid()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏀粯鐢ㄦ埛濮撳悕 ：</td>
					<td>
	                	<%=vo.getPayUserName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">棰勬敮浠樻椂闂? ：</td>
					<td>
	                	<%=vo.getPrePayTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">瀹屾垚鏀粯鏃堕棿 ：</td>
					<td>
	                	<%=vo.getFinishPayTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">涓氬姟璁㈠崟鍙? = 鐖跺崟鍙? = 鐗╀笟缂磋垂鎺ㄧ粰鏀粯妯″潡鐨勪笟鍔″崟鍙? ：</td>
					<td>
	                	<%=vo.getBusinessOrderCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">billCode鏀粯娆″簭 ：</td>
					<td>
	                	<%=vo.getPaySeq()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">灏忓尯ID ：</td>
					<td>
	                	<%=vo.getCommunityId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">NC鏀舵鍗曠紪鍙? ：</td>
					<td>
	                	<%=vo.getNcReceiptNum()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">NC鏀舵鍗曞叆璐﹂噾棰? ：</td>
					<td>
	                	<%=vo.getNcReceiptMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鎵嬬画璐? ：</td>
					<td>
	                	<%=vo.getRateFee()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏀粯绫诲瀷锛?0:鐗╀笟缂磋垂锛?1:瀵嗚湝棰勭即璐癸級 ：</td>
					<td>
	                	<%=vo.getPayType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">绗笁鏂逛氦鏄撴祦姘村彿 ：</td>
					<td>
	                	<%=vo.getThirdPartTransactionId()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TPmBillBalance.mc?method=getAllPageTPmBillBalance&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
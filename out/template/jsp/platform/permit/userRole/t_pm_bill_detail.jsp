<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.pm.bill.data.TPmBill" %>
<%@ page import="com.evergrande.pm.bill.view.TPmBillView" %>
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
		TPmBillView vo = (TPmBillView) request.getAttribute("TPmBill");
		if (vo == null) {
			vo = new TPmBillView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>璐﹀崟琛?查看</a>
		</div>
		<form id="form1" name="form1" method="post" action="TPmBill.mc?method=updateTPmBillJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">璐﹀崟ID ：</td>
					<td>
	                	<%=vo.getBillId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">璐﹀崟缂栧彿 ：</td>
					<td>
	                	<%=vo.getTypeCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">灏忓尯id ：</td>
					<td>
	                	<%=vo.getCommunityId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鎴块棿ID ：</td>
					<td>
	                	<%=vo.getHouseId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">搴旂即璐圭敤锛堝厓锛? ：</td>
					<td>
	                	<%=vo.getMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">宸叉敹閲戦锛堝厓锛? ：</td>
					<td>
	                	<%=vo.getRevMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">寰呯即閲戦锛堝厓锛? ：</td>
					<td>
	                	<%=vo.getPendMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">搴旂即婊炵撼閲戯紙鍏冿級 ：</td>
					<td>
	                	<%=vo.getOverdueMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">宸叉敹婊炵撼閲戯紙鍏冿級 ：</td>
					<td>
	                	<%=vo.getOverdueRevMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">寰呯即婊炵撼閲戯紙鍏冿級 ：</td>
					<td>
	                	<%=vo.getOverduePendMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">绾夸笅鏀粯鎬婚 ：</td>
					<td>
	                	<%=vo.getNcPayMoney()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">缂寸撼鐘舵?? ：</td>
					<td>
	                	<%=vo.getPayState()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">骞? ：</td>
					<td>
	                	<%=vo.getYear()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏈? ：</td>
					<td>
	                	<%=vo.getMonth()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">閾惰鍒掓墸鏍囪瘑 ：</td>
					<td>
	                	<%=vo.getBankBillFlag()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鐗╀笟鍏徃涓婚敭 ：</td>
					<td>
	                	<%=vo.getCompanyId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
	                	<%=vo.getNcBillId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鎴夸骇涓婚敭 ：</td>
					<td>
	                	<%=vo.getNcHouseId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">绠＄悊澶勪富閿? ：</td>
					<td>
	                	<%=vo.getNcManageId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鏄惁鍒犻櫎 ：</td>
					<td>
	                	<%=vo.getIsDelete()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">璐﹀崟缂栧彿 ：</td>
					<td>
	                	<%=vo.getBillCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
	                	<%=vo.getNcTs()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ：</td>
					<td>
	                	<%=vo.getNcPkRevfare()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">鍚屾鏃堕棿 ：</td>
					<td>
	                	<%=vo.getJoinTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">缁撶畻鐘舵?侊紙0锛氭湭缁撶畻锛?1锛氱粨绠椾腑锛?2锛氬凡缁撶畻锛?9锛氶攣瀹氫腑锛?10锛氱瓑寰呯粨绠楋級 ：</td>
					<td>
	                	<%=vo.getSettlementStatus()%>
   					</td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TPmBill.mc?method=getAllPageTPmBill&start=0&pageSize=10'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
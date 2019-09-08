<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.evergrande.pm.bill.data.TPmBillJoinNc" %>
<%@ page import="com.evergrande.pm.bill.view.TPmBillJoinNcView" %>
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
	<title>�鿴��Ϣ</title>
	<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>	
	<!-- �Զ�����ʽ -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css"> 
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>	
</head>
<body class="bgcolor3">
	<%
		TPmBillJoinNcView vo = (TPmBillJoinNcView) request.getAttribute("TPmBillJoinNc");
		if (vo == null) {
			vo = new TPmBillJoinNcView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>锟斤拷锟斤拷�鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="TPmBillJoinNc.mc?method=updateTPmBillJoinNcJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">账单结算ID ��</td>
					<td>
	                	<%=vo.getJoinId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">账单结算ID ��</td>
					<td>
	                	<%=vo.getBalanceId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">账单编号 ��</td>
					<td>
	                	<%=vo.getBillCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">账单类型编码 ��</td>
					<td>
	                	<%=vo.getTypeCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">缴费金额（元�? ��</td>
					<td>
	                	<%=vo.getNrevmny()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">滞纳金（元） ��</td>
					<td>
	                	<%=vo.getNrevlfmny()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">支付时间 ��</td>
					<td>
	                	<%=vo.getPayTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">物业公司的资金账�? ��</td>
					<td>
	                	<%=vo.getCompanyAccount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">nc_bill_id ��</td>
					<td>
	                	<%=vo.getNcBillId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">NC物业公司主键 ��</td>
					<td>
	                	<%=vo.getNcCompanyId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">管理处主�? ��</td>
					<td>
	                	<%=vo.getNcManageId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">缴纳状�?�（0-待同步，1-成功�?2-失败�? ��</td>
					<td>
	                	<%=vo.getJoinStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">同步NC时间 ��</td>
					<td>
	                	<%=vo.getJoinTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
	                	<%=vo.getNcTs()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">同步NC失败后，NC返回的�??(0：未同步�? 1：执行错误； 2：未授权(安全�?验不通过)�? 3：服务已停止(不提供服�?)�? 4：费用在NC端发生变化； 5：传入的费用更新、查询参数有误； 6：NC端查询错�? �? 7：重复缴�?)�? 8：NC服务维护中；99：密蜜传入NC参数有误�? ��</td>
					<td>
	                	<%=vo.getNcReturnStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">同步NC失败后，NC返回的失败描述信�? ��</td>
					<td>
	                	<%=vo.getNcReturnMessage()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�?款人id ��</td>
					<td>
	                	<%=vo.getRefundUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�?款时�? ��</td>
					<td>
	                	<%=vo.getRefundTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">记录添加时间 ��</td>
					<td>
	                	<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">创建时间 ��</td>
					<td>
	                	<%=vo.getDbCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">更新时间 ��</td>
					<td>
	                	<%=vo.getDbUpdateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">重复缴费，�??款状态（0:默认值；1:�?款中；已�?款） ��</td>
					<td>
	                	<%=vo.getRefundStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">小区ID ��</td>
					<td>
	                	<%=vo.getCommunityId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">房产ID ��</td>
					<td>
	                	<%=vo.getHouseId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">账单年份 ��</td>
					<td>
	                	<%=vo.getYear()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">账单月份 ��</td>
					<td>
	                	<%=vo.getMonth()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">异常单处理状�?(0-未处�?,1-已处�?,2-人工�?款中,3-已确认�??�?,4-已确认转预存) ��</td>
					<td>
	                	<%=vo.getProcessingStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">单元ID ��</td>
					<td>
	                	<%=vo.getUnitId()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='TPmBillJoinNc.mc?method=getAllPageTPmBillJoinNc&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
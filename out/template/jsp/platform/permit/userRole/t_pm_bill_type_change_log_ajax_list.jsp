<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBillTypeChangeLog" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<TITLE>閿熸枻鎷烽敓鏂ゆ嫹查询</TITLE>
	<!-- 导入JS和CSS样式-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/common/list_ajax.js"></script>
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
	<!-- 新样式风格必须引入的 -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css"> 
    <script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">
    <!-- 查询页面上有 checkbox的需要引入 -->
   <script type="text/javascript">
		
		$(function(){
		
			$("input[name='selectall_checkbox']").on('ifClicked',
		                function () {
		                    $('input:checkbox').iCheck('toggle');
		                });
		                          
			var operates = {
				edit:'TPmBillTypeChangeLog.mc?method=editTPmBillTypeChangeLog&pkId,typeId,optTime,optEvent,status,optUserId,dbUpdateTime,dbCreateTime,remark=',
				del:'TPmBillTypeChangeLog.mc?method=deleteTPmBillTypeChangeLog&PK=',
				view:'TPmBillTypeChangeLog.mc?method=detailTPmBillTypeChangeLog&pkId,typeId,optTime,optEvent,status,optUserId,dbUpdateTime,dbCreateTime,remark='
			};
			var options = {
				tableId:'pageTable',
				url:'TPmBillTypeChangeLog.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'pkId,typeId,optTime,optEvent,status,optUserId,dbUpdateTime,dbCreateTime,remark'
			};
			
			jQuery.page( options );
			
			$("#moreSearch").toggle(function(){
				var cls = $(this).find("span").attr( "class" );
				if( cls == "search_more" ) {
					$(this).find("span").attr( "class", "search_more_on" );
				} else {
					$(this).find("span").attr( "class", "search_more" );
				}
				$("tr[class*=more]").show();
			},function(){
				$("tr[class*=more]").hide();
				var cls = $(this).find("span").attr( "class" );
				if( cls == "search_more" ) {
					$(this).find("span").attr( "class", "search_more_on" );
				} else {
					$(this).find("span").attr( "class", "search_more" );
				}
			});
			
		
			
		});
		
	
			
	</script>
</head>
<body>
	<form name="searchForm" method="post" class="form-search" action="" id="searchForm">
		<input type="hidden" name="pageNo" id="pageNo" />
 		<input type="hidden" name="pageSize" id="pageSize" />
 		<input type="hidden" name="start" id="start" />
 		<input type="hidden" name="orderName" id="orderName" />
 		
 		<!-- 查询条件显示区域start -->
 		<div class="tabelist" style="border:1px solid gray;width:100%;padding:10px;margin:0 auto;">
			<div style="margin:0 auto;width:100%;">
			<div class="title-common">
				 	閿熸枻鎷烽敓鏂ゆ嫹查询
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_type_change_log_edit.jsp'">添加</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="pk_id" placeholder="涓婚敭" value="${ param.pk_id }"/>
		<input type='text' class="input-small" name="type_id" placeholder="璐﹀崟绫诲瀷琛ㄤ富閿?" value="${ param.type_id }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="鎿嶄綔鏃堕棿" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="opt_event" placeholder="鎿嶄綔浜嬮」 濡傚彉鏇翠竴绾х被鐩? 浜岀骇绫荤洰 鍙敤鐘舵??" value="${ param.opt_event }"/>
		<input type='text' class="input-small" name="status" placeholder="1:鏃犳晥 2鏈夋晥 榛樿2" value="${ param.status }"/>
		<input type='text' class="input-small" name="opt_user_id" placeholder="鎿嶄綔鑰卛d" value="${ param.opt_user_id }"/>
		<input type='text' class="input-small" name="db_update_time" placeholder="鏇存柊鏃堕棿" value="${ param.db_update_time }"/>
		<input type='text' class="input-small" name="db_create_time" placeholder="鍒涘缓鏃堕棿" value="${ param.db_create_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="澶囨敞" value="${ param.remark }"/>
		<button type="button" id="searchBtn" class="btn btn-group-vertical">搜索</button>
							</div>
						</td>
						</tr>
		</table>
				</div>
			</div>
			<!-- 查询条件显示区域end -->
			<!--//数据显示列表-->
			<div style="position: relative;">
				<div id="loading" style=" width:100%; height: 340px;position: absolute; top: 0; display:none;">
					<div style="background-color: ; position: absolute; top: 50%; left: 50%; margin: -33px 0 0 -33px;">
						<img src="skins/style/images/loading.gif" />
					</div>
				</div>
				<div class="tabelist">
					<table id="pageTable" width="100%" border="0" class="table table-hover table-condensed" cellpadding="0" cellspacing="0">
	  					<thead>
	                    	<tr height="22" class="tab_title_bg">
	                        	<th align="center">
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="全选/取消" />
	                            </th>
	                            <!--表头循环开始 -->
								<!-- 主键列  涓婚敭-->   
								<th align="center" rowName="pkId" orderName="pk_id:DESC" title='涓婚敭'>涓婚敭</th>
								<!-- 主键列  璐﹀崟绫诲瀷琛ㄤ富閿?-->   
								<th align="center" rowName="typeId" orderName="type_id:DESC" title='璐﹀崟绫诲瀷琛ㄤ富閿?'>璐﹀崟绫诲瀷琛ㄤ富閿?</th>
								<!-- 主键列  鎿嶄綔鏃堕棿-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='鎿嶄綔鏃堕棿'>鎿嶄綔鏃堕棿</th>
								<!-- 主键列  鎿嶄綔浜嬮」 濡傚彉鏇翠竴绾х被鐩? 浜岀骇绫荤洰 鍙敤鐘舵??-->   
								<th align="center" rowName="optEvent" orderName="opt_event:DESC" title='鎿嶄綔浜嬮」 濡傚彉鏇翠竴绾х被鐩? 浜岀骇绫荤洰 鍙敤鐘舵??'>鎿嶄綔浜嬮」 濡傚彉鏇翠竴绾х被鐩? 浜岀骇绫荤洰 鍙敤鐘舵??</th>
								<!-- 主键列  1:鏃犳晥 2鏈夋晥 榛樿2-->   
								<th align="center" rowName="status" orderName="status:DESC" title='1:鏃犳晥 2鏈夋晥 榛樿2'>1:鏃犳晥 2鏈夋晥 榛樿2</th>
								<!-- 主键列  鎿嶄綔鑰卛d-->   
								<th align="center" rowName="optUserId" orderName="opt_user_id:DESC" title='鎿嶄綔鑰卛d'>鎿嶄綔鑰卛d</th>
								<!-- 主键列  鏇存柊鏃堕棿-->   
								<th align="center" rowName="dbUpdateTime" orderName="db_update_time:DESC" title='鏇存柊鏃堕棿'>鏇存柊鏃堕棿</th>
								<!-- 主键列  鍒涘缓鏃堕棿-->   
								<th align="center" rowName="dbCreateTime" orderName="db_create_time:DESC" title='鍒涘缓鏃堕棿'>鍒涘缓鏃堕棿</th>
								<!-- 主键列  澶囨敞-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='澶囨敞'>澶囨敞</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
					    </tbody>      
					</table>
	               	<div id="pageMenu" class="page"></div>
	               	<div style="clear:both"></div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
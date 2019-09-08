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
	<TITLE>锟斤拷锟斤拷��ѯ</TITLE>
	<!-- ����JS��CSS��ʽ-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/common/list_ajax.js"></script>
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
	<!-- ����ʽ����������� -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css"> 
    <script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">
    <!-- ��ѯҳ������ checkbox����Ҫ���� -->
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
 		
 		<!-- ��ѯ������ʾ����start -->
 		<div class="tabelist" style="border:1px solid gray;width:100%;padding:10px;margin:0 auto;">
			<div style="margin:0 auto;width:100%;">
			<div class="title-common">
				 	锟斤拷锟斤拷��ѯ
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_type_change_log_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="pk_id" placeholder="主键" value="${ param.pk_id }"/>
		<input type='text' class="input-small" name="type_id" placeholder="账单类型表主�?" value="${ param.type_id }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="操作时间" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="opt_event" placeholder="操作事项 如变更一级类�? 二级类目 可用状�??" value="${ param.opt_event }"/>
		<input type='text' class="input-small" name="status" placeholder="1:无效 2有效 默认2" value="${ param.status }"/>
		<input type='text' class="input-small" name="opt_user_id" placeholder="操作者id" value="${ param.opt_user_id }"/>
		<input type='text' class="input-small" name="db_update_time" placeholder="更新时间" value="${ param.db_update_time }"/>
		<input type='text' class="input-small" name="db_create_time" placeholder="创建时间" value="${ param.db_create_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="备注" value="${ param.remark }"/>
		<button type="button" id="searchBtn" class="btn btn-group-vertical">����</button>
							</div>
						</td>
						</tr>
		</table>
				</div>
			</div>
			<!-- ��ѯ������ʾ����end -->
			<!--//������ʾ�б�-->
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
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="ȫѡ/ȡ��" />
	                            </th>
	                            <!--��ͷѭ����ʼ -->
								<!-- ������  主键-->   
								<th align="center" rowName="pkId" orderName="pk_id:DESC" title='主键'>主键</th>
								<!-- ������  账单类型表主�?-->   
								<th align="center" rowName="typeId" orderName="type_id:DESC" title='账单类型表主�?'>账单类型表主�?</th>
								<!-- ������  操作时间-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='操作时间'>操作时间</th>
								<!-- ������  操作事项 如变更一级类�? 二级类目 可用状�??-->   
								<th align="center" rowName="optEvent" orderName="opt_event:DESC" title='操作事项 如变更一级类�? 二级类目 可用状�??'>操作事项 如变更一级类�? 二级类目 可用状�??</th>
								<!-- ������  1:无效 2有效 默认2-->   
								<th align="center" rowName="status" orderName="status:DESC" title='1:无效 2有效 默认2'>1:无效 2有效 默认2</th>
								<!-- ������  操作者id-->   
								<th align="center" rowName="optUserId" orderName="opt_user_id:DESC" title='操作者id'>操作者id</th>
								<!-- ������  更新时间-->   
								<th align="center" rowName="dbUpdateTime" orderName="db_update_time:DESC" title='更新时间'>更新时间</th>
								<!-- ������  创建时间-->   
								<th align="center" rowName="dbCreateTime" orderName="db_create_time:DESC" title='创建时间'>创建时间</th>
								<!-- ������  备注-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
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
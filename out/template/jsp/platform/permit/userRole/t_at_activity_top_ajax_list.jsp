<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TAtActivityTop" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<TITLE>活动�?��ѯ</TITLE>
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
				edit:'TAtActivityTop.mc?method=editTAtActivityTop&pkId,activityName,activityDesc,activityStartTime,activityEndTime,status,updateTime,createTime,remark=',
				del:'TAtActivityTop.mc?method=deleteTAtActivityTop&PK=',
				view:'TAtActivityTop.mc?method=detailTAtActivityTop&pkId,activityName,activityDesc,activityStartTime,activityEndTime,status,updateTime,createTime,remark='
			};
			var options = {
				tableId:'pageTable',
				url:'TAtActivityTop.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'pkId,activityName,activityDesc,activityStartTime,activityEndTime,status,updateTime,createTime,remark'
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
				 	活动�?��ѯ
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_at_activity_top_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="pk_id" placeholder="活动id" value="${ param.pk_id }"/>
		<input type='text' class="input-small" name="activity_name" placeholder="活动名称" value="${ param.activity_name }"/>
		<input type='text' class="input-small" name="activity_desc" placeholder="活动描述" value="${ param.activity_desc }"/>
		<input type='text' class="input-small" name="activity_start_time" placeholder="活动�?始时�?" value="${ param.activity_start_time }"/>
		<input type='text' class="input-small" name="activity_end_time" placeholder="活动结束时间" value="${ param.activity_end_time }"/>
		<input type='text' class="input-small" name="status" placeholder="1 正常 2 停用" value="${ param.status }"/>
		<input type='text' class="input-small" name="update_time" placeholder="更新时间" value="${ param.update_time }"/>
		<input type='text' class="input-small" name="create_time" placeholder="创建时间" value="${ param.create_time }"/>
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
								<!-- ������  活动id-->   
								<th align="center" rowName="pkId" orderName="pk_id:DESC" title='活动id'>活动id</th>
								<!-- ������  活动名称-->   
								<th align="center" rowName="activityName" orderName="activity_name:DESC" title='活动名称'>活动名称</th>
								<!-- ������  活动描述-->   
								<th align="center" rowName="activityDesc" orderName="activity_desc:DESC" title='活动描述'>活动描述</th>
								<!-- ������  活动�?始时�?-->   
								<th align="center" rowName="activityStartTime" orderName="activity_start_time:DESC" title='活动�?始时�?'>活动�?始时�?</th>
								<!-- ������  活动结束时间-->   
								<th align="center" rowName="activityEndTime" orderName="activity_end_time:DESC" title='活动结束时间'>活动结束时间</th>
								<!-- ������  1 正常 2 停用-->   
								<th align="center" rowName="status" orderName="status:DESC" title='1 正常 2 停用'>1 正常 2 停用</th>
								<!-- ������  更新时间-->   
								<th align="center" rowName="updateTime" orderName="update_time:DESC" title='更新时间'>更新时间</th>
								<!-- ������  创建时间-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='创建时间'>创建时间</th>
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
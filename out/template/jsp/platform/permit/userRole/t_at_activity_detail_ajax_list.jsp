<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.social.data.TAtActivityDetail" %>
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
				edit:'TAtActivityDetail.mc?method=editTAtActivityDetail&pkId,userId,triggerTime,triggerType,deviceType,channelType,activityId,updateTime,createTime,remark=',
				del:'TAtActivityDetail.mc?method=deleteTAtActivityDetail&PK=',
				view:'TAtActivityDetail.mc?method=detailTAtActivityDetail&pkId,userId,triggerTime,triggerType,deviceType,channelType,activityId,updateTime,createTime,remark='
			};
			var options = {
				tableId:'pageTable',
				url:'TAtActivityDetail.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'pkId,userId,triggerTime,triggerType,deviceType,channelType,activityId,updateTime,createTime,remark'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_at_activity_detail_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="pk_id" placeholder="明细id" value="${ param.pk_id }"/>
		<input type='text' class="input-small" name="user_id" placeholder="登录者id 没有则是0" value="${ param.user_id }"/>
		<input type='text' class="input-small" name="trigger_time" placeholder="触发时间" value="${ param.trigger_time }"/>
		<input type='text' class="input-small" name="trigger_type" placeholder="触发类型 1 查看 2 分享" value="${ param.trigger_type }"/>
		<input type='text' class="input-small" name="device_type" placeholder="设备类型 1 ios  2 android 3 web" value="${ param.device_type }"/>
		<input type='text' class="input-small" name="channel_type" placeholder="来源渠道 1 微信  2 app" value="${ param.channel_type }"/>
		<input type='text' class="input-small" name="activity_id" placeholder="活动id" value="${ param.activity_id }"/>
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
								<!-- ������  明细id-->   
								<th align="center" rowName="pkId" orderName="pk_id:DESC" title='明细id'>明细id</th>
								<!-- ������  登录者id 没有则是0-->   
								<th align="center" rowName="userId" orderName="user_id:DESC" title='登录者id 没有则是0'>登录者id 没有则是0</th>
								<!-- ������  触发时间-->   
								<th align="center" rowName="triggerTime" orderName="trigger_time:DESC" title='触发时间'>触发时间</th>
								<!-- ������  触发类型 1 查看 2 分享-->   
								<th align="center" rowName="triggerType" orderName="trigger_type:DESC" title='触发类型 1 查看 2 分享'>触发类型 1 查看 2 分享</th>
								<!-- ������  设备类型 1 ios  2 android 3 web-->   
								<th align="center" rowName="deviceType" orderName="device_type:DESC" title='设备类型 1 ios  2 android 3 web'>设备类型 1 ios  2 android 3 web</th>
								<!-- ������  来源渠道 1 微信  2 app-->   
								<th align="center" rowName="channelType" orderName="channel_type:DESC" title='来源渠道 1 微信  2 app'>来源渠道 1 微信  2 app</th>
								<!-- ������  活动id-->   
								<th align="center" rowName="activityId" orderName="activity_id:DESC" title='活动id'>活动id</th>
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
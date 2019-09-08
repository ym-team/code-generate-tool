<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.discovers.data.DiscoverPushSocialAdvice" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<TITLE>锟斤拷锟斤拷查询</TITLE>
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
				edit:'DiscoverPushSocialAdvice.mc?method=editDiscoverPushSocialAdvice&discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType=',
				del:'DiscoverPushSocialAdvice.mc?method=deleteDiscoverPushSocialAdvice&PK=',
				view:'DiscoverPushSocialAdvice.mc?method=detailDiscoverPushSocialAdvice&discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType='
			};
			var options = {
				tableId:'pageTable',
				url:'DiscoverPushSocialAdvice.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType'
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
				 	锟斤拷锟斤拷查询
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/discover_push_social_advice_edit.jsp'">添加</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="discover_push_office_id" placeholder="主键" value="${ param.discover_push_office_id }"/>
		<input type='text' class="input-small" name="push_user_id" placeholder="推送者id" value="${ param.push_user_id }"/>
		<input type='text' class="input-small" name="push_user_info" placeholder="推送者信息" value="${ param.push_user_info }"/>
		<input type='text' class="input-small" name="from_user_id" placeholder="来自于哪个用户的id" value="${ param.from_user_id }"/>
		<input type='text' class="input-small" name="from_user_info" placeholder="来自于哪个用户信息" value="${ param.from_user_info }"/>
		<input type='text' class="input-small" name="to_user_id" placeholder="接收者id" value="${ param.to_user_id }"/>
		<input type='text' class="input-small" name="to_user_info" placeholder="接收者信息" value="${ param.to_user_info }"/>
		<input type='text' class="input-small" name="inner_push_type" placeholder="父类型" value="${ param.inner_push_type }"/>
		<input type='text' class="input-small" name="inner_push_sub_type" placeholder="子类型" value="${ param.inner_push_sub_type }"/>
		<input type='text' class="input-small" name="push_service_title" placeholder="推送标题" value="${ param.push_service_title }"/>
		<input type='text' class="input-small" name="push_service_msg" placeholder="推送内容" value="${ param.push_service_msg }"/>
		<input type='text' class="input-small" name="push_service_id" placeholder="推送业务id" value="${ param.push_service_id }"/>
		<input type='text' class="input-small" name="push_service_msg_status" placeholder="事件状态" value="${ param.push_service_msg_status }"/>
		<input type='text' class="input-small" name="create_time" placeholder="创建时间" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="操作时间" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="备注" value="${ param.remark }"/>
		<input type='text' class="input-small" name="push_status" placeholder="1已处理 2未处理" value="${ param.push_status }"/>
		<input type='text' class="input-small" name="push_service_money" placeholder="多少钱 *100" value="${ param.push_service_money }"/>
		<input type='text' class="input-small" name="push_service_count" placeholder="该事件数量" value="${ param.push_service_count }"/>
		<input type='text' class="input-small" name="push_service_type" placeholder="该事件类型" value="${ param.push_service_type }"/>
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
								<!-- 主键列  主键-->   
								<th align="center" rowName="discoverPushOfficeId" orderName="discover_push_office_id:DESC" title='主键'>主键</th>
								<!-- 主键列  推送者id-->   
								<th align="center" rowName="pushUserId" orderName="push_user_id:DESC" title='推送者id'>推送者id</th>
								<!-- 主键列  推送者信息-->   
								<th align="center" rowName="pushUserInfo" orderName="push_user_info:DESC" title='推送者信息'>推送者信息</th>
								<!-- 主键列  来自于哪个用户的id-->   
								<th align="center" rowName="fromUserId" orderName="from_user_id:DESC" title='来自于哪个用户的id'>来自于哪个用户的id</th>
								<!-- 主键列  来自于哪个用户信息-->   
								<th align="center" rowName="fromUserInfo" orderName="from_user_info:DESC" title='来自于哪个用户信息'>来自于哪个用户信息</th>
								<!-- 主键列  接收者id-->   
								<th align="center" rowName="toUserId" orderName="to_user_id:DESC" title='接收者id'>接收者id</th>
								<!-- 主键列  接收者信息-->   
								<th align="center" rowName="toUserInfo" orderName="to_user_info:DESC" title='接收者信息'>接收者信息</th>
								<!-- 主键列  父类型-->   
								<th align="center" rowName="innerPushType" orderName="inner_push_type:DESC" title='父类型'>父类型</th>
								<!-- 主键列  子类型-->   
								<th align="center" rowName="innerPushSubType" orderName="inner_push_sub_type:DESC" title='子类型'>子类型</th>
								<!-- 主键列  推送标题-->   
								<th align="center" rowName="pushServiceTitle" orderName="push_service_title:DESC" title='推送标题'>推送标题</th>
								<!-- 主键列  推送内容-->   
								<th align="center" rowName="pushServiceMsg" orderName="push_service_msg:DESC" title='推送内容'>推送内容</th>
								<!-- 主键列  推送业务id-->   
								<th align="center" rowName="pushServiceId" orderName="push_service_id:DESC" title='推送业务id'>推送业务id</th>
								<!-- 主键列  事件状态-->   
								<th align="center" rowName="pushServiceMsgStatus" orderName="push_service_msg_status:DESC" title='事件状态'>事件状态</th>
								<!-- 主键列  创建时间-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列  操作时间-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='操作时间'>操作时间</th>
								<!-- 主键列  备注-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!-- 主键列  1已处理 2未处理-->   
								<th align="center" rowName="pushStatus" orderName="push_status:DESC" title='1已处理 2未处理'>1已处理 2未处理</th>
								<!-- 主键列  多少钱 *100-->   
								<th align="center" rowName="pushServiceMoney" orderName="push_service_money:DESC" title='多少钱 *100'>多少钱 *100</th>
								<!-- 主键列  该事件数量-->   
								<th align="center" rowName="pushServiceCount" orderName="push_service_count:DESC" title='该事件数量'>该事件数量</th>
								<!-- 主键列  该事件类型-->   
								<th align="center" rowName="pushServiceType" orderName="push_service_type:DESC" title='该事件类型'>该事件类型</th>
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
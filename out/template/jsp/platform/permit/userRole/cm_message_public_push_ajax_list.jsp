<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.discovers.data.CmMessagePublicPush" %>
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
				edit:'CmMessagePublicPush.mc?method=editCmMessagePublicPush&pkId,pushType,pushUserId,subType,pushContent,createDate,opTimestamp,opTime,status,pushDesc,pushRemark,pushMsgCount=',
				del:'CmMessagePublicPush.mc?method=deleteCmMessagePublicPush&PK=',
				view:'CmMessagePublicPush.mc?method=detailCmMessagePublicPush&pkId,pushType,pushUserId,subType,pushContent,createDate,opTimestamp,opTime,status,pushDesc,pushRemark,pushMsgCount='
			};
			var options = {
				tableId:'pageTable',
				url:'CmMessagePublicPush.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'pkId,pushType,pushUserId,subType,pushContent,createDate,opTimestamp,opTime,status,pushDesc,pushRemark,pushMsgCount'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_message_public_push_edit.jsp'">添加</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="pk_id" placeholder="主键" value="${ param.pk_id }"/>
		<input type='text' class="input-small" name="push_type" placeholder="频道/类型             1: 新闻             2:病例分享             3:疑难求助             4:好友申请             5:系统推送提醒             6:圈子申请通知             7:圈子邀请通知             8:圈子帖子通知             9:帖子评论             10:帖子转发             11:帖子点餐             12:私信/聊天" value="${ param.push_type }"/>
		<input type='text' class="input-small" name="push_user_id" placeholder="推送人" value="${ param.push_user_id }"/>
		<input type='text' class="input-small" name="sub_type" placeholder="推送子类型" value="${ param.sub_type }"/>
		<input type='text' class="input-small" name="push_content" placeholder="推送内容" value="${ param.push_content }"/>
		<input type='text' class="input-small" name="create_date" placeholder="帖子创建时间" value="${ param.create_date }"/>
		<input type='text' class="input-small" name="op_timestamp" placeholder="推送说明, 排序使用" value="${ param.op_timestamp }"/>
		<input type='text' class="input-small" name="op_time" placeholder="操作时间" value="${ param.op_time }"/>
		<input type='text' class="input-small" name="status" placeholder="0:  无效             1:  有效             " value="${ param.status }"/>
		<input type='text' class="input-small" name="push_desc" placeholder="推送说明" value="${ param.push_desc }"/>
		<input type='text' class="input-small" name="push_remark" placeholder="推送备注" value="${ param.push_remark }"/>
		<input type='text' class="input-small" name="push_msg_count" placeholder="用户未读数:用本表pkid减去公共消息推送用户阅读表的PUBLIC_PUSH_ID等于该未读数,但此字段写表。在程序中直接处理返回前台" value="${ param.push_msg_count }"/>
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
								<th align="center" rowName="pkId" orderName="pk_id:DESC" title='主键'>主键</th>
								<!-- 主键列  频道/类型             1: 新闻             2:病例分享             3:疑难求助             4:好友申请             5:系统推送提醒             6:圈子申请通知             7:圈子邀请通知             8:圈子帖子通知             9:帖子评论             10:帖子转发             11:帖子点餐             12:私信/聊天-->   
								<th align="center" rowName="pushType" orderName="push_type:DESC" title='频道/类型             1: 新闻             2:病例分享             3:疑难求助             4:好友申请             5:系统推送提醒             6:圈子申请通知             7:圈子邀请通知             8:圈子帖子通知             9:帖子评论             10:帖子转发             11:帖子点餐             12:私信/聊天'>频道/类型             1: 新闻             2:病例分享             3:疑难求助             4:好友申请             5:系统推送提醒             6:圈子申请通知             7:圈子邀请通知             8:圈子帖子通知             9:帖子评论             10:帖子转发             11:帖子点餐             12:私信/聊天</th>
								<!-- 主键列  推送人-->   
								<th align="center" rowName="pushUserId" orderName="push_user_id:DESC" title='推送人'>推送人</th>
								<!-- 主键列  推送子类型-->   
								<th align="center" rowName="subType" orderName="sub_type:DESC" title='推送子类型'>推送子类型</th>
								<!-- 主键列  推送内容-->   
								<th align="center" rowName="pushContent" orderName="push_content:DESC" title='推送内容'>推送内容</th>
								<!-- 主键列  帖子创建时间-->   
								<th align="center" rowName="createDate" orderName="create_date:DESC" title='帖子创建时间'>帖子创建时间</th>
								<!-- 主键列  推送说明, 排序使用-->   
								<th align="center" rowName="opTimestamp" orderName="op_timestamp:DESC" title='推送说明, 排序使用'>推送说明, 排序使用</th>
								<!-- 主键列  操作时间-->   
								<th align="center" rowName="opTime" orderName="op_time:DESC" title='操作时间'>操作时间</th>
								<!-- 主键列  0:  无效             1:  有效             -->   
								<th align="center" rowName="status" orderName="status:DESC" title='0:  无效             1:  有效             '>0:  无效             1:  有效             </th>
								<!-- 主键列  推送说明-->   
								<th align="center" rowName="pushDesc" orderName="push_desc:DESC" title='推送说明'>推送说明</th>
								<!-- 主键列  推送备注-->   
								<th align="center" rowName="pushRemark" orderName="push_remark:DESC" title='推送备注'>推送备注</th>
								<!-- 主键列  用户未读数:用本表pkid减去公共消息推送用户阅读表的PUBLIC_PUSH_ID等于该未读数,但此字段写表。在程序中直接处理返回前台-->   
								<th align="center" rowName="pushMsgCount" orderName="push_msg_count:DESC" title='用户未读数:用本表pkid减去公共消息推送用户阅读表的PUBLIC_PUSH_ID等于该未读数,但此字段写表。在程序中直接处理返回前台'>用户未读数:用本表pkid减去公共消息推送用户阅读表的PUBLIC_PUSH_ID等于该未读数,但此字段写表。在程序中直接处理返回前台</th>
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
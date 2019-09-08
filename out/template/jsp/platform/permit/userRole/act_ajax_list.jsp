<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.act.data.Act" %>
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
				edit:'Act.mc?method=editAct&id,title,actStarttime,actEndtime,actAddress,actDesc,actType,actMoney,actPicUrl,actCreateUserId,actStatus,actMemberCount,actLikeCount,createTime,optTime,remark,char2=',
				del:'Act.mc?method=deleteAct&PK=',
				view:'Act.mc?method=detailAct&id,title,actStarttime,actEndtime,actAddress,actDesc,actType,actMoney,actPicUrl,actCreateUserId,actStatus,actMemberCount,actLikeCount,createTime,optTime,remark,char2='
			};
			var options = {
				tableId:'pageTable',
				url:'Act.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,title,actStarttime,actEndtime,actAddress,actDesc,actType,actMoney,actPicUrl,actCreateUserId,actStatus,actMemberCount,actLikeCount,createTime,optTime,remark,char2'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/act_edit.jsp'">添加</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="主键" value="${ param.id }"/>
		<input type='text' class="input-small" name="title" placeholder="活动标题" value="${ param.title }"/>
		<input type='text' class="input-small" name="act_starttime" placeholder="创建时间" value="${ param.act_starttime }"/>
		<input type='text' class="input-small" name="act_endtime" placeholder="结束时间" value="${ param.act_endtime }"/>
		<input type='text' class="input-small" name="act_address" placeholder="活动地址" value="${ param.act_address }"/>
		<input type='text' class="input-small" name="act_desc" placeholder="活动简介" value="${ param.act_desc }"/>
		<input type='text' class="input-small" name="act_type" placeholder="0 免费 1 收费 默认为0" value="${ param.act_type }"/>
		<input type='text' class="input-small" name="act_money" placeholder="活动费用" value="${ param.act_money }"/>
		<input type='text' class="input-small" name="act_pic_url" placeholder="活动宣传图" value="${ param.act_pic_url }"/>
		<input type='text' class="input-small" name="act_create_user_id" placeholder="创建者id" value="${ param.act_create_user_id }"/>
		<input type='text' class="input-small" name="act_status" placeholder="活动状态 1 审核中 2 成功 3 拒绝 4 结束" value="${ param.act_status }"/>
		<input type='text' class="input-small" name="act_member_count" placeholder="成员数 默认为1" value="${ param.act_member_count }"/>
		<input type='text' class="input-small" name="act_like_count" placeholder="点赞数 默认为0" value="${ param.act_like_count }"/>
		<input type='text' class="input-small" name="create_time" placeholder="创建时间" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="更新时间" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="备注" value="${ param.remark }"/>
		<input type='text' class="input-small" name="char2" placeholder="备注1" value="${ param.char2 }"/>
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
								<th align="center" rowName="id" orderName="id:DESC" title='主键'>主键</th>
								<!-- 主键列  活动标题-->   
								<th align="center" rowName="title" orderName="title:DESC" title='活动标题'>活动标题</th>
								<!-- 主键列  创建时间-->   
								<th align="center" rowName="actStarttime" orderName="act_starttime:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列  结束时间-->   
								<th align="center" rowName="actEndtime" orderName="act_endtime:DESC" title='结束时间'>结束时间</th>
								<!-- 主键列  活动地址-->   
								<th align="center" rowName="actAddress" orderName="act_address:DESC" title='活动地址'>活动地址</th>
								<!-- 主键列  活动简介-->   
								<th align="center" rowName="actDesc" orderName="act_desc:DESC" title='活动简介'>活动简介</th>
								<!-- 主键列  0 免费 1 收费 默认为0-->   
								<th align="center" rowName="actType" orderName="act_type:DESC" title='0 免费 1 收费 默认为0'>0 免费 1 收费 默认为0</th>
								<!-- 主键列  活动费用-->   
								<th align="center" rowName="actMoney" orderName="act_money:DESC" title='活动费用'>活动费用</th>
								<!-- 主键列  活动宣传图-->   
								<th align="center" rowName="actPicUrl" orderName="act_pic_url:DESC" title='活动宣传图'>活动宣传图</th>
								<!-- 主键列  创建者id-->   
								<th align="center" rowName="actCreateUserId" orderName="act_create_user_id:DESC" title='创建者id'>创建者id</th>
								<!-- 主键列  活动状态 1 审核中 2 成功 3 拒绝 4 结束-->   
								<th align="center" rowName="actStatus" orderName="act_status:DESC" title='活动状态 1 审核中 2 成功 3 拒绝 4 结束'>活动状态 1 审核中 2 成功 3 拒绝 4 结束</th>
								<!-- 主键列  成员数 默认为1-->   
								<th align="center" rowName="actMemberCount" orderName="act_member_count:DESC" title='成员数 默认为1'>成员数 默认为1</th>
								<!-- 主键列  点赞数 默认为0-->   
								<th align="center" rowName="actLikeCount" orderName="act_like_count:DESC" title='点赞数 默认为0'>点赞数 默认为0</th>
								<!-- 主键列  创建时间-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列  更新时间-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='更新时间'>更新时间</th>
								<!-- 主键列  备注-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!-- 主键列  备注1-->   
								<th align="center" rowName="char2" orderName="char2:DESC" title='备注1'>备注1</th>
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.act.data.ActMember" %>
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
				edit:'ActMember.mc?method=editActMember&id,memberId,memberStatus,memberType,actId,actPhone,memberFollowCount,actMemberName,createTime,optTime,remark,char1=',
				del:'ActMember.mc?method=deleteActMember&PK=',
				view:'ActMember.mc?method=detailActMember&id,memberId,memberStatus,memberType,actId,actPhone,memberFollowCount,actMemberName,createTime,optTime,remark,char1='
			};
			var options = {
				tableId:'pageTable',
				url:'ActMember.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,memberId,memberStatus,memberType,actId,actPhone,memberFollowCount,actMemberName,createTime,optTime,remark,char1'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/act_member_edit.jsp'">添加</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="主键" value="${ param.id }"/>
		<input type='text' class="input-small" name="member_id" placeholder="成员id" value="${ param.member_id }"/>
		<input type='text' class="input-small" name="member_status" placeholder="1.申请中  2.成功  3.拒绝  默认为2" value="${ param.member_status }"/>
		<input type='text' class="input-small" name="member_type" placeholder="1.活动创建者  2.普通参加成员" value="${ param.member_type }"/>
		<input type='text' class="input-small" name="act_id" placeholder="活动id" value="${ param.act_id }"/>
		<input type='text' class="input-small" name="act_phone" placeholder="参与人电话" value="${ param.act_phone }"/>
		<input type='text' class="input-small" name="member_follow_count" placeholder="跟随人数 默认为1 即本人" value="${ param.member_follow_count }"/>
		<input type='text' class="input-small" name="act_member_name" placeholder="参与人姓名" value="${ param.act_member_name }"/>
		<input type='text' class="input-small" name="create_time" placeholder="创建时间" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="更新时间" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="备注" value="${ param.remark }"/>
		<input type='text' class="input-small" name="char1" placeholder="备注1" value="${ param.char1 }"/>
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
								<!-- 主键列  成员id-->   
								<th align="center" rowName="memberId" orderName="member_id:DESC" title='成员id'>成员id</th>
								<!-- 主键列  1.申请中  2.成功  3.拒绝  默认为2-->   
								<th align="center" rowName="memberStatus" orderName="member_status:DESC" title='1.申请中  2.成功  3.拒绝  默认为2'>1.申请中  2.成功  3.拒绝  默认为2</th>
								<!-- 主键列  1.活动创建者  2.普通参加成员-->   
								<th align="center" rowName="memberType" orderName="member_type:DESC" title='1.活动创建者  2.普通参加成员'>1.活动创建者  2.普通参加成员</th>
								<!-- 主键列  活动id-->   
								<th align="center" rowName="actId" orderName="act_id:DESC" title='活动id'>活动id</th>
								<!-- 主键列  参与人电话-->   
								<th align="center" rowName="actPhone" orderName="act_phone:DESC" title='参与人电话'>参与人电话</th>
								<!-- 主键列  跟随人数 默认为1 即本人-->   
								<th align="center" rowName="memberFollowCount" orderName="member_follow_count:DESC" title='跟随人数 默认为1 即本人'>跟随人数 默认为1 即本人</th>
								<!-- 主键列  参与人姓名-->   
								<th align="center" rowName="actMemberName" orderName="act_member_name:DESC" title='参与人姓名'>参与人姓名</th>
								<!-- 主键列  创建时间-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列  更新时间-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='更新时间'>更新时间</th>
								<!-- 主键列  备注-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!-- 主键列  备注1-->   
								<th align="center" rowName="char1" orderName="char1:DESC" title='备注1'>备注1</th>
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
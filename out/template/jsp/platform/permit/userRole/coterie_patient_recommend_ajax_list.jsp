<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.coteriepatient.data.CoteriePatientRecommend" %>
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
				edit:'CoteriePatientRecommend.mc?method=editCoteriePatientRecommend&id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,order1,source,faceUrl,coterieId=',
				del:'CoteriePatientRecommend.mc?method=deleteCoteriePatientRecommend&PK=',
				view:'CoteriePatientRecommend.mc?method=detailCoteriePatientRecommend&id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,order1,source,faceUrl,coterieId='
			};
			var options = {
				tableId:'pageTable',
				url:'CoteriePatientRecommend.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,order1,source,faceUrl,coterieId'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/coterie_patient_recommend_edit.jsp'">添加</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="主键" value="${ param.id }"/>
		<input type='text' class="input-small" name="name" placeholder="圈子名称  系统圈名参考deptname" value="${ param.name }"/>
		<input type='text' class="input-small" name="coterie_desc" placeholder="圈子介绍" value="${ param.coterie_desc }"/>
		<input type='text' class="input-small" name="pic_url" placeholder="圈子图 最多6张图 以|分隔" value="${ param.pic_url }"/>
		<input type='text' class="input-small" name="coterie_type" placeholder="1 公圈 2 私圈" value="${ param.coterie_type }"/>
		<input type='text' class="input-small" name="coterie_service_type" placeholder="圈子业务类型 暂未启用 默认为0" value="${ param.coterie_service_type }"/>
		<input type='text' class="input-small" name="coterie_status" placeholder="1 审核中   2 成功   3 拒绝   4. 解散" value="${ param.coterie_status }"/>
		<input type='text' class="input-small" name="create_user_id" placeholder="创建者id" value="${ param.create_user_id }"/>
		<input type='text' class="input-small" name="channel_type" placeholder="用户类型 1 木棉健康 2 家校健康 3 家校app" value="${ param.channel_type }"/>
		<input type='text' class="input-small" name="member_count" placeholder="成员数" value="${ param.member_count }"/>
		<input type='text' class="input-small" name="post_count" placeholder="帖子数" value="${ param.post_count }"/>
		<input type='text' class="input-small" name="sub_system_type" placeholder="系统圈 为 deptId    自建圈为 0" value="${ param.sub_system_type }"/>
		<input type='text' class="input-small" name="system_type" placeholder="1 系统默认圈  2 自建圈" value="${ param.system_type }"/>
		<input type='text' class="input-small" name="create_time" placeholder="创建时间" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="更新时间" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="备注" value="${ param.remark }"/>
		<input type='text' class="input-small" name="order1" placeholder="备注1" value="${ param.order1 }"/>
		<input type='text' class="input-small" name="source" placeholder="1 系统数据统计来源 2 运营推荐" value="${ param.source }"/>
		<input type='text' class="input-small" name="face_url" placeholder="头像" value="${ param.face_url }"/>
		<input type='text' class="input-small" name="coterie_id" placeholder="圈子id" value="${ param.coterie_id }"/>
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
								<!-- 主键列  圈子名称  系统圈名参考deptname-->   
								<th align="center" rowName="name" orderName="name:DESC" title='圈子名称  系统圈名参考deptname'>圈子名称  系统圈名参考deptname</th>
								<!-- 主键列  圈子介绍-->   
								<th align="center" rowName="coterieDesc" orderName="coterie_desc:DESC" title='圈子介绍'>圈子介绍</th>
								<!-- 主键列  圈子图 最多6张图 以|分隔-->   
								<th align="center" rowName="picUrl" orderName="pic_url:DESC" title='圈子图 最多6张图 以|分隔'>圈子图 最多6张图 以|分隔</th>
								<!-- 主键列  1 公圈 2 私圈-->   
								<th align="center" rowName="coterieType" orderName="coterie_type:DESC" title='1 公圈 2 私圈'>1 公圈 2 私圈</th>
								<!-- 主键列  圈子业务类型 暂未启用 默认为0-->   
								<th align="center" rowName="coterieServiceType" orderName="coterie_service_type:DESC" title='圈子业务类型 暂未启用 默认为0'>圈子业务类型 暂未启用 默认为0</th>
								<!-- 主键列  1 审核中   2 成功   3 拒绝   4. 解散-->   
								<th align="center" rowName="coterieStatus" orderName="coterie_status:DESC" title='1 审核中   2 成功   3 拒绝   4. 解散'>1 审核中   2 成功   3 拒绝   4. 解散</th>
								<!-- 主键列  创建者id-->   
								<th align="center" rowName="createUserId" orderName="create_user_id:DESC" title='创建者id'>创建者id</th>
								<!-- 主键列  用户类型 1 木棉健康 2 家校健康 3 家校app-->   
								<th align="center" rowName="channelType" orderName="channel_type:DESC" title='用户类型 1 木棉健康 2 家校健康 3 家校app'>用户类型 1 木棉健康 2 家校健康 3 家校app</th>
								<!-- 主键列  成员数-->   
								<th align="center" rowName="memberCount" orderName="member_count:DESC" title='成员数'>成员数</th>
								<!-- 主键列  帖子数-->   
								<th align="center" rowName="postCount" orderName="post_count:DESC" title='帖子数'>帖子数</th>
								<!-- 主键列  系统圈 为 deptId    自建圈为 0-->   
								<th align="center" rowName="subSystemType" orderName="sub_system_type:DESC" title='系统圈 为 deptId    自建圈为 0'>系统圈 为 deptId    自建圈为 0</th>
								<!-- 主键列  1 系统默认圈  2 自建圈-->   
								<th align="center" rowName="systemType" orderName="system_type:DESC" title='1 系统默认圈  2 自建圈'>1 系统默认圈  2 自建圈</th>
								<!-- 主键列  创建时间-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列  更新时间-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='更新时间'>更新时间</th>
								<!-- 主键列  备注-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!-- 主键列  备注1-->   
								<th align="center" rowName="order1" orderName="order1:DESC" title='备注1'>备注1</th>
								<!-- 主键列  1 系统数据统计来源 2 运营推荐-->   
								<th align="center" rowName="source" orderName="source:DESC" title='1 系统数据统计来源 2 运营推荐'>1 系统数据统计来源 2 运营推荐</th>
								<!-- 主键列  头像-->   
								<th align="center" rowName="faceUrl" orderName="face_url:DESC" title='头像'>头像</th>
								<!-- 主键列  圈子id-->   
								<th align="center" rowName="coterieId" orderName="coterie_id:DESC" title='圈子id'>圈子id</th>
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
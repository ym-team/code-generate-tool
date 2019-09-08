<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.discovers.data.DiscoverPushSocialAdvice" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
	Page pg = (Page) request.getAttribute("Page");
	PageInfo pginfo = (PageInfo) request.getAttribute("PageInfo");
	Map attributeMap = pg.getAttributeMap();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<TITLE>锟斤拷锟斤拷查询</TITLE>
	
	<!-- 导入JS和CSS样式-->
<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/artDialog/skins/default.css">
<script src="${contextPath}/skins/library/artDialog/jArtDialog.js"></script>
<script type="text/javascript" src="${contextPath}/skins/js/common/list_common_js.js"></script>
<!-- 新样式风格必须引入的 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">

<!-- 查询页面上有 checkbox的需要引入 -->
<link rel="stylesheet" type="text/css"	href="${contextPath}/skins/library/iCheck-master/skins/square/blue.css">
<script src="${contextPath}/skins/library/iCheck-master/icheck.js"></script>
<script type="text/javascript" src="${contextPath}/skins/js/common/scroll_common_js.js"></script>
	
	<script type="text/javascript">
		function deleteDiscoverPushSocialAdvice(PK) {
			jQuery.ajax({
				url : "DiscoverPushSocialAdvice.mc?method=deleteDiscoverPushSocialAdvice",
				type : "post",
				data : {PK:PK},
				success : function(result) {
					if (result > 0) {
						alert("删除成功");
						$("#start").val(0);
						$("#searchForm").submit();
					} else {
						alert("删除失败");
					}
				},
				error : function(result) {
					alert("删除失败");
				}
			});
		}
		
		function searchData(){
			$("#start").val(0);
			$("#searchForm").submit();
		}
		
		$(function(){
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
		/* */
			$('input:checkbox').iCheck({
				 checkboxClass: 'icheckbox_square-blue',
		         radioClass: 'iradio_square'
				});
		/**/
			 $('#selectall_checkbox').on('ifClicked',
		                function () {
		                    $('input:checkbox').iCheck('toggle');
		                });
		
			
		});
	</script>
</head>
<body>
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/DiscoverPushSocialAdvice.mc?method=getAllPageDiscoverPushSocialAdvice" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
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

								<button type="button" onclick="javascript:searchData();" id="searchbtn"  class="btn btn-group-vertical">搜索</button>
							</div>
								
							</td>
						</tr>
						
					</table>
			</div>
			<!-- 查询条件显示区域end --> 
			<!-- 数据显示列表start -->
	        <div id="tableData" style="position: relative;height: 480px;overflow: auto;">
				<div id="loading" style=" width:100%; height: 340px;position: absolute; top: 0; display:none;">
					<div style="background-color: ; position: absolute; top: 50%; left: 50%; margin: -33px 0 0 -33px;">
						<img src="skins/style/images/loading.gif" />
					</div>
				</div>
				<div class="tabelist">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-hover table-condensed">
	  					<thead>
	                    	<tr height="22" class="tab_title_bg">
	                        	<th align="center">
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="全选/取消" />
	                            </th>
	                            <!--表头循环开始 -->
								<!-- 主键列{主键}-->   
								<th align="center" rowName="discover_push_office_id" orderName="discover_push_office_id:DESC" title='主键'>主键</th>
								<!-- 主键列{推送者id}-->   
								<th align="center" rowName="push_user_id" orderName="push_user_id:DESC" title='推送者id'>推送者id</th>
								<!-- 主键列{推送者信息}-->   
								<th align="center" rowName="push_user_info" orderName="push_user_info:DESC" title='推送者信息'>推送者信息</th>
								<!-- 主键列{来自于哪个用户的id}-->   
								<th align="center" rowName="from_user_id" orderName="from_user_id:DESC" title='来自于哪个用户的id'>来自于哪个用户的id</th>
								<!-- 主键列{来自于哪个用户信息}-->   
								<th align="center" rowName="from_user_info" orderName="from_user_info:DESC" title='来自于哪个用户信息'>来自于哪个用户信息</th>
								<!-- 主键列{接收者id}-->   
								<th align="center" rowName="to_user_id" orderName="to_user_id:DESC" title='接收者id'>接收者id</th>
								<!-- 主键列{接收者信息}-->   
								<th align="center" rowName="to_user_info" orderName="to_user_info:DESC" title='接收者信息'>接收者信息</th>
								<!-- 主键列{父类型}-->   
								<th align="center" rowName="inner_push_type" orderName="inner_push_type:DESC" title='父类型'>父类型</th>
								<!-- 主键列{子类型}-->   
								<th align="center" rowName="inner_push_sub_type" orderName="inner_push_sub_type:DESC" title='子类型'>子类型</th>
								<!-- 主键列{推送标题}-->   
								<th align="center" rowName="push_service_title" orderName="push_service_title:DESC" title='推送标题'>推送标题</th>
								<!-- 主键列{推送内容}-->   
								<th align="center" rowName="push_service_msg" orderName="push_service_msg:DESC" title='推送内容'>推送内容</th>
								<!-- 主键列{推送业务id}-->   
								<th align="center" rowName="push_service_id" orderName="push_service_id:DESC" title='推送业务id'>推送业务id</th>
								<!-- 主键列{事件状态}-->   
								<th align="center" rowName="push_service_msg_status" orderName="push_service_msg_status:DESC" title='事件状态'>事件状态</th>
								<!-- 主键列{创建时间}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列{操作时间}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='操作时间'>操作时间</th>
								<!-- 主键列{备注}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!-- 主键列{1已处理 2未处理}-->   
								<th align="center" rowName="push_status" orderName="push_status:DESC" title='1已处理 2未处理'>1已处理 2未处理</th>
								<!-- 主键列{多少钱 *100}-->   
								<th align="center" rowName="push_service_money" orderName="push_service_money:DESC" title='多少钱 *100'>多少钱 *100</th>
								<!-- 主键列{该事件数量}-->   
								<th align="center" rowName="push_service_count" orderName="push_service_count:DESC" title='该事件数量'>该事件数量</th>
								<!-- 主键列{该事件类型}-->   
								<th align="center" rowName="push_service_type" orderName="push_service_type:DESC" title='该事件类型'>该事件类型</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							DiscoverPushSocialAdvice view = new DiscoverPushSocialAdvice();
								for (int i = 0; i < list.size(); i++) {
									view = (DiscoverPushSocialAdvice) list.get(i);
									if (i % 2 == 1) {
						%>
										<tr class="blue">
						<%
									} else {
						%>
										<tr>
						<%
									}
						%>
											<th align="center">
				                            	<input name="selectall_checkbox" type="checkbox" title="全选/取消" />
				                            </th>
					
											<!-- 主键列{主键}-->   
											<td><%=view.getDiscoverPushOfficeId()%></td>
											<!-- 主键列{推送者id}-->   
											<td><%=view.getPushUserId()%></td>
											<!-- 主键列{推送者信息}-->   
											<td><%=view.getPushUserInfo()%></td>
											<!-- 主键列{来自于哪个用户的id}-->   
											<td><%=view.getFromUserId()%></td>
											<!-- 主键列{来自于哪个用户信息}-->   
											<td><%=view.getFromUserInfo()%></td>
											<!-- 主键列{接收者id}-->   
											<td><%=view.getToUserId()%></td>
											<!-- 主键列{接收者信息}-->   
											<td><%=view.getToUserInfo()%></td>
											<!-- 主键列{父类型}-->   
											<td><%=view.getInnerPushType()%></td>
											<!-- 主键列{子类型}-->   
											<td><%=view.getInnerPushSubType()%></td>
											<!-- 主键列{推送标题}-->   
											<td><%=view.getPushServiceTitle()%></td>
											<!-- 主键列{推送内容}-->   
											<td><%=view.getPushServiceMsg()%></td>
											<!-- 主键列{推送业务id}-->   
											<td><%=view.getPushServiceId()%></td>
											<!-- 主键列{事件状态}-->   
											<td><%=view.getPushServiceMsgStatus()%></td>
											<!-- 主键列{创建时间}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- 主键列{操作时间}-->   
											<td><%=view.getOptTime()%></td>
											<!-- 主键列{备注}-->   
											<td><%=view.getRemark()%></td>
											<!-- 主键列{1已处理 2未处理}-->   
											<td><%=view.getPushStatus()%></td>
											<!-- 主键列{多少钱 *100}-->   
											<td><%=view.getPushServiceMoney()%></td>
											<!-- 主键列{该事件数量}-->   
											<td><%=view.getPushServiceCount()%></td>
											<!-- 主键列{该事件类型}-->   
											<td><%=view.getPushServiceType()%></td>

											<td>
												<a class="o-edit" href="DiscoverPushSocialAdvice.mc?method=editDiscoverPushSocialAdvice&discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType=<%= view.getDiscoverPushOfficeId() +":"+  view.getPushUserId() +":"+  view.getPushUserInfo() +":"+  view.getFromUserId() +":"+  view.getFromUserInfo() +":"+  view.getToUserId() +":"+  view.getToUserInfo() +":"+  view.getInnerPushType() +":"+  view.getInnerPushSubType() +":"+  view.getPushServiceTitle() +":"+  view.getPushServiceMsg() +":"+  view.getPushServiceId() +":"+  view.getPushServiceMsgStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getPushStatus() +":"+  view.getPushServiceMoney() +":"+  view.getPushServiceCount() +":"+  view.getPushServiceType() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteDiscoverPushSocialAdvice('<%= view.getDiscoverPushOfficeId() +":"+  view.getPushUserId() +":"+  view.getPushUserInfo() +":"+  view.getFromUserId() +":"+  view.getFromUserInfo() +":"+  view.getToUserId() +":"+  view.getToUserInfo() +":"+  view.getInnerPushType() +":"+  view.getInnerPushSubType() +":"+  view.getPushServiceTitle() +":"+  view.getPushServiceMsg() +":"+  view.getPushServiceId() +":"+  view.getPushServiceMsgStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getPushStatus() +":"+  view.getPushServiceMoney() +":"+  view.getPushServiceCount() +":"+  view.getPushServiceType() %>')" title="删除"></a>
											    <a class="o-view" href="DiscoverPushSocialAdvice.mc?method=detailDiscoverPushSocialAdvice&discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType=<%= view.getDiscoverPushOfficeId() +":"+  view.getPushUserId() +":"+  view.getPushUserInfo() +":"+  view.getFromUserId() +":"+  view.getFromUserInfo() +":"+  view.getToUserId() +":"+  view.getToUserInfo() +":"+  view.getInnerPushType() +":"+  view.getInnerPushSubType() +":"+  view.getPushServiceTitle() +":"+  view.getPushServiceMsg() +":"+  view.getPushServiceId() +":"+  view.getPushServiceMsgStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getPushStatus() +":"+  view.getPushServiceMoney() +":"+  view.getPushServiceCount() +":"+  view.getPushServiceType() %>" title="详情"></a> 
												
											</td>
										</tr>
						<%
							}
						%>
						</tbody>      
					</table>
					</div>
			    </div>
	              <div style="height:50px;position: fixed;bottom: 0px;right: 2px;background-color: #f9fbff;width: 100%;padding-right:17px;border-top:1px solid #e2e2e2;">
	    	         <jsp:include page="/jsp/platform/page.jsp" />
		          </div>

	</form>
</body>
</html>
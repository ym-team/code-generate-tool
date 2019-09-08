<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.dhome.data.CmMessagePush" %>
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
		function deleteCmMessagePush(PK) {
			jQuery.ajax({
				url : "CmMessagePush.mc?method=deleteCmMessagePush",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CmMessagePush.mc?method=getAllPageCmMessagePush" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_message_push_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="主键" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="receiver_user_id" placeholder="收件人" value="${ param.receiver_user_id }"/>
						    
						    	<input type='text' class="input-small" name="push_type" placeholder="频道/类型（1：新闻，2：病例分享，3：疑难求助，4：好友申请，5：系统推送提醒，6：圈子申请通知，7：圈子邀请通知，8：圈子帖子通知，9：帖子评论，10：帖子转发，11：帖子点赞，12：私信聊天）" value="${ param.push_type }"/>
						    
						    	<input type='text' class="input-small" name="push_user_id" placeholder="推送人" value="${ param.push_user_id }"/>
						    
						    	<input type='text' class="input-small" name="push_coterie_id" placeholder="圈子ID" value="${ param.push_coterie_id }"/>
						    
						    	<input type='text' class="input-small" name="sub_type" placeholder="" value="${ param.sub_type }"/>
						    
						    	<input type='text' class="input-small" name="push_content" placeholder="推送内容" value="${ param.push_content }"/>
						    
						    	<input type='text' class="input-small" name="push_msg_count" placeholder="推送数量" value="${ param.push_msg_count }"/>
						    
						    	<input type='text' class="input-small" name="create_date" placeholder="创建时间" value="${ param.create_date }"/>
						    
						    	<input type='text' class="input-small" name="op_time" placeholder="推送时间" value="${ param.op_time }"/>
						    
						    	<input type='text' class="input-small" name="op_timestamp" placeholder="时间戳（排序）" value="${ param.op_timestamp }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="状态" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="push_desc" placeholder="推送说明" value="${ param.push_desc }"/>
						    
						    	<input type='text' class="input-small" name="push_remark" placeholder="推送备注" value="${ param.push_remark }"/>

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
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='主键'>主键</th>
								<!-- 主键列{收件人}-->   
								<th align="center" rowName="receiver_user_id" orderName="receiver_user_id:DESC" title='收件人'>收件人</th>
								<!-- 主键列{频道/类型（1：新闻，2：病例分享，3：疑难求助，4：好友申请，5：系统推送提醒，6：圈子申请通知，7：圈子邀请通知，8：圈子帖子通知，9：帖子评论，10：帖子转发，11：帖子点赞，12：私信聊天）}-->   
								<th align="center" rowName="push_type" orderName="push_type:DESC" title='频道/类型（1：新闻，2：病例分享，3：疑难求助，4：好友申请，5：系统推送提醒，6：圈子申请通知，7：圈子邀请通知，8：圈子帖子通知，9：帖子评论，10：帖子转发，11：帖子点赞，12：私信聊天）'>频道/类型（1：新闻，2：病例分享，3：疑难求助，4：好友申请，5：系统推送提醒，6：圈子申请通知，7：圈子邀请通知，8：圈子帖子通知，9：帖子评论，10：帖子转发，11：帖子点赞，12：私信聊天）</th>
								<!-- 主键列{推送人}-->   
								<th align="center" rowName="push_user_id" orderName="push_user_id:DESC" title='推送人'>推送人</th>
								<!-- 主键列{圈子ID}-->   
								<th align="center" rowName="push_coterie_id" orderName="push_coterie_id:DESC" title='圈子ID'>圈子ID</th>
								<!-- 主键列{}-->   
								<th align="center" rowName="sub_type" orderName="sub_type:DESC" title=''></th>
								<!-- 主键列{推送内容}-->   
								<th align="center" rowName="push_content" orderName="push_content:DESC" title='推送内容'>推送内容</th>
								<!-- 主键列{推送数量}-->   
								<th align="center" rowName="push_msg_count" orderName="push_msg_count:DESC" title='推送数量'>推送数量</th>
								<!-- 主键列{创建时间}-->   
								<th align="center" rowName="create_date" orderName="create_date:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列{推送时间}-->   
								<th align="center" rowName="op_time" orderName="op_time:DESC" title='推送时间'>推送时间</th>
								<!-- 主键列{时间戳（排序）}-->   
								<th align="center" rowName="op_timestamp" orderName="op_timestamp:DESC" title='时间戳（排序）'>时间戳（排序）</th>
								<!-- 主键列{状态}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='状态'>状态</th>
								<!-- 主键列{推送说明}-->   
								<th align="center" rowName="push_desc" orderName="push_desc:DESC" title='推送说明'>推送说明</th>
								<!-- 主键列{推送备注}-->   
								<th align="center" rowName="push_remark" orderName="push_remark:DESC" title='推送备注'>推送备注</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							CmMessagePush view = new CmMessagePush();
								for (int i = 0; i < list.size(); i++) {
									view = (CmMessagePush) list.get(i);
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
											<td><%=view.getPkId()%></td>
											<!-- 主键列{收件人}-->   
											<td><%=view.getReceiverUserId()%></td>
											<!-- 主键列{频道/类型（1：新闻，2：病例分享，3：疑难求助，4：好友申请，5：系统推送提醒，6：圈子申请通知，7：圈子邀请通知，8：圈子帖子通知，9：帖子评论，10：帖子转发，11：帖子点赞，12：私信聊天）}-->   
											<td><%=view.getPushType()%></td>
											<!-- 主键列{推送人}-->   
											<td><%=view.getPushUserId()%></td>
											<!-- 主键列{圈子ID}-->   
											<td><%=view.getPushCoterieId()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getSubType()%></td>
											<!-- 主键列{推送内容}-->   
											<td><%=view.getPushContent()%></td>
											<!-- 主键列{推送数量}-->   
											<td><%=view.getPushMsgCount()%></td>
											<!-- 主键列{创建时间}-->   
											<td><%=view.getCreateDate()%></td>
											<!-- 主键列{推送时间}-->   
											<td><%=view.getOpTime()%></td>
											<!-- 主键列{时间戳（排序）}-->   
											<td><%=view.getOpTimestamp()%></td>
											<!-- 主键列{状态}-->   
											<td><%=view.getStatus()%></td>
											<!-- 主键列{推送说明}-->   
											<td><%=view.getPushDesc()%></td>
											<!-- 主键列{推送备注}-->   
											<td><%=view.getPushRemark()%></td>

											<td>
												<a class="o-edit" href="CmMessagePush.mc?method=editCmMessagePush&pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark=<%= view.getPkId() +":"+  view.getReceiverUserId() +":"+  view.getPushType() +":"+  view.getPushUserId() +":"+  view.getPushCoterieId() +":"+  view.getSubType() +":"+  view.getPushContent() +":"+  view.getPushMsgCount() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getOpTimestamp() +":"+  view.getStatus() +":"+  view.getPushDesc() +":"+  view.getPushRemark() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCmMessagePush('<%= view.getPkId() +":"+  view.getReceiverUserId() +":"+  view.getPushType() +":"+  view.getPushUserId() +":"+  view.getPushCoterieId() +":"+  view.getSubType() +":"+  view.getPushContent() +":"+  view.getPushMsgCount() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getOpTimestamp() +":"+  view.getStatus() +":"+  view.getPushDesc() +":"+  view.getPushRemark() %>')" title="删除"></a>
											    <a class="o-view" href="CmMessagePush.mc?method=detailCmMessagePush&pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark=<%= view.getPkId() +":"+  view.getReceiverUserId() +":"+  view.getPushType() +":"+  view.getPushUserId() +":"+  view.getPushCoterieId() +":"+  view.getSubType() +":"+  view.getPushContent() +":"+  view.getPushMsgCount() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getOpTimestamp() +":"+  view.getStatus() +":"+  view.getPushDesc() +":"+  view.getPushRemark() %>" title="详情"></a> 
												
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
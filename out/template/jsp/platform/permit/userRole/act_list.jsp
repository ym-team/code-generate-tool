<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.act.data.Act" %>
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
		function deleteAct(PK) {
			jQuery.ajax({
				url : "Act.mc?method=deleteAct",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/Act.mc?method=getAllPageAct" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
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
								<th align="center" rowName="id" orderName="id:DESC" title='主键'>主键</th>
								<!-- 主键列{活动标题}-->   
								<th align="center" rowName="title" orderName="title:DESC" title='活动标题'>活动标题</th>
								<!-- 主键列{创建时间}-->   
								<th align="center" rowName="act_starttime" orderName="act_starttime:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列{结束时间}-->   
								<th align="center" rowName="act_endtime" orderName="act_endtime:DESC" title='结束时间'>结束时间</th>
								<!-- 主键列{活动地址}-->   
								<th align="center" rowName="act_address" orderName="act_address:DESC" title='活动地址'>活动地址</th>
								<!-- 主键列{活动简介}-->   
								<th align="center" rowName="act_desc" orderName="act_desc:DESC" title='活动简介'>活动简介</th>
								<!-- 主键列{0 免费 1 收费 默认为0}-->   
								<th align="center" rowName="act_type" orderName="act_type:DESC" title='0 免费 1 收费 默认为0'>0 免费 1 收费 默认为0</th>
								<!-- 主键列{活动费用}-->   
								<th align="center" rowName="act_money" orderName="act_money:DESC" title='活动费用'>活动费用</th>
								<!-- 主键列{活动宣传图}-->   
								<th align="center" rowName="act_pic_url" orderName="act_pic_url:DESC" title='活动宣传图'>活动宣传图</th>
								<!-- 主键列{创建者id}-->   
								<th align="center" rowName="act_create_user_id" orderName="act_create_user_id:DESC" title='创建者id'>创建者id</th>
								<!-- 主键列{活动状态 1 审核中 2 成功 3 拒绝 4 结束}-->   
								<th align="center" rowName="act_status" orderName="act_status:DESC" title='活动状态 1 审核中 2 成功 3 拒绝 4 结束'>活动状态 1 审核中 2 成功 3 拒绝 4 结束</th>
								<!-- 主键列{成员数 默认为1}-->   
								<th align="center" rowName="act_member_count" orderName="act_member_count:DESC" title='成员数 默认为1'>成员数 默认为1</th>
								<!-- 主键列{点赞数 默认为0}-->   
								<th align="center" rowName="act_like_count" orderName="act_like_count:DESC" title='点赞数 默认为0'>点赞数 默认为0</th>
								<!-- 主键列{创建时间}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列{更新时间}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='更新时间'>更新时间</th>
								<!-- 主键列{备注}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!-- 主键列{备注1}-->   
								<th align="center" rowName="char2" orderName="char2:DESC" title='备注1'>备注1</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							Act view = new Act();
								for (int i = 0; i < list.size(); i++) {
									view = (Act) list.get(i);
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
											<td><%=view.getId()%></td>
											<!-- 主键列{活动标题}-->   
											<td><%=view.getTitle()%></td>
											<!-- 主键列{创建时间}-->   
											<td><%=view.getActStarttime()%></td>
											<!-- 主键列{结束时间}-->   
											<td><%=view.getActEndtime()%></td>
											<!-- 主键列{活动地址}-->   
											<td><%=view.getActAddress()%></td>
											<!-- 主键列{活动简介}-->   
											<td><%=view.getActDesc()%></td>
											<!-- 主键列{0 免费 1 收费 默认为0}-->   
											<td><%=view.getActType()%></td>
											<!-- 主键列{活动费用}-->   
											<td><%=view.getActMoney()%></td>
											<!-- 主键列{活动宣传图}-->   
											<td><%=view.getActPicUrl()%></td>
											<!-- 主键列{创建者id}-->   
											<td><%=view.getActCreateUserId()%></td>
											<!-- 主键列{活动状态 1 审核中 2 成功 3 拒绝 4 结束}-->   
											<td><%=view.getActStatus()%></td>
											<!-- 主键列{成员数 默认为1}-->   
											<td><%=view.getActMemberCount()%></td>
											<!-- 主键列{点赞数 默认为0}-->   
											<td><%=view.getActLikeCount()%></td>
											<!-- 主键列{创建时间}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- 主键列{更新时间}-->   
											<td><%=view.getOptTime()%></td>
											<!-- 主键列{备注}-->   
											<td><%=view.getRemark()%></td>
											<!-- 主键列{备注1}-->   
											<td><%=view.getChar2()%></td>

											<td>
												<a class="o-edit" href="Act.mc?method=editAct&id,title,actStarttime,actEndtime,actAddress,actDesc,actType,actMoney,actPicUrl,actCreateUserId,actStatus,actMemberCount,actLikeCount,createTime,optTime,remark,char2=<%= view.getId() +":"+  view.getTitle() +":"+  view.getActStarttime() +":"+  view.getActEndtime() +":"+  view.getActAddress() +":"+  view.getActDesc() +":"+  view.getActType() +":"+  view.getActMoney() +":"+  view.getActPicUrl() +":"+  view.getActCreateUserId() +":"+  view.getActStatus() +":"+  view.getActMemberCount() +":"+  view.getActLikeCount() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar2() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteAct('<%= view.getId() +":"+  view.getTitle() +":"+  view.getActStarttime() +":"+  view.getActEndtime() +":"+  view.getActAddress() +":"+  view.getActDesc() +":"+  view.getActType() +":"+  view.getActMoney() +":"+  view.getActPicUrl() +":"+  view.getActCreateUserId() +":"+  view.getActStatus() +":"+  view.getActMemberCount() +":"+  view.getActLikeCount() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar2() %>')" title="删除"></a>
											    <a class="o-view" href="Act.mc?method=detailAct&id,title,actStarttime,actEndtime,actAddress,actDesc,actType,actMoney,actPicUrl,actCreateUserId,actStatus,actMemberCount,actLikeCount,createTime,optTime,remark,char2=<%= view.getId() +":"+  view.getTitle() +":"+  view.getActStarttime() +":"+  view.getActEndtime() +":"+  view.getActAddress() +":"+  view.getActDesc() +":"+  view.getActType() +":"+  view.getActMoney() +":"+  view.getActPicUrl() +":"+  view.getActCreateUserId() +":"+  view.getActStatus() +":"+  view.getActMemberCount() +":"+  view.getActLikeCount() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar2() %>" title="详情"></a> 
												
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
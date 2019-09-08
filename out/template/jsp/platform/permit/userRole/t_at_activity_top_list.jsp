<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TAtActivityTop" %>
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
	<TITLE>娲诲姩琛?查询</TITLE>
	
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
		function deleteTAtActivityTop(PK) {
			jQuery.ajax({
				url : "TAtActivityTop.mc?method=deleteTAtActivityTop",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TAtActivityTop.mc?method=getAllPageTAtActivityTop" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_at_activity_top_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="娲诲姩id" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="activity_name" placeholder="娲诲姩鍚嶇О" value="${ param.activity_name }"/>
						    
						    	<input type='text' class="input-small" name="activity_desc" placeholder="娲诲姩鎻忚堪" value="${ param.activity_desc }"/>
						    
						    	<input type='text' class="input-small" name="activity_start_time" placeholder="娲诲姩寮?濮嬫椂闂?" value="${ param.activity_start_time }"/>
						    
						    	<input type='text' class="input-small" name="activity_end_time" placeholder="娲诲姩缁撴潫鏃堕棿" value="${ param.activity_end_time }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="1 姝ｅ父 2 鍋滅敤" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="update_time" placeholder="鏇存柊鏃堕棿" value="${ param.update_time }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="鍒涘缓鏃堕棿" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="澶囨敞" value="${ param.remark }"/>

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
								<!-- 主键列{娲诲姩id}-->   
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='娲诲姩id'>娲诲姩id</th>
								<!-- 主键列{娲诲姩鍚嶇О}-->   
								<th align="center" rowName="activity_name" orderName="activity_name:DESC" title='娲诲姩鍚嶇О'>娲诲姩鍚嶇О</th>
								<!-- 主键列{娲诲姩鎻忚堪}-->   
								<th align="center" rowName="activity_desc" orderName="activity_desc:DESC" title='娲诲姩鎻忚堪'>娲诲姩鎻忚堪</th>
								<!-- 主键列{娲诲姩寮?濮嬫椂闂?}-->   
								<th align="center" rowName="activity_start_time" orderName="activity_start_time:DESC" title='娲诲姩寮?濮嬫椂闂?'>娲诲姩寮?濮嬫椂闂?</th>
								<!-- 主键列{娲诲姩缁撴潫鏃堕棿}-->   
								<th align="center" rowName="activity_end_time" orderName="activity_end_time:DESC" title='娲诲姩缁撴潫鏃堕棿'>娲诲姩缁撴潫鏃堕棿</th>
								<!-- 主键列{1 姝ｅ父 2 鍋滅敤}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='1 姝ｅ父 2 鍋滅敤'>1 姝ｅ父 2 鍋滅敤</th>
								<!-- 主键列{鏇存柊鏃堕棿}-->   
								<th align="center" rowName="update_time" orderName="update_time:DESC" title='鏇存柊鏃堕棿'>鏇存柊鏃堕棿</th>
								<!-- 主键列{鍒涘缓鏃堕棿}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='鍒涘缓鏃堕棿'>鍒涘缓鏃堕棿</th>
								<!-- 主键列{澶囨敞}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='澶囨敞'>澶囨敞</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							TAtActivityTop view = new TAtActivityTop();
								for (int i = 0; i < list.size(); i++) {
									view = (TAtActivityTop) list.get(i);
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
					
											<!-- 主键列{娲诲姩id}-->   
											<td><%=view.getPkId()%></td>
											<!-- 主键列{娲诲姩鍚嶇О}-->   
											<td><%=view.getActivityName()%></td>
											<!-- 主键列{娲诲姩鎻忚堪}-->   
											<td><%=view.getActivityDesc()%></td>
											<!-- 主键列{娲诲姩寮?濮嬫椂闂?}-->   
											<td><%=view.getActivityStartTime()%></td>
											<!-- 主键列{娲诲姩缁撴潫鏃堕棿}-->   
											<td><%=view.getActivityEndTime()%></td>
											<!-- 主键列{1 姝ｅ父 2 鍋滅敤}-->   
											<td><%=view.getStatus()%></td>
											<!-- 主键列{鏇存柊鏃堕棿}-->   
											<td><%=view.getUpdateTime()%></td>
											<!-- 主键列{鍒涘缓鏃堕棿}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- 主键列{澶囨敞}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="TAtActivityTop.mc?method=editTAtActivityTop&pkId,activityName,activityDesc,activityStartTime,activityEndTime,status,updateTime,createTime,remark=<%= view.getPkId() +":"+  view.getActivityName() +":"+  view.getActivityDesc() +":"+  view.getActivityStartTime() +":"+  view.getActivityEndTime() +":"+  view.getStatus() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTAtActivityTop('<%= view.getPkId() +":"+  view.getActivityName() +":"+  view.getActivityDesc() +":"+  view.getActivityStartTime() +":"+  view.getActivityEndTime() +":"+  view.getStatus() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>')" title="删除"></a>
											    <a class="o-view" href="TAtActivityTop.mc?method=detailTAtActivityTop&pkId,activityName,activityDesc,activityStartTime,activityEndTime,status,updateTime,createTime,remark=<%= view.getPkId() +":"+  view.getActivityName() +":"+  view.getActivityDesc() +":"+  view.getActivityStartTime() +":"+  view.getActivityEndTime() +":"+  view.getStatus() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>" title="详情"></a> 
												
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
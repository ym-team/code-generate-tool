<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.social.data.TSocialKeyword" %>
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
	<TITLE>鏁忔劅璇?查询</TITLE>
	
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
		function deleteTSocialKeyword(PK) {
			jQuery.ajax({
				url : "TSocialKeyword.mc?method=deleteTSocialKeyword",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TSocialKeyword.mc?method=getAllPageTSocialKeyword" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_social_keyword_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="content" placeholder="鍐呭" value="${ param.content }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="0-鍋滅敤 1-鍚敤" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="mark" placeholder="澶囨敞" value="${ param.mark }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="鍒涘缓鏃堕棿" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="modify_time" placeholder="鏈?鍚庝慨鏀规椂闂?" value="${ param.modify_time }"/>

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
								<!-- 主键列{}-->   
								<th align="center" rowName="id" orderName="id:DESC" title=''></th>
								<!-- 主键列{鍐呭}-->   
								<th align="center" rowName="content" orderName="content:DESC" title='鍐呭'>鍐呭</th>
								<!-- 主键列{0-鍋滅敤 1-鍚敤}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='0-鍋滅敤 1-鍚敤'>0-鍋滅敤 1-鍚敤</th>
								<!-- 主键列{澶囨敞}-->   
								<th align="center" rowName="mark" orderName="mark:DESC" title='澶囨敞'>澶囨敞</th>
								<!-- 主键列{鍒涘缓鏃堕棿}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='鍒涘缓鏃堕棿'>鍒涘缓鏃堕棿</th>
								<!-- 主键列{鏈?鍚庝慨鏀规椂闂?}-->   
								<th align="center" rowName="modify_time" orderName="modify_time:DESC" title='鏈?鍚庝慨鏀规椂闂?'>鏈?鍚庝慨鏀规椂闂?</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							TSocialKeyword view = new TSocialKeyword();
								for (int i = 0; i < list.size(); i++) {
									view = (TSocialKeyword) list.get(i);
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
					
											<!-- 主键列{}-->   
											<td><%=view.getId()%></td>
											<!-- 主键列{鍐呭}-->   
											<td><%=view.getContent()%></td>
											<!-- 主键列{0-鍋滅敤 1-鍚敤}-->   
											<td><%=view.getStatus()%></td>
											<!-- 主键列{澶囨敞}-->   
											<td><%=view.getMark()%></td>
											<!-- 主键列{鍒涘缓鏃堕棿}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- 主键列{鏈?鍚庝慨鏀规椂闂?}-->   
											<td><%=view.getModifyTime()%></td>

											<td>
												<a class="o-edit" href="TSocialKeyword.mc?method=editTSocialKeyword&id,content,status,mark,createTime,modifyTime=<%= view.getId() +":"+  view.getContent() +":"+  view.getStatus() +":"+  view.getMark() +":"+  view.getCreateTime() +":"+  view.getModifyTime() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTSocialKeyword('<%= view.getId() +":"+  view.getContent() +":"+  view.getStatus() +":"+  view.getMark() +":"+  view.getCreateTime() +":"+  view.getModifyTime() %>')" title="删除"></a>
											    <a class="o-view" href="TSocialKeyword.mc?method=detailTSocialKeyword&id,content,status,mark,createTime,modifyTime=<%= view.getId() +":"+  view.getContent() +":"+  view.getStatus() +":"+  view.getMark() +":"+  view.getCreateTime() +":"+  view.getModifyTime() %>" title="详情"></a> 
												
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
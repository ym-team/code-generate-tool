<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.discovers.data.Privilege" %>
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
		function deletePrivilege(PK) {
			jQuery.ajax({
				url : "Privilege.mc?method=deletePrivilege",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/Privilege.mc?method=getAllPagePrivilege" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/privilege_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="主键" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="right_name" placeholder="名称" value="${ param.right_name }"/>
						    
						    	<input type='text' class="input-small" name="right_url" placeholder="url" value="${ param.right_url }"/>
						    
						    	<input type='text' class="input-small" name="right_desc" placeholder="url描述" value="${ param.right_desc }"/>
						    
						    	<input type='text' class="input-small" name="right_code" placeholder="url对应的权限码" value="${ param.right_code }"/>
						    
						    	<input type='text' class="input-small" name="right_pos" placeholder="url对应的权限码" value="${ param.right_pos }"/>

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
								<!-- 主键列{名称}-->   
								<th align="center" rowName="right_name" orderName="right_name:DESC" title='名称'>名称</th>
								<!-- 主键列{url}-->   
								<th align="center" rowName="right_url" orderName="right_url:DESC" title='url'>url</th>
								<!-- 主键列{url描述}-->   
								<th align="center" rowName="right_desc" orderName="right_desc:DESC" title='url描述'>url描述</th>
								<!-- 主键列{url对应的权限码}-->   
								<th align="center" rowName="right_code" orderName="right_code:DESC" title='url对应的权限码'>url对应的权限码</th>
								<!-- 主键列{url对应的权限码}-->   
								<th align="center" rowName="right_pos" orderName="right_pos:DESC" title='url对应的权限码'>url对应的权限码</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							Privilege view = new Privilege();
								for (int i = 0; i < list.size(); i++) {
									view = (Privilege) list.get(i);
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
											<!-- 主键列{名称}-->   
											<td><%=view.getRightName()%></td>
											<!-- 主键列{url}-->   
											<td><%=view.getRightUrl()%></td>
											<!-- 主键列{url描述}-->   
											<td><%=view.getRightDesc()%></td>
											<!-- 主键列{url对应的权限码}-->   
											<td><%=view.getRightCode()%></td>
											<!-- 主键列{url对应的权限码}-->   
											<td><%=view.getRightPos()%></td>

											<td>
												<a class="o-edit" href="Privilege.mc?method=editPrivilege&id,rightName,rightUrl,rightDesc,rightCode,rightPos=<%= view.getId() +":"+  view.getRightName() +":"+  view.getRightUrl() +":"+  view.getRightDesc() +":"+  view.getRightCode() +":"+  view.getRightPos() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deletePrivilege('<%= view.getId() +":"+  view.getRightName() +":"+  view.getRightUrl() +":"+  view.getRightDesc() +":"+  view.getRightCode() +":"+  view.getRightPos() %>')" title="删除"></a>
											    <a class="o-view" href="Privilege.mc?method=detailPrivilege&id,rightName,rightUrl,rightDesc,rightCode,rightPos=<%= view.getId() +":"+  view.getRightName() +":"+  view.getRightUrl() +":"+  view.getRightDesc() +":"+  view.getRightCode() +":"+  view.getRightPos() %>" title="详情"></a> 
												
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
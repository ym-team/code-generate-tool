<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmExceptionBillToIngore" %>
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
	<TITLE>寮傚父鍗曚箣蹇界暐璁板綍琛?查询</TITLE>
	
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
		function deleteTPmExceptionBillToIngore(PK) {
			jQuery.ajax({
				url : "TPmExceptionBillToIngore.mc?method=deleteTPmExceptionBillToIngore",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TPmExceptionBillToIngore.mc?method=getAllPageTPmExceptionBillToIngore" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_exception_bill_to_ingore_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="涓婚敭" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="join_id" placeholder="寮傚父璐﹀崟琛ㄤ富閿?" value="${ param.join_id }"/>
						    
						    	<input type='text' class="input-small" name="bill_code" placeholder="璐﹀崟缂栧彿" value="${ param.bill_code }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="鎿嶄綔鏃堕棿" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="ingore_reason" placeholder="蹇界暐鍘熷洜" value="${ param.ingore_reason }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="1:鏃犳晥 2鏈夋晥 榛樿2" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="opt_user_id" placeholder="鎿嶄綔鑰卛d" value="${ param.opt_user_id }"/>
						    
						    	<input type='text' class="input-small" name="db_update_time" placeholder="鏇存柊鏃堕棿" value="${ param.db_update_time }"/>
						    
						    	<input type='text' class="input-small" name="db_create_time" placeholder="鍒涘缓鏃堕棿" value="${ param.db_create_time }"/>
						    
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
								<!-- 主键列{涓婚敭}-->   
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='涓婚敭'>涓婚敭</th>
								<!-- 主键列{寮傚父璐﹀崟琛ㄤ富閿?}-->   
								<th align="center" rowName="join_id" orderName="join_id:DESC" title='寮傚父璐﹀崟琛ㄤ富閿?'>寮傚父璐﹀崟琛ㄤ富閿?</th>
								<!-- 主键列{璐﹀崟缂栧彿}-->   
								<th align="center" rowName="bill_code" orderName="bill_code:DESC" title='璐﹀崟缂栧彿'>璐﹀崟缂栧彿</th>
								<!-- 主键列{鎿嶄綔鏃堕棿}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='鎿嶄綔鏃堕棿'>鎿嶄綔鏃堕棿</th>
								<!-- 主键列{蹇界暐鍘熷洜}-->   
								<th align="center" rowName="ingore_reason" orderName="ingore_reason:DESC" title='蹇界暐鍘熷洜'>蹇界暐鍘熷洜</th>
								<!-- 主键列{1:鏃犳晥 2鏈夋晥 榛樿2}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='1:鏃犳晥 2鏈夋晥 榛樿2'>1:鏃犳晥 2鏈夋晥 榛樿2</th>
								<!-- 主键列{鎿嶄綔鑰卛d}-->   
								<th align="center" rowName="opt_user_id" orderName="opt_user_id:DESC" title='鎿嶄綔鑰卛d'>鎿嶄綔鑰卛d</th>
								<!-- 主键列{鏇存柊鏃堕棿}-->   
								<th align="center" rowName="db_update_time" orderName="db_update_time:DESC" title='鏇存柊鏃堕棿'>鏇存柊鏃堕棿</th>
								<!-- 主键列{鍒涘缓鏃堕棿}-->   
								<th align="center" rowName="db_create_time" orderName="db_create_time:DESC" title='鍒涘缓鏃堕棿'>鍒涘缓鏃堕棿</th>
								<!-- 主键列{澶囨敞}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='澶囨敞'>澶囨敞</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							TPmExceptionBillToIngore view = new TPmExceptionBillToIngore();
								for (int i = 0; i < list.size(); i++) {
									view = (TPmExceptionBillToIngore) list.get(i);
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
					
											<!-- 主键列{涓婚敭}-->   
											<td><%=view.getPkId()%></td>
											<!-- 主键列{寮傚父璐﹀崟琛ㄤ富閿?}-->   
											<td><%=view.getJoinId()%></td>
											<!-- 主键列{璐﹀崟缂栧彿}-->   
											<td><%=view.getBillCode()%></td>
											<!-- 主键列{鎿嶄綔鏃堕棿}-->   
											<td><%=view.getOptTime()%></td>
											<!-- 主键列{蹇界暐鍘熷洜}-->   
											<td><%=view.getIngoreReason()%></td>
											<!-- 主键列{1:鏃犳晥 2鏈夋晥 榛樿2}-->   
											<td><%=view.getStatus()%></td>
											<!-- 主键列{鎿嶄綔鑰卛d}-->   
											<td><%=view.getOptUserId()%></td>
											<!-- 主键列{鏇存柊鏃堕棿}-->   
											<td><%=view.getDbUpdateTime()%></td>
											<!-- 主键列{鍒涘缓鏃堕棿}-->   
											<td><%=view.getDbCreateTime()%></td>
											<!-- 主键列{澶囨敞}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="TPmExceptionBillToIngore.mc?method=editTPmExceptionBillToIngore&pkId,joinId,billCode,optTime,ingoreReason,status,optUserId,dbUpdateTime,dbCreateTime,remark=<%= view.getPkId() +":"+  view.getJoinId() +":"+  view.getBillCode() +":"+  view.getOptTime() +":"+  view.getIngoreReason() +":"+  view.getStatus() +":"+  view.getOptUserId() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTPmExceptionBillToIngore('<%= view.getPkId() +":"+  view.getJoinId() +":"+  view.getBillCode() +":"+  view.getOptTime() +":"+  view.getIngoreReason() +":"+  view.getStatus() +":"+  view.getOptUserId() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>')" title="删除"></a>
											    <a class="o-view" href="TPmExceptionBillToIngore.mc?method=detailTPmExceptionBillToIngore&pkId,joinId,billCode,optTime,ingoreReason,status,optUserId,dbUpdateTime,dbCreateTime,remark=<%= view.getPkId() +":"+  view.getJoinId() +":"+  view.getBillCode() +":"+  view.getOptTime() +":"+  view.getIngoreReason() +":"+  view.getStatus() +":"+  view.getOptUserId() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>" title="详情"></a> 
												
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
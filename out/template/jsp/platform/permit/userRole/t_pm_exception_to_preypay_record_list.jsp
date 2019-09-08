<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmExceptionToPreypayRecord" %>
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
	<TITLE>閿熸枻鎷烽敓鏂ゆ嫹查询</TITLE>
	
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
		function deleteTPmExceptionToPreypayRecord(PK) {
			jQuery.ajax({
				url : "TPmExceptionToPreypayRecord.mc?method=deleteTPmExceptionToPreypayRecord",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TPmExceptionToPreypayRecord.mc?method=getAllPageTPmExceptionToPreypayRecord" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_exception_to_preypay_record_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="exception_prepay_id" placeholder="寮傚父杞敮浠樿褰曚富閿?" value="${ param.exception_prepay_id }"/>
						    
						    	<input type='text' class="input-small" name="exception_bill_code" placeholder="寮傚父鍗曡〃billcode" value="${ param.exception_bill_code }"/>
						    
						    	<input type='text' class="input-small" name="nc_prepay_id" placeholder="棰勭即璐瑰崟鍙?" value="${ param.nc_prepay_id }"/>
						    
						    	<input type='text' class="input-small" name="nc_prepay_time" placeholder="棰勭即璐规椂闂?" value="${ param.nc_prepay_time }"/>
						    
						    	<input type='text' class="input-small" name="nc_prepay_name" placeholder="棰勭即璐规柟妗?" value="${ param.nc_prepay_name }"/>
						    
						    	<input type='text' class="input-small" name="nc_prepay_money" placeholder="棰勭即閲戦" value="${ param.nc_prepay_money }"/>
						    
						    	<input type='text' class="input-small" name="nc_status" placeholder="0:鏃犳晥 1鏈夋晥 榛樿1" value="${ param.nc_status }"/>
						    
						    	<input type='text' class="input-small" name="opt_user_id" placeholder="鎿嶄綔鑰卛d" value="${ param.opt_user_id }"/>
						    
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
								<!-- 主键列{寮傚父杞敮浠樿褰曚富閿?}-->   
								<th align="center" rowName="exception_prepay_id" orderName="exception_prepay_id:DESC" title='寮傚父杞敮浠樿褰曚富閿?'>寮傚父杞敮浠樿褰曚富閿?</th>
								<!-- 主键列{寮傚父鍗曡〃billcode}-->   
								<th align="center" rowName="exception_bill_code" orderName="exception_bill_code:DESC" title='寮傚父鍗曡〃billcode'>寮傚父鍗曡〃billcode</th>
								<!-- 主键列{棰勭即璐瑰崟鍙?}-->   
								<th align="center" rowName="nc_prepay_id" orderName="nc_prepay_id:DESC" title='棰勭即璐瑰崟鍙?'>棰勭即璐瑰崟鍙?</th>
								<!-- 主键列{棰勭即璐规椂闂?}-->   
								<th align="center" rowName="nc_prepay_time" orderName="nc_prepay_time:DESC" title='棰勭即璐规椂闂?'>棰勭即璐规椂闂?</th>
								<!-- 主键列{棰勭即璐规柟妗?}-->   
								<th align="center" rowName="nc_prepay_name" orderName="nc_prepay_name:DESC" title='棰勭即璐规柟妗?'>棰勭即璐规柟妗?</th>
								<!-- 主键列{棰勭即閲戦}-->   
								<th align="center" rowName="nc_prepay_money" orderName="nc_prepay_money:DESC" title='棰勭即閲戦'>棰勭即閲戦</th>
								<!-- 主键列{0:鏃犳晥 1鏈夋晥 榛樿1}-->   
								<th align="center" rowName="nc_status" orderName="nc_status:DESC" title='0:鏃犳晥 1鏈夋晥 榛樿1'>0:鏃犳晥 1鏈夋晥 榛樿1</th>
								<!-- 主键列{鎿嶄綔鑰卛d}-->   
								<th align="center" rowName="opt_user_id" orderName="opt_user_id:DESC" title='鎿嶄綔鑰卛d'>鎿嶄綔鑰卛d</th>
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
							TPmExceptionToPreypayRecord view = new TPmExceptionToPreypayRecord();
								for (int i = 0; i < list.size(); i++) {
									view = (TPmExceptionToPreypayRecord) list.get(i);
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
					
											<!-- 主键列{寮傚父杞敮浠樿褰曚富閿?}-->   
											<td><%=view.getExceptionPrepayId()%></td>
											<!-- 主键列{寮傚父鍗曡〃billcode}-->   
											<td><%=view.getExceptionBillCode()%></td>
											<!-- 主键列{棰勭即璐瑰崟鍙?}-->   
											<td><%=view.getNcPrepayId()%></td>
											<!-- 主键列{棰勭即璐规椂闂?}-->   
											<td><%=view.getNcPrepayTime()%></td>
											<!-- 主键列{棰勭即璐规柟妗?}-->   
											<td><%=view.getNcPrepayName()%></td>
											<!-- 主键列{棰勭即閲戦}-->   
											<td><%=view.getNcPrepayMoney()%></td>
											<!-- 主键列{0:鏃犳晥 1鏈夋晥 榛樿1}-->   
											<td><%=view.getNcStatus()%></td>
											<!-- 主键列{鎿嶄綔鑰卛d}-->   
											<td><%=view.getOptUserId()%></td>
											<!-- 主键列{鏇存柊鏃堕棿}-->   
											<td><%=view.getUpdateTime()%></td>
											<!-- 主键列{鍒涘缓鏃堕棿}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- 主键列{澶囨敞}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="TPmExceptionToPreypayRecord.mc?method=editTPmExceptionToPreypayRecord&exceptionPrepayId,exceptionBillCode,ncPrepayId,ncPrepayTime,ncPrepayName,ncPrepayMoney,ncStatus,optUserId,updateTime,createTime,remark=<%= view.getExceptionPrepayId() +":"+  view.getExceptionBillCode() +":"+  view.getNcPrepayId() +":"+  view.getNcPrepayTime() +":"+  view.getNcPrepayName() +":"+  view.getNcPrepayMoney() +":"+  view.getNcStatus() +":"+  view.getOptUserId() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTPmExceptionToPreypayRecord('<%= view.getExceptionPrepayId() +":"+  view.getExceptionBillCode() +":"+  view.getNcPrepayId() +":"+  view.getNcPrepayTime() +":"+  view.getNcPrepayName() +":"+  view.getNcPrepayMoney() +":"+  view.getNcStatus() +":"+  view.getOptUserId() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>')" title="删除"></a>
											    <a class="o-view" href="TPmExceptionToPreypayRecord.mc?method=detailTPmExceptionToPreypayRecord&exceptionPrepayId,exceptionBillCode,ncPrepayId,ncPrepayTime,ncPrepayName,ncPrepayMoney,ncStatus,optUserId,updateTime,createTime,remark=<%= view.getExceptionPrepayId() +":"+  view.getExceptionBillCode() +":"+  view.getNcPrepayId() +":"+  view.getNcPrepayTime() +":"+  view.getNcPrepayName() +":"+  view.getNcPrepayMoney() +":"+  view.getNcStatus() +":"+  view.getOptUserId() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>" title="详情"></a> 
												
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
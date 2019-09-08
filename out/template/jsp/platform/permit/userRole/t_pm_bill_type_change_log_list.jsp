<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBillTypeChangeLog" %>
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
	<TITLE>锟斤拷锟斤拷��ѯ</TITLE>
	
	<!-- ����JS��CSS��ʽ-->
<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/artDialog/skins/default.css">
<script src="${contextPath}/skins/library/artDialog/jArtDialog.js"></script>
<script type="text/javascript" src="${contextPath}/skins/js/common/list_common_js.js"></script>
<!-- ����ʽ����������� -->
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">

<!-- ��ѯҳ������ checkbox����Ҫ���� -->
<link rel="stylesheet" type="text/css"	href="${contextPath}/skins/library/iCheck-master/skins/square/blue.css">
<script src="${contextPath}/skins/library/iCheck-master/icheck.js"></script>
<script type="text/javascript" src="${contextPath}/skins/js/common/scroll_common_js.js"></script>
	
	<script type="text/javascript">
		function deleteTPmBillTypeChangeLog(PK) {
			jQuery.ajax({
				url : "TPmBillTypeChangeLog.mc?method=deleteTPmBillTypeChangeLog",
				type : "post",
				data : {PK:PK},
				success : function(result) {
					if (result > 0) {
						alert("ɾ���ɹ�");
						$("#start").val(0);
						$("#searchForm").submit();
					} else {
						alert("ɾ��ʧ��");
					}
				},
				error : function(result) {
					alert("ɾ��ʧ��");
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TPmBillTypeChangeLog.mc?method=getAllPageTPmBillTypeChangeLog" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_type_change_log_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="主键" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="type_id" placeholder="账单类型表主�?" value="${ param.type_id }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="操作时间" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_event" placeholder="操作事项 如变更一级类�? 二级类目 可用状�??" value="${ param.opt_event }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="1:无效 2有效 默认2" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="opt_user_id" placeholder="操作者id" value="${ param.opt_user_id }"/>
						    
						    	<input type='text' class="input-small" name="db_update_time" placeholder="更新时间" value="${ param.db_update_time }"/>
						    
						    	<input type='text' class="input-small" name="db_create_time" placeholder="创建时间" value="${ param.db_create_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="备注" value="${ param.remark }"/>

								<button type="button" onclick="javascript:searchData();" id="searchbtn"  class="btn btn-group-vertical">����</button>
							</div>
								
							</td>
						</tr>
						
					</table>
			</div>
			<!-- ��ѯ������ʾ����end --> 
			<!-- ������ʾ�б�start -->
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
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="ȫѡ/ȡ��" />
	                            </th>
	                            <!--��ͷѭ����ʼ -->
								<!-- ������{主键}-->   
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='主键'>主键</th>
								<!-- ������{账单类型表主�?}-->   
								<th align="center" rowName="type_id" orderName="type_id:DESC" title='账单类型表主�?'>账单类型表主�?</th>
								<!-- ������{操作时间}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='操作时间'>操作时间</th>
								<!-- ������{操作事项 如变更一级类�? 二级类目 可用状�??}-->   
								<th align="center" rowName="opt_event" orderName="opt_event:DESC" title='操作事项 如变更一级类�? 二级类目 可用状�??'>操作事项 如变更一级类�? 二级类目 可用状�??</th>
								<!-- ������{1:无效 2有效 默认2}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='1:无效 2有效 默认2'>1:无效 2有效 默认2</th>
								<!-- ������{操作者id}-->   
								<th align="center" rowName="opt_user_id" orderName="opt_user_id:DESC" title='操作者id'>操作者id</th>
								<!-- ������{更新时间}-->   
								<th align="center" rowName="db_update_time" orderName="db_update_time:DESC" title='更新时间'>更新时间</th>
								<!-- ������{创建时间}-->   
								<th align="center" rowName="db_create_time" orderName="db_create_time:DESC" title='创建时间'>创建时间</th>
								<!-- ������{备注}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							TPmBillTypeChangeLog view = new TPmBillTypeChangeLog();
								for (int i = 0; i < list.size(); i++) {
									view = (TPmBillTypeChangeLog) list.get(i);
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
				                            	<input name="selectall_checkbox" type="checkbox" title="ȫѡ/ȡ��" />
				                            </th>
					
											<!-- ������{主键}-->   
											<td><%=view.getPkId()%></td>
											<!-- ������{账单类型表主�?}-->   
											<td><%=view.getTypeId()%></td>
											<!-- ������{操作时间}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{操作事项 如变更一级类�? 二级类目 可用状�??}-->   
											<td><%=view.getOptEvent()%></td>
											<!-- ������{1:无效 2有效 默认2}-->   
											<td><%=view.getStatus()%></td>
											<!-- ������{操作者id}-->   
											<td><%=view.getOptUserId()%></td>
											<!-- ������{更新时间}-->   
											<td><%=view.getDbUpdateTime()%></td>
											<!-- ������{创建时间}-->   
											<td><%=view.getDbCreateTime()%></td>
											<!-- ������{备注}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="TPmBillTypeChangeLog.mc?method=editTPmBillTypeChangeLog&pkId,typeId,optTime,optEvent,status,optUserId,dbUpdateTime,dbCreateTime,remark=<%= view.getPkId() +":"+  view.getTypeId() +":"+  view.getOptTime() +":"+  view.getOptEvent() +":"+  view.getStatus() +":"+  view.getOptUserId() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTPmBillTypeChangeLog('<%= view.getPkId() +":"+  view.getTypeId() +":"+  view.getOptTime() +":"+  view.getOptEvent() +":"+  view.getStatus() +":"+  view.getOptUserId() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>')" title="ɾ��"></a>
											    <a class="o-view" href="TPmBillTypeChangeLog.mc?method=detailTPmBillTypeChangeLog&pkId,typeId,optTime,optEvent,status,optUserId,dbUpdateTime,dbCreateTime,remark=<%= view.getPkId() +":"+  view.getTypeId() +":"+  view.getOptTime() +":"+  view.getOptEvent() +":"+  view.getStatus() +":"+  view.getOptUserId() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>" title="����"></a> 
												
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
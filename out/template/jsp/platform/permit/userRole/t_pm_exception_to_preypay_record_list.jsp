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
		function deleteTPmExceptionToPreypayRecord(PK) {
			jQuery.ajax({
				url : "TPmExceptionToPreypayRecord.mc?method=deleteTPmExceptionToPreypayRecord",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TPmExceptionToPreypayRecord.mc?method=getAllPageTPmExceptionToPreypayRecord" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_exception_to_preypay_record_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="exception_prepay_id" placeholder="异常转支付记录主�?" value="${ param.exception_prepay_id }"/>
						    
						    	<input type='text' class="input-small" name="exception_bill_code" placeholder="异常单表billcode" value="${ param.exception_bill_code }"/>
						    
						    	<input type='text' class="input-small" name="nc_prepay_id" placeholder="预缴费单�?" value="${ param.nc_prepay_id }"/>
						    
						    	<input type='text' class="input-small" name="nc_prepay_time" placeholder="预缴费时�?" value="${ param.nc_prepay_time }"/>
						    
						    	<input type='text' class="input-small" name="nc_prepay_name" placeholder="预缴费方�?" value="${ param.nc_prepay_name }"/>
						    
						    	<input type='text' class="input-small" name="nc_prepay_money" placeholder="预缴金额" value="${ param.nc_prepay_money }"/>
						    
						    	<input type='text' class="input-small" name="nc_status" placeholder="0:无效 1有效 默认1" value="${ param.nc_status }"/>
						    
						    	<input type='text' class="input-small" name="opt_user_id" placeholder="操作者id" value="${ param.opt_user_id }"/>
						    
						    	<input type='text' class="input-small" name="update_time" placeholder="更新时间" value="${ param.update_time }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="创建时间" value="${ param.create_time }"/>
						    
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
								<!-- ������{异常转支付记录主�?}-->   
								<th align="center" rowName="exception_prepay_id" orderName="exception_prepay_id:DESC" title='异常转支付记录主�?'>异常转支付记录主�?</th>
								<!-- ������{异常单表billcode}-->   
								<th align="center" rowName="exception_bill_code" orderName="exception_bill_code:DESC" title='异常单表billcode'>异常单表billcode</th>
								<!-- ������{预缴费单�?}-->   
								<th align="center" rowName="nc_prepay_id" orderName="nc_prepay_id:DESC" title='预缴费单�?'>预缴费单�?</th>
								<!-- ������{预缴费时�?}-->   
								<th align="center" rowName="nc_prepay_time" orderName="nc_prepay_time:DESC" title='预缴费时�?'>预缴费时�?</th>
								<!-- ������{预缴费方�?}-->   
								<th align="center" rowName="nc_prepay_name" orderName="nc_prepay_name:DESC" title='预缴费方�?'>预缴费方�?</th>
								<!-- ������{预缴金额}-->   
								<th align="center" rowName="nc_prepay_money" orderName="nc_prepay_money:DESC" title='预缴金额'>预缴金额</th>
								<!-- ������{0:无效 1有效 默认1}-->   
								<th align="center" rowName="nc_status" orderName="nc_status:DESC" title='0:无效 1有效 默认1'>0:无效 1有效 默认1</th>
								<!-- ������{操作者id}-->   
								<th align="center" rowName="opt_user_id" orderName="opt_user_id:DESC" title='操作者id'>操作者id</th>
								<!-- ������{更新时间}-->   
								<th align="center" rowName="update_time" orderName="update_time:DESC" title='更新时间'>更新时间</th>
								<!-- ������{创建时间}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- ������{备注}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
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
				                            	<input name="selectall_checkbox" type="checkbox" title="ȫѡ/ȡ��" />
				                            </th>
					
											<!-- ������{异常转支付记录主�?}-->   
											<td><%=view.getExceptionPrepayId()%></td>
											<!-- ������{异常单表billcode}-->   
											<td><%=view.getExceptionBillCode()%></td>
											<!-- ������{预缴费单�?}-->   
											<td><%=view.getNcPrepayId()%></td>
											<!-- ������{预缴费时�?}-->   
											<td><%=view.getNcPrepayTime()%></td>
											<!-- ������{预缴费方�?}-->   
											<td><%=view.getNcPrepayName()%></td>
											<!-- ������{预缴金额}-->   
											<td><%=view.getNcPrepayMoney()%></td>
											<!-- ������{0:无效 1有效 默认1}-->   
											<td><%=view.getNcStatus()%></td>
											<!-- ������{操作者id}-->   
											<td><%=view.getOptUserId()%></td>
											<!-- ������{更新时间}-->   
											<td><%=view.getUpdateTime()%></td>
											<!-- ������{创建时间}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{备注}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="TPmExceptionToPreypayRecord.mc?method=editTPmExceptionToPreypayRecord&exceptionPrepayId,exceptionBillCode,ncPrepayId,ncPrepayTime,ncPrepayName,ncPrepayMoney,ncStatus,optUserId,updateTime,createTime,remark=<%= view.getExceptionPrepayId() +":"+  view.getExceptionBillCode() +":"+  view.getNcPrepayId() +":"+  view.getNcPrepayTime() +":"+  view.getNcPrepayName() +":"+  view.getNcPrepayMoney() +":"+  view.getNcStatus() +":"+  view.getOptUserId() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTPmExceptionToPreypayRecord('<%= view.getExceptionPrepayId() +":"+  view.getExceptionBillCode() +":"+  view.getNcPrepayId() +":"+  view.getNcPrepayTime() +":"+  view.getNcPrepayName() +":"+  view.getNcPrepayMoney() +":"+  view.getNcStatus() +":"+  view.getOptUserId() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>')" title="ɾ��"></a>
											    <a class="o-view" href="TPmExceptionToPreypayRecord.mc?method=detailTPmExceptionToPreypayRecord&exceptionPrepayId,exceptionBillCode,ncPrepayId,ncPrepayTime,ncPrepayName,ncPrepayMoney,ncStatus,optUserId,updateTime,createTime,remark=<%= view.getExceptionPrepayId() +":"+  view.getExceptionBillCode() +":"+  view.getNcPrepayId() +":"+  view.getNcPrepayTime() +":"+  view.getNcPrepayName() +":"+  view.getNcPrepayMoney() +":"+  view.getNcStatus() +":"+  view.getOptUserId() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>" title="����"></a> 
												
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
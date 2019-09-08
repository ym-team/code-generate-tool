<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.social.data.TAtActivityDetail" %>
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
		function deleteTAtActivityDetail(PK) {
			jQuery.ajax({
				url : "TAtActivityDetail.mc?method=deleteTAtActivityDetail",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TAtActivityDetail.mc?method=getAllPageTAtActivityDetail" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_at_activity_detail_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="明细id" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="user_id" placeholder="登录者id 没有则是0" value="${ param.user_id }"/>
						    
						    	<input type='text' class="input-small" name="trigger_time" placeholder="触发时间" value="${ param.trigger_time }"/>
						    
						    	<input type='text' class="input-small" name="trigger_type" placeholder="触发类型 1 查看 2 分享" value="${ param.trigger_type }"/>
						    
						    	<input type='text' class="input-small" name="device_type" placeholder="设备类型 1 ios  2 android 3 web" value="${ param.device_type }"/>
						    
						    	<input type='text' class="input-small" name="channel_type" placeholder="来源渠道 1 微信  2 app" value="${ param.channel_type }"/>
						    
						    	<input type='text' class="input-small" name="activity_id" placeholder="活动id" value="${ param.activity_id }"/>
						    
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
								<!-- ������{明细id}-->   
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='明细id'>明细id</th>
								<!-- ������{登录者id 没有则是0}-->   
								<th align="center" rowName="user_id" orderName="user_id:DESC" title='登录者id 没有则是0'>登录者id 没有则是0</th>
								<!-- ������{触发时间}-->   
								<th align="center" rowName="trigger_time" orderName="trigger_time:DESC" title='触发时间'>触发时间</th>
								<!-- ������{触发类型 1 查看 2 分享}-->   
								<th align="center" rowName="trigger_type" orderName="trigger_type:DESC" title='触发类型 1 查看 2 分享'>触发类型 1 查看 2 分享</th>
								<!-- ������{设备类型 1 ios  2 android 3 web}-->   
								<th align="center" rowName="device_type" orderName="device_type:DESC" title='设备类型 1 ios  2 android 3 web'>设备类型 1 ios  2 android 3 web</th>
								<!-- ������{来源渠道 1 微信  2 app}-->   
								<th align="center" rowName="channel_type" orderName="channel_type:DESC" title='来源渠道 1 微信  2 app'>来源渠道 1 微信  2 app</th>
								<!-- ������{活动id}-->   
								<th align="center" rowName="activity_id" orderName="activity_id:DESC" title='活动id'>活动id</th>
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
							TAtActivityDetail view = new TAtActivityDetail();
								for (int i = 0; i < list.size(); i++) {
									view = (TAtActivityDetail) list.get(i);
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
					
											<!-- ������{明细id}-->   
											<td><%=view.getPkId()%></td>
											<!-- ������{登录者id 没有则是0}-->   
											<td><%=view.getUserId()%></td>
											<!-- ������{触发时间}-->   
											<td><%=view.getTriggerTime()%></td>
											<!-- ������{触发类型 1 查看 2 分享}-->   
											<td><%=view.getTriggerType()%></td>
											<!-- ������{设备类型 1 ios  2 android 3 web}-->   
											<td><%=view.getDeviceType()%></td>
											<!-- ������{来源渠道 1 微信  2 app}-->   
											<td><%=view.getChannelType()%></td>
											<!-- ������{活动id}-->   
											<td><%=view.getActivityId()%></td>
											<!-- ������{更新时间}-->   
											<td><%=view.getUpdateTime()%></td>
											<!-- ������{创建时间}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{备注}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="TAtActivityDetail.mc?method=editTAtActivityDetail&pkId,userId,triggerTime,triggerType,deviceType,channelType,activityId,updateTime,createTime,remark=<%= view.getPkId() +":"+  view.getUserId() +":"+  view.getTriggerTime() +":"+  view.getTriggerType() +":"+  view.getDeviceType() +":"+  view.getChannelType() +":"+  view.getActivityId() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTAtActivityDetail('<%= view.getPkId() +":"+  view.getUserId() +":"+  view.getTriggerTime() +":"+  view.getTriggerType() +":"+  view.getDeviceType() +":"+  view.getChannelType() +":"+  view.getActivityId() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>')" title="ɾ��"></a>
											    <a class="o-view" href="TAtActivityDetail.mc?method=detailTAtActivityDetail&pkId,userId,triggerTime,triggerType,deviceType,channelType,activityId,updateTime,createTime,remark=<%= view.getPkId() +":"+  view.getUserId() +":"+  view.getTriggerTime() +":"+  view.getTriggerType() +":"+  view.getDeviceType() +":"+  view.getChannelType() +":"+  view.getActivityId() +":"+  view.getUpdateTime() +":"+  view.getCreateTime() +":"+  view.getRemark() %>" title="����"></a> 
												
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
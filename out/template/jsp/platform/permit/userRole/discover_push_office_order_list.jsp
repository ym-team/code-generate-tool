<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.DiscoverPushOfficeOrder" %>
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
	<TITLE>������ѯ</TITLE>
	
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
		function deleteDiscoverPushOfficeOrder(PK) {
			jQuery.ajax({
				url : "DiscoverPushOfficeOrder.mc?method=deleteDiscoverPushOfficeOrder",
				type : "post",
				data : {PK:PK},
				success : function(result) {
					if (result > 0) {
						alert("ɾ��ɹ�");
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/DiscoverPushOfficeOrder.mc?method=getAllPageDiscoverPushOfficeOrder" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/discover_push_office_order_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="discover_push_office_id" placeholder="����" value="${ param.discover_push_office_id }"/>
						    
						    	<input type='text' class="input-small" name="push_user_id" placeholder="������id" value="${ param.push_user_id }"/>
						    
						    	<input type='text' class="input-small" name="push_user_info" placeholder="��������Ϣ" value="${ param.push_user_info }"/>
						    
						    	<input type='text' class="input-small" name="from_user_id" placeholder="�������ĸ��û���id" value="${ param.from_user_id }"/>
						    
						    	<input type='text' class="input-small" name="from_user_info" placeholder="�������ĸ��û���Ϣ" value="${ param.from_user_info }"/>
						    
						    	<input type='text' class="input-small" name="to_user_id" placeholder="������id" value="${ param.to_user_id }"/>
						    
						    	<input type='text' class="input-small" name="to_user_info" placeholder="��������Ϣ" value="${ param.to_user_info }"/>
						    
						    	<input type='text' class="input-small" name="inner_push_type" placeholder="100������" value="${ param.inner_push_type }"/>
						    
						    	<input type='text' class="input-small" name="inner_push_sub_type" placeholder="��δ����" value="${ param.inner_push_sub_type }"/>
						    
						    	<input type='text' class="input-small" name="push_service_title" placeholder="���ͱ���" value="${ param.push_service_title }"/>
						    
						    	<input type='text' class="input-small" name="push_service_msg" placeholder="��������" value="${ param.push_service_msg }"/>
						    
						    	<input type='text' class="input-small" name="push_service_id" placeholder="����ҵ��id" value="${ param.push_service_id }"/>
						    
						    	<input type='text' class="input-small" name="push_service_msg_status" placeholder="��� �����ҳ�Ա 1���룬2ͬ�⣬3�ܾ�4���� 5����" value="${ param.push_service_msg_status }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="push_status" placeholder="1�Ѵ��� 2δ����" value="${ param.push_status }"/>
						    
						    	<input type='text' class="input-small" name="push_service_money" placeholder="����Ǯ *100" value="${ param.push_service_money }"/>
						    
						    	<input type='text' class="input-small" name="push_service_count" placeholder="���¼�����" value="${ param.push_service_count }"/>
						    
						    	<input type='text' class="input-small" name="push_service_type" placeholder="���¼�����" value="${ param.push_service_type }"/>

								<button type="button" onclick="javascript:searchData();" id="searchbtn"  class="btn btn-group-vertical">����</button>
							</div>
								
							</td>
						</tr>
						
					</table>
			</div>
			<!-- ��ѯ������ʾ����end --> 
			<!-- �����ʾ�б�start -->
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
								<!-- ������{����}-->   
								<th align="center" rowName="discover_push_office_id" orderName="discover_push_office_id:DESC" title='����'>����</th>
								<!-- ������{������id}-->   
								<th align="center" rowName="push_user_id" orderName="push_user_id:DESC" title='������id'>������id</th>
								<!-- ������{��������Ϣ}-->   
								<th align="center" rowName="push_user_info" orderName="push_user_info:DESC" title='��������Ϣ'>��������Ϣ</th>
								<!-- ������{�������ĸ��û���id}-->   
								<th align="center" rowName="from_user_id" orderName="from_user_id:DESC" title='�������ĸ��û���id'>�������ĸ��û���id</th>
								<!-- ������{�������ĸ��û���Ϣ}-->   
								<th align="center" rowName="from_user_info" orderName="from_user_info:DESC" title='�������ĸ��û���Ϣ'>�������ĸ��û���Ϣ</th>
								<!-- ������{������id}-->   
								<th align="center" rowName="to_user_id" orderName="to_user_id:DESC" title='������id'>������id</th>
								<!-- ������{��������Ϣ}-->   
								<th align="center" rowName="to_user_info" orderName="to_user_info:DESC" title='��������Ϣ'>��������Ϣ</th>
								<!-- ������{100������}-->   
								<th align="center" rowName="inner_push_type" orderName="inner_push_type:DESC" title='100������'>100������</th>
								<!-- ������{��δ����}-->   
								<th align="center" rowName="inner_push_sub_type" orderName="inner_push_sub_type:DESC" title='��δ����'>��δ����</th>
								<!-- ������{���ͱ���}-->   
								<th align="center" rowName="push_service_title" orderName="push_service_title:DESC" title='���ͱ���'>���ͱ���</th>
								<!-- ������{��������}-->   
								<th align="center" rowName="push_service_msg" orderName="push_service_msg:DESC" title='��������'>��������</th>
								<!-- ������{����ҵ��id}-->   
								<th align="center" rowName="push_service_id" orderName="push_service_id:DESC" title='����ҵ��id'>����ҵ��id</th>
								<!-- ������{��� �����ҳ�Ա 1���룬2ͬ�⣬3�ܾ�4���� 5����}-->   
								<th align="center" rowName="push_service_msg_status" orderName="push_service_msg_status:DESC" title='��� �����ҳ�Ա 1���룬2ͬ�⣬3�ܾ�4���� 5����'>��� �����ҳ�Ա 1���룬2ͬ�⣬3�ܾ�4���� 5����</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title=''></th>
								<!-- ������{1�Ѵ��� 2δ����}-->   
								<th align="center" rowName="push_status" orderName="push_status:DESC" title='1�Ѵ��� 2δ����'>1�Ѵ��� 2δ����</th>
								<!-- ������{����Ǯ *100}-->   
								<th align="center" rowName="push_service_money" orderName="push_service_money:DESC" title='����Ǯ *100'>����Ǯ *100</th>
								<!-- ������{���¼�����}-->   
								<th align="center" rowName="push_service_count" orderName="push_service_count:DESC" title='���¼�����'>���¼�����</th>
								<!-- ������{���¼�����}-->   
								<th align="center" rowName="push_service_type" orderName="push_service_type:DESC" title='���¼�����'>���¼�����</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							DiscoverPushOfficeOrder view = new DiscoverPushOfficeOrder();
								for (int i = 0; i < list.size(); i++) {
									view = (DiscoverPushOfficeOrder) list.get(i);
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
					
											<!-- ������{����}-->   
											<td><%=view.getDiscoverPushOfficeId()%></td>
											<!-- ������{������id}-->   
											<td><%=view.getPushUserId()%></td>
											<!-- ������{��������Ϣ}-->   
											<td><%=view.getPushUserInfo()%></td>
											<!-- ������{�������ĸ��û���id}-->   
											<td><%=view.getFromUserId()%></td>
											<!-- ������{�������ĸ��û���Ϣ}-->   
											<td><%=view.getFromUserInfo()%></td>
											<!-- ������{������id}-->   
											<td><%=view.getToUserId()%></td>
											<!-- ������{��������Ϣ}-->   
											<td><%=view.getToUserInfo()%></td>
											<!-- ������{100������}-->   
											<td><%=view.getInnerPushType()%></td>
											<!-- ������{��δ����}-->   
											<td><%=view.getInnerPushSubType()%></td>
											<!-- ������{���ͱ���}-->   
											<td><%=view.getPushServiceTitle()%></td>
											<!-- ������{��������}-->   
											<td><%=view.getPushServiceMsg()%></td>
											<!-- ������{����ҵ��id}-->   
											<td><%=view.getPushServiceId()%></td>
											<!-- ������{��� �����ҳ�Ա 1���룬2ͬ�⣬3�ܾ�4���� 5����}-->   
											<td><%=view.getPushServiceMsgStatus()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{1�Ѵ��� 2δ����}-->   
											<td><%=view.getPushStatus()%></td>
											<!-- ������{����Ǯ *100}-->   
											<td><%=view.getPushServiceMoney()%></td>
											<!-- ������{���¼�����}-->   
											<td><%=view.getPushServiceCount()%></td>
											<!-- ������{���¼�����}-->   
											<td><%=view.getPushServiceType()%></td>

											<td>
												<a class="o-edit" href="DiscoverPushOfficeOrder.mc?method=editDiscoverPushOfficeOrder&discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType=<%= view.getDiscoverPushOfficeId() +":"+  view.getPushUserId() +":"+  view.getPushUserInfo() +":"+  view.getFromUserId() +":"+  view.getFromUserInfo() +":"+  view.getToUserId() +":"+  view.getToUserInfo() +":"+  view.getInnerPushType() +":"+  view.getInnerPushSubType() +":"+  view.getPushServiceTitle() +":"+  view.getPushServiceMsg() +":"+  view.getPushServiceId() +":"+  view.getPushServiceMsgStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getPushStatus() +":"+  view.getPushServiceMoney() +":"+  view.getPushServiceCount() +":"+  view.getPushServiceType() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteDiscoverPushOfficeOrder('<%= view.getDiscoverPushOfficeId() +":"+  view.getPushUserId() +":"+  view.getPushUserInfo() +":"+  view.getFromUserId() +":"+  view.getFromUserInfo() +":"+  view.getToUserId() +":"+  view.getToUserInfo() +":"+  view.getInnerPushType() +":"+  view.getInnerPushSubType() +":"+  view.getPushServiceTitle() +":"+  view.getPushServiceMsg() +":"+  view.getPushServiceId() +":"+  view.getPushServiceMsgStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getPushStatus() +":"+  view.getPushServiceMoney() +":"+  view.getPushServiceCount() +":"+  view.getPushServiceType() %>')" title="ɾ��"></a>
											    <a class="o-view" href="DiscoverPushOfficeOrder.mc?method=detailDiscoverPushOfficeOrder&discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType=<%= view.getDiscoverPushOfficeId() +":"+  view.getPushUserId() +":"+  view.getPushUserInfo() +":"+  view.getFromUserId() +":"+  view.getFromUserInfo() +":"+  view.getToUserId() +":"+  view.getToUserInfo() +":"+  view.getInnerPushType() +":"+  view.getInnerPushSubType() +":"+  view.getPushServiceTitle() +":"+  view.getPushServiceMsg() +":"+  view.getPushServiceId() +":"+  view.getPushServiceMsgStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getPushStatus() +":"+  view.getPushServiceMoney() +":"+  view.getPushServiceCount() +":"+  view.getPushServiceType() %>" title="����"></a> 
												
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
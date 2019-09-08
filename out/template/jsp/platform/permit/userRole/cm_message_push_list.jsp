<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.dhome.data.CmMessagePush" %>
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
		function deleteCmMessagePush(PK) {
			jQuery.ajax({
				url : "CmMessagePush.mc?method=deleteCmMessagePush",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CmMessagePush.mc?method=getAllPageCmMessagePush" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_message_push_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="����" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="receiver_user_id" placeholder="�ռ���" value="${ param.receiver_user_id }"/>
						    
						    	<input type='text' class="input-small" name="push_type" placeholder="Ƶ��/���ͣ�1�����ţ�2����������3������������4���������룬5��ϵͳ�������ѣ�6��Ȧ������֪ͨ��7��Ȧ������֪ͨ��8��Ȧ������֪ͨ��9���������ۣ�10������ת����11�����ӵ��ޣ�12��˽�����죩" value="${ param.push_type }"/>
						    
						    	<input type='text' class="input-small" name="push_user_id" placeholder="������" value="${ param.push_user_id }"/>
						    
						    	<input type='text' class="input-small" name="push_coterie_id" placeholder="Ȧ��ID" value="${ param.push_coterie_id }"/>
						    
						    	<input type='text' class="input-small" name="sub_type" placeholder="" value="${ param.sub_type }"/>
						    
						    	<input type='text' class="input-small" name="push_content" placeholder="��������" value="${ param.push_content }"/>
						    
						    	<input type='text' class="input-small" name="push_msg_count" placeholder="��������" value="${ param.push_msg_count }"/>
						    
						    	<input type='text' class="input-small" name="create_date" placeholder="����ʱ��" value="${ param.create_date }"/>
						    
						    	<input type='text' class="input-small" name="op_time" placeholder="����ʱ��" value="${ param.op_time }"/>
						    
						    	<input type='text' class="input-small" name="op_timestamp" placeholder="ʱ���������" value="${ param.op_timestamp }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="״̬" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="push_desc" placeholder="����˵��" value="${ param.push_desc }"/>
						    
						    	<input type='text' class="input-small" name="push_remark" placeholder="���ͱ�ע" value="${ param.push_remark }"/>

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
								<!-- ������{����}-->   
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='����'>����</th>
								<!-- ������{�ռ���}-->   
								<th align="center" rowName="receiver_user_id" orderName="receiver_user_id:DESC" title='�ռ���'>�ռ���</th>
								<!-- ������{Ƶ��/���ͣ�1�����ţ�2����������3������������4���������룬5��ϵͳ�������ѣ�6��Ȧ������֪ͨ��7��Ȧ������֪ͨ��8��Ȧ������֪ͨ��9���������ۣ�10������ת����11�����ӵ��ޣ�12��˽�����죩}-->   
								<th align="center" rowName="push_type" orderName="push_type:DESC" title='Ƶ��/���ͣ�1�����ţ�2����������3������������4���������룬5��ϵͳ�������ѣ�6��Ȧ������֪ͨ��7��Ȧ������֪ͨ��8��Ȧ������֪ͨ��9���������ۣ�10������ת����11�����ӵ��ޣ�12��˽�����죩'>Ƶ��/���ͣ�1�����ţ�2����������3������������4���������룬5��ϵͳ�������ѣ�6��Ȧ������֪ͨ��7��Ȧ������֪ͨ��8��Ȧ������֪ͨ��9���������ۣ�10������ת����11�����ӵ��ޣ�12��˽�����죩</th>
								<!-- ������{������}-->   
								<th align="center" rowName="push_user_id" orderName="push_user_id:DESC" title='������'>������</th>
								<!-- ������{Ȧ��ID}-->   
								<th align="center" rowName="push_coterie_id" orderName="push_coterie_id:DESC" title='Ȧ��ID'>Ȧ��ID</th>
								<!-- ������{}-->   
								<th align="center" rowName="sub_type" orderName="sub_type:DESC" title=''></th>
								<!-- ������{��������}-->   
								<th align="center" rowName="push_content" orderName="push_content:DESC" title='��������'>��������</th>
								<!-- ������{��������}-->   
								<th align="center" rowName="push_msg_count" orderName="push_msg_count:DESC" title='��������'>��������</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_date" orderName="create_date:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="op_time" orderName="op_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{ʱ���������}-->   
								<th align="center" rowName="op_timestamp" orderName="op_timestamp:DESC" title='ʱ���������'>ʱ���������</th>
								<!-- ������{״̬}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='״̬'>״̬</th>
								<!-- ������{����˵��}-->   
								<th align="center" rowName="push_desc" orderName="push_desc:DESC" title='����˵��'>����˵��</th>
								<!-- ������{���ͱ�ע}-->   
								<th align="center" rowName="push_remark" orderName="push_remark:DESC" title='���ͱ�ע'>���ͱ�ע</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							CmMessagePush view = new CmMessagePush();
								for (int i = 0; i < list.size(); i++) {
									view = (CmMessagePush) list.get(i);
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
											<td><%=view.getPkId()%></td>
											<!-- ������{�ռ���}-->   
											<td><%=view.getReceiverUserId()%></td>
											<!-- ������{Ƶ��/���ͣ�1�����ţ�2����������3������������4���������룬5��ϵͳ�������ѣ�6��Ȧ������֪ͨ��7��Ȧ������֪ͨ��8��Ȧ������֪ͨ��9���������ۣ�10������ת����11�����ӵ��ޣ�12��˽�����죩}-->   
											<td><%=view.getPushType()%></td>
											<!-- ������{������}-->   
											<td><%=view.getPushUserId()%></td>
											<!-- ������{Ȧ��ID}-->   
											<td><%=view.getPushCoterieId()%></td>
											<!-- ������{}-->   
											<td><%=view.getSubType()%></td>
											<!-- ������{��������}-->   
											<td><%=view.getPushContent()%></td>
											<!-- ������{��������}-->   
											<td><%=view.getPushMsgCount()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateDate()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOpTime()%></td>
											<!-- ������{ʱ���������}-->   
											<td><%=view.getOpTimestamp()%></td>
											<!-- ������{״̬}-->   
											<td><%=view.getStatus()%></td>
											<!-- ������{����˵��}-->   
											<td><%=view.getPushDesc()%></td>
											<!-- ������{���ͱ�ע}-->   
											<td><%=view.getPushRemark()%></td>

											<td>
												<a class="o-edit" href="CmMessagePush.mc?method=editCmMessagePush&pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark=<%= view.getPkId() +":"+  view.getReceiverUserId() +":"+  view.getPushType() +":"+  view.getPushUserId() +":"+  view.getPushCoterieId() +":"+  view.getSubType() +":"+  view.getPushContent() +":"+  view.getPushMsgCount() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getOpTimestamp() +":"+  view.getStatus() +":"+  view.getPushDesc() +":"+  view.getPushRemark() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCmMessagePush('<%= view.getPkId() +":"+  view.getReceiverUserId() +":"+  view.getPushType() +":"+  view.getPushUserId() +":"+  view.getPushCoterieId() +":"+  view.getSubType() +":"+  view.getPushContent() +":"+  view.getPushMsgCount() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getOpTimestamp() +":"+  view.getStatus() +":"+  view.getPushDesc() +":"+  view.getPushRemark() %>')" title="ɾ��"></a>
											    <a class="o-view" href="CmMessagePush.mc?method=detailCmMessagePush&pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark=<%= view.getPkId() +":"+  view.getReceiverUserId() +":"+  view.getPushType() +":"+  view.getPushUserId() +":"+  view.getPushCoterieId() +":"+  view.getSubType() +":"+  view.getPushContent() +":"+  view.getPushMsgCount() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getOpTimestamp() +":"+  view.getStatus() +":"+  view.getPushDesc() +":"+  view.getPushRemark() %>" title="����"></a> 
												
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
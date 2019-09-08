<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.discovers.data.CmMessagePublicPush" %>
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
		function deleteCmMessagePublicPush(PK) {
			jQuery.ajax({
				url : "CmMessagePublicPush.mc?method=deleteCmMessagePublicPush",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CmMessagePublicPush.mc?method=getAllPageCmMessagePublicPush" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_message_public_push_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="����" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="push_type" placeholder="Ƶ��/����             1: ����             2:��������             3:��������             4:��������             5:ϵͳ��������             6:Ȧ������֪ͨ             7:Ȧ������֪ͨ             8:Ȧ������֪ͨ             9:��������             10:����ת��             11:���ӵ��             12:˽��/����" value="${ param.push_type }"/>
						    
						    	<input type='text' class="input-small" name="push_user_id" placeholder="������" value="${ param.push_user_id }"/>
						    
						    	<input type='text' class="input-small" name="sub_type" placeholder="����������" value="${ param.sub_type }"/>
						    
						    	<input type='text' class="input-small" name="push_content" placeholder="��������" value="${ param.push_content }"/>
						    
						    	<input type='text' class="input-small" name="create_date" placeholder="���Ӵ���ʱ��" value="${ param.create_date }"/>
						    
						    	<input type='text' class="input-small" name="op_timestamp" placeholder="����˵��, ����ʹ��" value="${ param.op_timestamp }"/>
						    
						    	<input type='text' class="input-small" name="op_time" placeholder="����ʱ��" value="${ param.op_time }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="0:  ��Ч             1:  ��Ч             " value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="push_desc" placeholder="����˵��" value="${ param.push_desc }"/>
						    
						    	<input type='text' class="input-small" name="push_remark" placeholder="���ͱ�ע" value="${ param.push_remark }"/>
						    
						    	<input type='text' class="input-small" name="push_msg_count" placeholder="�û�δ����:�ñ���pkid��ȥ������Ϣ�����û��Ķ����PUBLIC_PUSH_ID���ڸ�δ����,�����ֶ�д���ڳ�����ֱ�Ӵ�����ǰ̨" value="${ param.push_msg_count }"/>

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
								<!-- ������{Ƶ��/����             1: ����             2:��������             3:��������             4:��������             5:ϵͳ��������             6:Ȧ������֪ͨ             7:Ȧ������֪ͨ             8:Ȧ������֪ͨ             9:��������             10:����ת��             11:���ӵ��             12:˽��/����}-->   
								<th align="center" rowName="push_type" orderName="push_type:DESC" title='Ƶ��/����             1: ����             2:��������             3:��������             4:��������             5:ϵͳ��������             6:Ȧ������֪ͨ             7:Ȧ������֪ͨ             8:Ȧ������֪ͨ             9:��������             10:����ת��             11:���ӵ��             12:˽��/����'>Ƶ��/����             1: ����             2:��������             3:��������             4:��������             5:ϵͳ��������             6:Ȧ������֪ͨ             7:Ȧ������֪ͨ             8:Ȧ������֪ͨ             9:��������             10:����ת��             11:���ӵ��             12:˽��/����</th>
								<!-- ������{������}-->   
								<th align="center" rowName="push_user_id" orderName="push_user_id:DESC" title='������'>������</th>
								<!-- ������{����������}-->   
								<th align="center" rowName="sub_type" orderName="sub_type:DESC" title='����������'>����������</th>
								<!-- ������{��������}-->   
								<th align="center" rowName="push_content" orderName="push_content:DESC" title='��������'>��������</th>
								<!-- ������{���Ӵ���ʱ��}-->   
								<th align="center" rowName="create_date" orderName="create_date:DESC" title='���Ӵ���ʱ��'>���Ӵ���ʱ��</th>
								<!-- ������{����˵��, ����ʹ��}-->   
								<th align="center" rowName="op_timestamp" orderName="op_timestamp:DESC" title='����˵��, ����ʹ��'>����˵��, ����ʹ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="op_time" orderName="op_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{0:  ��Ч             1:  ��Ч             }-->   
								<th align="center" rowName="status" orderName="status:DESC" title='0:  ��Ч             1:  ��Ч             '>0:  ��Ч             1:  ��Ч             </th>
								<!-- ������{����˵��}-->   
								<th align="center" rowName="push_desc" orderName="push_desc:DESC" title='����˵��'>����˵��</th>
								<!-- ������{���ͱ�ע}-->   
								<th align="center" rowName="push_remark" orderName="push_remark:DESC" title='���ͱ�ע'>���ͱ�ע</th>
								<!-- ������{�û�δ����:�ñ���pkid��ȥ������Ϣ�����û��Ķ����PUBLIC_PUSH_ID���ڸ�δ����,�����ֶ�д���ڳ�����ֱ�Ӵ�����ǰ̨}-->   
								<th align="center" rowName="push_msg_count" orderName="push_msg_count:DESC" title='�û�δ����:�ñ���pkid��ȥ������Ϣ�����û��Ķ����PUBLIC_PUSH_ID���ڸ�δ����,�����ֶ�д���ڳ�����ֱ�Ӵ�����ǰ̨'>�û�δ����:�ñ���pkid��ȥ������Ϣ�����û��Ķ����PUBLIC_PUSH_ID���ڸ�δ����,�����ֶ�д���ڳ�����ֱ�Ӵ�����ǰ̨</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							CmMessagePublicPush view = new CmMessagePublicPush();
								for (int i = 0; i < list.size(); i++) {
									view = (CmMessagePublicPush) list.get(i);
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
											<!-- ������{Ƶ��/����             1: ����             2:��������             3:��������             4:��������             5:ϵͳ��������             6:Ȧ������֪ͨ             7:Ȧ������֪ͨ             8:Ȧ������֪ͨ             9:��������             10:����ת��             11:���ӵ��             12:˽��/����}-->   
											<td><%=view.getPushType()%></td>
											<!-- ������{������}-->   
											<td><%=view.getPushUserId()%></td>
											<!-- ������{����������}-->   
											<td><%=view.getSubType()%></td>
											<!-- ������{��������}-->   
											<td><%=view.getPushContent()%></td>
											<!-- ������{���Ӵ���ʱ��}-->   
											<td><%=view.getCreateDate()%></td>
											<!-- ������{����˵��, ����ʹ��}-->   
											<td><%=view.getOpTimestamp()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOpTime()%></td>
											<!-- ������{0:  ��Ч             1:  ��Ч             }-->   
											<td><%=view.getStatus()%></td>
											<!-- ������{����˵��}-->   
											<td><%=view.getPushDesc()%></td>
											<!-- ������{���ͱ�ע}-->   
											<td><%=view.getPushRemark()%></td>
											<!-- ������{�û�δ����:�ñ���pkid��ȥ������Ϣ�����û��Ķ����PUBLIC_PUSH_ID���ڸ�δ����,�����ֶ�д���ڳ�����ֱ�Ӵ�����ǰ̨}-->   
											<td><%=view.getPushMsgCount()%></td>

											<td>
												<a class="o-edit" href="CmMessagePublicPush.mc?method=editCmMessagePublicPush&pkId,pushType,pushUserId,subType,pushContent,createDate,opTimestamp,opTime,status,pushDesc,pushRemark,pushMsgCount=<%= view.getPkId() +":"+  view.getPushType() +":"+  view.getPushUserId() +":"+  view.getSubType() +":"+  view.getPushContent() +":"+  view.getCreateDate() +":"+  view.getOpTimestamp() +":"+  view.getOpTime() +":"+  view.getStatus() +":"+  view.getPushDesc() +":"+  view.getPushRemark() +":"+  view.getPushMsgCount() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCmMessagePublicPush('<%= view.getPkId() +":"+  view.getPushType() +":"+  view.getPushUserId() +":"+  view.getSubType() +":"+  view.getPushContent() +":"+  view.getCreateDate() +":"+  view.getOpTimestamp() +":"+  view.getOpTime() +":"+  view.getStatus() +":"+  view.getPushDesc() +":"+  view.getPushRemark() +":"+  view.getPushMsgCount() %>')" title="ɾ��"></a>
											    <a class="o-view" href="CmMessagePublicPush.mc?method=detailCmMessagePublicPush&pkId,pushType,pushUserId,subType,pushContent,createDate,opTimestamp,opTime,status,pushDesc,pushRemark,pushMsgCount=<%= view.getPkId() +":"+  view.getPushType() +":"+  view.getPushUserId() +":"+  view.getSubType() +":"+  view.getPushContent() +":"+  view.getCreateDate() +":"+  view.getOpTimestamp() +":"+  view.getOpTime() +":"+  view.getStatus() +":"+  view.getPushDesc() +":"+  view.getPushRemark() +":"+  view.getPushMsgCount() %>" title="����"></a> 
												
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
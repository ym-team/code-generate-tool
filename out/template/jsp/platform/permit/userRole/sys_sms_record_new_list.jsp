<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.SysSmsRecordNew" %>
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
	<TITLE>���Բ�ѯ</TITLE>
	
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
		function deleteSysSmsRecordNew(PK) {
			jQuery.ajax({
				url : "SysSmsRecordNew.mc?method=deleteSysSmsRecordNew",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/SysSmsRecordNew.mc?method=getAllPageSysSmsRecordNew" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/sys_sms_record_new_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="����" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="send_user_device_id" placeholder="�������豸ID" value="${ param.send_user_device_id }"/>
						    
						    	<input type='text' class="input-small" name="send_user_id" placeholder="������" value="${ param.send_user_id }"/>
						    
						    	<input type='text' class="input-small" name="sms_content" placeholder="��������" value="${ param.sms_content }"/>
						    
						    	<input type='text' class="input-small" name="recieve_phone_num" placeholder="���պ���" value="${ param.recieve_phone_num }"/>
						    
						    	<input type='text' class="input-small" name="busi_type" placeholder="ҵ������ 1:ע��(��֤��) 2�һ�����(��֤��) " value="${ param.busi_type }"/>
						    
						    	<input type='text' class="input-small" name="return_code" placeholder="����ƽ̨��������" value="${ param.return_code }"/>
						    
						    	<input type='text' class="input-small" name="return_msg" placeholder="����ƽ̨���ر���" value="${ param.return_msg }"/>
						    
						    	<input type='text' class="input-small" name="batch_id" placeholder="������κ�" value="${ param.batch_id }"/>
						    
						    	<input type='text' class="input-small" name="create_date" placeholder="����ʱ��" value="${ param.create_date }"/>
						    
						    	<input type='text' class="input-small" name="op_time" placeholder="����ʱ��" value="${ param.op_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="sys_type" placeholder="ϵͳ���� 1:���߰� 2:ҽ���" value="${ param.sys_type }"/>

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
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='����'>����</th>
								<!-- ������{�������豸ID}-->   
								<th align="center" rowName="send_user_device_id" orderName="send_user_device_id:DESC" title='�������豸ID'>�������豸ID</th>
								<!-- ������{������}-->   
								<th align="center" rowName="send_user_id" orderName="send_user_id:DESC" title='������'>������</th>
								<!-- ������{��������}-->   
								<th align="center" rowName="sms_content" orderName="sms_content:DESC" title='��������'>��������</th>
								<!-- ������{���պ���}-->   
								<th align="center" rowName="recieve_phone_num" orderName="recieve_phone_num:DESC" title='���պ���'>���պ���</th>
								<!-- ������{ҵ������ 1:ע��(��֤��) 2�һ�����(��֤��) }-->   
								<th align="center" rowName="busi_type" orderName="busi_type:DESC" title='ҵ������ 1:ע��(��֤��) 2�һ�����(��֤��) '>ҵ������ 1:ע��(��֤��) 2�һ�����(��֤��) </th>
								<!-- ������{����ƽ̨��������}-->   
								<th align="center" rowName="return_code" orderName="return_code:DESC" title='����ƽ̨��������'>����ƽ̨��������</th>
								<!-- ������{����ƽ̨���ر���}-->   
								<th align="center" rowName="return_msg" orderName="return_msg:DESC" title='����ƽ̨���ر���'>����ƽ̨���ر���</th>
								<!-- ������{������κ�}-->   
								<th align="center" rowName="batch_id" orderName="batch_id:DESC" title='������κ�'>������κ�</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_date" orderName="create_date:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="op_time" orderName="op_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{ϵͳ���� 1:���߰� 2:ҽ���}-->   
								<th align="center" rowName="sys_type" orderName="sys_type:DESC" title='ϵͳ���� 1:���߰� 2:ҽ���'>ϵͳ���� 1:���߰� 2:ҽ���</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							SysSmsRecordNew view = new SysSmsRecordNew();
								for (int i = 0; i < list.size(); i++) {
									view = (SysSmsRecordNew) list.get(i);
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
											<!-- ������{�������豸ID}-->   
											<td><%=view.getSendUserDeviceId()%></td>
											<!-- ������{������}-->   
											<td><%=view.getSendUserId()%></td>
											<!-- ������{��������}-->   
											<td><%=view.getSmsContent()%></td>
											<!-- ������{���պ���}-->   
											<td><%=view.getRecievePhoneNum()%></td>
											<!-- ������{ҵ������ 1:ע��(��֤��) 2�һ�����(��֤��) }-->   
											<td><%=view.getBusiType()%></td>
											<!-- ������{����ƽ̨��������}-->   
											<td><%=view.getReturnCode()%></td>
											<!-- ������{����ƽ̨���ر���}-->   
											<td><%=view.getReturnMsg()%></td>
											<!-- ������{������κ�}-->   
											<td><%=view.getBatchId()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateDate()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOpTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{ϵͳ���� 1:���߰� 2:ҽ���}-->   
											<td><%=view.getSysType()%></td>

											<td>
												<a class="o-edit" href="SysSmsRecordNew.mc?method=editSysSmsRecordNew&pkId,sendUserDeviceId,sendUserId,smsContent,recievePhoneNum,busiType,returnCode,returnMsg,batchId,createDate,opTime,remark,sysType=<%= view.getPkId() +":"+  view.getSendUserDeviceId() +":"+  view.getSendUserId() +":"+  view.getSmsContent() +":"+  view.getRecievePhoneNum() +":"+  view.getBusiType() +":"+  view.getReturnCode() +":"+  view.getReturnMsg() +":"+  view.getBatchId() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getRemark() +":"+  view.getSysType() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteSysSmsRecordNew('<%= view.getPkId() +":"+  view.getSendUserDeviceId() +":"+  view.getSendUserId() +":"+  view.getSmsContent() +":"+  view.getRecievePhoneNum() +":"+  view.getBusiType() +":"+  view.getReturnCode() +":"+  view.getReturnMsg() +":"+  view.getBatchId() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getRemark() +":"+  view.getSysType() %>')" title="ɾ��"></a>
											    <a class="o-view" href="SysSmsRecordNew.mc?method=detailSysSmsRecordNew&pkId,sendUserDeviceId,sendUserId,smsContent,recievePhoneNum,busiType,returnCode,returnMsg,batchId,createDate,opTime,remark,sysType=<%= view.getPkId() +":"+  view.getSendUserDeviceId() +":"+  view.getSendUserId() +":"+  view.getSmsContent() +":"+  view.getRecievePhoneNum() +":"+  view.getBusiType() +":"+  view.getReturnCode() +":"+  view.getReturnMsg() +":"+  view.getBatchId() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getRemark() +":"+  view.getSysType() %>" title="����"></a> 
												
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
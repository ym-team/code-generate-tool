<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmUserCertInfo" %>
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
		function deleteCmUserCertInfo(PK) {
			jQuery.ajax({
				url : "CmUserCertInfo.mc?method=deleteCmUserCertInfo",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CmUserCertInfo.mc?method=getAllPageCmUserCertInfo" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_user_cert_info_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="cert_app_id" placeholder="����ID" value="${ param.cert_app_id }"/>
						    
						    	<input type='text' class="input-small" name="user_seq_id" placeholder="�û�ID" value="${ param.user_seq_id }"/>
						    
						    	<input type='text' class="input-small" name="cert_type" placeholder="��֤����:  1:���֤  2:ְҵ�ʸ�֤ 3:����֤ 4:��ҵ֤ 5:ѧ��֤ 6:����֤�� 7: ��֤�� 8: ��Ӫ��֤" value="${ param.cert_type }"/>
						    
						    	<input type='text' class="input-small" name="cert_id" placeholder="֤��ID��,��ʱ����" value="${ param.cert_id }"/>
						    
						    	<input type='text' class="input-small" name="cert_name" placeholder="֤�����, ��CERT_ID����" value="${ param.cert_name }"/>
						    
						    	<input type='text' class="input-small" name="cert_pic_url" placeholder="ͼƬURL" value="${ param.cert_pic_url }"/>
						    
						    	<input type='text' class="input-small" name="create_date" placeholder="�ϴ�ʱ��" value="${ param.create_date }"/>
						    
						    	<input type='text' class="input-small" name="verify_status" placeholder="��֤״̬: 0-δ��֤ 1-�Ѿ���֤  2:��֤��ͨ��" value="${ param.verify_status }"/>
						    
						    	<input type='text' class="input-small" name="verify_time" placeholder="��֤ʱ��" value="${ param.verify_time }"/>
						    
						    	<input type='text' class="input-small" name="op_time" placeholder="����ʱ�䣨������ʱ�䣩" value="${ param.op_time }"/>
						    
						    	<input type='text' class="input-small" name="batch_number" placeholder="��κ�" value="${ param.batch_number }"/>

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
								<!-- ������{����ID}-->   
								<th align="center" rowName="cert_app_id" orderName="cert_app_id:DESC" title='����ID'>����ID</th>
								<!-- ������{�û�ID}-->   
								<th align="center" rowName="user_seq_id" orderName="user_seq_id:DESC" title='�û�ID'>�û�ID</th>
								<!-- ������{��֤����:  1:���֤  2:ְҵ�ʸ�֤ 3:����֤ 4:��ҵ֤ 5:ѧ��֤ 6:����֤�� 7: ��֤�� 8: ��Ӫ��֤}-->   
								<th align="center" rowName="cert_type" orderName="cert_type:DESC" title='��֤����:  1:���֤  2:ְҵ�ʸ�֤ 3:����֤ 4:��ҵ֤ 5:ѧ��֤ 6:����֤�� 7: ��֤�� 8: ��Ӫ��֤'>��֤����:  1:���֤  2:ְҵ�ʸ�֤ 3:����֤ 4:��ҵ֤ 5:ѧ��֤ 6:����֤�� 7: ��֤�� 8: ��Ӫ��֤</th>
								<!-- ������{֤��ID��,��ʱ����}-->   
								<th align="center" rowName="cert_id" orderName="cert_id:DESC" title='֤��ID��,��ʱ����'>֤��ID��,��ʱ����</th>
								<!-- ������{֤�����, ��CERT_ID����}-->   
								<th align="center" rowName="cert_name" orderName="cert_name:DESC" title='֤�����, ��CERT_ID����'>֤�����, ��CERT_ID����</th>
								<!-- ������{ͼƬURL}-->   
								<th align="center" rowName="cert_pic_url" orderName="cert_pic_url:DESC" title='ͼƬURL'>ͼƬURL</th>
								<!-- ������{�ϴ�ʱ��}-->   
								<th align="center" rowName="create_date" orderName="create_date:DESC" title='�ϴ�ʱ��'>�ϴ�ʱ��</th>
								<!-- ������{��֤״̬: 0-δ��֤ 1-�Ѿ���֤  2:��֤��ͨ��}-->   
								<th align="center" rowName="verify_status" orderName="verify_status:DESC" title='��֤״̬: 0-δ��֤ 1-�Ѿ���֤  2:��֤��ͨ��'>��֤״̬: 0-δ��֤ 1-�Ѿ���֤  2:��֤��ͨ��</th>
								<!-- ������{��֤ʱ��}-->   
								<th align="center" rowName="verify_time" orderName="verify_time:DESC" title='��֤ʱ��'>��֤ʱ��</th>
								<!-- ������{����ʱ�䣨������ʱ�䣩}-->   
								<th align="center" rowName="op_time" orderName="op_time:DESC" title='����ʱ�䣨������ʱ�䣩'>����ʱ�䣨������ʱ�䣩</th>
								<!-- ������{��κ�}-->   
								<th align="center" rowName="batch_number" orderName="batch_number:DESC" title='��κ�'>��κ�</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							CmUserCertInfo view = new CmUserCertInfo();
								for (int i = 0; i < list.size(); i++) {
									view = (CmUserCertInfo) list.get(i);
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
					
											<!-- ������{����ID}-->   
											<td><%=view.getCertAppId()%></td>
											<!-- ������{�û�ID}-->   
											<td><%=view.getUserSeqId()%></td>
											<!-- ������{��֤����:  1:���֤  2:ְҵ�ʸ�֤ 3:����֤ 4:��ҵ֤ 5:ѧ��֤ 6:����֤�� 7: ��֤�� 8: ��Ӫ��֤}-->   
											<td><%=view.getCertType()%></td>
											<!-- ������{֤��ID��,��ʱ����}-->   
											<td><%=view.getCertId()%></td>
											<!-- ������{֤�����, ��CERT_ID����}-->   
											<td><%=view.getCertName()%></td>
											<!-- ������{ͼƬURL}-->   
											<td><%=view.getCertPicUrl()%></td>
											<!-- ������{�ϴ�ʱ��}-->   
											<td><%=view.getCreateDate()%></td>
											<!-- ������{��֤״̬: 0-δ��֤ 1-�Ѿ���֤  2:��֤��ͨ��}-->   
											<td><%=view.getVerifyStatus()%></td>
											<!-- ������{��֤ʱ��}-->   
											<td><%=view.getVerifyTime()%></td>
											<!-- ������{����ʱ�䣨������ʱ�䣩}-->   
											<td><%=view.getOpTime()%></td>
											<!-- ������{��κ�}-->   
											<td><%=view.getBatchNumber()%></td>

											<td>
												<a class="o-edit" href="CmUserCertInfo.mc?method=editCmUserCertInfo&certAppId,userSeqId,certType,certId,certName,certPicUrl,createDate,verifyStatus,verifyTime,opTime,batchNumber=<%= view.getCertAppId() +":"+  view.getUserSeqId() +":"+  view.getCertType() +":"+  view.getCertId() +":"+  view.getCertName() +":"+  view.getCertPicUrl() +":"+  view.getCreateDate() +":"+  view.getVerifyStatus() +":"+  view.getVerifyTime() +":"+  view.getOpTime() +":"+  view.getBatchNumber() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCmUserCertInfo('<%= view.getCertAppId() +":"+  view.getUserSeqId() +":"+  view.getCertType() +":"+  view.getCertId() +":"+  view.getCertName() +":"+  view.getCertPicUrl() +":"+  view.getCreateDate() +":"+  view.getVerifyStatus() +":"+  view.getVerifyTime() +":"+  view.getOpTime() +":"+  view.getBatchNumber() %>')" title="ɾ��"></a>
											    <a class="o-view" href="CmUserCertInfo.mc?method=detailCmUserCertInfo&certAppId,userSeqId,certType,certId,certName,certPicUrl,createDate,verifyStatus,verifyTime,opTime,batchNumber=<%= view.getCertAppId() +":"+  view.getUserSeqId() +":"+  view.getCertType() +":"+  view.getCertId() +":"+  view.getCertName() +":"+  view.getCertPicUrl() +":"+  view.getCreateDate() +":"+  view.getVerifyStatus() +":"+  view.getVerifyTime() +":"+  view.getOpTime() +":"+  view.getBatchNumber() %>" title="����"></a> 
												
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.offices.data.OfficeCopy" %>
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
		function deleteOfficeCopy(PK) {
			jQuery.ajax({
				url : "OfficeCopy.mc?method=deleteOfficeCopy",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/OfficeCopy.mc?method=getAllPageOfficeCopy" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/office_copy_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="office_copy_id" placeholder="����" value="${ param.office_copy_id }"/>
						    
						    	<input type='text' class="input-small" name="office_id" placeholder="������id" value="${ param.office_id }"/>
						    
						    	<input type='text' class="input-small" name="offfice_identify_url" placeholder="���֤" value="${ param.offfice_identify_url }"/>
						    
						    	<input type='text' class="input-small" name="office_qualification_url" placeholder="ִҵ�ʸ���" value="${ param.office_qualification_url }"/>
						    
						    	<input type='text' class="input-small" name="office_halfbody_url" placeholder="�ϰ�����" value="${ param.office_halfbody_url }"/>
						    
						    	<input type='text' class="input-small" name="office_businesslicence_urls" placeholder="Ӫҵִ�յ��ж�����ã�" value="${ param.office_businesslicence_urls }"/>
						    
						    	<input type='text' class="input-small" name="office_master_name" placeholder="��֤������" value="${ param.office_master_name }"/>
						    
						    	<input type='text' class="input-small" name="office_master_phone" placeholder="��֤�˵绰" value="${ param.office_master_phone }"/>
						    
						    	<input type='text' class="input-small" name="office_status" placeholder="1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��" value="${ param.office_status }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="office_type" placeholder="����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����" value="${ param.office_type }"/>
						    
						    	<input type='text' class="input-small" name="invite_code" placeholder="ʹ�õ�������" value="${ param.invite_code }"/>
						    
						    	<input type='text' class="input-small" name="invite_code_phone" placeholder="" value="${ param.invite_code_phone }"/>

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
								<th align="center" rowName="office_copy_id" orderName="office_copy_id:DESC" title='����'>����</th>
								<!-- ������{������id}-->   
								<th align="center" rowName="office_id" orderName="office_id:DESC" title='������id'>������id</th>
								<!-- ������{���֤}-->   
								<th align="center" rowName="offfice_identify_url" orderName="offfice_identify_url:DESC" title='���֤'>���֤</th>
								<!-- ������{ִҵ�ʸ���}-->   
								<th align="center" rowName="office_qualification_url" orderName="office_qualification_url:DESC" title='ִҵ�ʸ���'>ִҵ�ʸ���</th>
								<!-- ������{�ϰ�����}-->   
								<th align="center" rowName="office_halfbody_url" orderName="office_halfbody_url:DESC" title='�ϰ�����'>�ϰ�����</th>
								<!-- ������{Ӫҵִ�յ��ж�����ã�}-->   
								<th align="center" rowName="office_businesslicence_urls" orderName="office_businesslicence_urls:DESC" title='Ӫҵִ�յ��ж�����ã�'>Ӫҵִ�յ��ж�����ã�</th>
								<!-- ������{��֤������}-->   
								<th align="center" rowName="office_master_name" orderName="office_master_name:DESC" title='��֤������'>��֤������</th>
								<!-- ������{��֤�˵绰}-->   
								<th align="center" rowName="office_master_phone" orderName="office_master_phone:DESC" title='��֤�˵绰'>��֤�˵绰</th>
								<!-- ������{1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��}-->   
								<th align="center" rowName="office_status" orderName="office_status:DESC" title='1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��'>1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����}-->   
								<th align="center" rowName="office_type" orderName="office_type:DESC" title='����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����'>����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����</th>
								<!-- ������{ʹ�õ�������}-->   
								<th align="center" rowName="invite_code" orderName="invite_code:DESC" title='ʹ�õ�������'>ʹ�õ�������</th>
								<!-- ������{}-->   
								<th align="center" rowName="invite_code_phone" orderName="invite_code_phone:DESC" title=''></th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							OfficeCopy view = new OfficeCopy();
								for (int i = 0; i < list.size(); i++) {
									view = (OfficeCopy) list.get(i);
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
											<td><%=view.getOfficeCopyId()%></td>
											<!-- ������{������id}-->   
											<td><%=view.getOfficeId()%></td>
											<!-- ������{���֤}-->   
											<td><%=view.getOffficeIdentifyUrl()%></td>
											<!-- ������{ִҵ�ʸ���}-->   
											<td><%=view.getOfficeQualificationUrl()%></td>
											<!-- ������{�ϰ�����}-->   
											<td><%=view.getOfficeHalfbodyUrl()%></td>
											<!-- ������{Ӫҵִ�յ��ж�����ã�}-->   
											<td><%=view.getOfficeBusinesslicenceUrls()%></td>
											<!-- ������{��֤������}-->   
											<td><%=view.getOfficeMasterName()%></td>
											<!-- ������{��֤�˵绰}-->   
											<td><%=view.getOfficeMasterPhone()%></td>
											<!-- ������{1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��}-->   
											<td><%=view.getOfficeStatus()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����}-->   
											<td><%=view.getOfficeType()%></td>
											<!-- ������{ʹ�õ�������}-->   
											<td><%=view.getInviteCode()%></td>
											<!-- ������{}-->   
											<td><%=view.getInviteCodePhone()%></td>

											<td>
												<a class="o-edit" href="OfficeCopy.mc?method=editOfficeCopy&officeCopyId,officeId,offficeIdentifyUrl,officeQualificationUrl,officeHalfbodyUrl,officeBusinesslicenceUrls,officeMasterName,officeMasterPhone,officeStatus,createTime,optTime,remark,officeType,inviteCode,inviteCodePhone=<%= view.getOfficeCopyId() +":"+  view.getOfficeId() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeType() +":"+  view.getInviteCode() +":"+  view.getInviteCodePhone() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteOfficeCopy('<%= view.getOfficeCopyId() +":"+  view.getOfficeId() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeType() +":"+  view.getInviteCode() +":"+  view.getInviteCodePhone() %>')" title="ɾ��"></a>
											    <a class="o-view" href="OfficeCopy.mc?method=detailOfficeCopy&officeCopyId,officeId,offficeIdentifyUrl,officeQualificationUrl,officeHalfbodyUrl,officeBusinesslicenceUrls,officeMasterName,officeMasterPhone,officeStatus,createTime,optTime,remark,officeType,inviteCode,inviteCodePhone=<%= view.getOfficeCopyId() +":"+  view.getOfficeId() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeType() +":"+  view.getInviteCode() +":"+  view.getInviteCodePhone() %>" title="����"></a> 
												
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
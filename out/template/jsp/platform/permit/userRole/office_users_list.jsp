<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.OfficeUsers" %>
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
		function deleteOfficeUsers(PK) {
			jQuery.ajax({
				url : "OfficeUsers.mc?method=deleteOfficeUsers",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/OfficeUsers.mc?method=getAllPageOfficeUsers" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/office_users_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="office_user_id" placeholder="�����ҳ�Ա" value="${ param.office_user_id }"/>
						    
						    	<input type='text' class="input-small" name="office_user_type" placeholder="1����Ա��2��Ա" value="${ param.office_user_type }"/>
						    
						    	<input type='text' class="input-small" name="office_user_status" placeholder="1���룬2ͬ�⣬3�ܾ�4����" value="${ param.office_user_status }"/>
						    
						    	<input type='text' class="input-small" name="office_id" placeholder="������id" value="${ param.office_id }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="�����ҳ�Ա����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="office_isproficient" placeholder="" value="${ param.office_isproficient }"/>

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
								<!-- ������{�����ҳ�Ա}-->   
								<th align="center" rowName="office_user_id" orderName="office_user_id:DESC" title='�����ҳ�Ա'>�����ҳ�Ա</th>
								<!-- ������{1����Ա��2��Ա}-->   
								<th align="center" rowName="office_user_type" orderName="office_user_type:DESC" title='1����Ա��2��Ա'>1����Ա��2��Ա</th>
								<!-- ������{1���룬2ͬ�⣬3�ܾ�4����}-->   
								<th align="center" rowName="office_user_status" orderName="office_user_status:DESC" title='1���룬2ͬ�⣬3�ܾ�4����'>1���룬2ͬ�⣬3�ܾ�4����</th>
								<!-- ������{������id}-->   
								<th align="center" rowName="office_id" orderName="office_id:DESC" title='������id'>������id</th>
								<!-- ������{�����ҳ�Ա����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='�����ҳ�Ա����ʱ��'>�����ҳ�Ա����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{}-->   
								<th align="center" rowName="office_isproficient" orderName="office_isproficient:DESC" title=''></th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							OfficeUsers view = new OfficeUsers();
								for (int i = 0; i < list.size(); i++) {
									view = (OfficeUsers) list.get(i);
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
					
											<!-- ������{�����ҳ�Ա}-->   
											<td><%=view.getOfficeUserId()%></td>
											<!-- ������{1����Ա��2��Ա}-->   
											<td><%=view.getOfficeUserType()%></td>
											<!-- ������{1���룬2ͬ�⣬3�ܾ�4����}-->   
											<td><%=view.getOfficeUserStatus()%></td>
											<!-- ������{������id}-->   
											<td><%=view.getOfficeId()%></td>
											<!-- ������{�����ҳ�Ա����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeIsproficient()%></td>

											<td>
												<a class="o-edit" href="OfficeUsers.mc?method=editOfficeUsers&officeUserId,officeUserType,officeUserStatus,officeId,createTime,optTime,remark,officeIsproficient=<%= view.getOfficeUserId() +":"+  view.getOfficeUserType() +":"+  view.getOfficeUserStatus() +":"+  view.getOfficeId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeIsproficient() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteOfficeUsers('<%= view.getOfficeUserId() +":"+  view.getOfficeUserType() +":"+  view.getOfficeUserStatus() +":"+  view.getOfficeId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeIsproficient() %>')" title="ɾ��"></a>
											    <a class="o-view" href="OfficeUsers.mc?method=detailOfficeUsers&officeUserId,officeUserType,officeUserStatus,officeId,createTime,optTime,remark,officeIsproficient=<%= view.getOfficeUserId() +":"+  view.getOfficeUserType() +":"+  view.getOfficeUserStatus() +":"+  view.getOfficeId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeIsproficient() %>" title="����"></a> 
												
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
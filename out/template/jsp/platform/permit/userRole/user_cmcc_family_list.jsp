<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.UserCmccFamily" %>
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
		function deleteUserCmccFamily(PK) {
			jQuery.ajax({
				url : "UserCmccFamily.mc?method=deleteUserCmccFamily",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/UserCmccFamily.mc?method=getAllPageUserCmccFamily" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/user_cmcc_family_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="user_id" placeholder="�û�Id ������" value="${ param.user_id }"/>
						    
						    	<input type='text' class="input-small" name="family_user_id" placeholder="�û�Id ������" value="${ param.family_user_id }"/>
						    
						    	<input type='text' class="input-small" name="name" placeholder="����" value="${ param.name }"/>
						    
						    	<input type='text' class="input-small" name="sex" placeholder="�Ա� 1���� 2��Ů" value="${ param.sex }"/>
						    
						    	<input type='text' class="input-small" name="phone" placeholder="�ֻ����" value="${ param.phone }"/>
						    
						    	<input type='text' class="input-small" name="type" placeholder="������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա��" value="${ param.type }"/>
						    
						    	<input type='text' class="input-small" name="avatar" placeholder="ͷ��" value="${ param.avatar }"/>
						    
						    	<input type='text' class="input-small" name="birthday" placeholder="��������" value="${ param.birthday }"/>
						    
						    	<input type='text' class="input-small" name="isdefault" placeholder="�Ƿ�Ĭ�ϣ�1���ǣ�2����" value="${ param.isdefault }"/>
						    
						    	<input type='text' class="input-small" name="isvalid" placeholder="�Ƿ���Ч��0����Ч��1����Ч��" value="${ param.isvalid }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="������ʱ��" value="${ param.opt_time }"/>

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
								<th align="center" rowName="id" orderName="id:DESC" title='����'>����</th>
								<!-- ������{�û�Id ������}-->   
								<th align="center" rowName="user_id" orderName="user_id:DESC" title='�û�Id ������'>�û�Id ������</th>
								<!-- ������{�û�Id ������}-->   
								<th align="center" rowName="family_user_id" orderName="family_user_id:DESC" title='�û�Id ������'>�û�Id ������</th>
								<!-- ������{����}-->   
								<th align="center" rowName="name" orderName="name:DESC" title='����'>����</th>
								<!-- ������{�Ա� 1���� 2��Ů}-->   
								<th align="center" rowName="sex" orderName="sex:DESC" title='�Ա� 1���� 2��Ů'>�Ա� 1���� 2��Ů</th>
								<!-- ������{�ֻ����}-->   
								<th align="center" rowName="phone" orderName="phone:DESC" title='�ֻ����'>�ֻ����</th>
								<!-- ������{������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա��}-->   
								<th align="center" rowName="type" orderName="type:DESC" title='������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա��'>������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա��</th>
								<!-- ������{ͷ��}-->   
								<th align="center" rowName="avatar" orderName="avatar:DESC" title='ͷ��'>ͷ��</th>
								<!-- ������{��������}-->   
								<th align="center" rowName="birthday" orderName="birthday:DESC" title='��������'>��������</th>
								<!-- ������{�Ƿ�Ĭ�ϣ�1���ǣ�2����}-->   
								<th align="center" rowName="isdefault" orderName="isdefault:DESC" title='�Ƿ�Ĭ�ϣ�1���ǣ�2����'>�Ƿ�Ĭ�ϣ�1���ǣ�2����</th>
								<!-- ������{�Ƿ���Ч��0����Ч��1����Ч��}-->   
								<th align="center" rowName="isvalid" orderName="isvalid:DESC" title='�Ƿ���Ч��0����Ч��1����Ч��'>�Ƿ���Ч��0����Ч��1����Ч��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{������ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='������ʱ��'>������ʱ��</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							UserCmccFamily view = new UserCmccFamily();
								for (int i = 0; i < list.size(); i++) {
									view = (UserCmccFamily) list.get(i);
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
											<td><%=view.getId()%></td>
											<!-- ������{�û�Id ������}-->   
											<td><%=view.getUserId()%></td>
											<!-- ������{�û�Id ������}-->   
											<td><%=view.getFamilyUserId()%></td>
											<!-- ������{����}-->   
											<td><%=view.getName()%></td>
											<!-- ������{�Ա� 1���� 2��Ů}-->   
											<td><%=view.getSex()%></td>
											<!-- ������{�ֻ����}-->   
											<td><%=view.getPhone()%></td>
											<!-- ������{������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա��}-->   
											<td><%=view.getType()%></td>
											<!-- ������{ͷ��}-->   
											<td><%=view.getAvatar()%></td>
											<!-- ������{��������}-->   
											<td><%=view.getBirthday()%></td>
											<!-- ������{�Ƿ�Ĭ�ϣ�1���ǣ�2����}-->   
											<td><%=view.getIsdefault()%></td>
											<!-- ������{�Ƿ���Ч��0����Ч��1����Ч��}-->   
											<td><%=view.getIsvalid()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{������ʱ��}-->   
											<td><%=view.getOptTime()%></td>

											<td>
												<a class="o-edit" href="UserCmccFamily.mc?method=editUserCmccFamily&id,userId,familyUserId,name,sex,phone,type,avatar,birthday,isdefault,isvalid,createTime,optTime=<%= view.getId() +":"+  view.getUserId() +":"+  view.getFamilyUserId() +":"+  view.getName() +":"+  view.getSex() +":"+  view.getPhone() +":"+  view.getType() +":"+  view.getAvatar() +":"+  view.getBirthday() +":"+  view.getIsdefault() +":"+  view.getIsvalid() +":"+  view.getCreateTime() +":"+  view.getOptTime() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteUserCmccFamily('<%= view.getId() +":"+  view.getUserId() +":"+  view.getFamilyUserId() +":"+  view.getName() +":"+  view.getSex() +":"+  view.getPhone() +":"+  view.getType() +":"+  view.getAvatar() +":"+  view.getBirthday() +":"+  view.getIsdefault() +":"+  view.getIsvalid() +":"+  view.getCreateTime() +":"+  view.getOptTime() %>')" title="ɾ��"></a>
											    <a class="o-view" href="UserCmccFamily.mc?method=detailUserCmccFamily&id,userId,familyUserId,name,sex,phone,type,avatar,birthday,isdefault,isvalid,createTime,optTime=<%= view.getId() +":"+  view.getUserId() +":"+  view.getFamilyUserId() +":"+  view.getName() +":"+  view.getSex() +":"+  view.getPhone() +":"+  view.getType() +":"+  view.getAvatar() +":"+  view.getBirthday() +":"+  view.getIsdefault() +":"+  view.getIsvalid() +":"+  view.getCreateTime() +":"+  view.getOptTime() %>" title="����"></a> 
												
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
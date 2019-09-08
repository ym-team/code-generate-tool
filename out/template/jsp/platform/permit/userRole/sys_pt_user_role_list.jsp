<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.SysPtUserRole" %>
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
	<TITLE>�û���ɫ��Ӧ��ѯ</TITLE>
	
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
		function deleteSysPtUserRole(PK) {
			jQuery.ajax({
				url : "SysPtUserRole.mc?method=deleteSysPtUserRole",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/SysPtUserRole.mc?method=getAllPageSysPtUserRole" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/sys_pt_user_role_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="user_id" placeholder="�û��˻�" value="${ param.user_id }"/>
						    
						    	<input type='text' class="input-small" name="role_id" placeholder="������Ľ�ɫ" value="${ param.role_id }"/>
						    
						    	<input type='text' class="input-small" name="role_name" placeholder="��ɫ���" value="${ param.role_name }"/>
						    
						    	<input type='text' class="input-small" name="user_name" placeholder="�û����" value="${ param.user_name }"/>
						    
						    	<input type='text' class="input-small" name="note" placeholder="˵��" value="${ param.note }"/>
						    
						    	<input type='text' class="input-small" name="operator" placeholder="������" value="${ param.operator }"/>
						    
						    	<input type='text' class="input-small" name="operat_time" placeholder="����ʱ��" value="${ param.operat_time }"/>
<%
request.setAttribute("SYS_PT_USER_ROLE.INUSE",CodeFactory.getCodeListByCodeType("SYS_PT_USER_ROLE.INUSE"));
%>
							  	ʹ�ñ�־��
					           	<select name="in_use" >
						        	<option value="">ȫ��</option>
						         	<html:options collection="SYS_PT_USER_ROLE.INUSE" value="name" key="code"
						         	selected="${ param.in_use }" />
						         </select>
						    
						    	<input type='text' class="input-small" name="char_1" placeholder="�ַ��������ֶ�1" value="${ param.char_1 }"/>

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
								<!-- ������{�û��˻�}-->   
								<th align="center" rowName="user_id" orderName="user_id:DESC" title='�û��˻�'>�û��˻�</th>
								<!-- ������{������Ľ�ɫ}-->   
								<th align="center" rowName="role_id" orderName="role_id:DESC" title='������Ľ�ɫ'>������Ľ�ɫ</th>
								<!-- һ����{��ɫ���}-->   
								<th align="center" rowName="role_name" orderName="role_name:DESC" title='��ɫ���'>��ɫ���</th>
								<!-- һ����{�û����}-->   
								<th align="center" rowName="user_name" orderName="user_name:DESC" title='�û����'>�û����</th>
								<!-- һ����{˵��}-->   
								<th align="center" rowName="note" orderName="note:DESC" title='˵��'>˵��</th>
								<!-- һ����{������}-->   
								<th align="center" rowName="operator" orderName="operator:DESC" title='������'>������</th>
								<!-- һ����{����ʱ��}-->   
								<th align="center" rowName="operat_time" orderName="operat_time:DESC" title='����ʱ��'>����ʱ��</th>
<%
if(request.getAttribute("SYS_PT_USER_ROLE.INUSE")==null){
request.setAttribute("SYS_PT_USER_ROLE.INUSE",CodeFactory.getCodeListByCodeType("SYS_PT_USER_ROLE.INUSE"));
}
%>	

								<!-- ö���� {ʹ�ñ�־}-->   
								<th align="center" rowName="in_use" orderName="in_use:DESC" title='ʹ�ñ�־'>ʹ�ñ�־</th>
								<!-- һ����{�ַ��������ֶ�1}-->   
								<th align="center" rowName="char_1" orderName="char_1:DESC" title='�ַ��������ֶ�1'>�ַ��������ֶ�1</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							SysPtUserRole view = new SysPtUserRole();
								for (int i = 0; i < list.size(); i++) {
									view = (SysPtUserRole) list.get(i);
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
					
											<!-- ������{�û��˻�}-->   
											<td><%=view.getUserId()%></td>
											<!-- ������{������Ľ�ɫ}-->   
											<td><%=view.getRoleId()%></td>
											<!-- һ����{��ɫ���}-->   
											<td><%=view.getRoleName()%></td>
											<!-- һ����{�û����}-->   
											<td><%=view.getUserName()%></td>
											<!-- һ����{˵��}-->   
											<td><%=view.getNote()%></td>
											<!-- һ����{������}-->   
											<td><%=view.getOperator()%></td>
											<!-- һ����{����ʱ��}-->   
											<td><%=view.getOperatTime()%></td>
											<!-- ö����{ʹ�ñ�־}-->   
											<td>
											<html:label name="in_use" collection="SYS_PT_USER_ROLE.INUSE"  value="<%=view.getInUse()%>" labelKey="code" onlyName="true" labelProperty="name"/>
											</td>
											<!-- һ����{�ַ��������ֶ�1}-->   
											<td><%=view.getChar1()%></td>

											<td>
												<a class="o-edit" href="SysPtUserRole.mc?method=editSysPtUserRole&userId,roleId=<%= view.getUserId() +":"+  view.getRoleId() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteSysPtUserRole('<%= view.getUserId() +":"+  view.getRoleId() %>')" title="ɾ��"></a>
											    <a class="o-view" href="SysPtUserRole.mc?method=detailSysPtUserRole&userId,roleId=<%= view.getUserId() +":"+  view.getRoleId() %>" title="����"></a> 
												
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
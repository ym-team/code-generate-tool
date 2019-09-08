<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.SysBaseConfig" %>
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
		function deleteSysBaseConfig(PK) {
			jQuery.ajax({
				url : "SysBaseConfig.mc?method=deleteSysBaseConfig",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/SysBaseConfig.mc?method=getAllPageSysBaseConfig" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/sys_base_config_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="����" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="obj_type" placeholder="����ʹ��              ����@�ֶ��� eg: TABLE_NAME@COLOUM_NAME" value="${ param.obj_type }"/>
						    
						    	<input type='text' class="input-small" name="obj_id" placeholder="���ID" value="${ param.obj_id }"/>
						    
						    	<input type='text' class="input-small" name="obj_name" placeholder="������" value="${ param.obj_name }"/>
						    
						    	<input type='text' class="input-small" name="obj_ext" placeholder="�����չ����" value="${ param.obj_ext }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="���" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="obj_sts" placeholder="0:ʧЧ 1:���� " value="${ param.obj_sts }"/>
						    
						    	<input type='text' class="input-small" name="p_obj_id" placeholder="���ڵ�" value="${ param.p_obj_id }"/>
						    
						    	<input type='text' class="input-small" name="root_obj_id" placeholder="��ڵ�" value="${ param.root_obj_id }"/>
						    
						    	<input type='text' class="input-small" name="obj_level" placeholder="�㼶" value="${ param.obj_level }"/>

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
								<!-- ������{����ʹ��              ����@�ֶ��� eg: TABLE_NAME@COLOUM_NAME}-->   
								<th align="center" rowName="obj_type" orderName="obj_type:DESC" title='����ʹ��              ����@�ֶ��� eg: TABLE_NAME@COLOUM_NAME'>����ʹ��              ����@�ֶ��� eg: TABLE_NAME@COLOUM_NAME</th>
								<!-- ������{���ID}-->   
								<th align="center" rowName="obj_id" orderName="obj_id:DESC" title='���ID'>���ID</th>
								<!-- ������{������}-->   
								<th align="center" rowName="obj_name" orderName="obj_name:DESC" title='������'>������</th>
								<!-- ������{�����չ����}-->   
								<th align="center" rowName="obj_ext" orderName="obj_ext:DESC" title='�����չ����'>�����չ����</th>
								<!-- ������{���}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='���'>���</th>
								<!-- ������{0:ʧЧ 1:���� }-->   
								<th align="center" rowName="obj_sts" orderName="obj_sts:DESC" title='0:ʧЧ 1:���� '>0:ʧЧ 1:���� </th>
								<!-- ������{���ڵ�}-->   
								<th align="center" rowName="p_obj_id" orderName="p_obj_id:DESC" title='���ڵ�'>���ڵ�</th>
								<!-- ������{��ڵ�}-->   
								<th align="center" rowName="root_obj_id" orderName="root_obj_id:DESC" title='��ڵ�'>��ڵ�</th>
								<!-- ������{�㼶}-->   
								<th align="center" rowName="obj_level" orderName="obj_level:DESC" title='�㼶'>�㼶</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							SysBaseConfig view = new SysBaseConfig();
								for (int i = 0; i < list.size(); i++) {
									view = (SysBaseConfig) list.get(i);
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
											<!-- ������{����ʹ��              ����@�ֶ��� eg: TABLE_NAME@COLOUM_NAME}-->   
											<td><%=view.getObjType()%></td>
											<!-- ������{���ID}-->   
											<td><%=view.getObjId()%></td>
											<!-- ������{������}-->   
											<td><%=view.getObjName()%></td>
											<!-- ������{�����չ����}-->   
											<td><%=view.getObjExt()%></td>
											<!-- ������{���}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{0:ʧЧ 1:���� }-->   
											<td><%=view.getObjSts()%></td>
											<!-- ������{���ڵ�}-->   
											<td><%=view.getPObjId()%></td>
											<!-- ������{��ڵ�}-->   
											<td><%=view.getRootObjId()%></td>
											<!-- ������{�㼶}-->   
											<td><%=view.getObjLevel()%></td>

											<td>
												<a class="o-edit" href="SysBaseConfig.mc?method=editSysBaseConfig&pkId,objType,objId,objName,objExt,remark,objSts,pObjId,rootObjId,objLevel=<%= view.getPkId() +":"+  view.getObjType() +":"+  view.getObjId() +":"+  view.getObjName() +":"+  view.getObjExt() +":"+  view.getRemark() +":"+  view.getObjSts() +":"+  view.getPObjId() +":"+  view.getRootObjId() +":"+  view.getObjLevel() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteSysBaseConfig('<%= view.getPkId() +":"+  view.getObjType() +":"+  view.getObjId() +":"+  view.getObjName() +":"+  view.getObjExt() +":"+  view.getRemark() +":"+  view.getObjSts() +":"+  view.getPObjId() +":"+  view.getRootObjId() +":"+  view.getObjLevel() %>')" title="ɾ��"></a>
											    <a class="o-view" href="SysBaseConfig.mc?method=detailSysBaseConfig&pkId,objType,objId,objName,objExt,remark,objSts,pObjId,rootObjId,objLevel=<%= view.getPkId() +":"+  view.getObjType() +":"+  view.getObjId() +":"+  view.getObjName() +":"+  view.getObjExt() +":"+  view.getRemark() +":"+  view.getObjSts() +":"+  view.getPObjId() +":"+  view.getRootObjId() +":"+  view.getObjLevel() %>" title="����"></a> 
												
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
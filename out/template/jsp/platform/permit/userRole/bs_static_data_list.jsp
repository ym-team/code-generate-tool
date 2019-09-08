<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.BsStaticData" %>
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
		function deleteBsStaticData(PK) {
			jQuery.ajax({
				url : "BsStaticData.mc?method=deleteBsStaticData",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/BsStaticData.mc?method=getAllPageBsStaticData" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/bs_static_data_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="code_type" placeholder="" value="${ param.code_type }"/>
						    
						    	<input type='text' class="input-small" name="code_value" placeholder="" value="${ param.code_value }"/>
						    
						    	<input type='text' class="input-small" name="code_name" placeholder="" value="${ param.code_name }"/>
						    
						    	<input type='text' class="input-small" name="code_desc" placeholder="" value="${ param.code_desc }"/>
						    
						    	<input type='text' class="input-small" name="code_type_alias" placeholder="" value="${ param.code_type_alias }"/>
						    
						    	<input type='text' class="input-small" name="sort_id" placeholder="" value="${ param.sort_id }"/>
						    
						    	<input type='text' class="input-small" name="state" placeholder="" value="${ param.state }"/>
						    
						    	<input type='text' class="input-small" name="extern_code_type" placeholder="" value="${ param.extern_code_type }"/>

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
								<!-- ������{}-->   
								<th align="center" rowName="code_type" orderName="code_type:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="code_value" orderName="code_value:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="code_name" orderName="code_name:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="code_desc" orderName="code_desc:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="code_type_alias" orderName="code_type_alias:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="sort_id" orderName="sort_id:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="state" orderName="state:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="extern_code_type" orderName="extern_code_type:DESC" title=''></th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							BsStaticData view = new BsStaticData();
								for (int i = 0; i < list.size(); i++) {
									view = (BsStaticData) list.get(i);
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
					
											<!-- ������{}-->   
											<td><%=view.getCodeType()%></td>
											<!-- ������{}-->   
											<td><%=view.getCodeValue()%></td>
											<!-- ������{}-->   
											<td><%=view.getCodeName()%></td>
											<!-- ������{}-->   
											<td><%=view.getCodeDesc()%></td>
											<!-- ������{}-->   
											<td><%=view.getCodeTypeAlias()%></td>
											<!-- ������{}-->   
											<td><%=view.getSortId()%></td>
											<!-- ������{}-->   
											<td><%=view.getState()%></td>
											<!-- ������{}-->   
											<td><%=view.getExternCodeType()%></td>

											<td>
												<a class="o-edit" href="BsStaticData.mc?method=editBsStaticData&codeType,codeValue,codeName,codeDesc,codeTypeAlias,sortId,state,externCodeType=<%= view.getCodeType() +":"+  view.getCodeValue() +":"+  view.getCodeName() +":"+  view.getCodeDesc() +":"+  view.getCodeTypeAlias() +":"+  view.getSortId() +":"+  view.getState() +":"+  view.getExternCodeType() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteBsStaticData('<%= view.getCodeType() +":"+  view.getCodeValue() +":"+  view.getCodeName() +":"+  view.getCodeDesc() +":"+  view.getCodeTypeAlias() +":"+  view.getSortId() +":"+  view.getState() +":"+  view.getExternCodeType() %>')" title="ɾ��"></a>
											    <a class="o-view" href="BsStaticData.mc?method=detailBsStaticData&codeType,codeValue,codeName,codeDesc,codeTypeAlias,sortId,state,externCodeType=<%= view.getCodeType() +":"+  view.getCodeValue() +":"+  view.getCodeName() +":"+  view.getCodeDesc() +":"+  view.getCodeTypeAlias() +":"+  view.getSortId() +":"+  view.getState() +":"+  view.getExternCodeType() %>" title="����"></a> 
												
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
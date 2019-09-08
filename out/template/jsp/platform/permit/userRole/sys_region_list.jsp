<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.SysRegion" %>
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
		function deleteSysRegion(PK) {
			jQuery.ajax({
				url : "SysRegion.mc?method=deleteSysRegion",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/SysRegion.mc?method=getAllPageSysRegion" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/sys_region_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="province_code" placeholder="?" value="${ param.province_code }"/>
						    
						    	<input type='text' class="input-small" name="province_name" placeholder="?" value="${ param.province_name }"/>
						    
						    	<input type='text' class="input-small" name="city_code" placeholder="" value="${ param.city_code }"/>
						    
						    	<input type='text' class="input-small" name="city_name" placeholder="" value="${ param.city_name }"/>
						    
						    	<input type='text' class="input-small" name="county_code" placeholder="" value="${ param.county_code }"/>
						    
						    	<input type='text' class="input-small" name="county_name" placeholder="" value="${ param.county_name }"/>

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
								<!-- ������{?}-->   
								<th align="center" rowName="province_code" orderName="province_code:DESC" title='?'>?</th>
								<!-- ������{?}-->   
								<th align="center" rowName="province_name" orderName="province_name:DESC" title='?'>?</th>
								<!-- ������{}-->   
								<th align="center" rowName="city_code" orderName="city_code:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="city_name" orderName="city_name:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="county_code" orderName="county_code:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="county_name" orderName="county_name:DESC" title=''></th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							SysRegion view = new SysRegion();
								for (int i = 0; i < list.size(); i++) {
									view = (SysRegion) list.get(i);
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
					
											<!-- ������{?}-->   
											<td><%=view.getProvinceCode()%></td>
											<!-- ������{?}-->   
											<td><%=view.getProvinceName()%></td>
											<!-- ������{}-->   
											<td><%=view.getCityCode()%></td>
											<!-- ������{}-->   
											<td><%=view.getCityName()%></td>
											<!-- ������{}-->   
											<td><%=view.getCountyCode()%></td>
											<!-- ������{}-->   
											<td><%=view.getCountyName()%></td>

											<td>
												<a class="o-edit" href="SysRegion.mc?method=editSysRegion&provinceCode,provinceName,cityCode,cityName,countyCode,countyName=<%= view.getProvinceCode() +":"+  view.getProvinceName() +":"+  view.getCityCode() +":"+  view.getCityName() +":"+  view.getCountyCode() +":"+  view.getCountyName() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteSysRegion('<%= view.getProvinceCode() +":"+  view.getProvinceName() +":"+  view.getCityCode() +":"+  view.getCityName() +":"+  view.getCountyCode() +":"+  view.getCountyName() %>')" title="ɾ��"></a>
											    <a class="o-view" href="SysRegion.mc?method=detailSysRegion&provinceCode,provinceName,cityCode,cityName,countyCode,countyName=<%= view.getProvinceCode() +":"+  view.getProvinceName() +":"+  view.getCityCode() +":"+  view.getCityName() +":"+  view.getCountyCode() +":"+  view.getCountyName() %>" title="����"></a> 
												
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.SysHospitalNew" %>
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
		function deleteSysHospitalNew(PK) {
			jQuery.ajax({
				url : "SysHospitalNew.mc?method=deleteSysHospitalNew",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/SysHospitalNew.mc?method=getAllPageSysHospitalNew" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/sys_hospital_new_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="hospital_name" placeholder="ҽԺ���" value="${ param.hospital_name }"/>
						    
						    	<input type='text' class="input-small" name="province_code" placeholder="ʡ���" value="${ param.province_code }"/>
						    
						    	<input type='text' class="input-small" name="city_code" placeholder="���б��" value="${ param.city_code }"/>
						    
						    	<input type='text' class="input-small" name="hospital_level" placeholder="3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ� " value="${ param.hospital_level }"/>
						    
						    	<input type='text' class="input-small" name="hospital_level_name" placeholder="������� " value="${ param.hospital_level_name }"/>
						    
						    	<input type='text' class="input-small" name="hospital_pro" placeholder="ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪" value="${ param.hospital_pro }"/>
						    
						    	<input type='text' class="input-small" name="hospital_pro_name" placeholder="ҽԺ���� ���" value="${ param.hospital_pro_name }"/>
						    
						    	<input type='text' class="input-small" name="ctity_level" placeholder="1 ���Ϲ��� 2 ���߳��� 3 ���߳���" value="${ param.ctity_level }"/>
						    
						    	<input type='text' class="input-small" name="hospital_sts" placeholder="1:���� 2������" value="${ param.hospital_sts }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>

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
								<!-- ������{ҽԺ���}-->   
								<th align="center" rowName="hospital_name" orderName="hospital_name:DESC" title='ҽԺ���'>ҽԺ���</th>
								<!-- ������{ʡ���}-->   
								<th align="center" rowName="province_code" orderName="province_code:DESC" title='ʡ���'>ʡ���</th>
								<!-- ������{���б��}-->   
								<th align="center" rowName="city_code" orderName="city_code:DESC" title='���б��'>���б��</th>
								<!-- ������{3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ� }-->   
								<th align="center" rowName="hospital_level" orderName="hospital_level:DESC" title='3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ� '>3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ� </th>
								<!-- ������{������� }-->   
								<th align="center" rowName="hospital_level_name" orderName="hospital_level_name:DESC" title='������� '>������� </th>
								<!-- ������{ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪}-->   
								<th align="center" rowName="hospital_pro" orderName="hospital_pro:DESC" title='ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪'>ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪</th>
								<!-- ������{ҽԺ���� ���}-->   
								<th align="center" rowName="hospital_pro_name" orderName="hospital_pro_name:DESC" title='ҽԺ���� ���'>ҽԺ���� ���</th>
								<!-- ������{1 ���Ϲ��� 2 ���߳��� 3 ���߳���}-->   
								<th align="center" rowName="ctity_level" orderName="ctity_level:DESC" title='1 ���Ϲ��� 2 ���߳��� 3 ���߳���'>1 ���Ϲ��� 2 ���߳��� 3 ���߳���</th>
								<!-- ������{1:���� 2������}-->   
								<th align="center" rowName="hospital_sts" orderName="hospital_sts:DESC" title='1:���� 2������'>1:���� 2������</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							SysHospitalNew view = new SysHospitalNew();
								for (int i = 0; i < list.size(); i++) {
									view = (SysHospitalNew) list.get(i);
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
											<!-- ������{ҽԺ���}-->   
											<td><%=view.getHospitalName()%></td>
											<!-- ������{ʡ���}-->   
											<td><%=view.getProvinceCode()%></td>
											<!-- ������{���б��}-->   
											<td><%=view.getCityCode()%></td>
											<!-- ������{3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ� }-->   
											<td><%=view.getHospitalLevel()%></td>
											<!-- ������{������� }-->   
											<td><%=view.getHospitalLevelName()%></td>
											<!-- ������{ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪}-->   
											<td><%=view.getHospitalPro()%></td>
											<!-- ������{ҽԺ���� ���}-->   
											<td><%=view.getHospitalProName()%></td>
											<!-- ������{1 ���Ϲ��� 2 ���߳��� 3 ���߳���}-->   
											<td><%=view.getCtityLevel()%></td>
											<!-- ������{1:���� 2������}-->   
											<td><%=view.getHospitalSts()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="SysHospitalNew.mc?method=editSysHospitalNew&id,hospitalName,provinceCode,cityCode,hospitalLevel,hospitalLevelName,hospitalPro,hospitalProName,ctityLevel,hospitalSts,createTime,optTime,remark=<%= view.getId() +":"+  view.getHospitalName() +":"+  view.getProvinceCode() +":"+  view.getCityCode() +":"+  view.getHospitalLevel() +":"+  view.getHospitalLevelName() +":"+  view.getHospitalPro() +":"+  view.getHospitalProName() +":"+  view.getCtityLevel() +":"+  view.getHospitalSts() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteSysHospitalNew('<%= view.getId() +":"+  view.getHospitalName() +":"+  view.getProvinceCode() +":"+  view.getCityCode() +":"+  view.getHospitalLevel() +":"+  view.getHospitalLevelName() +":"+  view.getHospitalPro() +":"+  view.getHospitalProName() +":"+  view.getCtityLevel() +":"+  view.getHospitalSts() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() %>')" title="ɾ��"></a>
											    <a class="o-view" href="SysHospitalNew.mc?method=detailSysHospitalNew&id,hospitalName,provinceCode,cityCode,hospitalLevel,hospitalLevelName,hospitalPro,hospitalProName,ctityLevel,hospitalSts,createTime,optTime,remark=<%= view.getId() +":"+  view.getHospitalName() +":"+  view.getProvinceCode() +":"+  view.getCityCode() +":"+  view.getHospitalLevel() +":"+  view.getHospitalLevelName() +":"+  view.getHospitalPro() +":"+  view.getHospitalProName() +":"+  view.getCtityLevel() +":"+  view.getHospitalSts() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() %>" title="����"></a> 
												
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
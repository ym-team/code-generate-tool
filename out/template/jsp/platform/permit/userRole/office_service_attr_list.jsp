<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.OfficeServiceAttr" %>
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
		function deleteOfficeServiceAttr(PK) {
			jQuery.ajax({
				url : "OfficeServiceAttr.mc?method=deleteOfficeServiceAttr",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/OfficeServiceAttr.mc?method=getAllPageOfficeServiceAttr" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/office_service_attr_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="office_service_attr_id" placeholder="�������id����" value="${ param.office_service_attr_id }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_price" placeholder="�۸�" value="${ param.office_service_attr_price }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_isopen" placeholder="�������ԤԼ�Ƿ�ͨ��1��ͨ 2δ��ͨ" value="${ param.office_service_attr_isopen }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_title" placeholder="" value="${ param.office_service_attr_title }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_desc" placeholder="��������" value="${ param.office_service_attr_desc }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_url" placeholder="�������ͼ ���ƴװ" value="${ param.office_service_attr_url }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_starttime" placeholder="" value="${ param.office_service_attr_starttime }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_endtime" placeholder="�������ʱ��" value="${ param.office_service_attr_endtime }"/>
						    
						    	<input type='text' class="input-small" name="system_type" placeholder="1 ����ʱ�� ����ԤԼ  ר��ԤԼ 2Ϊ�Լ������ķ������" value="${ param.system_type }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="office_service_id" placeholder="����id" value="${ param.office_service_id }"/>
						    
						    	<input type='text' class="input-small" name="office_id" placeholder="������id" value="${ param.office_id }"/>
						    
						    	<input type='text' class="input-small" name="sub_system_type" placeholder="101Ϊ����ʱ�� 102Ϊ����ԤԼ 103Ϊר��ԤԼ" value="${ param.sub_system_type }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_proficientcard" placeholder="" value="${ param.office_service_attr_proficientcard }"/>

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
								<!-- ������{�������id����}-->   
								<th align="center" rowName="office_service_attr_id" orderName="office_service_attr_id:DESC" title='�������id����'>�������id����</th>
								<!-- ������{�۸�}-->   
								<th align="center" rowName="office_service_attr_price" orderName="office_service_attr_price:DESC" title='�۸�'>�۸�</th>
								<!-- ������{�������ԤԼ�Ƿ�ͨ��1��ͨ 2δ��ͨ}-->   
								<th align="center" rowName="office_service_attr_isopen" orderName="office_service_attr_isopen:DESC" title='�������ԤԼ�Ƿ�ͨ��1��ͨ 2δ��ͨ'>�������ԤԼ�Ƿ�ͨ��1��ͨ 2δ��ͨ</th>
								<!-- ������{}-->   
								<th align="center" rowName="office_service_attr_title" orderName="office_service_attr_title:DESC" title=''></th>
								<!-- ������{��������}-->   
								<th align="center" rowName="office_service_attr_desc" orderName="office_service_attr_desc:DESC" title='��������'>��������</th>
								<!-- ������{�������ͼ ���ƴװ}-->   
								<th align="center" rowName="office_service_attr_url" orderName="office_service_attr_url:DESC" title='�������ͼ ���ƴװ'>�������ͼ ���ƴװ</th>
								<!-- ������{}-->   
								<th align="center" rowName="office_service_attr_starttime" orderName="office_service_attr_starttime:DESC" title=''></th>
								<!-- ������{�������ʱ��}-->   
								<th align="center" rowName="office_service_attr_endtime" orderName="office_service_attr_endtime:DESC" title='�������ʱ��'>�������ʱ��</th>
								<!-- ������{1 ����ʱ�� ����ԤԼ  ר��ԤԼ 2Ϊ�Լ������ķ������}-->   
								<th align="center" rowName="system_type" orderName="system_type:DESC" title='1 ����ʱ�� ����ԤԼ  ר��ԤԼ 2Ϊ�Լ������ķ������'>1 ����ʱ�� ����ԤԼ  ר��ԤԼ 2Ϊ�Լ������ķ������</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{����id}-->   
								<th align="center" rowName="office_service_id" orderName="office_service_id:DESC" title='����id'>����id</th>
								<!-- ������{������id}-->   
								<th align="center" rowName="office_id" orderName="office_id:DESC" title='������id'>������id</th>
								<!-- ������{101Ϊ����ʱ�� 102Ϊ����ԤԼ 103Ϊר��ԤԼ}-->   
								<th align="center" rowName="sub_system_type" orderName="sub_system_type:DESC" title='101Ϊ����ʱ�� 102Ϊ����ԤԼ 103Ϊר��ԤԼ'>101Ϊ����ʱ�� 102Ϊ����ԤԼ 103Ϊר��ԤԼ</th>
								<!-- ������{}-->   
								<th align="center" rowName="office_service_attr_proficientcard" orderName="office_service_attr_proficientcard:DESC" title=''></th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							OfficeServiceAttr view = new OfficeServiceAttr();
								for (int i = 0; i < list.size(); i++) {
									view = (OfficeServiceAttr) list.get(i);
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
					
											<!-- ������{�������id����}-->   
											<td><%=view.getOfficeServiceAttrId()%></td>
											<!-- ������{�۸�}-->   
											<td><%=view.getOfficeServiceAttrPrice()%></td>
											<!-- ������{�������ԤԼ�Ƿ�ͨ��1��ͨ 2δ��ͨ}-->   
											<td><%=view.getOfficeServiceAttrIsopen()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeServiceAttrTitle()%></td>
											<!-- ������{��������}-->   
											<td><%=view.getOfficeServiceAttrDesc()%></td>
											<!-- ������{�������ͼ ���ƴװ}-->   
											<td><%=view.getOfficeServiceAttrUrl()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeServiceAttrStarttime()%></td>
											<!-- ������{�������ʱ��}-->   
											<td><%=view.getOfficeServiceAttrEndtime()%></td>
											<!-- ������{1 ����ʱ�� ����ԤԼ  ר��ԤԼ 2Ϊ�Լ������ķ������}-->   
											<td><%=view.getSystemType()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{����id}-->   
											<td><%=view.getOfficeServiceId()%></td>
											<!-- ������{������id}-->   
											<td><%=view.getOfficeId()%></td>
											<!-- ������{101Ϊ����ʱ�� 102Ϊ����ԤԼ 103Ϊר��ԤԼ}-->   
											<td><%=view.getSubSystemType()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeServiceAttrProficientcard()%></td>

											<td>
												<a class="o-edit" href="OfficeServiceAttr.mc?method=editOfficeServiceAttr&officeServiceAttrId,officeServiceAttrPrice,officeServiceAttrIsopen,officeServiceAttrTitle,officeServiceAttrDesc,officeServiceAttrUrl,officeServiceAttrStarttime,officeServiceAttrEndtime,systemType,createTime,optTime,remark,officeServiceId,officeId,subSystemType,officeServiceAttrProficientcard=<%= view.getOfficeServiceAttrId() +":"+  view.getOfficeServiceAttrPrice() +":"+  view.getOfficeServiceAttrIsopen() +":"+  view.getOfficeServiceAttrTitle() +":"+  view.getOfficeServiceAttrDesc() +":"+  view.getOfficeServiceAttrUrl() +":"+  view.getOfficeServiceAttrStarttime() +":"+  view.getOfficeServiceAttrEndtime() +":"+  view.getSystemType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeServiceId() +":"+  view.getOfficeId() +":"+  view.getSubSystemType() +":"+  view.getOfficeServiceAttrProficientcard() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteOfficeServiceAttr('<%= view.getOfficeServiceAttrId() +":"+  view.getOfficeServiceAttrPrice() +":"+  view.getOfficeServiceAttrIsopen() +":"+  view.getOfficeServiceAttrTitle() +":"+  view.getOfficeServiceAttrDesc() +":"+  view.getOfficeServiceAttrUrl() +":"+  view.getOfficeServiceAttrStarttime() +":"+  view.getOfficeServiceAttrEndtime() +":"+  view.getSystemType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeServiceId() +":"+  view.getOfficeId() +":"+  view.getSubSystemType() +":"+  view.getOfficeServiceAttrProficientcard() %>')" title="ɾ��"></a>
											    <a class="o-view" href="OfficeServiceAttr.mc?method=detailOfficeServiceAttr&officeServiceAttrId,officeServiceAttrPrice,officeServiceAttrIsopen,officeServiceAttrTitle,officeServiceAttrDesc,officeServiceAttrUrl,officeServiceAttrStarttime,officeServiceAttrEndtime,systemType,createTime,optTime,remark,officeServiceId,officeId,subSystemType,officeServiceAttrProficientcard=<%= view.getOfficeServiceAttrId() +":"+  view.getOfficeServiceAttrPrice() +":"+  view.getOfficeServiceAttrIsopen() +":"+  view.getOfficeServiceAttrTitle() +":"+  view.getOfficeServiceAttrDesc() +":"+  view.getOfficeServiceAttrUrl() +":"+  view.getOfficeServiceAttrStarttime() +":"+  view.getOfficeServiceAttrEndtime() +":"+  view.getSystemType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeServiceId() +":"+  view.getOfficeId() +":"+  view.getSubSystemType() +":"+  view.getOfficeServiceAttrProficientcard() %>" title="����"></a> 
												
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
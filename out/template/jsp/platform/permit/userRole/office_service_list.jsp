<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.OfficeService" %>
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
		function deleteOfficeService(PK) {
			jQuery.ajax({
				url : "OfficeService.mc?method=deleteOfficeService",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/OfficeService.mc?method=getAllPageOfficeService" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/office_service_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="office_service_id" placeholder="�����ҷ���������id" value="${ param.office_service_id }"/>
						    
						    	<input type='text' class="input-small" name="office_service_name" placeholder="������Ŀ���" value="${ param.office_service_name }"/>
						    
						    	<input type='text' class="input-small" name="office_service_urls" placeholder="������url,ƴ���ַ�" value="${ param.office_service_urls }"/>
						    
						    	<input type='text' class="input-small" name="office_service_type" placeholder="1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵�����" value="${ param.office_service_type }"/>
						    
						    	<input type='text' class="input-small" name="office_service_status" placeholder="1�����ߣ�2���ߣ�3������ ��ʱĬ����������" value="${ param.office_service_status }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_count" placeholder="����������� ����һ�����������¼ʱ�����1" value="${ param.office_service_attr_count }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_minprice" placeholder="��С��� (������������ʱ����Ҫ�б�)" value="${ param.office_service_attr_minprice }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_maxprice" placeholder="�����(������������ʱ����Ҫ�б�)" value="${ param.office_service_attr_maxprice }"/>
						    
						    	<input type='text' class="input-small" name="office_service_comment_count" placeholder="������������" value="${ param.office_service_comment_count }"/>
						    
						    	<input type='text' class="input-small" name="system_type" placeholder="1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽����������" value="${ param.system_type }"/>
						    
						    	<input type='text' class="input-small" name="office_id" placeholder="�������id" value="${ param.office_id }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="office_service_sold" placeholder="���۷���" value="${ param.office_service_sold }"/>
						    
						    	<input type='text' class="input-small" name="people_num" placeholder="" value="${ param.people_num }"/>
						    
						    	<input type='text' class="input-small" name="schedual_isopen" placeholder="�Ű����ñ��" value="${ param.schedual_isopen }"/>
						    
						    	<input type='text' class="input-small" name="sub_system_type" placeholder="ϵͳ������" value="${ param.sub_system_type }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_starttime" placeholder="����ʼʱ��" value="${ param.office_service_attr_starttime }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attr_endtime" placeholder="�������ʱ��" value="${ param.office_service_attr_endtime }"/>
						    
						    	<input type='text' class="input-small" name="char1" placeholder="�����ֶ�" value="${ param.char1 }"/>
						    
						    	<input type='text' class="input-small" name="char2" placeholder="�����ֶ�" value="${ param.char2 }"/>

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
								<!-- ������{�����ҷ���������id}-->   
								<th align="center" rowName="office_service_id" orderName="office_service_id:DESC" title='�����ҷ���������id'>�����ҷ���������id</th>
								<!-- ������{������Ŀ���}-->   
								<th align="center" rowName="office_service_name" orderName="office_service_name:DESC" title='������Ŀ���'>������Ŀ���</th>
								<!-- ������{������url,ƴ���ַ�}-->   
								<th align="center" rowName="office_service_urls" orderName="office_service_urls:DESC" title='������url,ƴ���ַ�'>������url,ƴ���ַ�</th>
								<!-- ������{1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵�����}-->   
								<th align="center" rowName="office_service_type" orderName="office_service_type:DESC" title='1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵�����'>1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵�����</th>
								<!-- ������{1�����ߣ�2���ߣ�3������ ��ʱĬ����������}-->   
								<th align="center" rowName="office_service_status" orderName="office_service_status:DESC" title='1�����ߣ�2���ߣ�3������ ��ʱĬ����������'>1�����ߣ�2���ߣ�3������ ��ʱĬ����������</th>
								<!-- ������{����������� ����һ�����������¼ʱ�����1}-->   
								<th align="center" rowName="office_service_attr_count" orderName="office_service_attr_count:DESC" title='����������� ����һ�����������¼ʱ�����1'>����������� ����һ�����������¼ʱ�����1</th>
								<!-- ������{��С��� (������������ʱ����Ҫ�б�)}-->   
								<th align="center" rowName="office_service_attr_minprice" orderName="office_service_attr_minprice:DESC" title='��С��� (������������ʱ����Ҫ�б�)'>��С��� (������������ʱ����Ҫ�б�)</th>
								<!-- ������{�����(������������ʱ����Ҫ�б�)}-->   
								<th align="center" rowName="office_service_attr_maxprice" orderName="office_service_attr_maxprice:DESC" title='�����(������������ʱ����Ҫ�б�)'>�����(������������ʱ����Ҫ�б�)</th>
								<!-- ������{������������}-->   
								<th align="center" rowName="office_service_comment_count" orderName="office_service_comment_count:DESC" title='������������'>������������</th>
								<!-- ������{1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽����������}-->   
								<th align="center" rowName="system_type" orderName="system_type:DESC" title='1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽����������'>1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽����������</th>
								<!-- ������{�������id}-->   
								<th align="center" rowName="office_id" orderName="office_id:DESC" title='�������id'>�������id</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title=''></th>
								<!-- ������{���۷���}-->   
								<th align="center" rowName="office_service_sold" orderName="office_service_sold:DESC" title='���۷���'>���۷���</th>
								<!-- ������{}-->   
								<th align="center" rowName="people_num" orderName="people_num:DESC" title=''></th>
								<!-- ������{�Ű����ñ��}-->   
								<th align="center" rowName="schedual_isopen" orderName="schedual_isopen:DESC" title='�Ű����ñ��'>�Ű����ñ��</th>
								<!-- ������{ϵͳ������}-->   
								<th align="center" rowName="sub_system_type" orderName="sub_system_type:DESC" title='ϵͳ������'>ϵͳ������</th>
								<!-- ������{����ʼʱ��}-->   
								<th align="center" rowName="office_service_attr_starttime" orderName="office_service_attr_starttime:DESC" title='����ʼʱ��'>����ʼʱ��</th>
								<!-- ������{�������ʱ��}-->   
								<th align="center" rowName="office_service_attr_endtime" orderName="office_service_attr_endtime:DESC" title='�������ʱ��'>�������ʱ��</th>
								<!-- ������{�����ֶ�}-->   
								<th align="center" rowName="char1" orderName="char1:DESC" title='�����ֶ�'>�����ֶ�</th>
								<!-- ������{�����ֶ�}-->   
								<th align="center" rowName="char2" orderName="char2:DESC" title='�����ֶ�'>�����ֶ�</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							OfficeService view = new OfficeService();
								for (int i = 0; i < list.size(); i++) {
									view = (OfficeService) list.get(i);
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
					
											<!-- ������{�����ҷ���������id}-->   
											<td><%=view.getOfficeServiceId()%></td>
											<!-- ������{������Ŀ���}-->   
											<td><%=view.getOfficeServiceName()%></td>
											<!-- ������{������url,ƴ���ַ�}-->   
											<td><%=view.getOfficeServiceUrls()%></td>
											<!-- ������{1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵�����}-->   
											<td><%=view.getOfficeServiceType()%></td>
											<!-- ������{1�����ߣ�2���ߣ�3������ ��ʱĬ����������}-->   
											<td><%=view.getOfficeServiceStatus()%></td>
											<!-- ������{����������� ����һ�����������¼ʱ�����1}-->   
											<td><%=view.getOfficeServiceAttrCount()%></td>
											<!-- ������{��С��� (������������ʱ����Ҫ�б�)}-->   
											<td><%=view.getOfficeServiceAttrMinprice()%></td>
											<!-- ������{�����(������������ʱ����Ҫ�б�)}-->   
											<td><%=view.getOfficeServiceAttrMaxprice()%></td>
											<!-- ������{������������}-->   
											<td><%=view.getOfficeServiceCommentCount()%></td>
											<!-- ������{1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽����������}-->   
											<td><%=view.getSystemType()%></td>
											<!-- ������{�������id}-->   
											<td><%=view.getOfficeId()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{���۷���}-->   
											<td><%=view.getOfficeServiceSold()%></td>
											<!-- ������{}-->   
											<td><%=view.getPeopleNum()%></td>
											<!-- ������{�Ű����ñ��}-->   
											<td><%=view.getSchedualIsopen()%></td>
											<!-- ������{ϵͳ������}-->   
											<td><%=view.getSubSystemType()%></td>
											<!-- ������{����ʼʱ��}-->   
											<td><%=view.getOfficeServiceAttrStarttime()%></td>
											<!-- ������{�������ʱ��}-->   
											<td><%=view.getOfficeServiceAttrEndtime()%></td>
											<!-- ������{�����ֶ�}-->   
											<td><%=view.getChar1()%></td>
											<!-- ������{�����ֶ�}-->   
											<td><%=view.getChar2()%></td>

											<td>
												<a class="o-edit" href="OfficeService.mc?method=editOfficeService&officeServiceId,officeServiceName,officeServiceUrls,officeServiceType,officeServiceStatus,officeServiceAttrCount,officeServiceAttrMinprice,officeServiceAttrMaxprice,officeServiceCommentCount,systemType,officeId,createTime,optTime,remark,officeServiceSold,peopleNum,schedualIsopen,subSystemType,officeServiceAttrStarttime,officeServiceAttrEndtime,char1,char2=<%= view.getOfficeServiceId() +":"+  view.getOfficeServiceName() +":"+  view.getOfficeServiceUrls() +":"+  view.getOfficeServiceType() +":"+  view.getOfficeServiceStatus() +":"+  view.getOfficeServiceAttrCount() +":"+  view.getOfficeServiceAttrMinprice() +":"+  view.getOfficeServiceAttrMaxprice() +":"+  view.getOfficeServiceCommentCount() +":"+  view.getSystemType() +":"+  view.getOfficeId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeServiceSold() +":"+  view.getPeopleNum() +":"+  view.getSchedualIsopen() +":"+  view.getSubSystemType() +":"+  view.getOfficeServiceAttrStarttime() +":"+  view.getOfficeServiceAttrEndtime() +":"+  view.getChar1() +":"+  view.getChar2() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteOfficeService('<%= view.getOfficeServiceId() +":"+  view.getOfficeServiceName() +":"+  view.getOfficeServiceUrls() +":"+  view.getOfficeServiceType() +":"+  view.getOfficeServiceStatus() +":"+  view.getOfficeServiceAttrCount() +":"+  view.getOfficeServiceAttrMinprice() +":"+  view.getOfficeServiceAttrMaxprice() +":"+  view.getOfficeServiceCommentCount() +":"+  view.getSystemType() +":"+  view.getOfficeId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeServiceSold() +":"+  view.getPeopleNum() +":"+  view.getSchedualIsopen() +":"+  view.getSubSystemType() +":"+  view.getOfficeServiceAttrStarttime() +":"+  view.getOfficeServiceAttrEndtime() +":"+  view.getChar1() +":"+  view.getChar2() %>')" title="ɾ��"></a>
											    <a class="o-view" href="OfficeService.mc?method=detailOfficeService&officeServiceId,officeServiceName,officeServiceUrls,officeServiceType,officeServiceStatus,officeServiceAttrCount,officeServiceAttrMinprice,officeServiceAttrMaxprice,officeServiceCommentCount,systemType,officeId,createTime,optTime,remark,officeServiceSold,peopleNum,schedualIsopen,subSystemType,officeServiceAttrStarttime,officeServiceAttrEndtime,char1,char2=<%= view.getOfficeServiceId() +":"+  view.getOfficeServiceName() +":"+  view.getOfficeServiceUrls() +":"+  view.getOfficeServiceType() +":"+  view.getOfficeServiceStatus() +":"+  view.getOfficeServiceAttrCount() +":"+  view.getOfficeServiceAttrMinprice() +":"+  view.getOfficeServiceAttrMaxprice() +":"+  view.getOfficeServiceCommentCount() +":"+  view.getSystemType() +":"+  view.getOfficeId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeServiceSold() +":"+  view.getPeopleNum() +":"+  view.getSchedualIsopen() +":"+  view.getSubSystemType() +":"+  view.getOfficeServiceAttrStarttime() +":"+  view.getOfficeServiceAttrEndtime() +":"+  view.getChar1() +":"+  view.getChar2() %>" title="����"></a> 
												
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
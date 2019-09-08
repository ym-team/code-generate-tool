<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmUserCoterieRel" %>
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
	<TITLE>������ѯ</TITLE>
	
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
		function deleteCmUserCoterieRel(PK) {
			jQuery.ajax({
				url : "CmUserCoterieRel.mc?method=deleteCmUserCoterieRel",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CmUserCoterieRel.mc?method=getAllPageCmUserCoterieRel" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_user_coterie_rel_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="����ID" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="coterie_id" placeholder="Ȧ��ID" value="${ param.coterie_id }"/>
						    
						    	<input type='text' class="input-small" name="user_id" placeholder="�û�ID" value="${ param.user_id }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="0: ��Ч             1: ��Ч" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="member_type" placeholder="��Ա���ͣ�3Ϊ�����ߣ�2Ϊ�����ߣ�1����ͨ��Ա" value="${ param.member_type }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="op_time" placeholder="����ʱ��" value="${ param.op_time }"/>

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
								<!-- ������{����ID}-->   
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='����ID'>����ID</th>
								<!-- ������{Ȧ��ID}-->   
								<th align="center" rowName="coterie_id" orderName="coterie_id:DESC" title='Ȧ��ID'>Ȧ��ID</th>
								<!-- ������{�û�ID}-->   
								<th align="center" rowName="user_id" orderName="user_id:DESC" title='�û�ID'>�û�ID</th>
								<!-- ������{0: ��Ч             1: ��Ч}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='0: ��Ч             1: ��Ч'>0: ��Ч             1: ��Ч</th>
								<!-- ������{��Ա���ͣ�3Ϊ�����ߣ�2Ϊ�����ߣ�1����ͨ��Ա}-->   
								<th align="center" rowName="member_type" orderName="member_type:DESC" title='��Ա���ͣ�3Ϊ�����ߣ�2Ϊ�����ߣ�1����ͨ��Ա'>��Ա���ͣ�3Ϊ�����ߣ�2Ϊ�����ߣ�1����ͨ��Ա</th>
								<!-- ������{}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title=''></th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="op_time" orderName="op_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							CmUserCoterieRel view = new CmUserCoterieRel();
								for (int i = 0; i < list.size(); i++) {
									view = (CmUserCoterieRel) list.get(i);
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
					
											<!-- ������{����ID}-->   
											<td><%=view.getPkId()%></td>
											<!-- ������{Ȧ��ID}-->   
											<td><%=view.getCoterieId()%></td>
											<!-- ������{�û�ID}-->   
											<td><%=view.getUserId()%></td>
											<!-- ������{0: ��Ч             1: ��Ч}-->   
											<td><%=view.getStatus()%></td>
											<!-- ������{��Ա���ͣ�3Ϊ�����ߣ�2Ϊ�����ߣ�1����ͨ��Ա}-->   
											<td><%=view.getMemberType()%></td>
											<!-- ������{}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOpTime()%></td>

											<td>
												<a class="o-edit" href="CmUserCoterieRel.mc?method=editCmUserCoterieRel&pkId,coterieId,userId,status,memberType,createTime,opTime=<%= view.getPkId() +":"+  view.getCoterieId() +":"+  view.getUserId() +":"+  view.getStatus() +":"+  view.getMemberType() +":"+  view.getCreateTime() +":"+  view.getOpTime() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCmUserCoterieRel('<%= view.getPkId() +":"+  view.getCoterieId() +":"+  view.getUserId() +":"+  view.getStatus() +":"+  view.getMemberType() +":"+  view.getCreateTime() +":"+  view.getOpTime() %>')" title="ɾ��"></a>
											    <a class="o-view" href="CmUserCoterieRel.mc?method=detailCmUserCoterieRel&pkId,coterieId,userId,status,memberType,createTime,opTime=<%= view.getPkId() +":"+  view.getCoterieId() +":"+  view.getUserId() +":"+  view.getStatus() +":"+  view.getMemberType() +":"+  view.getCreateTime() +":"+  view.getOpTime() %>" title="����"></a> 
												
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
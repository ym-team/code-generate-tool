<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.InfOpCount" %>
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
		function deleteInfOpCount(PK) {
			jQuery.ajax({
				url : "InfOpCount.mc?method=deleteInfOpCount",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/InfOpCount.mc?method=getAllPageInfOpCount" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/inf_op_count_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="inf_id" placeholder="��Ѷ��Ϣ��ʶ" value="${ param.inf_id }"/>
						    
						    	<input type='text' class="input-small" name="forward_num" placeholder="ת������, ÿ������ת��ʱ, +1����" value="${ param.forward_num }"/>
						    
						    	<input type='text' class="input-small" name="like_num" placeholder="��������, ÿ�����˵���ʱ, +1����" value="${ param.like_num }"/>
						    
						    	<input type='text' class="input-small" name="comment_num" placeholder="��������, ÿ����������ʱʱ, +1����" value="${ param.comment_num }"/>

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
								<!-- ������{��Ѷ��Ϣ��ʶ}-->   
								<th align="center" rowName="inf_id" orderName="inf_id:DESC" title='��Ѷ��Ϣ��ʶ'>��Ѷ��Ϣ��ʶ</th>
								<!-- ������{ת������, ÿ������ת��ʱ, +1����}-->   
								<th align="center" rowName="forward_num" orderName="forward_num:DESC" title='ת������, ÿ������ת��ʱ, +1����'>ת������, ÿ������ת��ʱ, +1����</th>
								<!-- ������{��������, ÿ�����˵���ʱ, +1����}-->   
								<th align="center" rowName="like_num" orderName="like_num:DESC" title='��������, ÿ�����˵���ʱ, +1����'>��������, ÿ�����˵���ʱ, +1����</th>
								<!-- ������{��������, ÿ����������ʱʱ, +1����}-->   
								<th align="center" rowName="comment_num" orderName="comment_num:DESC" title='��������, ÿ����������ʱʱ, +1����'>��������, ÿ����������ʱʱ, +1����</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							InfOpCount view = new InfOpCount();
								for (int i = 0; i < list.size(); i++) {
									view = (InfOpCount) list.get(i);
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
					
											<!-- ������{��Ѷ��Ϣ��ʶ}-->   
											<td><%=view.getInfId()%></td>
											<!-- ������{ת������, ÿ������ת��ʱ, +1����}-->   
											<td><%=view.getForwardNum()%></td>
											<!-- ������{��������, ÿ�����˵���ʱ, +1����}-->   
											<td><%=view.getLikeNum()%></td>
											<!-- ������{��������, ÿ����������ʱʱ, +1����}-->   
											<td><%=view.getCommentNum()%></td>

											<td>
												<a class="o-edit" href="InfOpCount.mc?method=editInfOpCount&infId,forwardNum,likeNum,commentNum=<%= view.getInfId() +":"+  view.getForwardNum() +":"+  view.getLikeNum() +":"+  view.getCommentNum() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteInfOpCount('<%= view.getInfId() +":"+  view.getForwardNum() +":"+  view.getLikeNum() +":"+  view.getCommentNum() %>')" title="ɾ��"></a>
											    <a class="o-view" href="InfOpCount.mc?method=detailInfOpCount&infId,forwardNum,likeNum,commentNum=<%= view.getInfId() +":"+  view.getForwardNum() +":"+  view.getLikeNum() +":"+  view.getCommentNum() %>" title="����"></a> 
												
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
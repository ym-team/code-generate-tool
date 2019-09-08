<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.InfAbstract" %>
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
		function deleteInfAbstract(PK) {
			jQuery.ajax({
				url : "InfAbstract.mc?method=deleteInfAbstract",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/InfAbstract.mc?method=getAllPageInfAbstract" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/inf_abstract_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="inf_id" placeholder="" value="${ param.inf_id }"/>
						    
						    	<input type='text' class="input-small" name="inf_title" placeholder="��Ѷ����" value="${ param.inf_title }"/>
						    
						    	<input type='text' class="input-small" name="inf_img" placeholder="��ѶͼƬ" value="${ param.inf_img }"/>
						    
						    	<input type='text' class="input-small" name="inf_create_time" placeholder="��ѶժҪ����ʱ��" value="${ param.inf_create_time }"/>
						    
						    	<input type='text' class="input-small" name="inf_ger_time" placeholder="ժҪ���ʱ��" value="${ param.inf_ger_time }"/>
						    
						    	<input type='text' class="input-small" name="inf_sign_time" placeholder="ժҪ���ʱ��" value="${ param.inf_sign_time }"/>
						    
						    	<input type='text' class="input-small" name="img_extend" placeholder="ժҪ��չͼƬ" value="${ param.img_extend }"/>
						    
						    	<input type='text' class="input-small" name="inf_tab" placeholder="ժҪ��ǩ" value="${ param.inf_tab }"/>
						    
						    	<input type='text' class="input-small" name="inf_show_type" placeholder="ժҪ��ʾ����" value="${ param.inf_show_type }"/>

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
								<th align="center" rowName="inf_id" orderName="inf_id:DESC" title=''></th>
								<!-- ������{��Ѷ����}-->   
								<th align="center" rowName="inf_title" orderName="inf_title:DESC" title='��Ѷ����'>��Ѷ����</th>
								<!-- ������{��ѶͼƬ}-->   
								<th align="center" rowName="inf_img" orderName="inf_img:DESC" title='��ѶͼƬ'>��ѶͼƬ</th>
								<!-- ������{��ѶժҪ����ʱ��}-->   
								<th align="center" rowName="inf_create_time" orderName="inf_create_time:DESC" title='��ѶժҪ����ʱ��'>��ѶժҪ����ʱ��</th>
								<!-- ������{ժҪ���ʱ��}-->   
								<th align="center" rowName="inf_ger_time" orderName="inf_ger_time:DESC" title='ժҪ���ʱ��'>ժҪ���ʱ��</th>
								<!-- ������{ժҪ���ʱ��}-->   
								<th align="center" rowName="inf_sign_time" orderName="inf_sign_time:DESC" title='ժҪ���ʱ��'>ժҪ���ʱ��</th>
								<!-- ������{ժҪ��չͼƬ}-->   
								<th align="center" rowName="img_extend" orderName="img_extend:DESC" title='ժҪ��չͼƬ'>ժҪ��չͼƬ</th>
								<!-- ������{ժҪ��ǩ}-->   
								<th align="center" rowName="inf_tab" orderName="inf_tab:DESC" title='ժҪ��ǩ'>ժҪ��ǩ</th>
								<!-- ������{ժҪ��ʾ����}-->   
								<th align="center" rowName="inf_show_type" orderName="inf_show_type:DESC" title='ժҪ��ʾ����'>ժҪ��ʾ����</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							InfAbstract view = new InfAbstract();
								for (int i = 0; i < list.size(); i++) {
									view = (InfAbstract) list.get(i);
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
											<td><%=view.getInfId()%></td>
											<!-- ������{��Ѷ����}-->   
											<td><%=view.getInfTitle()%></td>
											<!-- ������{��ѶͼƬ}-->   
											<td><%=view.getInfImg()%></td>
											<!-- ������{��ѶժҪ����ʱ��}-->   
											<td><%=view.getInfCreateTime()%></td>
											<!-- ������{ժҪ���ʱ��}-->   
											<td><%=view.getInfGerTime()%></td>
											<!-- ������{ժҪ���ʱ��}-->   
											<td><%=view.getInfSignTime()%></td>
											<!-- ������{ժҪ��չͼƬ}-->   
											<td><%=view.getImgExtend()%></td>
											<!-- ������{ժҪ��ǩ}-->   
											<td><%=view.getInfTab()%></td>
											<!-- ������{ժҪ��ʾ����}-->   
											<td><%=view.getInfShowType()%></td>

											<td>
												<a class="o-edit" href="InfAbstract.mc?method=editInfAbstract&infId,infTitle,infImg,infCreateTime,infGerTime,infSignTime,imgExtend,infTab,infShowType=<%= view.getInfId() +":"+  view.getInfTitle() +":"+  view.getInfImg() +":"+  view.getInfCreateTime() +":"+  view.getInfGerTime() +":"+  view.getInfSignTime() +":"+  view.getImgExtend() +":"+  view.getInfTab() +":"+  view.getInfShowType() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteInfAbstract('<%= view.getInfId() +":"+  view.getInfTitle() +":"+  view.getInfImg() +":"+  view.getInfCreateTime() +":"+  view.getInfGerTime() +":"+  view.getInfSignTime() +":"+  view.getImgExtend() +":"+  view.getInfTab() +":"+  view.getInfShowType() %>')" title="ɾ��"></a>
											    <a class="o-view" href="InfAbstract.mc?method=detailInfAbstract&infId,infTitle,infImg,infCreateTime,infGerTime,infSignTime,imgExtend,infTab,infShowType=<%= view.getInfId() +":"+  view.getInfTitle() +":"+  view.getInfImg() +":"+  view.getInfCreateTime() +":"+  view.getInfGerTime() +":"+  view.getInfSignTime() +":"+  view.getImgExtend() +":"+  view.getInfTab() +":"+  view.getInfShowType() %>" title="����"></a> 
												
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
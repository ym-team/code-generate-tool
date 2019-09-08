<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmUserCardInfo" %>
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
		function deleteCmUserCardInfo(PK) {
			jQuery.ajax({
				url : "CmUserCardInfo.mc?method=deleteCmUserCardInfo",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CmUserCardInfo.mc?method=getAllPageCmUserCardInfo" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_user_card_info_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="user_card_id" placeholder="�û���ƬID" value="${ param.user_card_id }"/>
						    
						    	<input type='text' class="input-small" name="user_id" placeholder="�û�ID" value="${ param.user_id }"/>
						    
						    	<input type='text' class="input-small" name="user_brife_card" placeholder="�û���Ҫ��Ϣ" value="${ param.user_brife_card }"/>
						    
						    	<input type='text' class="input-small" name="user_base_card" placeholder="�û���ϸ��Ϣ" value="${ param.user_base_card }"/>
						    
						    	<input type='text' class="input-small" name="user_show_card" placeholder="�û�չʾ��Ϣ" value="${ param.user_show_card }"/>
						    
						    	<input type='text' class="input-small" name="create_date" placeholder="����ʱ��" value="${ param.create_date }"/>
						    
						    	<input type='text' class="input-small" name="card_sts" placeholder="״̬             1: ����             2: ɾ��" value="${ param.card_sts }"/>
						    
						    	<input type='text' class="input-small" name="op_time" placeholder="����ʱ��" value="${ param.op_time }"/>
						    
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
								<!-- ������{�û���ƬID}-->   
								<th align="center" rowName="user_card_id" orderName="user_card_id:DESC" title='�û���ƬID'>�û���ƬID</th>
								<!-- ������{�û�ID}-->   
								<th align="center" rowName="user_id" orderName="user_id:DESC" title='�û�ID'>�û�ID</th>
								<!-- ������{�û���Ҫ��Ϣ}-->   
								<th align="center" rowName="user_brife_card" orderName="user_brife_card:DESC" title='�û���Ҫ��Ϣ'>�û���Ҫ��Ϣ</th>
								<!-- ������{�û���ϸ��Ϣ}-->   
								<th align="center" rowName="user_base_card" orderName="user_base_card:DESC" title='�û���ϸ��Ϣ'>�û���ϸ��Ϣ</th>
								<!-- ������{�û�չʾ��Ϣ}-->   
								<th align="center" rowName="user_show_card" orderName="user_show_card:DESC" title='�û�չʾ��Ϣ'>�û�չʾ��Ϣ</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_date" orderName="create_date:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{״̬             1: ����             2: ɾ��}-->   
								<th align="center" rowName="card_sts" orderName="card_sts:DESC" title='״̬             1: ����             2: ɾ��'>״̬             1: ����             2: ɾ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="op_time" orderName="op_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							CmUserCardInfo view = new CmUserCardInfo();
								for (int i = 0; i < list.size(); i++) {
									view = (CmUserCardInfo) list.get(i);
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
					
											<!-- ������{�û���ƬID}-->   
											<td><%=view.getUserCardId()%></td>
											<!-- ������{�û�ID}-->   
											<td><%=view.getUserId()%></td>
											<!-- ������{�û���Ҫ��Ϣ}-->   
											<td><%=view.getUserBrifeCard()%></td>
											<!-- ������{�û���ϸ��Ϣ}-->   
											<td><%=view.getUserBaseCard()%></td>
											<!-- ������{�û�չʾ��Ϣ}-->   
											<td><%=view.getUserShowCard()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateDate()%></td>
											<!-- ������{״̬             1: ����             2: ɾ��}-->   
											<td><%=view.getCardSts()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOpTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="CmUserCardInfo.mc?method=editCmUserCardInfo&userCardId,userId,userBrifeCard,userBaseCard,userShowCard,createDate,cardSts,opTime,remark=<%= view.getUserCardId() +":"+  view.getUserId() +":"+  view.getUserBrifeCard() +":"+  view.getUserBaseCard() +":"+  view.getUserShowCard() +":"+  view.getCreateDate() +":"+  view.getCardSts() +":"+  view.getOpTime() +":"+  view.getRemark() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCmUserCardInfo('<%= view.getUserCardId() +":"+  view.getUserId() +":"+  view.getUserBrifeCard() +":"+  view.getUserBaseCard() +":"+  view.getUserShowCard() +":"+  view.getCreateDate() +":"+  view.getCardSts() +":"+  view.getOpTime() +":"+  view.getRemark() %>')" title="ɾ��"></a>
											    <a class="o-view" href="CmUserCardInfo.mc?method=detailCmUserCardInfo&userCardId,userId,userBrifeCard,userBaseCard,userShowCard,createDate,cardSts,opTime,remark=<%= view.getUserCardId() +":"+  view.getUserId() +":"+  view.getUserBrifeCard() +":"+  view.getUserBaseCard() +":"+  view.getUserShowCard() +":"+  view.getCreateDate() +":"+  view.getCardSts() +":"+  view.getOpTime() +":"+  view.getRemark() %>" title="����"></a> 
												
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
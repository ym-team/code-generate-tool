<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.OrderComplainReply" %>
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
		function deleteOrderComplainReply(PK) {
			jQuery.ajax({
				url : "OrderComplainReply.mc?method=deleteOrderComplainReply",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/OrderComplainReply.mc?method=getAllPageOrderComplainReply" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/order_complain_reply_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="from_user_id" placeholder="Ͷ����id" value="${ param.from_user_id }"/>
						    
						    	<input type='text' class="input-small" name="order_id" placeholder="����id" value="${ param.order_id }"/>
						    
						    	<input type='text' class="input-small" name="order_complain_id" placeholder="Ͷ��id" value="${ param.order_complain_id }"/>
						    
						    	<input type='text' class="input-small" name="reply_content" placeholder="�ظ�����" value="${ param.reply_content }"/>
						    
						    	<input type='text' class="input-small" name="complain_user_id" placeholder="Ͷ����id" value="${ param.complain_user_id }"/>
						    
						    	<input type='text' class="input-small" name="complain_user_name" placeholder="Ͷ�������" value="${ param.complain_user_name }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="char1" placeholder="��ע1" value="${ param.char1 }"/>
						    
						    	<input type='text' class="input-small" name="char2" placeholder="��ע2" value="${ param.char2 }"/>
						    
						    	<input type='text' class="input-small" name="reply_id" placeholder="�ظ���id" value="${ param.reply_id }"/>
						    
						    	<input type='text' class="input-small" name="reply_name" placeholder="�ظ������" value="${ param.reply_name }"/>

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
								<!-- ������{Ͷ����id}-->   
								<th align="center" rowName="from_user_id" orderName="from_user_id:DESC" title='Ͷ����id'>Ͷ����id</th>
								<!-- ������{����id}-->   
								<th align="center" rowName="order_id" orderName="order_id:DESC" title='����id'>����id</th>
								<!-- ������{Ͷ��id}-->   
								<th align="center" rowName="order_complain_id" orderName="order_complain_id:DESC" title='Ͷ��id'>Ͷ��id</th>
								<!-- ������{�ظ�����}-->   
								<th align="center" rowName="reply_content" orderName="reply_content:DESC" title='�ظ�����'>�ظ�����</th>
								<!-- ������{Ͷ����id}-->   
								<th align="center" rowName="complain_user_id" orderName="complain_user_id:DESC" title='Ͷ����id'>Ͷ����id</th>
								<!-- ������{Ͷ�������}-->   
								<th align="center" rowName="complain_user_name" orderName="complain_user_name:DESC" title='Ͷ�������'>Ͷ�������</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{��ע1}-->   
								<th align="center" rowName="char1" orderName="char1:DESC" title='��ע1'>��ע1</th>
								<!-- ������{��ע2}-->   
								<th align="center" rowName="char2" orderName="char2:DESC" title='��ע2'>��ע2</th>
								<!-- ������{�ظ���id}-->   
								<th align="center" rowName="reply_id" orderName="reply_id:DESC" title='�ظ���id'>�ظ���id</th>
								<!-- ������{�ظ������}-->   
								<th align="center" rowName="reply_name" orderName="reply_name:DESC" title='�ظ������'>�ظ������</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							OrderComplainReply view = new OrderComplainReply();
								for (int i = 0; i < list.size(); i++) {
									view = (OrderComplainReply) list.get(i);
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
											<!-- ������{Ͷ����id}-->   
											<td><%=view.getFromUserId()%></td>
											<!-- ������{����id}-->   
											<td><%=view.getOrderId()%></td>
											<!-- ������{Ͷ��id}-->   
											<td><%=view.getOrderComplainId()%></td>
											<!-- ������{�ظ�����}-->   
											<td><%=view.getReplyContent()%></td>
											<!-- ������{Ͷ����id}-->   
											<td><%=view.getComplainUserId()%></td>
											<!-- ������{Ͷ�������}-->   
											<td><%=view.getComplainUserName()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{��ע1}-->   
											<td><%=view.getChar1()%></td>
											<!-- ������{��ע2}-->   
											<td><%=view.getChar2()%></td>
											<!-- ������{�ظ���id}-->   
											<td><%=view.getReplyId()%></td>
											<!-- ������{�ظ������}-->   
											<td><%=view.getReplyName()%></td>

											<td>
												<a class="o-edit" href="OrderComplainReply.mc?method=editOrderComplainReply&id,fromUserId,orderId,orderComplainId,replyContent,complainUserId,complainUserName,createTime,optTime,remark,char1,char2,replyId,replyName=<%= view.getId() +":"+  view.getFromUserId() +":"+  view.getOrderId() +":"+  view.getOrderComplainId() +":"+  view.getReplyContent() +":"+  view.getComplainUserId() +":"+  view.getComplainUserName() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() +":"+  view.getReplyId() +":"+  view.getReplyName() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteOrderComplainReply('<%= view.getId() +":"+  view.getFromUserId() +":"+  view.getOrderId() +":"+  view.getOrderComplainId() +":"+  view.getReplyContent() +":"+  view.getComplainUserId() +":"+  view.getComplainUserName() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() +":"+  view.getReplyId() +":"+  view.getReplyName() %>')" title="ɾ��"></a>
											    <a class="o-view" href="OrderComplainReply.mc?method=detailOrderComplainReply&id,fromUserId,orderId,orderComplainId,replyContent,complainUserId,complainUserName,createTime,optTime,remark,char1,char2,replyId,replyName=<%= view.getId() +":"+  view.getFromUserId() +":"+  view.getOrderId() +":"+  view.getOrderComplainId() +":"+  view.getReplyContent() +":"+  view.getComplainUserId() +":"+  view.getComplainUserName() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() +":"+  view.getReplyId() +":"+  view.getReplyName() %>" title="����"></a> 
												
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
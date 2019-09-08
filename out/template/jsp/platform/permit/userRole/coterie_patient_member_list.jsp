<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CoteriePatientMember" %>
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
		function deleteCoteriePatientMember(PK) {
			jQuery.ajax({
				url : "CoteriePatientMember.mc?method=deleteCoteriePatientMember",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CoteriePatientMember.mc?method=getAllPageCoteriePatientMember" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/coterie_patient_member_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="member_id" placeholder="��Աid" value="${ param.member_id }"/>
						    
						    	<input type='text' class="input-small" name="member_status" placeholder="1.������  2.�ɹ�   3.�ܾ�   4. ��ɢ 5 �˳� 6 �߳�" value="${ param.member_status }"/>
						    
						    	<input type='text' class="input-small" name="member_type" placeholder="1.����Ա  2.��Ա" value="${ param.member_type }"/>
						    
						    	<input type='text' class="input-small" name="coterie_id" placeholder="Ȧ��id" value="${ param.coterie_id }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="char1" placeholder="��ע1" value="${ param.char1 }"/>
						    
						    	<input type='text' class="input-small" name="channel_type" placeholder="�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp" value="${ param.channel_type }"/>
						    
						    	<input type='text' class="input-small" name="post_count" placeholder="������" value="${ param.post_count }"/>
						    
						    	<input type='text' class="input-small" name="like_count" placeholder="������" value="${ param.like_count }"/>
						    
						    	<input type='text' class="input-small" name="forward_count" placeholder="ת����" value="${ param.forward_count }"/>

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
								<!-- ������{��Աid}-->   
								<th align="center" rowName="member_id" orderName="member_id:DESC" title='��Աid'>��Աid</th>
								<!-- ������{1.������  2.�ɹ�   3.�ܾ�   4. ��ɢ 5 �˳� 6 �߳�}-->   
								<th align="center" rowName="member_status" orderName="member_status:DESC" title='1.������  2.�ɹ�   3.�ܾ�   4. ��ɢ 5 �˳� 6 �߳�'>1.������  2.�ɹ�   3.�ܾ�   4. ��ɢ 5 �˳� 6 �߳�</th>
								<!-- ������{1.����Ա  2.��Ա}-->   
								<th align="center" rowName="member_type" orderName="member_type:DESC" title='1.����Ա  2.��Ա'>1.����Ա  2.��Ա</th>
								<!-- ������{Ȧ��id}-->   
								<th align="center" rowName="coterie_id" orderName="coterie_id:DESC" title='Ȧ��id'>Ȧ��id</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{��ע1}-->   
								<th align="center" rowName="char1" orderName="char1:DESC" title='��ע1'>��ע1</th>
								<!-- ������{�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp}-->   
								<th align="center" rowName="channel_type" orderName="channel_type:DESC" title='�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp'>�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp</th>
								<!-- ������{������}-->   
								<th align="center" rowName="post_count" orderName="post_count:DESC" title='������'>������</th>
								<!-- ������{������}-->   
								<th align="center" rowName="like_count" orderName="like_count:DESC" title='������'>������</th>
								<!-- ������{ת����}-->   
								<th align="center" rowName="forward_count" orderName="forward_count:DESC" title='ת����'>ת����</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							CoteriePatientMember view = new CoteriePatientMember();
								for (int i = 0; i < list.size(); i++) {
									view = (CoteriePatientMember) list.get(i);
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
											<!-- ������{��Աid}-->   
											<td><%=view.getMemberId()%></td>
											<!-- ������{1.������  2.�ɹ�   3.�ܾ�   4. ��ɢ 5 �˳� 6 �߳�}-->   
											<td><%=view.getMemberStatus()%></td>
											<!-- ������{1.����Ա  2.��Ա}-->   
											<td><%=view.getMemberType()%></td>
											<!-- ������{Ȧ��id}-->   
											<td><%=view.getCoterieId()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{��ע1}-->   
											<td><%=view.getChar1()%></td>
											<!-- ������{�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp}-->   
											<td><%=view.getChannelType()%></td>
											<!-- ������{������}-->   
											<td><%=view.getPostCount()%></td>
											<!-- ������{������}-->   
											<td><%=view.getLikeCount()%></td>
											<!-- ������{ת����}-->   
											<td><%=view.getForwardCount()%></td>

											<td>
												<a class="o-edit" href="CoteriePatientMember.mc?method=editCoteriePatientMember&id,memberId,memberStatus,memberType,coterieId,createTime,optTime,remark,char1,channelType,postCount,likeCount,forwardCount=<%= view.getId() +":"+  view.getMemberId() +":"+  view.getMemberStatus() +":"+  view.getMemberType() +":"+  view.getCoterieId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChannelType() +":"+  view.getPostCount() +":"+  view.getLikeCount() +":"+  view.getForwardCount() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCoteriePatientMember('<%= view.getId() +":"+  view.getMemberId() +":"+  view.getMemberStatus() +":"+  view.getMemberType() +":"+  view.getCoterieId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChannelType() +":"+  view.getPostCount() +":"+  view.getLikeCount() +":"+  view.getForwardCount() %>')" title="ɾ��"></a>
											    <a class="o-view" href="CoteriePatientMember.mc?method=detailCoteriePatientMember&id,memberId,memberStatus,memberType,coterieId,createTime,optTime,remark,char1,channelType,postCount,likeCount,forwardCount=<%= view.getId() +":"+  view.getMemberId() +":"+  view.getMemberStatus() +":"+  view.getMemberType() +":"+  view.getCoterieId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChannelType() +":"+  view.getPostCount() +":"+  view.getLikeCount() +":"+  view.getForwardCount() %>" title="����"></a> 
												
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
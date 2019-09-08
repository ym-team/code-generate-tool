<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CoteriePatient" %>
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
		function deleteCoteriePatient(PK) {
			jQuery.ajax({
				url : "CoteriePatient.mc?method=deleteCoteriePatient",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CoteriePatient.mc?method=getAllPageCoteriePatient" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/coterie_patient_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="name" placeholder="Ȧ�����  ϵͳȦ��ο�deptname" value="${ param.name }"/>
						    
						    	<input type='text' class="input-small" name="coterie_desc" placeholder="Ȧ�ӽ���" value="${ param.coterie_desc }"/>
						    
						    	<input type='text' class="input-small" name="pic_url" placeholder="Ȧ��ͼ ���6��ͼ ��|�ָ�" value="${ param.pic_url }"/>
						    
						    	<input type='text' class="input-small" name="coterie_type" placeholder="1 ��Ȧ 2 ˽Ȧ" value="${ param.coterie_type }"/>
						    
						    	<input type='text' class="input-small" name="coterie_service_type" placeholder="Ȧ��ҵ������ ��δ���� Ĭ��Ϊ0" value="${ param.coterie_service_type }"/>
						    
						    	<input type='text' class="input-small" name="coterie_status" placeholder="1 �����   2 �ɹ�   3 �ܾ�   4. ��ɢ" value="${ param.coterie_status }"/>
						    
						    	<input type='text' class="input-small" name="create_user_id" placeholder="������id" value="${ param.create_user_id }"/>
						    
						    	<input type='text' class="input-small" name="channel_type" placeholder="�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp" value="${ param.channel_type }"/>
						    
						    	<input type='text' class="input-small" name="member_count" placeholder="��Ա��" value="${ param.member_count }"/>
						    
						    	<input type='text' class="input-small" name="post_count" placeholder="������" value="${ param.post_count }"/>
						    
						    	<input type='text' class="input-small" name="sub_system_type" placeholder="ϵͳȦ Ϊ deptId    �Խ�ȦΪ 0" value="${ param.sub_system_type }"/>
						    
						    	<input type='text' class="input-small" name="system_type" placeholder="1 ϵͳĬ��Ȧ  2 �Խ�Ȧ" value="${ param.system_type }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="char1" placeholder="��ע1" value="${ param.char1 }"/>
						    
						    	<input type='text' class="input-small" name="face_url" placeholder="ͷ��" value="${ param.face_url }"/>

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
								<!-- ������{Ȧ�����  ϵͳȦ��ο�deptname}-->   
								<th align="center" rowName="name" orderName="name:DESC" title='Ȧ�����  ϵͳȦ��ο�deptname'>Ȧ�����  ϵͳȦ��ο�deptname</th>
								<!-- ������{Ȧ�ӽ���}-->   
								<th align="center" rowName="coterie_desc" orderName="coterie_desc:DESC" title='Ȧ�ӽ���'>Ȧ�ӽ���</th>
								<!-- ������{Ȧ��ͼ ���6��ͼ ��|�ָ�}-->   
								<th align="center" rowName="pic_url" orderName="pic_url:DESC" title='Ȧ��ͼ ���6��ͼ ��|�ָ�'>Ȧ��ͼ ���6��ͼ ��|�ָ�</th>
								<!-- ������{1 ��Ȧ 2 ˽Ȧ}-->   
								<th align="center" rowName="coterie_type" orderName="coterie_type:DESC" title='1 ��Ȧ 2 ˽Ȧ'>1 ��Ȧ 2 ˽Ȧ</th>
								<!-- ������{Ȧ��ҵ������ ��δ���� Ĭ��Ϊ0}-->   
								<th align="center" rowName="coterie_service_type" orderName="coterie_service_type:DESC" title='Ȧ��ҵ������ ��δ���� Ĭ��Ϊ0'>Ȧ��ҵ������ ��δ���� Ĭ��Ϊ0</th>
								<!-- ������{1 �����   2 �ɹ�   3 �ܾ�   4. ��ɢ}-->   
								<th align="center" rowName="coterie_status" orderName="coterie_status:DESC" title='1 �����   2 �ɹ�   3 �ܾ�   4. ��ɢ'>1 �����   2 �ɹ�   3 �ܾ�   4. ��ɢ</th>
								<!-- ������{������id}-->   
								<th align="center" rowName="create_user_id" orderName="create_user_id:DESC" title='������id'>������id</th>
								<!-- ������{�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp}-->   
								<th align="center" rowName="channel_type" orderName="channel_type:DESC" title='�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp'>�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp</th>
								<!-- ������{��Ա��}-->   
								<th align="center" rowName="member_count" orderName="member_count:DESC" title='��Ա��'>��Ա��</th>
								<!-- ������{������}-->   
								<th align="center" rowName="post_count" orderName="post_count:DESC" title='������'>������</th>
								<!-- ������{ϵͳȦ Ϊ deptId    �Խ�ȦΪ 0}-->   
								<th align="center" rowName="sub_system_type" orderName="sub_system_type:DESC" title='ϵͳȦ Ϊ deptId    �Խ�ȦΪ 0'>ϵͳȦ Ϊ deptId    �Խ�ȦΪ 0</th>
								<!-- ������{1 ϵͳĬ��Ȧ  2 �Խ�Ȧ}-->   
								<th align="center" rowName="system_type" orderName="system_type:DESC" title='1 ϵͳĬ��Ȧ  2 �Խ�Ȧ'>1 ϵͳĬ��Ȧ  2 �Խ�Ȧ</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{��ע1}-->   
								<th align="center" rowName="char1" orderName="char1:DESC" title='��ע1'>��ע1</th>
								<!-- ������{ͷ��}-->   
								<th align="center" rowName="face_url" orderName="face_url:DESC" title='ͷ��'>ͷ��</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							CoteriePatient view = new CoteriePatient();
								for (int i = 0; i < list.size(); i++) {
									view = (CoteriePatient) list.get(i);
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
											<!-- ������{Ȧ�����  ϵͳȦ��ο�deptname}-->   
											<td><%=view.getName()%></td>
											<!-- ������{Ȧ�ӽ���}-->   
											<td><%=view.getCoterieDesc()%></td>
											<!-- ������{Ȧ��ͼ ���6��ͼ ��|�ָ�}-->   
											<td><%=view.getPicUrl()%></td>
											<!-- ������{1 ��Ȧ 2 ˽Ȧ}-->   
											<td><%=view.getCoterieType()%></td>
											<!-- ������{Ȧ��ҵ������ ��δ���� Ĭ��Ϊ0}-->   
											<td><%=view.getCoterieServiceType()%></td>
											<!-- ������{1 �����   2 �ɹ�   3 �ܾ�   4. ��ɢ}-->   
											<td><%=view.getCoterieStatus()%></td>
											<!-- ������{������id}-->   
											<td><%=view.getCreateUserId()%></td>
											<!-- ������{�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp}-->   
											<td><%=view.getChannelType()%></td>
											<!-- ������{��Ա��}-->   
											<td><%=view.getMemberCount()%></td>
											<!-- ������{������}-->   
											<td><%=view.getPostCount()%></td>
											<!-- ������{ϵͳȦ Ϊ deptId    �Խ�ȦΪ 0}-->   
											<td><%=view.getSubSystemType()%></td>
											<!-- ������{1 ϵͳĬ��Ȧ  2 �Խ�Ȧ}-->   
											<td><%=view.getSystemType()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{��ע1}-->   
											<td><%=view.getChar1()%></td>
											<!-- ������{ͷ��}-->   
											<td><%=view.getFaceUrl()%></td>

											<td>
												<a class="o-edit" href="CoteriePatient.mc?method=editCoteriePatient&id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,char1,faceUrl=<%= view.getId() +":"+  view.getName() +":"+  view.getCoterieDesc() +":"+  view.getPicUrl() +":"+  view.getCoterieType() +":"+  view.getCoterieServiceType() +":"+  view.getCoterieStatus() +":"+  view.getCreateUserId() +":"+  view.getChannelType() +":"+  view.getMemberCount() +":"+  view.getPostCount() +":"+  view.getSubSystemType() +":"+  view.getSystemType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getFaceUrl() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCoteriePatient('<%= view.getId() +":"+  view.getName() +":"+  view.getCoterieDesc() +":"+  view.getPicUrl() +":"+  view.getCoterieType() +":"+  view.getCoterieServiceType() +":"+  view.getCoterieStatus() +":"+  view.getCreateUserId() +":"+  view.getChannelType() +":"+  view.getMemberCount() +":"+  view.getPostCount() +":"+  view.getSubSystemType() +":"+  view.getSystemType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getFaceUrl() %>')" title="ɾ��"></a>
											    <a class="o-view" href="CoteriePatient.mc?method=detailCoteriePatient&id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,char1,faceUrl=<%= view.getId() +":"+  view.getName() +":"+  view.getCoterieDesc() +":"+  view.getPicUrl() +":"+  view.getCoterieType() +":"+  view.getCoterieServiceType() +":"+  view.getCoterieStatus() +":"+  view.getCreateUserId() +":"+  view.getChannelType() +":"+  view.getMemberCount() +":"+  view.getPostCount() +":"+  view.getSubSystemType() +":"+  view.getSystemType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getFaceUrl() %>" title="����"></a> 
												
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
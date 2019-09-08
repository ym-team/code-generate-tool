<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.UserCmccAdviceComment" %>
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
		function deleteUserCmccAdviceComment(PK) {
			jQuery.ajax({
				url : "UserCmccAdviceComment.mc?method=deleteUserCmccAdviceComment",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/UserCmccAdviceComment.mc?method=getAllPageUserCmccAdviceComment" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/user_cmcc_advice_comment_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="advice_title" placeholder="��ѯ������" value="${ param.advice_title }"/>
						    
						    	<input type='text' class="input-small" name="advice_id" placeholder="��ѯ��id" value="${ param.advice_id }"/>
						    
						    	<input type='text' class="input-small" name="patient_id" placeholder="�û�id" value="${ param.patient_id }"/>
						    
						    	<input type='text' class="input-small" name="doctor_id" placeholder="ҽ��id" value="${ param.doctor_id }"/>
						    
						    	<input type='text' class="input-small" name="create_user_id" placeholder="������id" value="${ param.create_user_id }"/>
						    
						    	<input type='text' class="input-small" name="from_user_id" placeholder="������id" value="${ param.from_user_id }"/>
						    
						    	<input type='text' class="input-small" name="to_user_id" placeholder="��������id" value="${ param.to_user_id }"/>
						    
						    	<input type='text' class="input-small" name="comment_title" placeholder="���۱���" value="${ param.comment_title }"/>
						    
						    	<input type='text' class="input-small" name="comment_text" placeholder="��������" value="${ param.comment_text }"/>
						    
						    	<input type='text' class="input-small" name="chnanel_type" placeholder="APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�" value="${ param.chnanel_type }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="char1" placeholder="��ע1" value="${ param.char1 }"/>
						    
						    	<input type='text' class="input-small" name="char2" placeholder="��ע2" value="${ param.char2 }"/>
						    
						    	<input type='text' class="input-small" name="comment_cmcc_id" placeholder="cmcc��Ŀ������id" value="${ param.comment_cmcc_id }"/>

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
								<!-- ������{��ѯ������}-->   
								<th align="center" rowName="advice_title" orderName="advice_title:DESC" title='��ѯ������'>��ѯ������</th>
								<!-- ������{��ѯ��id}-->   
								<th align="center" rowName="advice_id" orderName="advice_id:DESC" title='��ѯ��id'>��ѯ��id</th>
								<!-- ������{�û�id}-->   
								<th align="center" rowName="patient_id" orderName="patient_id:DESC" title='�û�id'>�û�id</th>
								<!-- ������{ҽ��id}-->   
								<th align="center" rowName="doctor_id" orderName="doctor_id:DESC" title='ҽ��id'>ҽ��id</th>
								<!-- ������{������id}-->   
								<th align="center" rowName="create_user_id" orderName="create_user_id:DESC" title='������id'>������id</th>
								<!-- ������{������id}-->   
								<th align="center" rowName="from_user_id" orderName="from_user_id:DESC" title='������id'>������id</th>
								<!-- ������{��������id}-->   
								<th align="center" rowName="to_user_id" orderName="to_user_id:DESC" title='��������id'>��������id</th>
								<!-- ������{���۱���}-->   
								<th align="center" rowName="comment_title" orderName="comment_title:DESC" title='���۱���'>���۱���</th>
								<!-- ������{��������}-->   
								<th align="center" rowName="comment_text" orderName="comment_text:DESC" title='��������'>��������</th>
								<!-- ������{APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�}-->   
								<th align="center" rowName="chnanel_type" orderName="chnanel_type:DESC" title='APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�'>APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�</th>
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
								<!-- ������{cmcc��Ŀ������id}-->   
								<th align="center" rowName="comment_cmcc_id" orderName="comment_cmcc_id:DESC" title='cmcc��Ŀ������id'>cmcc��Ŀ������id</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							UserCmccAdviceComment view = new UserCmccAdviceComment();
								for (int i = 0; i < list.size(); i++) {
									view = (UserCmccAdviceComment) list.get(i);
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
											<!-- ������{��ѯ������}-->   
											<td><%=view.getAdviceTitle()%></td>
											<!-- ������{��ѯ��id}-->   
											<td><%=view.getAdviceId()%></td>
											<!-- ������{�û�id}-->   
											<td><%=view.getPatientId()%></td>
											<!-- ������{ҽ��id}-->   
											<td><%=view.getDoctorId()%></td>
											<!-- ������{������id}-->   
											<td><%=view.getCreateUserId()%></td>
											<!-- ������{������id}-->   
											<td><%=view.getFromUserId()%></td>
											<!-- ������{��������id}-->   
											<td><%=view.getToUserId()%></td>
											<!-- ������{���۱���}-->   
											<td><%=view.getCommentTitle()%></td>
											<!-- ������{��������}-->   
											<td><%=view.getCommentText()%></td>
											<!-- ������{APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�}-->   
											<td><%=view.getChnanelType()%></td>
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
											<!-- ������{cmcc��Ŀ������id}-->   
											<td><%=view.getCommentCmccId()%></td>

											<td>
												<a class="o-edit" href="UserCmccAdviceComment.mc?method=editUserCmccAdviceComment&id,adviceTitle,adviceId,patientId,doctorId,createUserId,fromUserId,toUserId,commentTitle,commentText,chnanelType,createTime,optTime,remark,char1,char2,commentCmccId=<%= view.getId() +":"+  view.getAdviceTitle() +":"+  view.getAdviceId() +":"+  view.getPatientId() +":"+  view.getDoctorId() +":"+  view.getCreateUserId() +":"+  view.getFromUserId() +":"+  view.getToUserId() +":"+  view.getCommentTitle() +":"+  view.getCommentText() +":"+  view.getChnanelType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() +":"+  view.getCommentCmccId() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteUserCmccAdviceComment('<%= view.getId() +":"+  view.getAdviceTitle() +":"+  view.getAdviceId() +":"+  view.getPatientId() +":"+  view.getDoctorId() +":"+  view.getCreateUserId() +":"+  view.getFromUserId() +":"+  view.getToUserId() +":"+  view.getCommentTitle() +":"+  view.getCommentText() +":"+  view.getChnanelType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() +":"+  view.getCommentCmccId() %>')" title="ɾ��"></a>
											    <a class="o-view" href="UserCmccAdviceComment.mc?method=detailUserCmccAdviceComment&id,adviceTitle,adviceId,patientId,doctorId,createUserId,fromUserId,toUserId,commentTitle,commentText,chnanelType,createTime,optTime,remark,char1,char2,commentCmccId=<%= view.getId() +":"+  view.getAdviceTitle() +":"+  view.getAdviceId() +":"+  view.getPatientId() +":"+  view.getDoctorId() +":"+  view.getCreateUserId() +":"+  view.getFromUserId() +":"+  view.getToUserId() +":"+  view.getCommentTitle() +":"+  view.getCommentText() +":"+  view.getChnanelType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() +":"+  view.getCommentCmccId() %>" title="����"></a> 
												
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
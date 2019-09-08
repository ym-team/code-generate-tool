<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmUserDoctorWorkInfo" %>
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
		function deleteCmUserDoctorWorkInfo(PK) {
			jQuery.ajax({
				url : "CmUserDoctorWorkInfo.mc?method=deleteCmUserDoctorWorkInfo",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CmUserDoctorWorkInfo.mc?method=getAllPageCmUserDoctorWorkInfo" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_user_doctor_work_info_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="����" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="user_seq_id" placeholder="�û�ID" value="${ param.user_seq_id }"/>
						    
						    	<input type='text' class="input-small" name="user_brife_desc" placeholder="���˼��" value="${ param.user_brife_desc }"/>
						    
						    	<input type='text' class="input-small" name="user_honor_desc" placeholder="��������" value="${ param.user_honor_desc }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="0:  ��Ч 1:  ��Ч" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="create_date" placeholder="����ʱ��" value="${ param.create_date }"/>
						    
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
								<!-- ������{����}-->   
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='����'>����</th>
								<!-- ������{�û�ID}-->   
								<th align="center" rowName="user_seq_id" orderName="user_seq_id:DESC" title='�û�ID'>�û�ID</th>
								<!-- ������{���˼��}-->   
								<th align="center" rowName="user_brife_desc" orderName="user_brife_desc:DESC" title='���˼��'>���˼��</th>
								<!-- ������{��������}-->   
								<th align="center" rowName="user_honor_desc" orderName="user_honor_desc:DESC" title='��������'>��������</th>
								<!-- ������{0:  ��Ч 1:  ��Ч}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='0:  ��Ч 1:  ��Ч'>0:  ��Ч 1:  ��Ч</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_date" orderName="create_date:DESC" title='����ʱ��'>����ʱ��</th>
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
							CmUserDoctorWorkInfo view = new CmUserDoctorWorkInfo();
								for (int i = 0; i < list.size(); i++) {
									view = (CmUserDoctorWorkInfo) list.get(i);
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
											<td><%=view.getPkId()%></td>
											<!-- ������{�û�ID}-->   
											<td><%=view.getUserSeqId()%></td>
											<!-- ������{���˼��}-->   
											<td><%=view.getUserBrifeDesc()%></td>
											<!-- ������{��������}-->   
											<td><%=view.getUserHonorDesc()%></td>
											<!-- ������{0:  ��Ч 1:  ��Ч}-->   
											<td><%=view.getStatus()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateDate()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOpTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="CmUserDoctorWorkInfo.mc?method=editCmUserDoctorWorkInfo&pkId,userSeqId,userBrifeDesc,userHonorDesc,status,createDate,opTime,remark=<%= view.getPkId() +":"+  view.getUserSeqId() +":"+  view.getUserBrifeDesc() +":"+  view.getUserHonorDesc() +":"+  view.getStatus() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getRemark() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCmUserDoctorWorkInfo('<%= view.getPkId() +":"+  view.getUserSeqId() +":"+  view.getUserBrifeDesc() +":"+  view.getUserHonorDesc() +":"+  view.getStatus() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getRemark() %>')" title="ɾ��"></a>
											    <a class="o-view" href="CmUserDoctorWorkInfo.mc?method=detailCmUserDoctorWorkInfo&pkId,userSeqId,userBrifeDesc,userHonorDesc,status,createDate,opTime,remark=<%= view.getPkId() +":"+  view.getUserSeqId() +":"+  view.getUserBrifeDesc() +":"+  view.getUserHonorDesc() +":"+  view.getStatus() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getRemark() %>" title="����"></a> 
												
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
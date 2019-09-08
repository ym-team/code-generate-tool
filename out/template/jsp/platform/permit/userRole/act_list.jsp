<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.act.data.Act" %>
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
		function deleteAct(PK) {
			jQuery.ajax({
				url : "Act.mc?method=deleteAct",
				type : "post",
				data : {PK:PK},
				success : function(result) {
					if (result > 0) {
						alert("ɾ���ɹ�");
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/Act.mc?method=getAllPageAct" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/act_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="title" placeholder="�����" value="${ param.title }"/>
						    
						    	<input type='text' class="input-small" name="act_starttime" placeholder="����ʱ��" value="${ param.act_starttime }"/>
						    
						    	<input type='text' class="input-small" name="act_endtime" placeholder="����ʱ��" value="${ param.act_endtime }"/>
						    
						    	<input type='text' class="input-small" name="act_address" placeholder="���ַ" value="${ param.act_address }"/>
						    
						    	<input type='text' class="input-small" name="act_desc" placeholder="����" value="${ param.act_desc }"/>
						    
						    	<input type='text' class="input-small" name="act_type" placeholder="0 ��� 1 �շ� Ĭ��Ϊ0" value="${ param.act_type }"/>
						    
						    	<input type='text' class="input-small" name="act_money" placeholder="�����" value="${ param.act_money }"/>
						    
						    	<input type='text' class="input-small" name="act_pic_url" placeholder="�����ͼ" value="${ param.act_pic_url }"/>
						    
						    	<input type='text' class="input-small" name="act_create_user_id" placeholder="������id" value="${ param.act_create_user_id }"/>
						    
						    	<input type='text' class="input-small" name="act_status" placeholder="�״̬ 1 ����� 2 �ɹ� 3 �ܾ� 4 ����" value="${ param.act_status }"/>
						    
						    	<input type='text' class="input-small" name="act_member_count" placeholder="��Ա�� Ĭ��Ϊ1" value="${ param.act_member_count }"/>
						    
						    	<input type='text' class="input-small" name="act_like_count" placeholder="������ Ĭ��Ϊ0" value="${ param.act_like_count }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="char2" placeholder="��ע1" value="${ param.char2 }"/>

								<button type="button" onclick="javascript:searchData();" id="searchbtn"  class="btn btn-group-vertical">����</button>
							</div>
								
							</td>
						</tr>
						
					</table>
			</div>
			<!-- ��ѯ������ʾ����end --> 
			<!-- ������ʾ�б�start -->
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
								<!-- ������{�����}-->   
								<th align="center" rowName="title" orderName="title:DESC" title='�����'>�����</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="act_starttime" orderName="act_starttime:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="act_endtime" orderName="act_endtime:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{���ַ}-->   
								<th align="center" rowName="act_address" orderName="act_address:DESC" title='���ַ'>���ַ</th>
								<!-- ������{����}-->   
								<th align="center" rowName="act_desc" orderName="act_desc:DESC" title='����'>����</th>
								<!-- ������{0 ��� 1 �շ� Ĭ��Ϊ0}-->   
								<th align="center" rowName="act_type" orderName="act_type:DESC" title='0 ��� 1 �շ� Ĭ��Ϊ0'>0 ��� 1 �շ� Ĭ��Ϊ0</th>
								<!-- ������{�����}-->   
								<th align="center" rowName="act_money" orderName="act_money:DESC" title='�����'>�����</th>
								<!-- ������{�����ͼ}-->   
								<th align="center" rowName="act_pic_url" orderName="act_pic_url:DESC" title='�����ͼ'>�����ͼ</th>
								<!-- ������{������id}-->   
								<th align="center" rowName="act_create_user_id" orderName="act_create_user_id:DESC" title='������id'>������id</th>
								<!-- ������{�״̬ 1 ����� 2 �ɹ� 3 �ܾ� 4 ����}-->   
								<th align="center" rowName="act_status" orderName="act_status:DESC" title='�״̬ 1 ����� 2 �ɹ� 3 �ܾ� 4 ����'>�״̬ 1 ����� 2 �ɹ� 3 �ܾ� 4 ����</th>
								<!-- ������{��Ա�� Ĭ��Ϊ1}-->   
								<th align="center" rowName="act_member_count" orderName="act_member_count:DESC" title='��Ա�� Ĭ��Ϊ1'>��Ա�� Ĭ��Ϊ1</th>
								<!-- ������{������ Ĭ��Ϊ0}-->   
								<th align="center" rowName="act_like_count" orderName="act_like_count:DESC" title='������ Ĭ��Ϊ0'>������ Ĭ��Ϊ0</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{��ע1}-->   
								<th align="center" rowName="char2" orderName="char2:DESC" title='��ע1'>��ע1</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							Act view = new Act();
								for (int i = 0; i < list.size(); i++) {
									view = (Act) list.get(i);
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
											<!-- ������{�����}-->   
											<td><%=view.getTitle()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getActStarttime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getActEndtime()%></td>
											<!-- ������{���ַ}-->   
											<td><%=view.getActAddress()%></td>
											<!-- ������{����}-->   
											<td><%=view.getActDesc()%></td>
											<!-- ������{0 ��� 1 �շ� Ĭ��Ϊ0}-->   
											<td><%=view.getActType()%></td>
											<!-- ������{�����}-->   
											<td><%=view.getActMoney()%></td>
											<!-- ������{�����ͼ}-->   
											<td><%=view.getActPicUrl()%></td>
											<!-- ������{������id}-->   
											<td><%=view.getActCreateUserId()%></td>
											<!-- ������{�״̬ 1 ����� 2 �ɹ� 3 �ܾ� 4 ����}-->   
											<td><%=view.getActStatus()%></td>
											<!-- ������{��Ա�� Ĭ��Ϊ1}-->   
											<td><%=view.getActMemberCount()%></td>
											<!-- ������{������ Ĭ��Ϊ0}-->   
											<td><%=view.getActLikeCount()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{��ע1}-->   
											<td><%=view.getChar2()%></td>

											<td>
												<a class="o-edit" href="Act.mc?method=editAct&id,title,actStarttime,actEndtime,actAddress,actDesc,actType,actMoney,actPicUrl,actCreateUserId,actStatus,actMemberCount,actLikeCount,createTime,optTime,remark,char2=<%= view.getId() +":"+  view.getTitle() +":"+  view.getActStarttime() +":"+  view.getActEndtime() +":"+  view.getActAddress() +":"+  view.getActDesc() +":"+  view.getActType() +":"+  view.getActMoney() +":"+  view.getActPicUrl() +":"+  view.getActCreateUserId() +":"+  view.getActStatus() +":"+  view.getActMemberCount() +":"+  view.getActLikeCount() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar2() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteAct('<%= view.getId() +":"+  view.getTitle() +":"+  view.getActStarttime() +":"+  view.getActEndtime() +":"+  view.getActAddress() +":"+  view.getActDesc() +":"+  view.getActType() +":"+  view.getActMoney() +":"+  view.getActPicUrl() +":"+  view.getActCreateUserId() +":"+  view.getActStatus() +":"+  view.getActMemberCount() +":"+  view.getActLikeCount() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar2() %>')" title="ɾ��"></a>
											    <a class="o-view" href="Act.mc?method=detailAct&id,title,actStarttime,actEndtime,actAddress,actDesc,actType,actMoney,actPicUrl,actCreateUserId,actStatus,actMemberCount,actLikeCount,createTime,optTime,remark,char2=<%= view.getId() +":"+  view.getTitle() +":"+  view.getActStarttime() +":"+  view.getActEndtime() +":"+  view.getActAddress() +":"+  view.getActDesc() +":"+  view.getActType() +":"+  view.getActMoney() +":"+  view.getActPicUrl() +":"+  view.getActCreateUserId() +":"+  view.getActStatus() +":"+  view.getActMemberCount() +":"+  view.getActLikeCount() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar2() %>" title="����"></a> 
												
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
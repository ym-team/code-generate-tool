<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmCoterieBase" %>
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
		function deleteCmCoterieBase(PK) {
			jQuery.ajax({
				url : "CmCoterieBase.mc?method=deleteCmCoterieBase",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CmCoterieBase.mc?method=getAllPageCmCoterieBase" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_coterie_base_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="coterie_id" placeholder="Ȧ��ID" value="${ param.coterie_id }"/>
						    
						    	<input type='text' class="input-small" name="is_open" placeholder="1:����, 2��������" value="${ param.is_open }"/>
						    
						    	<input type='text' class="input-small" name="coterie_desc" placeholder="Ȧ������" value="${ param.coterie_desc }"/>
						    
						    	<input type='text' class="input-small" name="user_seq_id" placeholder="�û�ID" value="${ param.user_seq_id }"/>
						    
						    	<input type='text' class="input-small" name="coterie_name" placeholder="Ȧ�����, �����ظ�" value="${ param.coterie_name }"/>
						    
						    	<input type='text' class="input-small" name="coterie_type" placeholder="Ȧ������, 1:���� 2:��/��֯" value="${ param.coterie_type }"/>
						    
						    	<input type='text' class="input-small" name="coterie_face_url" placeholder="Ȧ��ͷ���url��ַ" value="${ param.coterie_face_url }"/>
						    
						    	<input type='text' class="input-small" name="member_num" placeholder="Ȧ������" value="${ param.member_num }"/>
						    
						    	<input type='text' class="input-small" name="coterie_level" placeholder="Ȧ�ӵȼ�V�ĵȼ� 1:δ��֤(Ĭ��) 2����ͨ��  3: Ȧ�Ӽ�V (��V)" value="${ param.coterie_level }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="0:  ��Ч 1:  ��Ч" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="create_date" placeholder="���Ӵ���ʱ��" value="${ param.create_date }"/>
						    
						    	<input type='text' class="input-small" name="verify_time" placeholder="��֤ʱ��" value="${ param.verify_time }"/>
						    
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
								<!-- ������{Ȧ��ID}-->   
								<th align="center" rowName="coterie_id" orderName="coterie_id:DESC" title='Ȧ��ID'>Ȧ��ID</th>
								<!-- ������{1:����, 2��������}-->   
								<th align="center" rowName="is_open" orderName="is_open:DESC" title='1:����, 2��������'>1:����, 2��������</th>
								<!-- ������{Ȧ������}-->   
								<th align="center" rowName="coterie_desc" orderName="coterie_desc:DESC" title='Ȧ������'>Ȧ������</th>
								<!-- ������{�û�ID}-->   
								<th align="center" rowName="user_seq_id" orderName="user_seq_id:DESC" title='�û�ID'>�û�ID</th>
								<!-- ������{Ȧ�����, �����ظ�}-->   
								<th align="center" rowName="coterie_name" orderName="coterie_name:DESC" title='Ȧ�����, �����ظ�'>Ȧ�����, �����ظ�</th>
								<!-- ������{Ȧ������, 1:���� 2:��/��֯}-->   
								<th align="center" rowName="coterie_type" orderName="coterie_type:DESC" title='Ȧ������, 1:���� 2:��/��֯'>Ȧ������, 1:���� 2:��/��֯</th>
								<!-- ������{Ȧ��ͷ���url��ַ}-->   
								<th align="center" rowName="coterie_face_url" orderName="coterie_face_url:DESC" title='Ȧ��ͷ���url��ַ'>Ȧ��ͷ���url��ַ</th>
								<!-- ������{Ȧ������}-->   
								<th align="center" rowName="member_num" orderName="member_num:DESC" title='Ȧ������'>Ȧ������</th>
								<!-- ������{Ȧ�ӵȼ�V�ĵȼ� 1:δ��֤(Ĭ��) 2����ͨ��  3: Ȧ�Ӽ�V (��V)}-->   
								<th align="center" rowName="coterie_level" orderName="coterie_level:DESC" title='Ȧ�ӵȼ�V�ĵȼ� 1:δ��֤(Ĭ��) 2����ͨ��  3: Ȧ�Ӽ�V (��V)'>Ȧ�ӵȼ�V�ĵȼ� 1:δ��֤(Ĭ��) 2����ͨ��  3: Ȧ�Ӽ�V (��V)</th>
								<!-- ������{0:  ��Ч 1:  ��Ч}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='0:  ��Ч 1:  ��Ч'>0:  ��Ч 1:  ��Ч</th>
								<!-- ������{���Ӵ���ʱ��}-->   
								<th align="center" rowName="create_date" orderName="create_date:DESC" title='���Ӵ���ʱ��'>���Ӵ���ʱ��</th>
								<!-- ������{��֤ʱ��}-->   
								<th align="center" rowName="verify_time" orderName="verify_time:DESC" title='��֤ʱ��'>��֤ʱ��</th>
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
							CmCoterieBase view = new CmCoterieBase();
								for (int i = 0; i < list.size(); i++) {
									view = (CmCoterieBase) list.get(i);
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
					
											<!-- ������{Ȧ��ID}-->   
											<td><%=view.getCoterieId()%></td>
											<!-- ������{1:����, 2��������}-->   
											<td><%=view.getIsOpen()%></td>
											<!-- ������{Ȧ������}-->   
											<td><%=view.getCoterieDesc()%></td>
											<!-- ������{�û�ID}-->   
											<td><%=view.getUserSeqId()%></td>
											<!-- ������{Ȧ�����, �����ظ�}-->   
											<td><%=view.getCoterieName()%></td>
											<!-- ������{Ȧ������, 1:���� 2:��/��֯}-->   
											<td><%=view.getCoterieType()%></td>
											<!-- ������{Ȧ��ͷ���url��ַ}-->   
											<td><%=view.getCoterieFaceUrl()%></td>
											<!-- ������{Ȧ������}-->   
											<td><%=view.getMemberNum()%></td>
											<!-- ������{Ȧ�ӵȼ�V�ĵȼ� 1:δ��֤(Ĭ��) 2����ͨ��  3: Ȧ�Ӽ�V (��V)}-->   
											<td><%=view.getCoterieLevel()%></td>
											<!-- ������{0:  ��Ч 1:  ��Ч}-->   
											<td><%=view.getStatus()%></td>
											<!-- ������{���Ӵ���ʱ��}-->   
											<td><%=view.getCreateDate()%></td>
											<!-- ������{��֤ʱ��}-->   
											<td><%=view.getVerifyTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOpTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="CmCoterieBase.mc?method=editCmCoterieBase&coterieId,isOpen,coterieDesc,userSeqId,coterieName,coterieType,coterieFaceUrl,memberNum,coterieLevel,status,createDate,verifyTime,opTime,remark=<%= view.getCoterieId() +":"+  view.getIsOpen() +":"+  view.getCoterieDesc() +":"+  view.getUserSeqId() +":"+  view.getCoterieName() +":"+  view.getCoterieType() +":"+  view.getCoterieFaceUrl() +":"+  view.getMemberNum() +":"+  view.getCoterieLevel() +":"+  view.getStatus() +":"+  view.getCreateDate() +":"+  view.getVerifyTime() +":"+  view.getOpTime() +":"+  view.getRemark() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCmCoterieBase('<%= view.getCoterieId() +":"+  view.getIsOpen() +":"+  view.getCoterieDesc() +":"+  view.getUserSeqId() +":"+  view.getCoterieName() +":"+  view.getCoterieType() +":"+  view.getCoterieFaceUrl() +":"+  view.getMemberNum() +":"+  view.getCoterieLevel() +":"+  view.getStatus() +":"+  view.getCreateDate() +":"+  view.getVerifyTime() +":"+  view.getOpTime() +":"+  view.getRemark() %>')" title="ɾ��"></a>
											    <a class="o-view" href="CmCoterieBase.mc?method=detailCmCoterieBase&coterieId,isOpen,coterieDesc,userSeqId,coterieName,coterieType,coterieFaceUrl,memberNum,coterieLevel,status,createDate,verifyTime,opTime,remark=<%= view.getCoterieId() +":"+  view.getIsOpen() +":"+  view.getCoterieDesc() +":"+  view.getUserSeqId() +":"+  view.getCoterieName() +":"+  view.getCoterieType() +":"+  view.getCoterieFaceUrl() +":"+  view.getMemberNum() +":"+  view.getCoterieLevel() +":"+  view.getStatus() +":"+  view.getCreateDate() +":"+  view.getVerifyTime() +":"+  view.getOpTime() +":"+  view.getRemark() %>" title="����"></a> 
												
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
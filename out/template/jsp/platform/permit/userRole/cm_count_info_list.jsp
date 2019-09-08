<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmCountInfo" %>
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
		function deleteCmCountInfo(PK) {
			jQuery.ajax({
				url : "CmCountInfo.mc?method=deleteCmCountInfo",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CmCountInfo.mc?method=getAllPageCmCountInfo" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_count_info_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="user_seq_id" placeholder="" value="${ param.user_seq_id }"/>
						    
						    	<input type='text' class="input-small" name="user_password" placeholder="" value="${ param.user_password }"/>
						    
						    	<input type='text' class="input-small" name="phone_num" placeholder="" value="${ param.phone_num }"/>
						    
						    	<input type='text' class="input-small" name="email" placeholder="" value="${ param.email }"/>
						    
						    	<input type='text' class="input-small" name="user_create_time" placeholder="" value="${ param.user_create_time }"/>
						    
						    	<input type='text' class="input-small" name="reg_channel" placeholder="C �˻���¼������ D ����ҽ�� H ���ֽ����� S ����ҩ��" value="${ param.reg_channel }"/>
						    
						    	<input type='text' class="input-small" name="user_reg_type" placeholder="�û��ն˰汾             11: ҽ���             12: ���߰�" value="${ param.user_reg_type }"/>
						    
						    	<input type='text' class="input-small" name="weibo_id" placeholder="΢��ID" value="${ param.weibo_id }"/>
						    
						    	<input type='text' class="input-small" name="qq_id" placeholder="" value="${ param.qq_id }"/>
						    
						    	<input type='text' class="input-small" name="we_chat_id" placeholder="΢��ID" value="${ param.we_chat_id }"/>
						    
						    	<input type='text' class="input-small" name="op_time" placeholder="����ʱ��" value="${ param.op_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="recommend_user_id" placeholder="�������û�ID" value="${ param.recommend_user_id }"/>

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
								<th align="center" rowName="user_seq_id" orderName="user_seq_id:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="user_password" orderName="user_password:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="phone_num" orderName="phone_num:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="email" orderName="email:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="user_create_time" orderName="user_create_time:DESC" title=''></th>
								<!-- ������{C �˻���¼������ D ����ҽ�� H ���ֽ����� S ����ҩ��}-->   
								<th align="center" rowName="reg_channel" orderName="reg_channel:DESC" title='C �˻���¼������ D ����ҽ�� H ���ֽ����� S ����ҩ��'>C �˻���¼������ D ����ҽ�� H ���ֽ����� S ����ҩ��</th>
								<!-- ������{�û��ն˰汾             11: ҽ���             12: ���߰�}-->   
								<th align="center" rowName="user_reg_type" orderName="user_reg_type:DESC" title='�û��ն˰汾             11: ҽ���             12: ���߰�'>�û��ն˰汾             11: ҽ���             12: ���߰�</th>
								<!-- ������{΢��ID}-->   
								<th align="center" rowName="weibo_id" orderName="weibo_id:DESC" title='΢��ID'>΢��ID</th>
								<!-- ������{}-->   
								<th align="center" rowName="qq_id" orderName="qq_id:DESC" title=''></th>
								<!-- ������{΢��ID}-->   
								<th align="center" rowName="we_chat_id" orderName="we_chat_id:DESC" title='΢��ID'>΢��ID</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="op_time" orderName="op_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{�������û�ID}-->   
								<th align="center" rowName="recommend_user_id" orderName="recommend_user_id:DESC" title='�������û�ID'>�������û�ID</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							CmCountInfo view = new CmCountInfo();
								for (int i = 0; i < list.size(); i++) {
									view = (CmCountInfo) list.get(i);
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
											<td><%=view.getUserSeqId()%></td>
											<!-- ������{}-->   
											<td><%=view.getUserPassword()%></td>
											<!-- ������{}-->   
											<td><%=view.getPhoneNum()%></td>
											<!-- ������{}-->   
											<td><%=view.getEmail()%></td>
											<!-- ������{}-->   
											<td><%=view.getUserCreateTime()%></td>
											<!-- ������{C �˻���¼������ D ����ҽ�� H ���ֽ����� S ����ҩ��}-->   
											<td><%=view.getRegChannel()%></td>
											<!-- ������{�û��ն˰汾             11: ҽ���             12: ���߰�}-->   
											<td><%=view.getUserRegType()%></td>
											<!-- ������{΢��ID}-->   
											<td><%=view.getWeiboId()%></td>
											<!-- ������{}-->   
											<td><%=view.getQqId()%></td>
											<!-- ������{΢��ID}-->   
											<td><%=view.getWeChatId()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOpTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{�������û�ID}-->   
											<td><%=view.getRecommendUserId()%></td>

											<td>
												<a class="o-edit" href="CmCountInfo.mc?method=editCmCountInfo&userSeqId,userPassword,phoneNum,email,userCreateTime,regChannel,userRegType,weiboId,qqId,weChatId,opTime,remark,recommendUserId=<%= view.getUserSeqId() +":"+  view.getUserPassword() +":"+  view.getPhoneNum() +":"+  view.getEmail() +":"+  view.getUserCreateTime() +":"+  view.getRegChannel() +":"+  view.getUserRegType() +":"+  view.getWeiboId() +":"+  view.getQqId() +":"+  view.getWeChatId() +":"+  view.getOpTime() +":"+  view.getRemark() +":"+  view.getRecommendUserId() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCmCountInfo('<%= view.getUserSeqId() +":"+  view.getUserPassword() +":"+  view.getPhoneNum() +":"+  view.getEmail() +":"+  view.getUserCreateTime() +":"+  view.getRegChannel() +":"+  view.getUserRegType() +":"+  view.getWeiboId() +":"+  view.getQqId() +":"+  view.getWeChatId() +":"+  view.getOpTime() +":"+  view.getRemark() +":"+  view.getRecommendUserId() %>')" title="ɾ��"></a>
											    <a class="o-view" href="CmCountInfo.mc?method=detailCmCountInfo&userSeqId,userPassword,phoneNum,email,userCreateTime,regChannel,userRegType,weiboId,qqId,weChatId,opTime,remark,recommendUserId=<%= view.getUserSeqId() +":"+  view.getUserPassword() +":"+  view.getPhoneNum() +":"+  view.getEmail() +":"+  view.getUserCreateTime() +":"+  view.getRegChannel() +":"+  view.getUserRegType() +":"+  view.getWeiboId() +":"+  view.getQqId() +":"+  view.getWeChatId() +":"+  view.getOpTime() +":"+  view.getRemark() +":"+  view.getRecommendUserId() %>" title="����"></a> 
												
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
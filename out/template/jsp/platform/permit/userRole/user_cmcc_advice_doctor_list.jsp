<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.UserCmccAdviceDoctor" %>
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
		function deleteUserCmccAdviceDoctor(PK) {
			jQuery.ajax({
				url : "UserCmccAdviceDoctor.mc?method=deleteUserCmccAdviceDoctor",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/UserCmccAdviceDoctor.mc?method=getAllPageUserCmccAdviceDoctor" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/user_cmcc_advice_doctor_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="advice_title" placeholder="��ѯ������" value="${ param.advice_title }"/>
						    
						    	<input type='text' class="input-small" name="advice_id" placeholder="��ѯ��id" value="${ param.advice_id }"/>
						    
						    	<input type='text' class="input-small" name="disease_id" placeholder="֢״�򼲲�id" value="${ param.disease_id }"/>
						    
						    	<input type='text' class="input-small" name="advice_type" placeholder="ר�ҵ�����ͨ�� 1  2  " value="${ param.advice_type }"/>
						    
						    	<input type='text' class="input-small" name="patient_id" placeholder="�û�id" value="${ param.patient_id }"/>
						    
						    	<input type='text' class="input-small" name="doctor_id" placeholder="ҽ��id" value="${ param.doctor_id }"/>
						    
						    	<input type='text' class="input-small" name="combo_id" placeholder="�ײ�id" value="${ param.combo_id }"/>
						    
						    	<input type='text' class="input-small" name="moeney" placeholder="��ѯ���۸�" value="${ param.moeney }"/>
						    
						    	<input type='text' class="input-small" name="advice_status" placeholder="��ѯ��״̬ 1 ����ѯ 2 ������ 3 ��� 4 �ܾ�" value="${ param.advice_status }"/>
						    
						    	<input type='text' class="input-small" name="chnanel_type" placeholder="APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�" value="${ param.chnanel_type }"/>
						    
						    	<input type='text' class="input-small" name="pay_channel_type" placeholder="����֧������ 1 ΢�� 2 ֧���� 3����" value="${ param.pay_channel_type }"/>
						    
						    	<input type='text' class="input-small" name="is_open" placeholder="�Ƿ��ڴ���չ�� 1 �� 2����" value="${ param.is_open }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="expire_time" placeholder="����ʱ��" value="${ param.expire_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="char1" placeholder="��ע1" value="${ param.char1 }"/>
						    
						    	<input type='text' class="input-small" name="char2" placeholder="��ע2" value="${ param.char2 }"/>
						    
						    	<input type='text' class="input-small" name="advice_start_time" placeholder="��ѯ�����쿪ʼʱ��" value="${ param.advice_start_time }"/>
						    
						    	<input type='text' class="input-small" name="advice_valid_time" placeholder="��ѯ������ʱ��" value="${ param.advice_valid_time }"/>

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
								<!-- ������{֢״�򼲲�id}-->   
								<th align="center" rowName="disease_id" orderName="disease_id:DESC" title='֢״�򼲲�id'>֢״�򼲲�id</th>
								<!-- ������{ר�ҵ�����ͨ�� 1  2  }-->   
								<th align="center" rowName="advice_type" orderName="advice_type:DESC" title='ר�ҵ�����ͨ�� 1  2  '>ר�ҵ�����ͨ�� 1  2  </th>
								<!-- ������{�û�id}-->   
								<th align="center" rowName="patient_id" orderName="patient_id:DESC" title='�û�id'>�û�id</th>
								<!-- ������{ҽ��id}-->   
								<th align="center" rowName="doctor_id" orderName="doctor_id:DESC" title='ҽ��id'>ҽ��id</th>
								<!-- ������{�ײ�id}-->   
								<th align="center" rowName="combo_id" orderName="combo_id:DESC" title='�ײ�id'>�ײ�id</th>
								<!-- ������{��ѯ���۸�}-->   
								<th align="center" rowName="moeney" orderName="moeney:DESC" title='��ѯ���۸�'>��ѯ���۸�</th>
								<!-- ������{��ѯ��״̬ 1 ����ѯ 2 ������ 3 ��� 4 �ܾ�}-->   
								<th align="center" rowName="advice_status" orderName="advice_status:DESC" title='��ѯ��״̬ 1 ����ѯ 2 ������ 3 ��� 4 �ܾ�'>��ѯ��״̬ 1 ����ѯ 2 ������ 3 ��� 4 �ܾ�</th>
								<!-- ������{APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�}-->   
								<th align="center" rowName="chnanel_type" orderName="chnanel_type:DESC" title='APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�'>APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�</th>
								<!-- ������{����֧������ 1 ΢�� 2 ֧���� 3����}-->   
								<th align="center" rowName="pay_channel_type" orderName="pay_channel_type:DESC" title='����֧������ 1 ΢�� 2 ֧���� 3����'>����֧������ 1 ΢�� 2 ֧���� 3����</th>
								<!-- ������{�Ƿ��ڴ���չ�� 1 �� 2����}-->   
								<th align="center" rowName="is_open" orderName="is_open:DESC" title='�Ƿ��ڴ���չ�� 1 �� 2����'>�Ƿ��ڴ���չ�� 1 �� 2����</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="expire_time" orderName="expire_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{��ע1}-->   
								<th align="center" rowName="char1" orderName="char1:DESC" title='��ע1'>��ע1</th>
								<!-- ������{��ע2}-->   
								<th align="center" rowName="char2" orderName="char2:DESC" title='��ע2'>��ע2</th>
								<!-- ������{��ѯ�����쿪ʼʱ��}-->   
								<th align="center" rowName="advice_start_time" orderName="advice_start_time:DESC" title='��ѯ�����쿪ʼʱ��'>��ѯ�����쿪ʼʱ��</th>
								<!-- ������{��ѯ������ʱ��}-->   
								<th align="center" rowName="advice_valid_time" orderName="advice_valid_time:DESC" title='��ѯ������ʱ��'>��ѯ������ʱ��</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							UserCmccAdviceDoctor view = new UserCmccAdviceDoctor();
								for (int i = 0; i < list.size(); i++) {
									view = (UserCmccAdviceDoctor) list.get(i);
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
											<!-- ������{֢״�򼲲�id}-->   
											<td><%=view.getDiseaseId()%></td>
											<!-- ������{ר�ҵ�����ͨ�� 1  2  }-->   
											<td><%=view.getAdviceType()%></td>
											<!-- ������{�û�id}-->   
											<td><%=view.getPatientId()%></td>
											<!-- ������{ҽ��id}-->   
											<td><%=view.getDoctorId()%></td>
											<!-- ������{�ײ�id}-->   
											<td><%=view.getComboId()%></td>
											<!-- ������{��ѯ���۸�}-->   
											<td><%=view.getMoeney()%></td>
											<!-- ������{��ѯ��״̬ 1 ����ѯ 2 ������ 3 ��� 4 �ܾ�}-->   
											<td><%=view.getAdviceStatus()%></td>
											<!-- ������{APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�}-->   
											<td><%=view.getChnanelType()%></td>
											<!-- ������{����֧������ 1 ΢�� 2 ֧���� 3����}-->   
											<td><%=view.getPayChannelType()%></td>
											<!-- ������{�Ƿ��ڴ���չ�� 1 �� 2����}-->   
											<td><%=view.getIsOpen()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getExpireTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{��ע1}-->   
											<td><%=view.getChar1()%></td>
											<!-- ������{��ע2}-->   
											<td><%=view.getChar2()%></td>
											<!-- ������{��ѯ�����쿪ʼʱ��}-->   
											<td><%=view.getAdviceStartTime()%></td>
											<!-- ������{��ѯ������ʱ��}-->   
											<td><%=view.getAdviceValidTime()%></td>

											<td>
												<a class="o-edit" href="UserCmccAdviceDoctor.mc?method=editUserCmccAdviceDoctor&id,adviceTitle,adviceId,diseaseId,adviceType,patientId,doctorId,comboId,moeney,adviceStatus,chnanelType,payChannelType,isOpen,createTime,optTime,expireTime,remark,char1,char2,adviceStartTime,adviceValidTime=<%= view.getId() +":"+  view.getAdviceTitle() +":"+  view.getAdviceId() +":"+  view.getDiseaseId() +":"+  view.getAdviceType() +":"+  view.getPatientId() +":"+  view.getDoctorId() +":"+  view.getComboId() +":"+  view.getMoeney() +":"+  view.getAdviceStatus() +":"+  view.getChnanelType() +":"+  view.getPayChannelType() +":"+  view.getIsOpen() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getExpireTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() +":"+  view.getAdviceStartTime() +":"+  view.getAdviceValidTime() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteUserCmccAdviceDoctor('<%= view.getId() +":"+  view.getAdviceTitle() +":"+  view.getAdviceId() +":"+  view.getDiseaseId() +":"+  view.getAdviceType() +":"+  view.getPatientId() +":"+  view.getDoctorId() +":"+  view.getComboId() +":"+  view.getMoeney() +":"+  view.getAdviceStatus() +":"+  view.getChnanelType() +":"+  view.getPayChannelType() +":"+  view.getIsOpen() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getExpireTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() +":"+  view.getAdviceStartTime() +":"+  view.getAdviceValidTime() %>')" title="ɾ��"></a>
											    <a class="o-view" href="UserCmccAdviceDoctor.mc?method=detailUserCmccAdviceDoctor&id,adviceTitle,adviceId,diseaseId,adviceType,patientId,doctorId,comboId,moeney,adviceStatus,chnanelType,payChannelType,isOpen,createTime,optTime,expireTime,remark,char1,char2,adviceStartTime,adviceValidTime=<%= view.getId() +":"+  view.getAdviceTitle() +":"+  view.getAdviceId() +":"+  view.getDiseaseId() +":"+  view.getAdviceType() +":"+  view.getPatientId() +":"+  view.getDoctorId() +":"+  view.getComboId() +":"+  view.getMoeney() +":"+  view.getAdviceStatus() +":"+  view.getChnanelType() +":"+  view.getPayChannelType() +":"+  view.getIsOpen() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getExpireTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() +":"+  view.getAdviceStartTime() +":"+  view.getAdviceValidTime() %>" title="����"></a> 
												
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.UserCmccDoctorMoney" %>
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
		function deleteUserCmccDoctorMoney(PK) {
			jQuery.ajax({
				url : "UserCmccDoctorMoney.mc?method=deleteUserCmccDoctorMoney",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/UserCmccDoctorMoney.mc?method=getAllPageUserCmccDoctorMoney" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/user_cmcc_doctor_money_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="advice_id" placeholder="��ѯid" value="${ param.advice_id }"/>
						    
						    	<input type='text' class="input-small" name="patient_id" placeholder="�û�id" value="${ param.patient_id }"/>
						    
						    	<input type='text' class="input-small" name="doctor_id" placeholder="ҽ��id" value="${ param.doctor_id }"/>
						    
						    	<input type='text' class="input-small" name="combo_id" placeholder="�ײ�id" value="${ param.combo_id }"/>
						    
						    	<input type='text' class="input-small" name="income" placeholder="����" value="${ param.income }"/>
						    
						    	<input type='text' class="input-small" name="money_status" placeholder="����״̬ 1 �ѽ��� 2 δ����" value="${ param.money_status }"/>
						    
						    	<input type='text' class="input-small" name="pay_channel_type" placeholder="����֧������ 1 ΢�� 2 ֧���� 3����" value="${ param.pay_channel_type }"/>
						    
						    	<input type='text' class="input-small" name="channel_type" placeholder="������Դ APP,CMCC,BOC" value="${ param.channel_type }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="char1" placeholder="��ע1" value="${ param.char1 }"/>
						    
						    	<input type='text' class="input-small" name="char2" placeholder="��ע2" value="${ param.char2 }"/>

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
								<!-- ������{��ѯid}-->   
								<th align="center" rowName="advice_id" orderName="advice_id:DESC" title='��ѯid'>��ѯid</th>
								<!-- ������{�û�id}-->   
								<th align="center" rowName="patient_id" orderName="patient_id:DESC" title='�û�id'>�û�id</th>
								<!-- ������{ҽ��id}-->   
								<th align="center" rowName="doctor_id" orderName="doctor_id:DESC" title='ҽ��id'>ҽ��id</th>
								<!-- ������{�ײ�id}-->   
								<th align="center" rowName="combo_id" orderName="combo_id:DESC" title='�ײ�id'>�ײ�id</th>
								<!-- ������{����}-->   
								<th align="center" rowName="income" orderName="income:DESC" title='����'>����</th>
								<!-- ������{����״̬ 1 �ѽ��� 2 δ����}-->   
								<th align="center" rowName="money_status" orderName="money_status:DESC" title='����״̬ 1 �ѽ��� 2 δ����'>����״̬ 1 �ѽ��� 2 δ����</th>
								<!-- ������{����֧������ 1 ΢�� 2 ֧���� 3����}-->   
								<th align="center" rowName="pay_channel_type" orderName="pay_channel_type:DESC" title='����֧������ 1 ΢�� 2 ֧���� 3����'>����֧������ 1 ΢�� 2 ֧���� 3����</th>
								<!-- ������{������Դ APP,CMCC,BOC}-->   
								<th align="center" rowName="channel_type" orderName="channel_type:DESC" title='������Դ APP,CMCC,BOC'>������Դ APP,CMCC,BOC</th>
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
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							UserCmccDoctorMoney view = new UserCmccDoctorMoney();
								for (int i = 0; i < list.size(); i++) {
									view = (UserCmccDoctorMoney) list.get(i);
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
											<!-- ������{��ѯid}-->   
											<td><%=view.getAdviceId()%></td>
											<!-- ������{�û�id}-->   
											<td><%=view.getPatientId()%></td>
											<!-- ������{ҽ��id}-->   
											<td><%=view.getDoctorId()%></td>
											<!-- ������{�ײ�id}-->   
											<td><%=view.getComboId()%></td>
											<!-- ������{����}-->   
											<td><%=view.getIncome()%></td>
											<!-- ������{����״̬ 1 �ѽ��� 2 δ����}-->   
											<td><%=view.getMoneyStatus()%></td>
											<!-- ������{����֧������ 1 ΢�� 2 ֧���� 3����}-->   
											<td><%=view.getPayChannelType()%></td>
											<!-- ������{������Դ APP,CMCC,BOC}-->   
											<td><%=view.getChannelType()%></td>
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

											<td>
												<a class="o-edit" href="UserCmccDoctorMoney.mc?method=editUserCmccDoctorMoney&id,adviceId,patientId,doctorId,comboId,income,moneyStatus,payChannelType,channelType,createTime,optTime,remark,char1,char2=<%= view.getId() +":"+  view.getAdviceId() +":"+  view.getPatientId() +":"+  view.getDoctorId() +":"+  view.getComboId() +":"+  view.getIncome() +":"+  view.getMoneyStatus() +":"+  view.getPayChannelType() +":"+  view.getChannelType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteUserCmccDoctorMoney('<%= view.getId() +":"+  view.getAdviceId() +":"+  view.getPatientId() +":"+  view.getDoctorId() +":"+  view.getComboId() +":"+  view.getIncome() +":"+  view.getMoneyStatus() +":"+  view.getPayChannelType() +":"+  view.getChannelType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() %>')" title="ɾ��"></a>
											    <a class="o-view" href="UserCmccDoctorMoney.mc?method=detailUserCmccDoctorMoney&id,adviceId,patientId,doctorId,comboId,income,moneyStatus,payChannelType,channelType,createTime,optTime,remark,char1,char2=<%= view.getId() +":"+  view.getAdviceId() +":"+  view.getPatientId() +":"+  view.getDoctorId() +":"+  view.getComboId() +":"+  view.getIncome() +":"+  view.getMoneyStatus() +":"+  view.getPayChannelType() +":"+  view.getChannelType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() %>" title="����"></a> 
												
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
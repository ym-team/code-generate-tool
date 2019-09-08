<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.UserCmccDoctorMoneySummary" %>
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
		function deleteUserCmccDoctorMoneySummary(PK) {
			jQuery.ajax({
				url : "UserCmccDoctorMoneySummary.mc?method=deleteUserCmccDoctorMoneySummary",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/UserCmccDoctorMoneySummary.mc?method=getAllPageUserCmccDoctorMoneySummary" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/user_cmcc_doctor_money_summary_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="doctor_id" placeholder="ҽ��id" value="${ param.doctor_id }"/>
						    
						    	<input type='text' class="input-small" name="channel_type" placeholder="APP,CMCC,BOC" value="${ param.channel_type }"/>
						    
						    	<input type='text' class="input-small" name="app_income" placeholder="app����" value="${ param.app_income }"/>
						    
						    	<input type='text' class="input-small" name="cmcc_income" placeholder="cmcc����" value="${ param.cmcc_income }"/>
						    
						    	<input type='text' class="input-small" name="income_finish" placeholder="����ɵ�����" value="${ param.income_finish }"/>
						    
						    	<input type='text' class="input-small" name="total_income" placeholder="������" value="${ param.total_income }"/>
						    
						    	<input type='text' class="input-small" name="app_inncome_ing" placeholder="app�����е����� ����δ���ʱ" value="${ param.app_inncome_ing }"/>
						    
						    	<input type='text' class="input-small" name="cmcc_income_ing" placeholder="CMCC�����е����� ����δ���ʱ" value="${ param.cmcc_income_ing }"/>
						    
						    	<input type='text' class="input-small" name="income_ing" placeholder="�����е�����  ����δ���ʱ" value="${ param.income_ing }"/>
						    
						    	<input type='text' class="input-small" name="income_status" placeholder="����״̬ 1������ 2δ���� ���Ӧ��û����  ����Ӧ���Ƿִ����ֵ� ���Ի���һ�Զ�����" value="${ param.income_status }"/>
						    
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
								<!-- ������{ҽ��id}-->   
								<th align="center" rowName="doctor_id" orderName="doctor_id:DESC" title='ҽ��id'>ҽ��id</th>
								<!-- ������{APP,CMCC,BOC}-->   
								<th align="center" rowName="channel_type" orderName="channel_type:DESC" title='APP,CMCC,BOC'>APP,CMCC,BOC</th>
								<!-- ������{app����}-->   
								<th align="center" rowName="app_income" orderName="app_income:DESC" title='app����'>app����</th>
								<!-- ������{cmcc����}-->   
								<th align="center" rowName="cmcc_income" orderName="cmcc_income:DESC" title='cmcc����'>cmcc����</th>
								<!-- ������{����ɵ�����}-->   
								<th align="center" rowName="income_finish" orderName="income_finish:DESC" title='����ɵ�����'>����ɵ�����</th>
								<!-- ������{������}-->   
								<th align="center" rowName="total_income" orderName="total_income:DESC" title='������'>������</th>
								<!-- ������{app�����е����� ����δ���ʱ}-->   
								<th align="center" rowName="app_inncome_ing" orderName="app_inncome_ing:DESC" title='app�����е����� ����δ���ʱ'>app�����е����� ����δ���ʱ</th>
								<!-- ������{CMCC�����е����� ����δ���ʱ}-->   
								<th align="center" rowName="cmcc_income_ing" orderName="cmcc_income_ing:DESC" title='CMCC�����е����� ����δ���ʱ'>CMCC�����е����� ����δ���ʱ</th>
								<!-- ������{�����е�����  ����δ���ʱ}-->   
								<th align="center" rowName="income_ing" orderName="income_ing:DESC" title='�����е�����  ����δ���ʱ'>�����е�����  ����δ���ʱ</th>
								<!-- ������{����״̬ 1������ 2δ���� ���Ӧ��û����  ����Ӧ���Ƿִ����ֵ� ���Ի���һ�Զ�����}-->   
								<th align="center" rowName="income_status" orderName="income_status:DESC" title='����״̬ 1������ 2δ���� ���Ӧ��û����  ����Ӧ���Ƿִ����ֵ� ���Ի���һ�Զ�����'>����״̬ 1������ 2δ���� ���Ӧ��û����  ����Ӧ���Ƿִ����ֵ� ���Ի���һ�Զ�����</th>
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
							UserCmccDoctorMoneySummary view = new UserCmccDoctorMoneySummary();
								for (int i = 0; i < list.size(); i++) {
									view = (UserCmccDoctorMoneySummary) list.get(i);
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
											<!-- ������{ҽ��id}-->   
											<td><%=view.getDoctorId()%></td>
											<!-- ������{APP,CMCC,BOC}-->   
											<td><%=view.getChannelType()%></td>
											<!-- ������{app����}-->   
											<td><%=view.getAppIncome()%></td>
											<!-- ������{cmcc����}-->   
											<td><%=view.getCmccIncome()%></td>
											<!-- ������{����ɵ�����}-->   
											<td><%=view.getIncomeFinish()%></td>
											<!-- ������{������}-->   
											<td><%=view.getTotalIncome()%></td>
											<!-- ������{app�����е����� ����δ���ʱ}-->   
											<td><%=view.getAppInncomeIng()%></td>
											<!-- ������{CMCC�����е����� ����δ���ʱ}-->   
											<td><%=view.getCmccIncomeIng()%></td>
											<!-- ������{�����е�����  ����δ���ʱ}-->   
											<td><%=view.getIncomeIng()%></td>
											<!-- ������{����״̬ 1������ 2δ���� ���Ӧ��û����  ����Ӧ���Ƿִ����ֵ� ���Ի���һ�Զ�����}-->   
											<td><%=view.getIncomeStatus()%></td>
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
												<a class="o-edit" href="UserCmccDoctorMoneySummary.mc?method=editUserCmccDoctorMoneySummary&id,doctorId,channelType,appIncome,cmccIncome,incomeFinish,totalIncome,appInncomeIng,cmccIncomeIng,incomeIng,incomeStatus,createTime,optTime,remark,char1,char2=<%= view.getId() +":"+  view.getDoctorId() +":"+  view.getChannelType() +":"+  view.getAppIncome() +":"+  view.getCmccIncome() +":"+  view.getIncomeFinish() +":"+  view.getTotalIncome() +":"+  view.getAppInncomeIng() +":"+  view.getCmccIncomeIng() +":"+  view.getIncomeIng() +":"+  view.getIncomeStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteUserCmccDoctorMoneySummary('<%= view.getId() +":"+  view.getDoctorId() +":"+  view.getChannelType() +":"+  view.getAppIncome() +":"+  view.getCmccIncome() +":"+  view.getIncomeFinish() +":"+  view.getTotalIncome() +":"+  view.getAppInncomeIng() +":"+  view.getCmccIncomeIng() +":"+  view.getIncomeIng() +":"+  view.getIncomeStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() %>')" title="ɾ��"></a>
											    <a class="o-view" href="UserCmccDoctorMoneySummary.mc?method=detailUserCmccDoctorMoneySummary&id,doctorId,channelType,appIncome,cmccIncome,incomeFinish,totalIncome,appInncomeIng,cmccIncomeIng,incomeIng,incomeStatus,createTime,optTime,remark,char1,char2=<%= view.getId() +":"+  view.getDoctorId() +":"+  view.getChannelType() +":"+  view.getAppIncome() +":"+  view.getCmccIncome() +":"+  view.getIncomeFinish() +":"+  view.getTotalIncome() +":"+  view.getAppInncomeIng() +":"+  view.getCmccIncomeIng() +":"+  view.getIncomeIng() +":"+  view.getIncomeStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() %>" title="����"></a> 
												
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
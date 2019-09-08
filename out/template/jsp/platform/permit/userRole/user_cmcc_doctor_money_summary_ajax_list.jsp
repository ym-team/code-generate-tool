<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.UserCmccDoctorMoneySummary" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<TITLE>���Բ�ѯ</TITLE>
	<!-- ����JS��CSS��ʽ-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/common/list_ajax.js"></script>
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
	<!-- ����ʽ����������� -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css"> 
    <script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">
    <!-- ��ѯҳ������ checkbox����Ҫ���� -->
   <script type="text/javascript">
		
		$(function(){
		
			$("input[name='selectall_checkbox']").on('ifClicked',
		                function () {
		                    $('input:checkbox').iCheck('toggle');
		                });
		                          
			var operates = {
				edit:'UserCmccDoctorMoneySummary.mc?method=editUserCmccDoctorMoneySummary&id,doctorId,channelType,appIncome,cmccIncome,incomeFinish,totalIncome,appInncomeIng,cmccIncomeIng,incomeIng,incomeStatus,createTime,optTime,remark,char1,char2=',
				del:'UserCmccDoctorMoneySummary.mc?method=deleteUserCmccDoctorMoneySummary&PK=',
				view:'UserCmccDoctorMoneySummary.mc?method=detailUserCmccDoctorMoneySummary&id,doctorId,channelType,appIncome,cmccIncome,incomeFinish,totalIncome,appInncomeIng,cmccIncomeIng,incomeIng,incomeStatus,createTime,optTime,remark,char1,char2='
			};
			var options = {
				tableId:'pageTable',
				url:'UserCmccDoctorMoneySummary.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,doctorId,channelType,appIncome,cmccIncome,incomeFinish,totalIncome,appInncomeIng,cmccIncomeIng,incomeIng,incomeStatus,createTime,optTime,remark,char1,char2'
			};
			
			jQuery.page( options );
			
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
			
		
			
		});
		
	
			
	</script>
</head>
<body>
	<form name="searchForm" method="post" class="form-search" action="" id="searchForm">
		<input type="hidden" name="pageNo" id="pageNo" />
 		<input type="hidden" name="pageSize" id="pageSize" />
 		<input type="hidden" name="start" id="start" />
 		<input type="hidden" name="orderName" id="orderName" />
 		
 		<!-- ��ѯ������ʾ����start -->
 		<div class="tabelist" style="border:1px solid gray;width:100%;padding:10px;margin:0 auto;">
			<div style="margin:0 auto;width:100%;">
			<div class="title-common">
				 	���Բ�ѯ
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
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
		<button type="button" id="searchBtn" class="btn btn-group-vertical">����</button>
							</div>
						</td>
						</tr>
		</table>
				</div>
			</div>
			<!-- ��ѯ������ʾ����end -->
			<!--//�����ʾ�б�-->
			<div style="position: relative;">
				<div id="loading" style=" width:100%; height: 340px;position: absolute; top: 0; display:none;">
					<div style="background-color: ; position: absolute; top: 50%; left: 50%; margin: -33px 0 0 -33px;">
						<img src="skins/style/images/loading.gif" />
					</div>
				</div>
				<div class="tabelist">
					<table id="pageTable" width="100%" border="0" class="table table-hover table-condensed" cellpadding="0" cellspacing="0">
	  					<thead>
	                    	<tr height="22" class="tab_title_bg">
	                        	<th align="center">
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="ȫѡ/ȡ��" />
	                            </th>
	                            <!--��ͷѭ����ʼ -->
								<!-- ������  ����-->   
								<th align="center" rowName="id" orderName="id:DESC" title='����'>����</th>
								<!-- ������  ҽ��id-->   
								<th align="center" rowName="doctorId" orderName="doctor_id:DESC" title='ҽ��id'>ҽ��id</th>
								<!-- ������  APP,CMCC,BOC-->   
								<th align="center" rowName="channelType" orderName="channel_type:DESC" title='APP,CMCC,BOC'>APP,CMCC,BOC</th>
								<!-- ������  app����-->   
								<th align="center" rowName="appIncome" orderName="app_income:DESC" title='app����'>app����</th>
								<!-- ������  cmcc����-->   
								<th align="center" rowName="cmccIncome" orderName="cmcc_income:DESC" title='cmcc����'>cmcc����</th>
								<!-- ������  ����ɵ�����-->   
								<th align="center" rowName="incomeFinish" orderName="income_finish:DESC" title='����ɵ�����'>����ɵ�����</th>
								<!-- ������  ������-->   
								<th align="center" rowName="totalIncome" orderName="total_income:DESC" title='������'>������</th>
								<!-- ������  app�����е����� ����δ���ʱ-->   
								<th align="center" rowName="appInncomeIng" orderName="app_inncome_ing:DESC" title='app�����е����� ����δ���ʱ'>app�����е����� ����δ���ʱ</th>
								<!-- ������  CMCC�����е����� ����δ���ʱ-->   
								<th align="center" rowName="cmccIncomeIng" orderName="cmcc_income_ing:DESC" title='CMCC�����е����� ����δ���ʱ'>CMCC�����е����� ����δ���ʱ</th>
								<!-- ������  �����е�����  ����δ���ʱ-->   
								<th align="center" rowName="incomeIng" orderName="income_ing:DESC" title='�����е�����  ����δ���ʱ'>�����е�����  ����δ���ʱ</th>
								<!-- ������  ����״̬ 1������ 2δ���� ���Ӧ��û����  ����Ӧ���Ƿִ����ֵ� ���Ի���һ�Զ�����-->   
								<th align="center" rowName="incomeStatus" orderName="income_status:DESC" title='����״̬ 1������ 2δ���� ���Ӧ��û����  ����Ӧ���Ƿִ����ֵ� ���Ի���һ�Զ�����'>����״̬ 1������ 2δ���� ���Ӧ��û����  ����Ӧ���Ƿִ����ֵ� ���Ի���һ�Զ�����</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ��ע-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������  ��ע1-->   
								<th align="center" rowName="char1" orderName="char1:DESC" title='��ע1'>��ע1</th>
								<!-- ������  ��ע2-->   
								<th align="center" rowName="char2" orderName="char2:DESC" title='��ע2'>��ע2</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
					    </tbody>      
					</table>
	               	<div id="pageMenu" class="page"></div>
	               	<div style="clear:both"></div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
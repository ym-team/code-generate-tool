<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.AcctUserBalanceSummary" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<TITLE>������ѯ</TITLE>
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
				edit:'AcctUserBalanceSummary.mc?method=editAcctUserBalanceSummary&pkId,subOrderId,fromAccountId,toAccountId,orderType,payFee,flowType,createDate,resultType,opTime,status,remark,orderSource=',
				del:'AcctUserBalanceSummary.mc?method=deleteAcctUserBalanceSummary&PK=',
				view:'AcctUserBalanceSummary.mc?method=detailAcctUserBalanceSummary&pkId,subOrderId,fromAccountId,toAccountId,orderType,payFee,flowType,createDate,resultType,opTime,status,remark,orderSource='
			};
			var options = {
				tableId:'pageTable',
				url:'AcctUserBalanceSummary.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'pkId,subOrderId,fromAccountId,toAccountId,orderType,payFee,flowType,createDate,resultType,opTime,status,remark,orderSource'
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
				 	������ѯ
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/acct_user_balance_summary_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="pk_id" placeholder="����ID" value="${ param.pk_id }"/>
		<input type='text' class="input-small" name="sub_order_id" placeholder="�Ӷ���ID-֧������" value="${ param.sub_order_id }"/>
		<input type='text' class="input-small" name="from_account_id" placeholder="֧���˻�ID" value="${ param.from_account_id }"/>
		<input type='text' class="input-small" name="to_account_id" placeholder="�����˻�ID" value="${ param.to_account_id }"/>
		<input type='text' class="input-small" name="order_type" placeholder="" value="${ param.order_type }"/>
		<input type='text' class="input-small" name="pay_fee" placeholder="֧������" value="${ param.pay_fee }"/>
		<input type='text' class="input-small" name="flow_type" placeholder="���ܼ�¼��Դ��1 ������֧��¼��2�ڲ�ҵ����֧��¼��" value="${ param.flow_type }"/>
		<input type='text' class="input-small" name="create_date" placeholder="����ʱ��" value="${ param.create_date }"/>
		<input type='text' class="input-small" name="result_type" placeholder="1:  �����             2:  ȡ��" value="${ param.result_type }"/>
		<input type='text' class="input-small" name="op_time" placeholder="" value="${ param.op_time }"/>
		<input type='text' class="input-small" name="status" placeholder="0:  ��Ч             1:  ��Ч" value="${ param.status }"/>
		<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
		<input type='text' class="input-small" name="order_source" placeholder="������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ���" value="${ param.order_source }"/>
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
								<!-- ������  ����ID-->   
								<th align="center" rowName="pkId" orderName="pk_id:DESC" title='����ID'>����ID</th>
								<!-- ������  �Ӷ���ID-֧������-->   
								<th align="center" rowName="subOrderId" orderName="sub_order_id:DESC" title='�Ӷ���ID-֧������'>�Ӷ���ID-֧������</th>
								<!-- ������  ֧���˻�ID-->   
								<th align="center" rowName="fromAccountId" orderName="from_account_id:DESC" title='֧���˻�ID'>֧���˻�ID</th>
								<!-- ������  �����˻�ID-->   
								<th align="center" rowName="toAccountId" orderName="to_account_id:DESC" title='�����˻�ID'>�����˻�ID</th>
								<!-- ������  -->   
								<th align="center" rowName="orderType" orderName="order_type:DESC" title=''></th>
								<!-- ������  ֧������-->   
								<th align="center" rowName="payFee" orderName="pay_fee:DESC" title='֧������'>֧������</th>
								<!-- ������  ���ܼ�¼��Դ��1 ������֧��¼��2�ڲ�ҵ����֧��¼��-->   
								<th align="center" rowName="flowType" orderName="flow_type:DESC" title='���ܼ�¼��Դ��1 ������֧��¼��2�ڲ�ҵ����֧��¼��'>���ܼ�¼��Դ��1 ������֧��¼��2�ڲ�ҵ����֧��¼��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createDate" orderName="create_date:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  1:  �����             2:  ȡ��-->   
								<th align="center" rowName="resultType" orderName="result_type:DESC" title='1:  �����             2:  ȡ��'>1:  �����             2:  ȡ��</th>
								<!-- ������  -->   
								<th align="center" rowName="opTime" orderName="op_time:DESC" title=''></th>
								<!-- ������  0:  ��Ч             1:  ��Ч-->   
								<th align="center" rowName="status" orderName="status:DESC" title='0:  ��Ч             1:  ��Ч'>0:  ��Ч             1:  ��Ч</th>
								<!-- ������  ��ע-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������  ������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ���-->   
								<th align="center" rowName="orderSource" orderName="order_source:DESC" title='������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ���'>������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ���</th>
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
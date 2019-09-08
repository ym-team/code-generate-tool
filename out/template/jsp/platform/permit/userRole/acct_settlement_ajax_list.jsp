<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.AcctSettlement" %>
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
				edit:'AcctSettlement.mc?method=editAcctSettlement&pkId,mainOrderId,accountId,channelAccountId,settlementMonth,accountBalance,settleBalance,taxFee,afterTaxBalance,mgntFee,channelType,settlementType,settlementDate,opTime,status,remark,channelFee=',
				del:'AcctSettlement.mc?method=deleteAcctSettlement&PK=',
				view:'AcctSettlement.mc?method=detailAcctSettlement&pkId,mainOrderId,accountId,channelAccountId,settlementMonth,accountBalance,settleBalance,taxFee,afterTaxBalance,mgntFee,channelType,settlementType,settlementDate,opTime,status,remark,channelFee='
			};
			var options = {
				tableId:'pageTable',
				url:'AcctSettlement.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'pkId,mainOrderId,accountId,channelAccountId,settlementMonth,accountBalance,settleBalance,taxFee,afterTaxBalance,mgntFee,channelType,settlementType,settlementDate,opTime,status,remark,channelFee'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/acct_settlement_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="pk_id" placeholder="����ID" value="${ param.pk_id }"/>
		<input type='text' class="input-small" name="main_order_id" placeholder="������ID" value="${ param.main_order_id }"/>
		<input type='text' class="input-small" name="account_id" placeholder="�˻�ID" value="${ param.account_id }"/>
		<input type='text' class="input-small" name="channel_account_id" placeholder="�����ʺ�ID" value="${ param.channel_account_id }"/>
		<input type='text' class="input-small" name="settlement_month" placeholder="�����·� ��ʾ:201501 ����6λ" value="${ param.settlement_month }"/>
		<input type='text' class="input-small" name="account_balance" placeholder="�˻���� = ������ - ƽ̨�����" value="${ param.account_balance }"/>
		<input type='text' class="input-small" name="settle_balance" placeholder="������ (δ��ƽ̨����ѣ�˰��)" value="${ param.settle_balance }"/>
		<input type='text' class="input-small" name="tax_fee" placeholder="��˰" value="${ param.tax_fee }"/>
		<input type='text' class="input-small" name="after_tax_balance" placeholder="˰���� = �˻���� - ˰��" value="${ param.after_tax_balance }"/>
		<input type='text' class="input-small" name="mgnt_fee" placeholder="ƽ̨�����" value="${ param.mgnt_fee }"/>
		<input type='text' class="input-small" name="channel_type" placeholder="������������             1: ֧����             2: ΢��֧��             3: ����" value="${ param.channel_type }"/>
		<input type='text' class="input-small" name="settlement_type" placeholder="����״̬             1:  �ѽ���             2:  δ����             3:  ƽ̨ת��" value="${ param.settlement_type }"/>
		<input type='text' class="input-small" name="settlement_date" placeholder="����ʱ��" value="${ param.settlement_date }"/>
		<input type='text' class="input-small" name="op_time" placeholder="" value="${ param.op_time }"/>
		<input type='text' class="input-small" name="status" placeholder="0:  ��Ч             1:  ��Ч" value="${ param.status }"/>
		<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
		<input type='text' class="input-small" name="channel_fee" placeholder="���������շ�" value="${ param.channel_fee }"/>
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
								<!-- ������  ������ID-->   
								<th align="center" rowName="mainOrderId" orderName="main_order_id:DESC" title='������ID'>������ID</th>
								<!-- ������  �˻�ID-->   
								<th align="center" rowName="accountId" orderName="account_id:DESC" title='�˻�ID'>�˻�ID</th>
								<!-- ������  �����ʺ�ID-->   
								<th align="center" rowName="channelAccountId" orderName="channel_account_id:DESC" title='�����ʺ�ID'>�����ʺ�ID</th>
								<!-- ������  �����·� ��ʾ:201501 ����6λ-->   
								<th align="center" rowName="settlementMonth" orderName="settlement_month:DESC" title='�����·� ��ʾ:201501 ����6λ'>�����·� ��ʾ:201501 ����6λ</th>
								<!-- ������  �˻���� = ������ - ƽ̨�����-->   
								<th align="center" rowName="accountBalance" orderName="account_balance:DESC" title='�˻���� = ������ - ƽ̨�����'>�˻���� = ������ - ƽ̨�����</th>
								<!-- ������  ������ (δ��ƽ̨����ѣ�˰��)-->   
								<th align="center" rowName="settleBalance" orderName="settle_balance:DESC" title='������ (δ��ƽ̨����ѣ�˰��)'>������ (δ��ƽ̨����ѣ�˰��)</th>
								<!-- ������  ��˰-->   
								<th align="center" rowName="taxFee" orderName="tax_fee:DESC" title='��˰'>��˰</th>
								<!-- ������  ˰���� = �˻���� - ˰��-->   
								<th align="center" rowName="afterTaxBalance" orderName="after_tax_balance:DESC" title='˰���� = �˻���� - ˰��'>˰���� = �˻���� - ˰��</th>
								<!-- ������  ƽ̨�����-->   
								<th align="center" rowName="mgntFee" orderName="mgnt_fee:DESC" title='ƽ̨�����'>ƽ̨�����</th>
								<!-- ������  ������������             1: ֧����             2: ΢��֧��             3: ����-->   
								<th align="center" rowName="channelType" orderName="channel_type:DESC" title='������������             1: ֧����             2: ΢��֧��             3: ����'>������������             1: ֧����             2: ΢��֧��             3: ����</th>
								<!-- ������  ����״̬             1:  �ѽ���             2:  δ����             3:  ƽ̨ת��-->   
								<th align="center" rowName="settlementType" orderName="settlement_type:DESC" title='����״̬             1:  �ѽ���             2:  δ����             3:  ƽ̨ת��'>����״̬             1:  �ѽ���             2:  δ����             3:  ƽ̨ת��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="settlementDate" orderName="settlement_date:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  -->   
								<th align="center" rowName="opTime" orderName="op_time:DESC" title=''></th>
								<!-- ������  0:  ��Ч             1:  ��Ч-->   
								<th align="center" rowName="status" orderName="status:DESC" title='0:  ��Ч             1:  ��Ч'>0:  ��Ч             1:  ��Ч</th>
								<!-- ������  ��ע-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������  ���������շ�-->   
								<th align="center" rowName="channelFee" orderName="channel_fee:DESC" title='���������շ�'>���������շ�</th>
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
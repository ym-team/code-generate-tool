<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.AcctSettlement" %>
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
		function deleteAcctSettlement(PK) {
			jQuery.ajax({
				url : "AcctSettlement.mc?method=deleteAcctSettlement",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/AcctSettlement.mc?method=getAllPageAcctSettlement" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
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
								<!-- ������{����ID}-->   
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='����ID'>����ID</th>
								<!-- ������{������ID}-->   
								<th align="center" rowName="main_order_id" orderName="main_order_id:DESC" title='������ID'>������ID</th>
								<!-- ������{�˻�ID}-->   
								<th align="center" rowName="account_id" orderName="account_id:DESC" title='�˻�ID'>�˻�ID</th>
								<!-- ������{�����ʺ�ID}-->   
								<th align="center" rowName="channel_account_id" orderName="channel_account_id:DESC" title='�����ʺ�ID'>�����ʺ�ID</th>
								<!-- ������{�����·� ��ʾ:201501 ����6λ}-->   
								<th align="center" rowName="settlement_month" orderName="settlement_month:DESC" title='�����·� ��ʾ:201501 ����6λ'>�����·� ��ʾ:201501 ����6λ</th>
								<!-- ������{�˻���� = ������ - ƽ̨�����}-->   
								<th align="center" rowName="account_balance" orderName="account_balance:DESC" title='�˻���� = ������ - ƽ̨�����'>�˻���� = ������ - ƽ̨�����</th>
								<!-- ������{������ (δ��ƽ̨����ѣ�˰��)}-->   
								<th align="center" rowName="settle_balance" orderName="settle_balance:DESC" title='������ (δ��ƽ̨����ѣ�˰��)'>������ (δ��ƽ̨����ѣ�˰��)</th>
								<!-- ������{��˰}-->   
								<th align="center" rowName="tax_fee" orderName="tax_fee:DESC" title='��˰'>��˰</th>
								<!-- ������{˰���� = �˻���� - ˰��}-->   
								<th align="center" rowName="after_tax_balance" orderName="after_tax_balance:DESC" title='˰���� = �˻���� - ˰��'>˰���� = �˻���� - ˰��</th>
								<!-- ������{ƽ̨�����}-->   
								<th align="center" rowName="mgnt_fee" orderName="mgnt_fee:DESC" title='ƽ̨�����'>ƽ̨�����</th>
								<!-- ������{������������             1: ֧����             2: ΢��֧��             3: ����}-->   
								<th align="center" rowName="channel_type" orderName="channel_type:DESC" title='������������             1: ֧����             2: ΢��֧��             3: ����'>������������             1: ֧����             2: ΢��֧��             3: ����</th>
								<!-- ������{����״̬             1:  �ѽ���             2:  δ����             3:  ƽ̨ת��}-->   
								<th align="center" rowName="settlement_type" orderName="settlement_type:DESC" title='����״̬             1:  �ѽ���             2:  δ����             3:  ƽ̨ת��'>����״̬             1:  �ѽ���             2:  δ����             3:  ƽ̨ת��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="settlement_date" orderName="settlement_date:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{}-->   
								<th align="center" rowName="op_time" orderName="op_time:DESC" title=''></th>
								<!-- ������{0:  ��Ч             1:  ��Ч}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='0:  ��Ч             1:  ��Ч'>0:  ��Ч             1:  ��Ч</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{���������շ�}-->   
								<th align="center" rowName="channel_fee" orderName="channel_fee:DESC" title='���������շ�'>���������շ�</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							AcctSettlement view = new AcctSettlement();
								for (int i = 0; i < list.size(); i++) {
									view = (AcctSettlement) list.get(i);
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
					
											<!-- ������{����ID}-->   
											<td><%=view.getPkId()%></td>
											<!-- ������{������ID}-->   
											<td><%=view.getMainOrderId()%></td>
											<!-- ������{�˻�ID}-->   
											<td><%=view.getAccountId()%></td>
											<!-- ������{�����ʺ�ID}-->   
											<td><%=view.getChannelAccountId()%></td>
											<!-- ������{�����·� ��ʾ:201501 ����6λ}-->   
											<td><%=view.getSettlementMonth()%></td>
											<!-- ������{�˻���� = ������ - ƽ̨�����}-->   
											<td><%=view.getAccountBalance()%></td>
											<!-- ������{������ (δ��ƽ̨����ѣ�˰��)}-->   
											<td><%=view.getSettleBalance()%></td>
											<!-- ������{��˰}-->   
											<td><%=view.getTaxFee()%></td>
											<!-- ������{˰���� = �˻���� - ˰��}-->   
											<td><%=view.getAfterTaxBalance()%></td>
											<!-- ������{ƽ̨�����}-->   
											<td><%=view.getMgntFee()%></td>
											<!-- ������{������������             1: ֧����             2: ΢��֧��             3: ����}-->   
											<td><%=view.getChannelType()%></td>
											<!-- ������{����״̬             1:  �ѽ���             2:  δ����             3:  ƽ̨ת��}-->   
											<td><%=view.getSettlementType()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getSettlementDate()%></td>
											<!-- ������{}-->   
											<td><%=view.getOpTime()%></td>
											<!-- ������{0:  ��Ч             1:  ��Ч}-->   
											<td><%=view.getStatus()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{���������շ�}-->   
											<td><%=view.getChannelFee()%></td>

											<td>
												<a class="o-edit" href="AcctSettlement.mc?method=editAcctSettlement&pkId,mainOrderId,accountId,channelAccountId,settlementMonth,accountBalance,settleBalance,taxFee,afterTaxBalance,mgntFee,channelType,settlementType,settlementDate,opTime,status,remark,channelFee=<%= view.getPkId() +":"+  view.getMainOrderId() +":"+  view.getAccountId() +":"+  view.getChannelAccountId() +":"+  view.getSettlementMonth() +":"+  view.getAccountBalance() +":"+  view.getSettleBalance() +":"+  view.getTaxFee() +":"+  view.getAfterTaxBalance() +":"+  view.getMgntFee() +":"+  view.getChannelType() +":"+  view.getSettlementType() +":"+  view.getSettlementDate() +":"+  view.getOpTime() +":"+  view.getStatus() +":"+  view.getRemark() +":"+  view.getChannelFee() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteAcctSettlement('<%= view.getPkId() +":"+  view.getMainOrderId() +":"+  view.getAccountId() +":"+  view.getChannelAccountId() +":"+  view.getSettlementMonth() +":"+  view.getAccountBalance() +":"+  view.getSettleBalance() +":"+  view.getTaxFee() +":"+  view.getAfterTaxBalance() +":"+  view.getMgntFee() +":"+  view.getChannelType() +":"+  view.getSettlementType() +":"+  view.getSettlementDate() +":"+  view.getOpTime() +":"+  view.getStatus() +":"+  view.getRemark() +":"+  view.getChannelFee() %>')" title="ɾ��"></a>
											    <a class="o-view" href="AcctSettlement.mc?method=detailAcctSettlement&pkId,mainOrderId,accountId,channelAccountId,settlementMonth,accountBalance,settleBalance,taxFee,afterTaxBalance,mgntFee,channelType,settlementType,settlementDate,opTime,status,remark,channelFee=<%= view.getPkId() +":"+  view.getMainOrderId() +":"+  view.getAccountId() +":"+  view.getChannelAccountId() +":"+  view.getSettlementMonth() +":"+  view.getAccountBalance() +":"+  view.getSettleBalance() +":"+  view.getTaxFee() +":"+  view.getAfterTaxBalance() +":"+  view.getMgntFee() +":"+  view.getChannelType() +":"+  view.getSettlementType() +":"+  view.getSettlementDate() +":"+  view.getOpTime() +":"+  view.getStatus() +":"+  view.getRemark() +":"+  view.getChannelFee() %>" title="����"></a> 
												
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
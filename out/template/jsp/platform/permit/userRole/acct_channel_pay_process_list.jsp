<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.AcctChannelPayProcess" %>
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
		function deleteAcctChannelPayProcess(PK) {
			jQuery.ajax({
				url : "AcctChannelPayProcess.mc?method=deleteAcctChannelPayProcess",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/AcctChannelPayProcess.mc?method=getAllPageAcctChannelPayProcess" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/acct_channel_pay_process_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="����ID" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="sub_order_id" placeholder="�Ӷ���ID" value="${ param.sub_order_id }"/>
						    
						    	<input type='text' class="input-small" name="from_account_id" placeholder="֧���˻�ID" value="${ param.from_account_id }"/>
						    
						    	<input type='text' class="input-small" name="to_account_id" placeholder="�����˻�ID" value="${ param.to_account_id }"/>
						    
						    	<input type='text' class="input-small" name="from_channel_account_id" placeholder="֧���ʺ�" value="${ param.from_channel_account_id }"/>
						    
						    	<input type='text' class="input-small" name="to_channel_account_id" placeholder="�����˺�" value="${ param.to_channel_account_id }"/>
						    
						    	<input type='text' class="input-small" name="channel_type" placeholder="1: ֧����             2: ΢��֧��             3: ����" value="${ param.channel_type }"/>
						    
						    	<input type='text' class="input-small" name="pay_fee" placeholder="֧������" value="${ param.pay_fee }"/>
						    
						    	<input type='text' class="input-small" name="pay_status" placeholder="11-�½�(��ȡ֧��ID)             21-֧����(ǰ̨�Ѿ�����֧��,���ܲ���Ҫ)             31-֧���쳣 (����ص�)             99-�����" value="${ param.pay_status }"/>
						    
						    	<input type='text' class="input-small" name="create_date" placeholder="����ʱ��" value="${ param.create_date }"/>
						    
						    	<input type='text' class="input-small" name="op_time" placeholder="" value="${ param.op_time }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="0:  ��Ч             1:  ��Ч" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="order_source" placeholder="������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ���" value="${ param.order_source }"/>

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
								<!-- ������{�Ӷ���ID}-->   
								<th align="center" rowName="sub_order_id" orderName="sub_order_id:DESC" title='�Ӷ���ID'>�Ӷ���ID</th>
								<!-- ������{֧���˻�ID}-->   
								<th align="center" rowName="from_account_id" orderName="from_account_id:DESC" title='֧���˻�ID'>֧���˻�ID</th>
								<!-- ������{�����˻�ID}-->   
								<th align="center" rowName="to_account_id" orderName="to_account_id:DESC" title='�����˻�ID'>�����˻�ID</th>
								<!-- ������{֧���ʺ�}-->   
								<th align="center" rowName="from_channel_account_id" orderName="from_channel_account_id:DESC" title='֧���ʺ�'>֧���ʺ�</th>
								<!-- ������{�����˺�}-->   
								<th align="center" rowName="to_channel_account_id" orderName="to_channel_account_id:DESC" title='�����˺�'>�����˺�</th>
								<!-- ������{1: ֧����             2: ΢��֧��             3: ����}-->   
								<th align="center" rowName="channel_type" orderName="channel_type:DESC" title='1: ֧����             2: ΢��֧��             3: ����'>1: ֧����             2: ΢��֧��             3: ����</th>
								<!-- ������{֧������}-->   
								<th align="center" rowName="pay_fee" orderName="pay_fee:DESC" title='֧������'>֧������</th>
								<!-- ������{11-�½�(��ȡ֧��ID)             21-֧����(ǰ̨�Ѿ�����֧��,���ܲ���Ҫ)             31-֧���쳣 (����ص�)             99-�����}-->   
								<th align="center" rowName="pay_status" orderName="pay_status:DESC" title='11-�½�(��ȡ֧��ID)             21-֧����(ǰ̨�Ѿ�����֧��,���ܲ���Ҫ)             31-֧���쳣 (����ص�)             99-�����'>11-�½�(��ȡ֧��ID)             21-֧����(ǰ̨�Ѿ�����֧��,���ܲ���Ҫ)             31-֧���쳣 (����ص�)             99-�����</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_date" orderName="create_date:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{}-->   
								<th align="center" rowName="op_time" orderName="op_time:DESC" title=''></th>
								<!-- ������{0:  ��Ч             1:  ��Ч}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='0:  ��Ч             1:  ��Ч'>0:  ��Ч             1:  ��Ч</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ���}-->   
								<th align="center" rowName="order_source" orderName="order_source:DESC" title='������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ���'>������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ���</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							AcctChannelPayProcess view = new AcctChannelPayProcess();
								for (int i = 0; i < list.size(); i++) {
									view = (AcctChannelPayProcess) list.get(i);
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
											<!-- ������{�Ӷ���ID}-->   
											<td><%=view.getSubOrderId()%></td>
											<!-- ������{֧���˻�ID}-->   
											<td><%=view.getFromAccountId()%></td>
											<!-- ������{�����˻�ID}-->   
											<td><%=view.getToAccountId()%></td>
											<!-- ������{֧���ʺ�}-->   
											<td><%=view.getFromChannelAccountId()%></td>
											<!-- ������{�����˺�}-->   
											<td><%=view.getToChannelAccountId()%></td>
											<!-- ������{1: ֧����             2: ΢��֧��             3: ����}-->   
											<td><%=view.getChannelType()%></td>
											<!-- ������{֧������}-->   
											<td><%=view.getPayFee()%></td>
											<!-- ������{11-�½�(��ȡ֧��ID)             21-֧����(ǰ̨�Ѿ�����֧��,���ܲ���Ҫ)             31-֧���쳣 (����ص�)             99-�����}-->   
											<td><%=view.getPayStatus()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateDate()%></td>
											<!-- ������{}-->   
											<td><%=view.getOpTime()%></td>
											<!-- ������{0:  ��Ч             1:  ��Ч}-->   
											<td><%=view.getStatus()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{������Դ��1 ����������ﶩ�����ɼ�¼Ϊ�գ���2 �����Ҷ���}-->   
											<td><%=view.getOrderSource()%></td>

											<td>
												<a class="o-edit" href="AcctChannelPayProcess.mc?method=editAcctChannelPayProcess&pkId,subOrderId,fromAccountId,toAccountId,fromChannelAccountId,toChannelAccountId,channelType,payFee,payStatus,createDate,opTime,status,remark,orderSource=<%= view.getPkId() +":"+  view.getSubOrderId() +":"+  view.getFromAccountId() +":"+  view.getToAccountId() +":"+  view.getFromChannelAccountId() +":"+  view.getToChannelAccountId() +":"+  view.getChannelType() +":"+  view.getPayFee() +":"+  view.getPayStatus() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getStatus() +":"+  view.getRemark() +":"+  view.getOrderSource() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteAcctChannelPayProcess('<%= view.getPkId() +":"+  view.getSubOrderId() +":"+  view.getFromAccountId() +":"+  view.getToAccountId() +":"+  view.getFromChannelAccountId() +":"+  view.getToChannelAccountId() +":"+  view.getChannelType() +":"+  view.getPayFee() +":"+  view.getPayStatus() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getStatus() +":"+  view.getRemark() +":"+  view.getOrderSource() %>')" title="ɾ��"></a>
											    <a class="o-view" href="AcctChannelPayProcess.mc?method=detailAcctChannelPayProcess&pkId,subOrderId,fromAccountId,toAccountId,fromChannelAccountId,toChannelAccountId,channelType,payFee,payStatus,createDate,opTime,status,remark,orderSource=<%= view.getPkId() +":"+  view.getSubOrderId() +":"+  view.getFromAccountId() +":"+  view.getToAccountId() +":"+  view.getFromChannelAccountId() +":"+  view.getToChannelAccountId() +":"+  view.getChannelType() +":"+  view.getPayFee() +":"+  view.getPayStatus() +":"+  view.getCreateDate() +":"+  view.getOpTime() +":"+  view.getStatus() +":"+  view.getRemark() +":"+  view.getOrderSource() %>" title="����"></a> 
												
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
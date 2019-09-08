<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.DiscoverPushOfficeOrderComment" %>
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
				edit:'DiscoverPushOfficeOrderComment.mc?method=editDiscoverPushOfficeOrderComment&discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType=',
				del:'DiscoverPushOfficeOrderComment.mc?method=deleteDiscoverPushOfficeOrderComment&PK=',
				view:'DiscoverPushOfficeOrderComment.mc?method=detailDiscoverPushOfficeOrderComment&discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType='
			};
			var options = {
				tableId:'pageTable',
				url:'DiscoverPushOfficeOrderComment.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'discoverPushOfficeId,pushUserId,pushUserInfo,fromUserId,fromUserInfo,toUserId,toUserInfo,innerPushType,innerPushSubType,pushServiceTitle,pushServiceMsg,pushServiceId,pushServiceMsgStatus,createTime,optTime,remark,pushStatus,pushServiceMoney,pushServiceCount,pushServiceType'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/discover_push_office_order_comment_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="discover_push_office_id" placeholder="����" value="${ param.discover_push_office_id }"/>
		<input type='text' class="input-small" name="push_user_id" placeholder="������id" value="${ param.push_user_id }"/>
		<input type='text' class="input-small" name="push_user_info" placeholder="��������Ϣ" value="${ param.push_user_info }"/>
		<input type='text' class="input-small" name="from_user_id" placeholder="�������ĸ��û���id" value="${ param.from_user_id }"/>
		<input type='text' class="input-small" name="from_user_info" placeholder="�������ĸ��û���Ϣ" value="${ param.from_user_info }"/>
		<input type='text' class="input-small" name="to_user_id" placeholder="������id" value="${ param.to_user_id }"/>
		<input type='text' class="input-small" name="to_user_info" placeholder="��������Ϣ" value="${ param.to_user_info }"/>
		<input type='text' class="input-small" name="inner_push_type" placeholder="100������" value="${ param.inner_push_type }"/>
		<input type='text' class="input-small" name="inner_push_sub_type" placeholder="��δ����" value="${ param.inner_push_sub_type }"/>
		<input type='text' class="input-small" name="push_service_title" placeholder="���ͱ���" value="${ param.push_service_title }"/>
		<input type='text' class="input-small" name="push_service_msg" placeholder="��������" value="${ param.push_service_msg }"/>
		<input type='text' class="input-small" name="push_service_id" placeholder="����ҵ��id" value="${ param.push_service_id }"/>
		<input type='text' class="input-small" name="push_service_msg_status" placeholder="��� �����ҳ�Ա 1���룬2ͬ�⣬3�ܾ�4���� 5����" value="${ param.push_service_msg_status }"/>
		<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="" value="${ param.remark }"/>
		<input type='text' class="input-small" name="push_status" placeholder="1�Ѵ��� 2δ����" value="${ param.push_status }"/>
		<input type='text' class="input-small" name="push_service_money" placeholder="����Ǯ *100" value="${ param.push_service_money }"/>
		<input type='text' class="input-small" name="push_service_count" placeholder="���¼�����" value="${ param.push_service_count }"/>
		<input type='text' class="input-small" name="push_service_type" placeholder="���¼�����" value="${ param.push_service_type }"/>
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
								<th align="center" rowName="discoverPushOfficeId" orderName="discover_push_office_id:DESC" title='����'>����</th>
								<!-- ������  ������id-->   
								<th align="center" rowName="pushUserId" orderName="push_user_id:DESC" title='������id'>������id</th>
								<!-- ������  ��������Ϣ-->   
								<th align="center" rowName="pushUserInfo" orderName="push_user_info:DESC" title='��������Ϣ'>��������Ϣ</th>
								<!-- ������  �������ĸ��û���id-->   
								<th align="center" rowName="fromUserId" orderName="from_user_id:DESC" title='�������ĸ��û���id'>�������ĸ��û���id</th>
								<!-- ������  �������ĸ��û���Ϣ-->   
								<th align="center" rowName="fromUserInfo" orderName="from_user_info:DESC" title='�������ĸ��û���Ϣ'>�������ĸ��û���Ϣ</th>
								<!-- ������  ������id-->   
								<th align="center" rowName="toUserId" orderName="to_user_id:DESC" title='������id'>������id</th>
								<!-- ������  ��������Ϣ-->   
								<th align="center" rowName="toUserInfo" orderName="to_user_info:DESC" title='��������Ϣ'>��������Ϣ</th>
								<!-- ������  100������-->   
								<th align="center" rowName="innerPushType" orderName="inner_push_type:DESC" title='100������'>100������</th>
								<!-- ������  ��δ����-->   
								<th align="center" rowName="innerPushSubType" orderName="inner_push_sub_type:DESC" title='��δ����'>��δ����</th>
								<!-- ������  ���ͱ���-->   
								<th align="center" rowName="pushServiceTitle" orderName="push_service_title:DESC" title='���ͱ���'>���ͱ���</th>
								<!-- ������  ��������-->   
								<th align="center" rowName="pushServiceMsg" orderName="push_service_msg:DESC" title='��������'>��������</th>
								<!-- ������  ����ҵ��id-->   
								<th align="center" rowName="pushServiceId" orderName="push_service_id:DESC" title='����ҵ��id'>����ҵ��id</th>
								<!-- ������  ��� �����ҳ�Ա 1���룬2ͬ�⣬3�ܾ�4���� 5����-->   
								<th align="center" rowName="pushServiceMsgStatus" orderName="push_service_msg_status:DESC" title='��� �����ҳ�Ա 1���룬2ͬ�⣬3�ܾ�4���� 5����'>��� �����ҳ�Ա 1���룬2ͬ�⣬3�ܾ�4���� 5����</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  -->   
								<th align="center" rowName="remark" orderName="remark:DESC" title=''></th>
								<!-- ������  1�Ѵ��� 2δ����-->   
								<th align="center" rowName="pushStatus" orderName="push_status:DESC" title='1�Ѵ��� 2δ����'>1�Ѵ��� 2δ����</th>
								<!-- ������  ����Ǯ *100-->   
								<th align="center" rowName="pushServiceMoney" orderName="push_service_money:DESC" title='����Ǯ *100'>����Ǯ *100</th>
								<!-- ������  ���¼�����-->   
								<th align="center" rowName="pushServiceCount" orderName="push_service_count:DESC" title='���¼�����'>���¼�����</th>
								<!-- ������  ���¼�����-->   
								<th align="center" rowName="pushServiceType" orderName="push_service_type:DESC" title='���¼�����'>���¼�����</th>
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
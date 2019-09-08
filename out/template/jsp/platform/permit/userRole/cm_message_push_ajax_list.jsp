<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.dhome.data.CmMessagePush" %>
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
				edit:'CmMessagePush.mc?method=editCmMessagePush&pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark=',
				del:'CmMessagePush.mc?method=deleteCmMessagePush&PK=',
				view:'CmMessagePush.mc?method=detailCmMessagePush&pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark='
			};
			var options = {
				tableId:'pageTable',
				url:'CmMessagePush.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'pkId,receiverUserId,pushType,pushUserId,pushCoterieId,subType,pushContent,pushMsgCount,createDate,opTime,opTimestamp,status,pushDesc,pushRemark'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_message_push_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="pk_id" placeholder="����" value="${ param.pk_id }"/>
		<input type='text' class="input-small" name="receiver_user_id" placeholder="�ռ���" value="${ param.receiver_user_id }"/>
		<input type='text' class="input-small" name="push_type" placeholder="Ƶ��/���ͣ�1�����ţ�2����������3������������4���������룬5��ϵͳ�������ѣ�6��Ȧ������֪ͨ��7��Ȧ������֪ͨ��8��Ȧ������֪ͨ��9���������ۣ�10������ת����11�����ӵ��ޣ�12��˽�����죩" value="${ param.push_type }"/>
		<input type='text' class="input-small" name="push_user_id" placeholder="������" value="${ param.push_user_id }"/>
		<input type='text' class="input-small" name="push_coterie_id" placeholder="Ȧ��ID" value="${ param.push_coterie_id }"/>
		<input type='text' class="input-small" name="sub_type" placeholder="" value="${ param.sub_type }"/>
		<input type='text' class="input-small" name="push_content" placeholder="��������" value="${ param.push_content }"/>
		<input type='text' class="input-small" name="push_msg_count" placeholder="��������" value="${ param.push_msg_count }"/>
		<input type='text' class="input-small" name="create_date" placeholder="����ʱ��" value="${ param.create_date }"/>
		<input type='text' class="input-small" name="op_time" placeholder="����ʱ��" value="${ param.op_time }"/>
		<input type='text' class="input-small" name="op_timestamp" placeholder="ʱ���������" value="${ param.op_timestamp }"/>
		<input type='text' class="input-small" name="status" placeholder="״̬" value="${ param.status }"/>
		<input type='text' class="input-small" name="push_desc" placeholder="����˵��" value="${ param.push_desc }"/>
		<input type='text' class="input-small" name="push_remark" placeholder="���ͱ�ע" value="${ param.push_remark }"/>
		<button type="button" id="searchBtn" class="btn btn-group-vertical">����</button>
							</div>
						</td>
						</tr>
		</table>
				</div>
			</div>
			<!-- ��ѯ������ʾ����end -->
			<!--//������ʾ�б�-->
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
								<th align="center" rowName="pkId" orderName="pk_id:DESC" title='����'>����</th>
								<!-- ������  �ռ���-->   
								<th align="center" rowName="receiverUserId" orderName="receiver_user_id:DESC" title='�ռ���'>�ռ���</th>
								<!-- ������  Ƶ��/���ͣ�1�����ţ�2����������3������������4���������룬5��ϵͳ�������ѣ�6��Ȧ������֪ͨ��7��Ȧ������֪ͨ��8��Ȧ������֪ͨ��9���������ۣ�10������ת����11�����ӵ��ޣ�12��˽�����죩-->   
								<th align="center" rowName="pushType" orderName="push_type:DESC" title='Ƶ��/���ͣ�1�����ţ�2����������3������������4���������룬5��ϵͳ�������ѣ�6��Ȧ������֪ͨ��7��Ȧ������֪ͨ��8��Ȧ������֪ͨ��9���������ۣ�10������ת����11�����ӵ��ޣ�12��˽�����죩'>Ƶ��/���ͣ�1�����ţ�2����������3������������4���������룬5��ϵͳ�������ѣ�6��Ȧ������֪ͨ��7��Ȧ������֪ͨ��8��Ȧ������֪ͨ��9���������ۣ�10������ת����11�����ӵ��ޣ�12��˽�����죩</th>
								<!-- ������  ������-->   
								<th align="center" rowName="pushUserId" orderName="push_user_id:DESC" title='������'>������</th>
								<!-- ������  Ȧ��ID-->   
								<th align="center" rowName="pushCoterieId" orderName="push_coterie_id:DESC" title='Ȧ��ID'>Ȧ��ID</th>
								<!-- ������  -->   
								<th align="center" rowName="subType" orderName="sub_type:DESC" title=''></th>
								<!-- ������  ��������-->   
								<th align="center" rowName="pushContent" orderName="push_content:DESC" title='��������'>��������</th>
								<!-- ������  ��������-->   
								<th align="center" rowName="pushMsgCount" orderName="push_msg_count:DESC" title='��������'>��������</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createDate" orderName="create_date:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="opTime" orderName="op_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ʱ���������-->   
								<th align="center" rowName="opTimestamp" orderName="op_timestamp:DESC" title='ʱ���������'>ʱ���������</th>
								<!-- ������  ״̬-->   
								<th align="center" rowName="status" orderName="status:DESC" title='״̬'>״̬</th>
								<!-- ������  ����˵��-->   
								<th align="center" rowName="pushDesc" orderName="push_desc:DESC" title='����˵��'>����˵��</th>
								<!-- ������  ���ͱ�ע-->   
								<th align="center" rowName="pushRemark" orderName="push_remark:DESC" title='���ͱ�ע'>���ͱ�ע</th>
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
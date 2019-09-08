<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.UserCmccAdviceComment" %>
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
				edit:'UserCmccAdviceComment.mc?method=editUserCmccAdviceComment&id,adviceTitle,adviceId,patientId,doctorId,createUserId,fromUserId,toUserId,commentTitle,commentText,chnanelType,createTime,optTime,remark,char1,char2,commentCmccId=',
				del:'UserCmccAdviceComment.mc?method=deleteUserCmccAdviceComment&PK=',
				view:'UserCmccAdviceComment.mc?method=detailUserCmccAdviceComment&id,adviceTitle,adviceId,patientId,doctorId,createUserId,fromUserId,toUserId,commentTitle,commentText,chnanelType,createTime,optTime,remark,char1,char2,commentCmccId='
			};
			var options = {
				tableId:'pageTable',
				url:'UserCmccAdviceComment.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,adviceTitle,adviceId,patientId,doctorId,createUserId,fromUserId,toUserId,commentTitle,commentText,chnanelType,createTime,optTime,remark,char1,char2,commentCmccId'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/user_cmcc_advice_comment_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
		<input type='text' class="input-small" name="advice_title" placeholder="��ѯ������" value="${ param.advice_title }"/>
		<input type='text' class="input-small" name="advice_id" placeholder="��ѯ��id" value="${ param.advice_id }"/>
		<input type='text' class="input-small" name="patient_id" placeholder="�û�id" value="${ param.patient_id }"/>
		<input type='text' class="input-small" name="doctor_id" placeholder="ҽ��id" value="${ param.doctor_id }"/>
		<input type='text' class="input-small" name="create_user_id" placeholder="������id" value="${ param.create_user_id }"/>
		<input type='text' class="input-small" name="from_user_id" placeholder="������id" value="${ param.from_user_id }"/>
		<input type='text' class="input-small" name="to_user_id" placeholder="��������id" value="${ param.to_user_id }"/>
		<input type='text' class="input-small" name="comment_title" placeholder="���۱���" value="${ param.comment_title }"/>
		<input type='text' class="input-small" name="comment_text" placeholder="��������" value="${ param.comment_text }"/>
		<input type='text' class="input-small" name="chnanel_type" placeholder="APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�" value="${ param.chnanel_type }"/>
		<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
		<input type='text' class="input-small" name="char1" placeholder="��ע1" value="${ param.char1 }"/>
		<input type='text' class="input-small" name="char2" placeholder="��ע2" value="${ param.char2 }"/>
		<input type='text' class="input-small" name="comment_cmcc_id" placeholder="cmcc��Ŀ������id" value="${ param.comment_cmcc_id }"/>
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
								<!-- ������  ��ѯ������-->   
								<th align="center" rowName="adviceTitle" orderName="advice_title:DESC" title='��ѯ������'>��ѯ������</th>
								<!-- ������  ��ѯ��id-->   
								<th align="center" rowName="adviceId" orderName="advice_id:DESC" title='��ѯ��id'>��ѯ��id</th>
								<!-- ������  �û�id-->   
								<th align="center" rowName="patientId" orderName="patient_id:DESC" title='�û�id'>�û�id</th>
								<!-- ������  ҽ��id-->   
								<th align="center" rowName="doctorId" orderName="doctor_id:DESC" title='ҽ��id'>ҽ��id</th>
								<!-- ������  ������id-->   
								<th align="center" rowName="createUserId" orderName="create_user_id:DESC" title='������id'>������id</th>
								<!-- ������  ������id-->   
								<th align="center" rowName="fromUserId" orderName="from_user_id:DESC" title='������id'>������id</th>
								<!-- ������  ��������id-->   
								<th align="center" rowName="toUserId" orderName="to_user_id:DESC" title='��������id'>��������id</th>
								<!-- ������  ���۱���-->   
								<th align="center" rowName="commentTitle" orderName="comment_title:DESC" title='���۱���'>���۱���</th>
								<!-- ������  ��������-->   
								<th align="center" rowName="commentText" orderName="comment_text:DESC" title='��������'>��������</th>
								<!-- ������  APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�-->   
								<th align="center" rowName="chnanelType" orderName="chnanel_type:DESC" title='APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�'>APP,CMCC,BOC �Լ�app�ĵ������ƶ��ĵ������еĵ�</th>
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
								<!-- ������  cmcc��Ŀ������id-->   
								<th align="center" rowName="commentCmccId" orderName="comment_cmcc_id:DESC" title='cmcc��Ŀ������id'>cmcc��Ŀ������id</th>
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
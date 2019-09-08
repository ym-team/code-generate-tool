<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.UserCmccFamily" %>
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
				edit:'UserCmccFamily.mc?method=editUserCmccFamily&id,userId,familyUserId,name,sex,phone,type,avatar,birthday,isdefault,isvalid,createTime,optTime=',
				del:'UserCmccFamily.mc?method=deleteUserCmccFamily&PK=',
				view:'UserCmccFamily.mc?method=detailUserCmccFamily&id,userId,familyUserId,name,sex,phone,type,avatar,birthday,isdefault,isvalid,createTime,optTime='
			};
			var options = {
				tableId:'pageTable',
				url:'UserCmccFamily.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,userId,familyUserId,name,sex,phone,type,avatar,birthday,isdefault,isvalid,createTime,optTime'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/user_cmcc_family_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
		<input type='text' class="input-small" name="user_id" placeholder="�û�Id ������" value="${ param.user_id }"/>
		<input type='text' class="input-small" name="family_user_id" placeholder="�û�Id ������" value="${ param.family_user_id }"/>
		<input type='text' class="input-small" name="name" placeholder="����" value="${ param.name }"/>
		<input type='text' class="input-small" name="sex" placeholder="�Ա� 1���� 2��Ů" value="${ param.sex }"/>
		<input type='text' class="input-small" name="phone" placeholder="�ֻ����" value="${ param.phone }"/>
		<input type='text' class="input-small" name="type" placeholder="������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա��" value="${ param.type }"/>
		<input type='text' class="input-small" name="avatar" placeholder="ͷ��" value="${ param.avatar }"/>
		<input type='text' class="input-small" name="birthday" placeholder="��������" value="${ param.birthday }"/>
		<input type='text' class="input-small" name="isdefault" placeholder="�Ƿ�Ĭ�ϣ�1���ǣ�2����" value="${ param.isdefault }"/>
		<input type='text' class="input-small" name="isvalid" placeholder="�Ƿ���Ч��0����Ч��1����Ч��" value="${ param.isvalid }"/>
		<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="������ʱ��" value="${ param.opt_time }"/>
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
								<!-- ������  �û�Id ������-->   
								<th align="center" rowName="userId" orderName="user_id:DESC" title='�û�Id ������'>�û�Id ������</th>
								<!-- ������  �û�Id ������-->   
								<th align="center" rowName="familyUserId" orderName="family_user_id:DESC" title='�û�Id ������'>�û�Id ������</th>
								<!-- ������  ����-->   
								<th align="center" rowName="name" orderName="name:DESC" title='����'>����</th>
								<!-- ������  �Ա� 1���� 2��Ů-->   
								<th align="center" rowName="sex" orderName="sex:DESC" title='�Ա� 1���� 2��Ů'>�Ա� 1���� 2��Ů</th>
								<!-- ������  �ֻ����-->   
								<th align="center" rowName="phone" orderName="phone:DESC" title='�ֻ����'>�ֻ����</th>
								<!-- ������  ������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա��-->   
								<th align="center" rowName="type" orderName="type:DESC" title='������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա��'>������ͣ�1 ������(ע���û�ʱ��Ĭ���������˵���)��2 ����ͥ��Ա��3 �������Ա��</th>
								<!-- ������  ͷ��-->   
								<th align="center" rowName="avatar" orderName="avatar:DESC" title='ͷ��'>ͷ��</th>
								<!-- ������  ��������-->   
								<th align="center" rowName="birthday" orderName="birthday:DESC" title='��������'>��������</th>
								<!-- ������  �Ƿ�Ĭ�ϣ�1���ǣ�2����-->   
								<th align="center" rowName="isdefault" orderName="isdefault:DESC" title='�Ƿ�Ĭ�ϣ�1���ǣ�2����'>�Ƿ�Ĭ�ϣ�1���ǣ�2����</th>
								<!-- ������  �Ƿ���Ч��0����Ч��1����Ч��-->   
								<th align="center" rowName="isvalid" orderName="isvalid:DESC" title='�Ƿ���Ч��0����Ч��1����Ч��'>�Ƿ���Ч��0����Ч��1����Ч��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ������ʱ��-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='������ʱ��'>������ʱ��</th>
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
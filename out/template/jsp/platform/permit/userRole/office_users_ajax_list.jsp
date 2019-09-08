<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.OfficeUsers" %>
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
				edit:'OfficeUsers.mc?method=editOfficeUsers&officeUserId,officeUserType,officeUserStatus,officeId,createTime,optTime,remark,officeIsproficient=',
				del:'OfficeUsers.mc?method=deleteOfficeUsers&PK=',
				view:'OfficeUsers.mc?method=detailOfficeUsers&officeUserId,officeUserType,officeUserStatus,officeId,createTime,optTime,remark,officeIsproficient='
			};
			var options = {
				tableId:'pageTable',
				url:'OfficeUsers.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'officeUserId,officeUserType,officeUserStatus,officeId,createTime,optTime,remark,officeIsproficient'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/office_users_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="office_user_id" placeholder="�����ҳ�Ա" value="${ param.office_user_id }"/>
		<input type='text' class="input-small" name="office_user_type" placeholder="1����Ա��2��Ա" value="${ param.office_user_type }"/>
		<input type='text' class="input-small" name="office_user_status" placeholder="1���룬2ͬ�⣬3�ܾ�4����" value="${ param.office_user_status }"/>
		<input type='text' class="input-small" name="office_id" placeholder="������id" value="${ param.office_id }"/>
		<input type='text' class="input-small" name="create_time" placeholder="�����ҳ�Ա����ʱ��" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
		<input type='text' class="input-small" name="office_isproficient" placeholder="" value="${ param.office_isproficient }"/>
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
								<!-- ������  �����ҳ�Ա-->   
								<th align="center" rowName="officeUserId" orderName="office_user_id:DESC" title='�����ҳ�Ա'>�����ҳ�Ա</th>
								<!-- ������  1����Ա��2��Ա-->   
								<th align="center" rowName="officeUserType" orderName="office_user_type:DESC" title='1����Ա��2��Ա'>1����Ա��2��Ա</th>
								<!-- ������  1���룬2ͬ�⣬3�ܾ�4����-->   
								<th align="center" rowName="officeUserStatus" orderName="office_user_status:DESC" title='1���룬2ͬ�⣬3�ܾ�4����'>1���룬2ͬ�⣬3�ܾ�4����</th>
								<!-- ������  ������id-->   
								<th align="center" rowName="officeId" orderName="office_id:DESC" title='������id'>������id</th>
								<!-- ������  �����ҳ�Ա����ʱ��-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='�����ҳ�Ա����ʱ��'>�����ҳ�Ա����ʱ��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ��ע-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������  -->   
								<th align="center" rowName="officeIsproficient" orderName="office_isproficient:DESC" title=''></th>
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
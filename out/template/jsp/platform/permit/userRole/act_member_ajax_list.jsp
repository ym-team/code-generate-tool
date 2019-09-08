<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.act.data.ActMember" %>
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
				edit:'ActMember.mc?method=editActMember&id,memberId,memberStatus,memberType,actId,actPhone,memberFollowCount,actMemberName,createTime,optTime,remark,char1=',
				del:'ActMember.mc?method=deleteActMember&PK=',
				view:'ActMember.mc?method=detailActMember&id,memberId,memberStatus,memberType,actId,actPhone,memberFollowCount,actMemberName,createTime,optTime,remark,char1='
			};
			var options = {
				tableId:'pageTable',
				url:'ActMember.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,memberId,memberStatus,memberType,actId,actPhone,memberFollowCount,actMemberName,createTime,optTime,remark,char1'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/act_member_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
		<input type='text' class="input-small" name="member_id" placeholder="��Աid" value="${ param.member_id }"/>
		<input type='text' class="input-small" name="member_status" placeholder="1.������  2.�ɹ�  3.�ܾ�  Ĭ��Ϊ2" value="${ param.member_status }"/>
		<input type='text' class="input-small" name="member_type" placeholder="1.�������  2.��ͨ�μӳ�Ա" value="${ param.member_type }"/>
		<input type='text' class="input-small" name="act_id" placeholder="�id" value="${ param.act_id }"/>
		<input type='text' class="input-small" name="act_phone" placeholder="�����˵绰" value="${ param.act_phone }"/>
		<input type='text' class="input-small" name="member_follow_count" placeholder="�������� Ĭ��Ϊ1 ������" value="${ param.member_follow_count }"/>
		<input type='text' class="input-small" name="act_member_name" placeholder="����������" value="${ param.act_member_name }"/>
		<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
		<input type='text' class="input-small" name="char1" placeholder="��ע1" value="${ param.char1 }"/>
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
								<th align="center" rowName="id" orderName="id:DESC" title='����'>����</th>
								<!-- ������  ��Աid-->   
								<th align="center" rowName="memberId" orderName="member_id:DESC" title='��Աid'>��Աid</th>
								<!-- ������  1.������  2.�ɹ�  3.�ܾ�  Ĭ��Ϊ2-->   
								<th align="center" rowName="memberStatus" orderName="member_status:DESC" title='1.������  2.�ɹ�  3.�ܾ�  Ĭ��Ϊ2'>1.������  2.�ɹ�  3.�ܾ�  Ĭ��Ϊ2</th>
								<!-- ������  1.�������  2.��ͨ�μӳ�Ա-->   
								<th align="center" rowName="memberType" orderName="member_type:DESC" title='1.�������  2.��ͨ�μӳ�Ա'>1.�������  2.��ͨ�μӳ�Ա</th>
								<!-- ������  �id-->   
								<th align="center" rowName="actId" orderName="act_id:DESC" title='�id'>�id</th>
								<!-- ������  �����˵绰-->   
								<th align="center" rowName="actPhone" orderName="act_phone:DESC" title='�����˵绰'>�����˵绰</th>
								<!-- ������  �������� Ĭ��Ϊ1 ������-->   
								<th align="center" rowName="memberFollowCount" orderName="member_follow_count:DESC" title='�������� Ĭ��Ϊ1 ������'>�������� Ĭ��Ϊ1 ������</th>
								<!-- ������  ����������-->   
								<th align="center" rowName="actMemberName" orderName="act_member_name:DESC" title='����������'>����������</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ��ע-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������  ��ע1-->   
								<th align="center" rowName="char1" orderName="char1:DESC" title='��ע1'>��ע1</th>
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
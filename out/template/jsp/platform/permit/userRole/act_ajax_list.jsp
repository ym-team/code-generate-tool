<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.act.data.Act" %>
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
				edit:'Act.mc?method=editAct&id,title,actStarttime,actEndtime,actAddress,actDesc,actType,actMoney,actPicUrl,actCreateUserId,actStatus,actMemberCount,actLikeCount,createTime,optTime,remark,char2=',
				del:'Act.mc?method=deleteAct&PK=',
				view:'Act.mc?method=detailAct&id,title,actStarttime,actEndtime,actAddress,actDesc,actType,actMoney,actPicUrl,actCreateUserId,actStatus,actMemberCount,actLikeCount,createTime,optTime,remark,char2='
			};
			var options = {
				tableId:'pageTable',
				url:'Act.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,title,actStarttime,actEndtime,actAddress,actDesc,actType,actMoney,actPicUrl,actCreateUserId,actStatus,actMemberCount,actLikeCount,createTime,optTime,remark,char2'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/act_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
		<input type='text' class="input-small" name="title" placeholder="�����" value="${ param.title }"/>
		<input type='text' class="input-small" name="act_starttime" placeholder="����ʱ��" value="${ param.act_starttime }"/>
		<input type='text' class="input-small" name="act_endtime" placeholder="����ʱ��" value="${ param.act_endtime }"/>
		<input type='text' class="input-small" name="act_address" placeholder="���ַ" value="${ param.act_address }"/>
		<input type='text' class="input-small" name="act_desc" placeholder="����" value="${ param.act_desc }"/>
		<input type='text' class="input-small" name="act_type" placeholder="0 ��� 1 �շ� Ĭ��Ϊ0" value="${ param.act_type }"/>
		<input type='text' class="input-small" name="act_money" placeholder="�����" value="${ param.act_money }"/>
		<input type='text' class="input-small" name="act_pic_url" placeholder="�����ͼ" value="${ param.act_pic_url }"/>
		<input type='text' class="input-small" name="act_create_user_id" placeholder="������id" value="${ param.act_create_user_id }"/>
		<input type='text' class="input-small" name="act_status" placeholder="�״̬ 1 ����� 2 �ɹ� 3 �ܾ� 4 ����" value="${ param.act_status }"/>
		<input type='text' class="input-small" name="act_member_count" placeholder="��Ա�� Ĭ��Ϊ1" value="${ param.act_member_count }"/>
		<input type='text' class="input-small" name="act_like_count" placeholder="������ Ĭ��Ϊ0" value="${ param.act_like_count }"/>
		<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
		<input type='text' class="input-small" name="char2" placeholder="��ע1" value="${ param.char2 }"/>
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
								<!-- ������  �����-->   
								<th align="center" rowName="title" orderName="title:DESC" title='�����'>�����</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="actStarttime" orderName="act_starttime:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="actEndtime" orderName="act_endtime:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ���ַ-->   
								<th align="center" rowName="actAddress" orderName="act_address:DESC" title='���ַ'>���ַ</th>
								<!-- ������  ����-->   
								<th align="center" rowName="actDesc" orderName="act_desc:DESC" title='����'>����</th>
								<!-- ������  0 ��� 1 �շ� Ĭ��Ϊ0-->   
								<th align="center" rowName="actType" orderName="act_type:DESC" title='0 ��� 1 �շ� Ĭ��Ϊ0'>0 ��� 1 �շ� Ĭ��Ϊ0</th>
								<!-- ������  �����-->   
								<th align="center" rowName="actMoney" orderName="act_money:DESC" title='�����'>�����</th>
								<!-- ������  �����ͼ-->   
								<th align="center" rowName="actPicUrl" orderName="act_pic_url:DESC" title='�����ͼ'>�����ͼ</th>
								<!-- ������  ������id-->   
								<th align="center" rowName="actCreateUserId" orderName="act_create_user_id:DESC" title='������id'>������id</th>
								<!-- ������  �״̬ 1 ����� 2 �ɹ� 3 �ܾ� 4 ����-->   
								<th align="center" rowName="actStatus" orderName="act_status:DESC" title='�״̬ 1 ����� 2 �ɹ� 3 �ܾ� 4 ����'>�״̬ 1 ����� 2 �ɹ� 3 �ܾ� 4 ����</th>
								<!-- ������  ��Ա�� Ĭ��Ϊ1-->   
								<th align="center" rowName="actMemberCount" orderName="act_member_count:DESC" title='��Ա�� Ĭ��Ϊ1'>��Ա�� Ĭ��Ϊ1</th>
								<!-- ������  ������ Ĭ��Ϊ0-->   
								<th align="center" rowName="actLikeCount" orderName="act_like_count:DESC" title='������ Ĭ��Ϊ0'>������ Ĭ��Ϊ0</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ��ע-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������  ��ע1-->   
								<th align="center" rowName="char2" orderName="char2:DESC" title='��ע1'>��ע1</th>
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
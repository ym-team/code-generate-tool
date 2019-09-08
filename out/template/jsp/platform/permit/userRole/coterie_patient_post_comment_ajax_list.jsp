<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CoteriePatientPostComment" %>
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
				edit:'CoteriePatientPostComment.mc?method=editCoteriePatientPostComment&id,commentDesc,picUrl,commentType,commentStatus,memberId,channelType,postId,coterieId,createTime,optTime,remark,char1=',
				del:'CoteriePatientPostComment.mc?method=deleteCoteriePatientPostComment&PK=',
				view:'CoteriePatientPostComment.mc?method=detailCoteriePatientPostComment&id,commentDesc,picUrl,commentType,commentStatus,memberId,channelType,postId,coterieId,createTime,optTime,remark,char1='
			};
			var options = {
				tableId:'pageTable',
				url:'CoteriePatientPostComment.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,commentDesc,picUrl,commentType,commentStatus,memberId,channelType,postId,coterieId,createTime,optTime,remark,char1'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/coterie_patient_post_comment_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
		<input type='text' class="input-small" name="comment_desc" placeholder="��������" value="${ param.comment_desc }"/>
		<input type='text' class="input-small" name="pic_url" placeholder="���ӻظ�ͼƬ" value="${ param.pic_url }"/>
		<input type='text' class="input-small" name="comment_type" placeholder="1 ΪȦ�ӻظ� 2 ƽ̨����ظ� ���coterie_post_public.POST_CHANNEL_TYPEֵ " value="${ param.comment_type }"/>
		<input type='text' class="input-small" name="comment_status" placeholder="�ظ�״̬ 1 ����� 2 ͨ��  3 ��ͨ�� Ĭ��Ϊ2" value="${ param.comment_status }"/>
		<input type='text' class="input-small" name="member_id" placeholder="�����û�id" value="${ param.member_id }"/>
		<input type='text' class="input-small" name="channel_type" placeholder="�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp" value="${ param.channel_type }"/>
		<input type='text' class="input-small" name="post_id" placeholder="����id" value="${ param.post_id }"/>
		<input type='text' class="input-small" name="coterie_id" placeholder="Ȧ��id" value="${ param.coterie_id }"/>
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
								<!-- ������  ��������-->   
								<th align="center" rowName="commentDesc" orderName="comment_desc:DESC" title='��������'>��������</th>
								<!-- ������  ���ӻظ�ͼƬ-->   
								<th align="center" rowName="picUrl" orderName="pic_url:DESC" title='���ӻظ�ͼƬ'>���ӻظ�ͼƬ</th>
								<!-- ������  1 ΪȦ�ӻظ� 2 ƽ̨����ظ� ���coterie_post_public.POST_CHANNEL_TYPEֵ -->   
								<th align="center" rowName="commentType" orderName="comment_type:DESC" title='1 ΪȦ�ӻظ� 2 ƽ̨����ظ� ���coterie_post_public.POST_CHANNEL_TYPEֵ '>1 ΪȦ�ӻظ� 2 ƽ̨����ظ� ���coterie_post_public.POST_CHANNEL_TYPEֵ </th>
								<!-- ������  �ظ�״̬ 1 ����� 2 ͨ��  3 ��ͨ�� Ĭ��Ϊ2-->   
								<th align="center" rowName="commentStatus" orderName="comment_status:DESC" title='�ظ�״̬ 1 ����� 2 ͨ��  3 ��ͨ�� Ĭ��Ϊ2'>�ظ�״̬ 1 ����� 2 ͨ��  3 ��ͨ�� Ĭ��Ϊ2</th>
								<!-- ������  �����û�id-->   
								<th align="center" rowName="memberId" orderName="member_id:DESC" title='�����û�id'>�����û�id</th>
								<!-- ������  �û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp-->   
								<th align="center" rowName="channelType" orderName="channel_type:DESC" title='�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp'>�û����� 1 ľ�޽��� 2 ��У���� 3 ��Уapp</th>
								<!-- ������  ����id-->   
								<th align="center" rowName="postId" orderName="post_id:DESC" title='����id'>����id</th>
								<!-- ������  Ȧ��id-->   
								<th align="center" rowName="coterieId" orderName="coterie_id:DESC" title='Ȧ��id'>Ȧ��id</th>
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CoteriePostPublic" %>
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
				edit:'CoteriePostPublic.mc?method=editCoteriePostPublic&id,title,postDesc,picUrl,vedioUrl,postType,postStatus,coterieId,postChannelType,postUserId,postCommentCount,createTime,optTime,remark,char1=',
				del:'CoteriePostPublic.mc?method=deleteCoteriePostPublic&PK=',
				view:'CoteriePostPublic.mc?method=detailCoteriePostPublic&id,title,postDesc,picUrl,vedioUrl,postType,postStatus,coterieId,postChannelType,postUserId,postCommentCount,createTime,optTime,remark,char1='
			};
			var options = {
				tableId:'pageTable',
				url:'CoteriePostPublic.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,title,postDesc,picUrl,vedioUrl,postType,postStatus,coterieId,postChannelType,postUserId,postCommentCount,createTime,optTime,remark,char1'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/coterie_post_public_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
		<input type='text' class="input-small" name="title" placeholder="�������" value="${ param.title }"/>
		<input type='text' class="input-small" name="post_desc" placeholder="��������" value="${ param.post_desc }"/>
		<input type='text' class="input-small" name="pic_url" placeholder="����ͼƬ ���6�� ��|�ָ�" value="${ param.pic_url }"/>
		<input type='text' class="input-small" name="vedio_url" placeholder="��Ƶurl" value="${ param.vedio_url }"/>
		<input type='text' class="input-small" name="post_type" placeholder="1 ���� 2 ���� ������Ӫ����" value="${ param.post_type }"/>
		<input type='text' class="input-small" name="post_status" placeholder="1 ����� 2 ͨ�� 3��ͨ��" value="${ param.post_status }"/>
		<input type='text' class="input-small" name="coterie_id" placeholder="Ȧ��id Ĭ��Ϊ0" value="${ param.coterie_id }"/>
		<input type='text' class="input-small" name="post_channel_type" placeholder="1 ȫƽ̨ͨ�� 2 ľ��ҽ���� 3 ľ�޽������� 4.��У����app ���� 5.��Уh5 ���� 6Ȧ���� " value="${ param.post_channel_type }"/>
		<input type='text' class="input-small" name="post_user_id" placeholder="������" value="${ param.post_user_id }"/>
		<input type='text' class="input-small" name="post_comment_count" placeholder="����������" value="${ param.post_comment_count }"/>
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
								<!-- ������  �������-->   
								<th align="center" rowName="title" orderName="title:DESC" title='�������'>�������</th>
								<!-- ������  ��������-->   
								<th align="center" rowName="postDesc" orderName="post_desc:DESC" title='��������'>��������</th>
								<!-- ������  ����ͼƬ ���6�� ��|�ָ�-->   
								<th align="center" rowName="picUrl" orderName="pic_url:DESC" title='����ͼƬ ���6�� ��|�ָ�'>����ͼƬ ���6�� ��|�ָ�</th>
								<!-- ������  ��Ƶurl-->   
								<th align="center" rowName="vedioUrl" orderName="vedio_url:DESC" title='��Ƶurl'>��Ƶurl</th>
								<!-- ������  1 ���� 2 ���� ������Ӫ����-->   
								<th align="center" rowName="postType" orderName="post_type:DESC" title='1 ���� 2 ���� ������Ӫ����'>1 ���� 2 ���� ������Ӫ����</th>
								<!-- ������  1 ����� 2 ͨ�� 3��ͨ��-->   
								<th align="center" rowName="postStatus" orderName="post_status:DESC" title='1 ����� 2 ͨ�� 3��ͨ��'>1 ����� 2 ͨ�� 3��ͨ��</th>
								<!-- ������  Ȧ��id Ĭ��Ϊ0-->   
								<th align="center" rowName="coterieId" orderName="coterie_id:DESC" title='Ȧ��id Ĭ��Ϊ0'>Ȧ��id Ĭ��Ϊ0</th>
								<!-- ������  1 ȫƽ̨ͨ�� 2 ľ��ҽ���� 3 ľ�޽������� 4.��У����app ���� 5.��Уh5 ���� 6Ȧ���� -->   
								<th align="center" rowName="postChannelType" orderName="post_channel_type:DESC" title='1 ȫƽ̨ͨ�� 2 ľ��ҽ���� 3 ľ�޽������� 4.��У����app ���� 5.��Уh5 ���� 6Ȧ���� '>1 ȫƽ̨ͨ�� 2 ľ��ҽ���� 3 ľ�޽������� 4.��У����app ���� 5.��Уh5 ���� 6Ȧ���� </th>
								<!-- ������  ������-->   
								<th align="center" rowName="postUserId" orderName="post_user_id:DESC" title='������'>������</th>
								<!-- ������  ����������-->   
								<th align="center" rowName="postCommentCount" orderName="post_comment_count:DESC" title='����������'>����������</th>
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
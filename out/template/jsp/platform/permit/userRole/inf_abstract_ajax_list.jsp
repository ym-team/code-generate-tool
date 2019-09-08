<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.InfAbstract" %>
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
				edit:'InfAbstract.mc?method=editInfAbstract&infId,infTitle,infImg,infCreateTime,infGerTime,infSignTime,imgExtend,infTab,infShowType=',
				del:'InfAbstract.mc?method=deleteInfAbstract&PK=',
				view:'InfAbstract.mc?method=detailInfAbstract&infId,infTitle,infImg,infCreateTime,infGerTime,infSignTime,imgExtend,infTab,infShowType='
			};
			var options = {
				tableId:'pageTable',
				url:'InfAbstract.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'infId,infTitle,infImg,infCreateTime,infGerTime,infSignTime,imgExtend,infTab,infShowType'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/inf_abstract_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="inf_id" placeholder="" value="${ param.inf_id }"/>
		<input type='text' class="input-small" name="inf_title" placeholder="��Ѷ����" value="${ param.inf_title }"/>
		<input type='text' class="input-small" name="inf_img" placeholder="��ѶͼƬ" value="${ param.inf_img }"/>
		<input type='text' class="input-small" name="inf_create_time" placeholder="��ѶժҪ����ʱ��" value="${ param.inf_create_time }"/>
		<input type='text' class="input-small" name="inf_ger_time" placeholder="ժҪ���ʱ��" value="${ param.inf_ger_time }"/>
		<input type='text' class="input-small" name="inf_sign_time" placeholder="ժҪ���ʱ��" value="${ param.inf_sign_time }"/>
		<input type='text' class="input-small" name="img_extend" placeholder="ժҪ��չͼƬ" value="${ param.img_extend }"/>
		<input type='text' class="input-small" name="inf_tab" placeholder="ժҪ��ǩ" value="${ param.inf_tab }"/>
		<input type='text' class="input-small" name="inf_show_type" placeholder="ժҪ��ʾ����" value="${ param.inf_show_type }"/>
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
								<!-- ������  -->   
								<th align="center" rowName="infId" orderName="inf_id:DESC" title=''></th>
								<!-- ������  ��Ѷ����-->   
								<th align="center" rowName="infTitle" orderName="inf_title:DESC" title='��Ѷ����'>��Ѷ����</th>
								<!-- ������  ��ѶͼƬ-->   
								<th align="center" rowName="infImg" orderName="inf_img:DESC" title='��ѶͼƬ'>��ѶͼƬ</th>
								<!-- ������  ��ѶժҪ����ʱ��-->   
								<th align="center" rowName="infCreateTime" orderName="inf_create_time:DESC" title='��ѶժҪ����ʱ��'>��ѶժҪ����ʱ��</th>
								<!-- ������  ժҪ���ʱ��-->   
								<th align="center" rowName="infGerTime" orderName="inf_ger_time:DESC" title='ժҪ���ʱ��'>ժҪ���ʱ��</th>
								<!-- ������  ժҪ���ʱ��-->   
								<th align="center" rowName="infSignTime" orderName="inf_sign_time:DESC" title='ժҪ���ʱ��'>ժҪ���ʱ��</th>
								<!-- ������  ժҪ��չͼƬ-->   
								<th align="center" rowName="imgExtend" orderName="img_extend:DESC" title='ժҪ��չͼƬ'>ժҪ��չͼƬ</th>
								<!-- ������  ժҪ��ǩ-->   
								<th align="center" rowName="infTab" orderName="inf_tab:DESC" title='ժҪ��ǩ'>ժҪ��ǩ</th>
								<!-- ������  ժҪ��ʾ����-->   
								<th align="center" rowName="infShowType" orderName="inf_show_type:DESC" title='ժҪ��ʾ����'>ժҪ��ʾ����</th>
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
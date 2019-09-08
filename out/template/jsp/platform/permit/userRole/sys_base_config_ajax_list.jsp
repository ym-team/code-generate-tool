<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.SysBaseConfig" %>
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
				edit:'SysBaseConfig.mc?method=editSysBaseConfig&pkId,objType,objId,objName,objExt,remark,objSts,pObjId,rootObjId,objLevel=',
				del:'SysBaseConfig.mc?method=deleteSysBaseConfig&PK=',
				view:'SysBaseConfig.mc?method=detailSysBaseConfig&pkId,objType,objId,objName,objExt,remark,objSts,pObjId,rootObjId,objLevel='
			};
			var options = {
				tableId:'pageTable',
				url:'SysBaseConfig.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'pkId,objType,objId,objName,objExt,remark,objSts,pObjId,rootObjId,objLevel'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/sys_base_config_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="pk_id" placeholder="����" value="${ param.pk_id }"/>
		<input type='text' class="input-small" name="obj_type" placeholder="����ʹ��              ����@�ֶ��� eg: TABLE_NAME@COLOUM_NAME" value="${ param.obj_type }"/>
		<input type='text' class="input-small" name="obj_id" placeholder="���ID" value="${ param.obj_id }"/>
		<input type='text' class="input-small" name="obj_name" placeholder="������" value="${ param.obj_name }"/>
		<input type='text' class="input-small" name="obj_ext" placeholder="�����չ����" value="${ param.obj_ext }"/>
		<input type='text' class="input-small" name="remark" placeholder="���" value="${ param.remark }"/>
		<input type='text' class="input-small" name="obj_sts" placeholder="0:ʧЧ 1:���� " value="${ param.obj_sts }"/>
		<input type='text' class="input-small" name="p_obj_id" placeholder="���ڵ�" value="${ param.p_obj_id }"/>
		<input type='text' class="input-small" name="root_obj_id" placeholder="��ڵ�" value="${ param.root_obj_id }"/>
		<input type='text' class="input-small" name="obj_level" placeholder="�㼶" value="${ param.obj_level }"/>
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
								<th align="center" rowName="pkId" orderName="pk_id:DESC" title='����'>����</th>
								<!-- ������  ����ʹ��              ����@�ֶ��� eg: TABLE_NAME@COLOUM_NAME-->   
								<th align="center" rowName="objType" orderName="obj_type:DESC" title='����ʹ��              ����@�ֶ��� eg: TABLE_NAME@COLOUM_NAME'>����ʹ��              ����@�ֶ��� eg: TABLE_NAME@COLOUM_NAME</th>
								<!-- ������  ���ID-->   
								<th align="center" rowName="objId" orderName="obj_id:DESC" title='���ID'>���ID</th>
								<!-- ������  ������-->   
								<th align="center" rowName="objName" orderName="obj_name:DESC" title='������'>������</th>
								<!-- ������  �����չ����-->   
								<th align="center" rowName="objExt" orderName="obj_ext:DESC" title='�����չ����'>�����չ����</th>
								<!-- ������  ���-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='���'>���</th>
								<!-- ������  0:ʧЧ 1:���� -->   
								<th align="center" rowName="objSts" orderName="obj_sts:DESC" title='0:ʧЧ 1:���� '>0:ʧЧ 1:���� </th>
								<!-- ������  ���ڵ�-->   
								<th align="center" rowName="pObjId" orderName="p_obj_id:DESC" title='���ڵ�'>���ڵ�</th>
								<!-- ������  ��ڵ�-->   
								<th align="center" rowName="rootObjId" orderName="root_obj_id:DESC" title='��ڵ�'>��ڵ�</th>
								<!-- ������  �㼶-->   
								<th align="center" rowName="objLevel" orderName="obj_level:DESC" title='�㼶'>�㼶</th>
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
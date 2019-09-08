<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmUserAddress" %>
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
				edit:'CmUserAddress.mc?method=editCmUserAddress&pkId,userId,objUserId,objUserName,isDefault,phoneNum,provinceId,cityId,countyId,street,address,gps,createDate,status,opTime,remark=',
				del:'CmUserAddress.mc?method=deleteCmUserAddress&PK=',
				view:'CmUserAddress.mc?method=detailCmUserAddress&pkId,userId,objUserId,objUserName,isDefault,phoneNum,provinceId,cityId,countyId,street,address,gps,createDate,status,opTime,remark='
			};
			var options = {
				tableId:'pageTable',
				url:'CmUserAddress.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'pkId,userId,objUserId,objUserName,isDefault,phoneNum,provinceId,cityId,countyId,street,address,gps,createDate,status,opTime,remark'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_user_address_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="pk_id" placeholder="����" value="${ param.pk_id }"/>
		<input type='text' class="input-small" name="user_id" placeholder="�û�ID" value="${ param.user_id }"/>
		<input type='text' class="input-small" name="obj_user_id" placeholder="Ŀ���û�ID" value="${ param.obj_user_id }"/>
		<input type='text' class="input-small" name="obj_user_name" placeholder="�û�����" value="${ param.obj_user_name }"/>
		<input type='text' class="input-small" name="is_default" placeholder="�Ƿ�Ĭ��   0:��Ĭ�� 1:Ĭ��" value="${ param.is_default }"/>
		<input type='text' class="input-small" name="phone_num" placeholder="" value="${ param.phone_num }"/>
		<input type='text' class="input-small" name="province_id" placeholder="ʡ��" value="${ param.province_id }"/>
		<input type='text' class="input-small" name="city_id" placeholder="����" value="${ param.city_id }"/>
		<input type='text' class="input-small" name="county_id" placeholder="����" value="${ param.county_id }"/>
		<input type='text' class="input-small" name="street" placeholder="���ڽֵ�" value="${ param.street }"/>
		<input type='text' class="input-small" name="address" placeholder="��ϸ��ַ" value="${ param.address }"/>
		<input type='text' class="input-small" name="gps" placeholder="GPS���" value="${ param.gps }"/>
		<input type='text' class="input-small" name="create_date" placeholder="����ʱ��" value="${ param.create_date }"/>
		<input type='text' class="input-small" name="status" placeholder="״̬             0:  ��Ч    1:��Ч" value="${ param.status }"/>
		<input type='text' class="input-small" name="op_time" placeholder="����ʱ��" value="${ param.op_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
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
								<!-- ������  �û�ID-->   
								<th align="center" rowName="userId" orderName="user_id:DESC" title='�û�ID'>�û�ID</th>
								<!-- ������  Ŀ���û�ID-->   
								<th align="center" rowName="objUserId" orderName="obj_user_id:DESC" title='Ŀ���û�ID'>Ŀ���û�ID</th>
								<!-- ������  �û�����-->   
								<th align="center" rowName="objUserName" orderName="obj_user_name:DESC" title='�û�����'>�û�����</th>
								<!-- ������  �Ƿ�Ĭ��   0:��Ĭ�� 1:Ĭ��-->   
								<th align="center" rowName="isDefault" orderName="is_default:DESC" title='�Ƿ�Ĭ��   0:��Ĭ�� 1:Ĭ��'>�Ƿ�Ĭ��   0:��Ĭ�� 1:Ĭ��</th>
								<!-- ������  -->   
								<th align="center" rowName="phoneNum" orderName="phone_num:DESC" title=''></th>
								<!-- ������  ʡ��-->   
								<th align="center" rowName="provinceId" orderName="province_id:DESC" title='ʡ��'>ʡ��</th>
								<!-- ������  ����-->   
								<th align="center" rowName="cityId" orderName="city_id:DESC" title='����'>����</th>
								<!-- ������  ����-->   
								<th align="center" rowName="countyId" orderName="county_id:DESC" title='����'>����</th>
								<!-- ������  ���ڽֵ�-->   
								<th align="center" rowName="street" orderName="street:DESC" title='���ڽֵ�'>���ڽֵ�</th>
								<!-- ������  ��ϸ��ַ-->   
								<th align="center" rowName="address" orderName="address:DESC" title='��ϸ��ַ'>��ϸ��ַ</th>
								<!-- ������  GPS���-->   
								<th align="center" rowName="gps" orderName="gps:DESC" title='GPS���'>GPS���</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createDate" orderName="create_date:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ״̬             0:  ��Ч    1:��Ч-->   
								<th align="center" rowName="status" orderName="status:DESC" title='״̬             0:  ��Ч    1:��Ч'>״̬             0:  ��Ч    1:��Ч</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="opTime" orderName="op_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ��ע-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.SysHospitalNew" %>
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
				edit:'SysHospitalNew.mc?method=editSysHospitalNew&id,hospitalName,provinceCode,cityCode,hospitalLevel,hospitalLevelName,hospitalPro,hospitalProName,ctityLevel,hospitalSts,createTime,optTime,remark=',
				del:'SysHospitalNew.mc?method=deleteSysHospitalNew&PK=',
				view:'SysHospitalNew.mc?method=detailSysHospitalNew&id,hospitalName,provinceCode,cityCode,hospitalLevel,hospitalLevelName,hospitalPro,hospitalProName,ctityLevel,hospitalSts,createTime,optTime,remark='
			};
			var options = {
				tableId:'pageTable',
				url:'SysHospitalNew.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,hospitalName,provinceCode,cityCode,hospitalLevel,hospitalLevelName,hospitalPro,hospitalProName,ctityLevel,hospitalSts,createTime,optTime,remark'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/sys_hospital_new_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
		<input type='text' class="input-small" name="hospital_name" placeholder="ҽԺ���" value="${ param.hospital_name }"/>
		<input type='text' class="input-small" name="province_code" placeholder="ʡ���" value="${ param.province_code }"/>
		<input type='text' class="input-small" name="city_code" placeholder="���б��" value="${ param.city_code }"/>
		<input type='text' class="input-small" name="hospital_level" placeholder="3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ� " value="${ param.hospital_level }"/>
		<input type='text' class="input-small" name="hospital_level_name" placeholder="������� " value="${ param.hospital_level_name }"/>
		<input type='text' class="input-small" name="hospital_pro" placeholder="ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪" value="${ param.hospital_pro }"/>
		<input type='text' class="input-small" name="hospital_pro_name" placeholder="ҽԺ���� ���" value="${ param.hospital_pro_name }"/>
		<input type='text' class="input-small" name="ctity_level" placeholder="1 ���Ϲ��� 2 ���߳��� 3 ���߳���" value="${ param.ctity_level }"/>
		<input type='text' class="input-small" name="hospital_sts" placeholder="1:���� 2������" value="${ param.hospital_sts }"/>
		<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
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
								<th align="center" rowName="id" orderName="id:DESC" title='����'>����</th>
								<!-- ������  ҽԺ���-->   
								<th align="center" rowName="hospitalName" orderName="hospital_name:DESC" title='ҽԺ���'>ҽԺ���</th>
								<!-- ������  ʡ���-->   
								<th align="center" rowName="provinceCode" orderName="province_code:DESC" title='ʡ���'>ʡ���</th>
								<!-- ������  ���б��-->   
								<th align="center" rowName="cityCode" orderName="city_code:DESC" title='���б��'>���б��</th>
								<!-- ������  3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ� -->   
								<th align="center" rowName="hospitalLevel" orderName="hospital_level:DESC" title='3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ� '>3 �� 303 �׵�  302 �ҵ� 2 ����  203 �����׵�  202 �ҵ�  1 һ�� 103 �׵� 102 �ҵ� </th>
								<!-- ������  ������� -->   
								<th align="center" rowName="hospitalLevelName" orderName="hospital_level_name:DESC" title='������� '>������� </th>
								<!-- ������  ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪-->   
								<th align="center" rowName="hospitalPro" orderName="hospital_pro:DESC" title='ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪'>ҽԺ���� 1 ��ͯ������ 2.δ֪ 3.δ֪</th>
								<!-- ������  ҽԺ���� ���-->   
								<th align="center" rowName="hospitalProName" orderName="hospital_pro_name:DESC" title='ҽԺ���� ���'>ҽԺ���� ���</th>
								<!-- ������  1 ���Ϲ��� 2 ���߳��� 3 ���߳���-->   
								<th align="center" rowName="ctityLevel" orderName="ctity_level:DESC" title='1 ���Ϲ��� 2 ���߳��� 3 ���߳���'>1 ���Ϲ��� 2 ���߳��� 3 ���߳���</th>
								<!-- ������  1:���� 2������-->   
								<th align="center" rowName="hospitalSts" orderName="hospital_sts:DESC" title='1:���� 2������'>1:���� 2������</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
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
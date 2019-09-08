<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.OfficeService" %>
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
				edit:'OfficeService.mc?method=editOfficeService&officeServiceId,officeServiceName,officeServiceUrls,officeServiceType,officeServiceStatus,officeServiceAttrCount,officeServiceAttrMinprice,officeServiceAttrMaxprice,officeServiceCommentCount,systemType,officeId,createTime,optTime,remark,officeServiceSold,peopleNum,schedualIsopen,subSystemType,officeServiceAttrStarttime,officeServiceAttrEndtime,char1,char2=',
				del:'OfficeService.mc?method=deleteOfficeService&PK=',
				view:'OfficeService.mc?method=detailOfficeService&officeServiceId,officeServiceName,officeServiceUrls,officeServiceType,officeServiceStatus,officeServiceAttrCount,officeServiceAttrMinprice,officeServiceAttrMaxprice,officeServiceCommentCount,systemType,officeId,createTime,optTime,remark,officeServiceSold,peopleNum,schedualIsopen,subSystemType,officeServiceAttrStarttime,officeServiceAttrEndtime,char1,char2='
			};
			var options = {
				tableId:'pageTable',
				url:'OfficeService.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'officeServiceId,officeServiceName,officeServiceUrls,officeServiceType,officeServiceStatus,officeServiceAttrCount,officeServiceAttrMinprice,officeServiceAttrMaxprice,officeServiceCommentCount,systemType,officeId,createTime,optTime,remark,officeServiceSold,peopleNum,schedualIsopen,subSystemType,officeServiceAttrStarttime,officeServiceAttrEndtime,char1,char2'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/office_service_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="office_service_id" placeholder="�����ҷ���������id" value="${ param.office_service_id }"/>
		<input type='text' class="input-small" name="office_service_name" placeholder="������Ŀ���" value="${ param.office_service_name }"/>
		<input type='text' class="input-small" name="office_service_urls" placeholder="������url,ƴ���ַ�" value="${ param.office_service_urls }"/>
		<input type='text' class="input-small" name="office_service_type" placeholder="1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵�����" value="${ param.office_service_type }"/>
		<input type='text' class="input-small" name="office_service_status" placeholder="1�����ߣ�2���ߣ�3������ ��ʱĬ����������" value="${ param.office_service_status }"/>
		<input type='text' class="input-small" name="office_service_attr_count" placeholder="����������� ����һ�����������¼ʱ�����1" value="${ param.office_service_attr_count }"/>
		<input type='text' class="input-small" name="office_service_attr_minprice" placeholder="��С��� (������������ʱ����Ҫ�б�)" value="${ param.office_service_attr_minprice }"/>
		<input type='text' class="input-small" name="office_service_attr_maxprice" placeholder="�����(������������ʱ����Ҫ�б�)" value="${ param.office_service_attr_maxprice }"/>
		<input type='text' class="input-small" name="office_service_comment_count" placeholder="������������" value="${ param.office_service_comment_count }"/>
		<input type='text' class="input-small" name="system_type" placeholder="1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽����������" value="${ param.system_type }"/>
		<input type='text' class="input-small" name="office_id" placeholder="�������id" value="${ param.office_id }"/>
		<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="" value="${ param.remark }"/>
		<input type='text' class="input-small" name="office_service_sold" placeholder="���۷���" value="${ param.office_service_sold }"/>
		<input type='text' class="input-small" name="people_num" placeholder="" value="${ param.people_num }"/>
		<input type='text' class="input-small" name="schedual_isopen" placeholder="�Ű����ñ��" value="${ param.schedual_isopen }"/>
		<input type='text' class="input-small" name="sub_system_type" placeholder="ϵͳ������" value="${ param.sub_system_type }"/>
		<input type='text' class="input-small" name="office_service_attr_starttime" placeholder="����ʼʱ��" value="${ param.office_service_attr_starttime }"/>
		<input type='text' class="input-small" name="office_service_attr_endtime" placeholder="�������ʱ��" value="${ param.office_service_attr_endtime }"/>
		<input type='text' class="input-small" name="char1" placeholder="�����ֶ�" value="${ param.char1 }"/>
		<input type='text' class="input-small" name="char2" placeholder="�����ֶ�" value="${ param.char2 }"/>
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
								<!-- ������  �����ҷ���������id-->   
								<th align="center" rowName="officeServiceId" orderName="office_service_id:DESC" title='�����ҷ���������id'>�����ҷ���������id</th>
								<!-- ������  ������Ŀ���-->   
								<th align="center" rowName="officeServiceName" orderName="office_service_name:DESC" title='������Ŀ���'>������Ŀ���</th>
								<!-- ������  ������url,ƴ���ַ�-->   
								<th align="center" rowName="officeServiceUrls" orderName="office_service_urls:DESC" title='������url,ƴ���ַ�'>������url,ƴ���ַ�</th>
								<!-- ������  1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵�����-->   
								<th align="center" rowName="officeServiceType" orderName="office_service_type:DESC" title='1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵�����'>1 ҽ�� 2 ����  3 ���� 4 ������ϵͳ���͵�����</th>
								<!-- ������  1�����ߣ�2���ߣ�3������ ��ʱĬ����������-->   
								<th align="center" rowName="officeServiceStatus" orderName="office_service_status:DESC" title='1�����ߣ�2���ߣ�3������ ��ʱĬ����������'>1�����ߣ�2���ߣ�3������ ��ʱĬ����������</th>
								<!-- ������  ����������� ����һ�����������¼ʱ�����1-->   
								<th align="center" rowName="officeServiceAttrCount" orderName="office_service_attr_count:DESC" title='����������� ����һ�����������¼ʱ�����1'>����������� ����һ�����������¼ʱ�����1</th>
								<!-- ������  ��С��� (������������ʱ����Ҫ�б�)-->   
								<th align="center" rowName="officeServiceAttrMinprice" orderName="office_service_attr_minprice:DESC" title='��С��� (������������ʱ����Ҫ�б�)'>��С��� (������������ʱ����Ҫ�б�)</th>
								<!-- ������  �����(������������ʱ����Ҫ�б�)-->   
								<th align="center" rowName="officeServiceAttrMaxprice" orderName="office_service_attr_maxprice:DESC" title='�����(������������ʱ����Ҫ�б�)'>�����(������������ʱ����Ҫ�б�)</th>
								<!-- ������  ������������-->   
								<th align="center" rowName="officeServiceCommentCount" orderName="office_service_comment_count:DESC" title='������������'>������������</th>
								<!-- ������  1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽����������-->   
								<th align="center" rowName="systemType" orderName="system_type:DESC" title='1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽����������'>1 Ϊ������� ,����ԤԼ����,ר��ԤԼ���� 2Ϊ�������Լ��˽����������</th>
								<!-- ������  �������id-->   
								<th align="center" rowName="officeId" orderName="office_id:DESC" title='�������id'>�������id</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  -->   
								<th align="center" rowName="remark" orderName="remark:DESC" title=''></th>
								<!-- ������  ���۷���-->   
								<th align="center" rowName="officeServiceSold" orderName="office_service_sold:DESC" title='���۷���'>���۷���</th>
								<!-- ������  -->   
								<th align="center" rowName="peopleNum" orderName="people_num:DESC" title=''></th>
								<!-- ������  �Ű����ñ��-->   
								<th align="center" rowName="schedualIsopen" orderName="schedual_isopen:DESC" title='�Ű����ñ��'>�Ű����ñ��</th>
								<!-- ������  ϵͳ������-->   
								<th align="center" rowName="subSystemType" orderName="sub_system_type:DESC" title='ϵͳ������'>ϵͳ������</th>
								<!-- ������  ����ʼʱ��-->   
								<th align="center" rowName="officeServiceAttrStarttime" orderName="office_service_attr_starttime:DESC" title='����ʼʱ��'>����ʼʱ��</th>
								<!-- ������  �������ʱ��-->   
								<th align="center" rowName="officeServiceAttrEndtime" orderName="office_service_attr_endtime:DESC" title='�������ʱ��'>�������ʱ��</th>
								<!-- ������  �����ֶ�-->   
								<th align="center" rowName="char1" orderName="char1:DESC" title='�����ֶ�'>�����ֶ�</th>
								<!-- ������  �����ֶ�-->   
								<th align="center" rowName="char2" orderName="char2:DESC" title='�����ֶ�'>�����ֶ�</th>
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
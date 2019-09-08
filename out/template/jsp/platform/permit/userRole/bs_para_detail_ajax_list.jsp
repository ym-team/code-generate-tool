<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.BsParaDetail" %>
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
				edit:'BsParaDetail.mc?method=editBsParaDetail&regionId,paraType,paraCode,paraName,para1,para2,para3,para4,para5,paraDesc,state,opId,stateDate,remarks=',
				del:'BsParaDetail.mc?method=deleteBsParaDetail&PK=',
				view:'BsParaDetail.mc?method=detailBsParaDetail&regionId,paraType,paraCode,paraName,para1,para2,para3,para4,para5,paraDesc,state,opId,stateDate,remarks='
			};
			var options = {
				tableId:'pageTable',
				url:'BsParaDetail.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'regionId,paraType,paraCode,paraName,para1,para2,para3,para4,para5,paraDesc,state,opId,stateDate,remarks'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/bs_para_detail_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="region_id" placeholder="" value="${ param.region_id }"/>
		<input type='text' class="input-small" name="para_type" placeholder="" value="${ param.para_type }"/>
		<input type='text' class="input-small" name="para_code" placeholder="" value="${ param.para_code }"/>
		<input type='text' class="input-small" name="para_name" placeholder="" value="${ param.para_name }"/>
		<input type='text' class="input-small" name="para1" placeholder="" value="${ param.para1 }"/>
		<input type='text' class="input-small" name="para2" placeholder="" value="${ param.para2 }"/>
		<input type='text' class="input-small" name="para3" placeholder="" value="${ param.para3 }"/>
		<input type='text' class="input-small" name="para4" placeholder="" value="${ param.para4 }"/>
		<input type='text' class="input-small" name="para5" placeholder="" value="${ param.para5 }"/>
		<input type='text' class="input-small" name="para_desc" placeholder="" value="${ param.para_desc }"/>
		<input type='text' class="input-small" name="state" placeholder="" value="${ param.state }"/>
		<input type='text' class="input-small" name="op_id" placeholder="" value="${ param.op_id }"/>
		<input type='text' class="input-small" name="state_date" placeholder="" value="${ param.state_date }"/>
		<input type='text' class="input-small" name="remarks" placeholder="" value="${ param.remarks }"/>
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
								<th align="center" rowName="regionId" orderName="region_id:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="paraType" orderName="para_type:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="paraCode" orderName="para_code:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="paraName" orderName="para_name:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="para1" orderName="para1:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="para2" orderName="para2:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="para3" orderName="para3:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="para4" orderName="para4:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="para5" orderName="para5:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="paraDesc" orderName="para_desc:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="state" orderName="state:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="opId" orderName="op_id:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="stateDate" orderName="state_date:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="remarks" orderName="remarks:DESC" title=''></th>
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
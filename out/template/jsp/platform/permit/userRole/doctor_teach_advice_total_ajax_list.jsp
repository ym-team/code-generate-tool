<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.DoctorTeachAdviceTotal" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<TITLE>�û���ɫ��Ӧ��ѯ</TITLE>
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
				edit:'DoctorTeachAdviceTotal.mc?method=editDoctorTeachAdviceTotal&id,optTime,userId,roleId=',
				del:'DoctorTeachAdviceTotal.mc?method=deleteDoctorTeachAdviceTotal&PK=',
				view:'DoctorTeachAdviceTotal.mc?method=detailDoctorTeachAdviceTotal&id,optTime,userId,roleId='
			};
			var options = {
				tableId:'pageTable',
				url:'DoctorTeachAdviceTotal.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'id,optTime,userId,roleId'
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
				 	�û���ɫ��Ӧ��ѯ
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/doctor_teach_advice_total_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="id" placeholder="�û��˻�" value="${ param.id }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="�û��˻�" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="user_id" placeholder="�û��˻�" value="${ param.user_id }"/>
		<input type='text' class="input-small" name="role_id" placeholder="������Ľ�ɫ" value="${ param.role_id }"/>
		<input type='text' class="input-small" name="role_name" placeholder="��ɫ���" value="${ param.role_name }"/>
		<input type='text' class="input-small" name="user_name" placeholder="�û����" value="${ param.user_name }"/>
		<input type='text' class="input-small" name="note" placeholder="˵��" value="${ param.note }"/>
		<input type='text' class="input-small" name="operator" placeholder="������" value="${ param.operator }"/>
		<input type='text' class="input-small" name="operat_time" placeholder="����ʱ��" value="${ param.operat_time }"/>
        <%
         request.setAttribute("DOCTOR_TEACH_ADVICE_TOTAL.INUSE",CodeFactory.getCodeListByCodeType("DOCTOR_TEACH_ADVICE_TOTAL.INUSE"));
        %>					
							  	ʹ�ñ�־��
					           	<select name="in_use" id="in_use">
						        	<option value="">ȫ��</option>
						         	<html:options collection="DOCTOR_TEACH_ADVICE_TOTAL.INUSE" value="name" key="code"
						         	selected="${ param.in_use }" />
						         </select>
		<input type='text' class="input-small" name="char_1" placeholder="�ַ��������ֶ�1" value="${ param.char_1 }"/>
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
								<!-- ������  �û��˻�-->   
								<th align="center" rowName="id" orderName="id:DESC" title='�û��˻�'>�û��˻�</th>
								<!-- ������  �û��˻�-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='�û��˻�'>�û��˻�</th>
								<!-- ������  �û��˻�-->   
								<th align="center" rowName="userId" orderName="user_id:DESC" title='�û��˻�'>�û��˻�</th>
								<!-- ������  ������Ľ�ɫ-->   
								<th align="center" rowName="roleId" orderName="role_id:DESC" title='������Ľ�ɫ'>������Ľ�ɫ</th>
								<!-- һ����  ��ɫ���-->   
								<th align="center" rowName="roleName" orderName="role_name:DESC" title='��ɫ���'>��ɫ���</th>
								<!-- һ����  �û����-->   
								<th align="center" rowName="userName" orderName="user_name:DESC" title='�û����'>�û����</th>
								<!-- һ����  ˵��-->   
								<th align="center" rowName="note" orderName="note:DESC" title='˵��'>˵��</th>
								<!-- һ����  ������-->   
								<th align="center" rowName="operator" orderName="operator:DESC" title='������'>������</th>
								<!-- һ����  ����ʱ��-->   
								<th align="center" rowName="operatTime" orderName="operat_time:DESC" title='����ʱ��'>����ʱ��</th>
                    			<!-- ö����  ʹ�ñ�־-->   
								<th align="center" trans="in_use" rowName="inUse" orderName="in_use:DESC" title='ʹ�ñ�־'>ʹ�ñ�־</th>
								<!-- һ����  �ַ��������ֶ�1-->   
								<th align="center" rowName="char1" orderName="char_1:DESC" title='�ַ��������ֶ�1'>�ַ��������ֶ�1</th>
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
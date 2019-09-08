<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmCountInfo" %>
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
				edit:'CmCountInfo.mc?method=editCmCountInfo&userSeqId,userPassword,phoneNum,email,userCreateTime,regChannel,userRegType,weiboId,qqId,weChatId,opTime,remark,recommendUserId=',
				del:'CmCountInfo.mc?method=deleteCmCountInfo&PK=',
				view:'CmCountInfo.mc?method=detailCmCountInfo&userSeqId,userPassword,phoneNum,email,userCreateTime,regChannel,userRegType,weiboId,qqId,weChatId,opTime,remark,recommendUserId='
			};
			var options = {
				tableId:'pageTable',
				url:'CmCountInfo.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'userSeqId,userPassword,phoneNum,email,userCreateTime,regChannel,userRegType,weiboId,qqId,weChatId,opTime,remark,recommendUserId'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_count_info_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="user_seq_id" placeholder="" value="${ param.user_seq_id }"/>
		<input type='text' class="input-small" name="user_password" placeholder="" value="${ param.user_password }"/>
		<input type='text' class="input-small" name="phone_num" placeholder="" value="${ param.phone_num }"/>
		<input type='text' class="input-small" name="email" placeholder="" value="${ param.email }"/>
		<input type='text' class="input-small" name="user_create_time" placeholder="" value="${ param.user_create_time }"/>
		<input type='text' class="input-small" name="reg_channel" placeholder="C �˻���¼������ D ����ҽ�� H ���ֽ����� S ����ҩ��" value="${ param.reg_channel }"/>
		<input type='text' class="input-small" name="user_reg_type" placeholder="�û��ն˰汾             11: ҽ���             12: ���߰�" value="${ param.user_reg_type }"/>
		<input type='text' class="input-small" name="weibo_id" placeholder="΢��ID" value="${ param.weibo_id }"/>
		<input type='text' class="input-small" name="qq_id" placeholder="" value="${ param.qq_id }"/>
		<input type='text' class="input-small" name="we_chat_id" placeholder="΢��ID" value="${ param.we_chat_id }"/>
		<input type='text' class="input-small" name="op_time" placeholder="����ʱ��" value="${ param.op_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
		<input type='text' class="input-small" name="recommend_user_id" placeholder="�������û�ID" value="${ param.recommend_user_id }"/>
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
								<th align="center" rowName="userSeqId" orderName="user_seq_id:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="userPassword" orderName="user_password:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="phoneNum" orderName="phone_num:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="email" orderName="email:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="userCreateTime" orderName="user_create_time:DESC" title=''></th>
								<!-- ������  C �˻���¼������ D ����ҽ�� H ���ֽ����� S ����ҩ��-->   
								<th align="center" rowName="regChannel" orderName="reg_channel:DESC" title='C �˻���¼������ D ����ҽ�� H ���ֽ����� S ����ҩ��'>C �˻���¼������ D ����ҽ�� H ���ֽ����� S ����ҩ��</th>
								<!-- ������  �û��ն˰汾             11: ҽ���             12: ���߰�-->   
								<th align="center" rowName="userRegType" orderName="user_reg_type:DESC" title='�û��ն˰汾             11: ҽ���             12: ���߰�'>�û��ն˰汾             11: ҽ���             12: ���߰�</th>
								<!-- ������  ΢��ID-->   
								<th align="center" rowName="weiboId" orderName="weibo_id:DESC" title='΢��ID'>΢��ID</th>
								<!-- ������  -->   
								<th align="center" rowName="qqId" orderName="qq_id:DESC" title=''></th>
								<!-- ������  ΢��ID-->   
								<th align="center" rowName="weChatId" orderName="we_chat_id:DESC" title='΢��ID'>΢��ID</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="opTime" orderName="op_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ��ע-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������  �������û�ID-->   
								<th align="center" rowName="recommendUserId" orderName="recommend_user_id:DESC" title='�������û�ID'>�������û�ID</th>
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmUserCertInfo" %>
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
				edit:'CmUserCertInfo.mc?method=editCmUserCertInfo&certAppId,userSeqId,certType,certId,certName,certPicUrl,createDate,verifyStatus,verifyTime,opTime,batchNumber=',
				del:'CmUserCertInfo.mc?method=deleteCmUserCertInfo&PK=',
				view:'CmUserCertInfo.mc?method=detailCmUserCertInfo&certAppId,userSeqId,certType,certId,certName,certPicUrl,createDate,verifyStatus,verifyTime,opTime,batchNumber='
			};
			var options = {
				tableId:'pageTable',
				url:'CmUserCertInfo.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'certAppId,userSeqId,certType,certId,certName,certPicUrl,createDate,verifyStatus,verifyTime,opTime,batchNumber'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_user_cert_info_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="cert_app_id" placeholder="����ID" value="${ param.cert_app_id }"/>
		<input type='text' class="input-small" name="user_seq_id" placeholder="�û�ID" value="${ param.user_seq_id }"/>
		<input type='text' class="input-small" name="cert_type" placeholder="��֤����:  1:���֤  2:ְҵ�ʸ�֤ 3:����֤ 4:��ҵ֤ 5:ѧ��֤ 6:����֤�� 7: ��֤�� 8: ��Ӫ��֤" value="${ param.cert_type }"/>
		<input type='text' class="input-small" name="cert_id" placeholder="֤��ID��,��ʱ����" value="${ param.cert_id }"/>
		<input type='text' class="input-small" name="cert_name" placeholder="֤�����, ��CERT_ID����" value="${ param.cert_name }"/>
		<input type='text' class="input-small" name="cert_pic_url" placeholder="ͼƬURL" value="${ param.cert_pic_url }"/>
		<input type='text' class="input-small" name="create_date" placeholder="�ϴ�ʱ��" value="${ param.create_date }"/>
		<input type='text' class="input-small" name="verify_status" placeholder="��֤״̬: 0-δ��֤ 1-�Ѿ���֤  2:��֤��ͨ��" value="${ param.verify_status }"/>
		<input type='text' class="input-small" name="verify_time" placeholder="��֤ʱ��" value="${ param.verify_time }"/>
		<input type='text' class="input-small" name="op_time" placeholder="����ʱ�䣨������ʱ�䣩" value="${ param.op_time }"/>
		<input type='text' class="input-small" name="batch_number" placeholder="��κ�" value="${ param.batch_number }"/>
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
								<!-- ������  ����ID-->   
								<th align="center" rowName="certAppId" orderName="cert_app_id:DESC" title='����ID'>����ID</th>
								<!-- ������  �û�ID-->   
								<th align="center" rowName="userSeqId" orderName="user_seq_id:DESC" title='�û�ID'>�û�ID</th>
								<!-- ������  ��֤����:  1:���֤  2:ְҵ�ʸ�֤ 3:����֤ 4:��ҵ֤ 5:ѧ��֤ 6:����֤�� 7: ��֤�� 8: ��Ӫ��֤-->   
								<th align="center" rowName="certType" orderName="cert_type:DESC" title='��֤����:  1:���֤  2:ְҵ�ʸ�֤ 3:����֤ 4:��ҵ֤ 5:ѧ��֤ 6:����֤�� 7: ��֤�� 8: ��Ӫ��֤'>��֤����:  1:���֤  2:ְҵ�ʸ�֤ 3:����֤ 4:��ҵ֤ 5:ѧ��֤ 6:����֤�� 7: ��֤�� 8: ��Ӫ��֤</th>
								<!-- ������  ֤��ID��,��ʱ����-->   
								<th align="center" rowName="certId" orderName="cert_id:DESC" title='֤��ID��,��ʱ����'>֤��ID��,��ʱ����</th>
								<!-- ������  ֤�����, ��CERT_ID����-->   
								<th align="center" rowName="certName" orderName="cert_name:DESC" title='֤�����, ��CERT_ID����'>֤�����, ��CERT_ID����</th>
								<!-- ������  ͼƬURL-->   
								<th align="center" rowName="certPicUrl" orderName="cert_pic_url:DESC" title='ͼƬURL'>ͼƬURL</th>
								<!-- ������  �ϴ�ʱ��-->   
								<th align="center" rowName="createDate" orderName="create_date:DESC" title='�ϴ�ʱ��'>�ϴ�ʱ��</th>
								<!-- ������  ��֤״̬: 0-δ��֤ 1-�Ѿ���֤  2:��֤��ͨ��-->   
								<th align="center" rowName="verifyStatus" orderName="verify_status:DESC" title='��֤״̬: 0-δ��֤ 1-�Ѿ���֤  2:��֤��ͨ��'>��֤״̬: 0-δ��֤ 1-�Ѿ���֤  2:��֤��ͨ��</th>
								<!-- ������  ��֤ʱ��-->   
								<th align="center" rowName="verifyTime" orderName="verify_time:DESC" title='��֤ʱ��'>��֤ʱ��</th>
								<!-- ������  ����ʱ�䣨������ʱ�䣩-->   
								<th align="center" rowName="opTime" orderName="op_time:DESC" title='����ʱ�䣨������ʱ�䣩'>����ʱ�䣨������ʱ�䣩</th>
								<!-- ������  ��κ�-->   
								<th align="center" rowName="batchNumber" orderName="batch_number:DESC" title='��κ�'>��κ�</th>
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
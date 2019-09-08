<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmCoterieBase" %>
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
				edit:'CmCoterieBase.mc?method=editCmCoterieBase&coterieId,isOpen,coterieDesc,userSeqId,coterieName,coterieType,coterieFaceUrl,memberNum,coterieLevel,status,createDate,verifyTime,opTime,remark=',
				del:'CmCoterieBase.mc?method=deleteCmCoterieBase&PK=',
				view:'CmCoterieBase.mc?method=detailCmCoterieBase&coterieId,isOpen,coterieDesc,userSeqId,coterieName,coterieType,coterieFaceUrl,memberNum,coterieLevel,status,createDate,verifyTime,opTime,remark='
			};
			var options = {
				tableId:'pageTable',
				url:'CmCoterieBase.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'coterieId,isOpen,coterieDesc,userSeqId,coterieName,coterieType,coterieFaceUrl,memberNum,coterieLevel,status,createDate,verifyTime,opTime,remark'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_coterie_base_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="coterie_id" placeholder="Ȧ��ID" value="${ param.coterie_id }"/>
		<input type='text' class="input-small" name="is_open" placeholder="1:����, 2��������" value="${ param.is_open }"/>
		<input type='text' class="input-small" name="coterie_desc" placeholder="Ȧ������" value="${ param.coterie_desc }"/>
		<input type='text' class="input-small" name="user_seq_id" placeholder="�û�ID" value="${ param.user_seq_id }"/>
		<input type='text' class="input-small" name="coterie_name" placeholder="Ȧ�����, �����ظ�" value="${ param.coterie_name }"/>
		<input type='text' class="input-small" name="coterie_type" placeholder="Ȧ������, 1:���� 2:��/��֯" value="${ param.coterie_type }"/>
		<input type='text' class="input-small" name="coterie_face_url" placeholder="Ȧ��ͷ���url��ַ" value="${ param.coterie_face_url }"/>
		<input type='text' class="input-small" name="member_num" placeholder="Ȧ������" value="${ param.member_num }"/>
		<input type='text' class="input-small" name="coterie_level" placeholder="Ȧ�ӵȼ�V�ĵȼ� 1:δ��֤(Ĭ��) 2����ͨ��  3: Ȧ�Ӽ�V (��V)" value="${ param.coterie_level }"/>
		<input type='text' class="input-small" name="status" placeholder="0:  ��Ч 1:  ��Ч" value="${ param.status }"/>
		<input type='text' class="input-small" name="create_date" placeholder="���Ӵ���ʱ��" value="${ param.create_date }"/>
		<input type='text' class="input-small" name="verify_time" placeholder="��֤ʱ��" value="${ param.verify_time }"/>
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
								<!-- ������  Ȧ��ID-->   
								<th align="center" rowName="coterieId" orderName="coterie_id:DESC" title='Ȧ��ID'>Ȧ��ID</th>
								<!-- ������  1:����, 2��������-->   
								<th align="center" rowName="isOpen" orderName="is_open:DESC" title='1:����, 2��������'>1:����, 2��������</th>
								<!-- ������  Ȧ������-->   
								<th align="center" rowName="coterieDesc" orderName="coterie_desc:DESC" title='Ȧ������'>Ȧ������</th>
								<!-- ������  �û�ID-->   
								<th align="center" rowName="userSeqId" orderName="user_seq_id:DESC" title='�û�ID'>�û�ID</th>
								<!-- ������  Ȧ�����, �����ظ�-->   
								<th align="center" rowName="coterieName" orderName="coterie_name:DESC" title='Ȧ�����, �����ظ�'>Ȧ�����, �����ظ�</th>
								<!-- ������  Ȧ������, 1:���� 2:��/��֯-->   
								<th align="center" rowName="coterieType" orderName="coterie_type:DESC" title='Ȧ������, 1:���� 2:��/��֯'>Ȧ������, 1:���� 2:��/��֯</th>
								<!-- ������  Ȧ��ͷ���url��ַ-->   
								<th align="center" rowName="coterieFaceUrl" orderName="coterie_face_url:DESC" title='Ȧ��ͷ���url��ַ'>Ȧ��ͷ���url��ַ</th>
								<!-- ������  Ȧ������-->   
								<th align="center" rowName="memberNum" orderName="member_num:DESC" title='Ȧ������'>Ȧ������</th>
								<!-- ������  Ȧ�ӵȼ�V�ĵȼ� 1:δ��֤(Ĭ��) 2����ͨ��  3: Ȧ�Ӽ�V (��V)-->   
								<th align="center" rowName="coterieLevel" orderName="coterie_level:DESC" title='Ȧ�ӵȼ�V�ĵȼ� 1:δ��֤(Ĭ��) 2����ͨ��  3: Ȧ�Ӽ�V (��V)'>Ȧ�ӵȼ�V�ĵȼ� 1:δ��֤(Ĭ��) 2����ͨ��  3: Ȧ�Ӽ�V (��V)</th>
								<!-- ������  0:  ��Ч 1:  ��Ч-->   
								<th align="center" rowName="status" orderName="status:DESC" title='0:  ��Ч 1:  ��Ч'>0:  ��Ч 1:  ��Ч</th>
								<!-- ������  ���Ӵ���ʱ��-->   
								<th align="center" rowName="createDate" orderName="create_date:DESC" title='���Ӵ���ʱ��'>���Ӵ���ʱ��</th>
								<!-- ������  ��֤ʱ��-->   
								<th align="center" rowName="verifyTime" orderName="verify_time:DESC" title='��֤ʱ��'>��֤ʱ��</th>
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.CmUserBaseInfo" %>
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
				edit:'CmUserBaseInfo.mc?method=editCmUserBaseInfo&userSeqId,userName,userType,sex,birthdate,province,cityCode,companyId,companyName,deptId,deptName,educationLevel,entrySchoolDate,mediaType,professionalTitle,jobTitle,userLevel,userFaceUrl,opTime,remark=',
				del:'CmUserBaseInfo.mc?method=deleteCmUserBaseInfo&PK=',
				view:'CmUserBaseInfo.mc?method=detailCmUserBaseInfo&userSeqId,userName,userType,sex,birthdate,province,cityCode,companyId,companyName,deptId,deptName,educationLevel,entrySchoolDate,mediaType,professionalTitle,jobTitle,userLevel,userFaceUrl,opTime,remark='
			};
			var options = {
				tableId:'pageTable',
				url:'CmUserBaseInfo.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'userSeqId,userName,userType,sex,birthdate,province,cityCode,companyId,companyName,deptId,deptName,educationLevel,entrySchoolDate,mediaType,professionalTitle,jobTitle,userLevel,userFaceUrl,opTime,remark'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/cm_user_base_info_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="user_seq_id" placeholder="�û�ID" value="${ param.user_seq_id }"/>
		<input type='text' class="input-small" name="user_name" placeholder="" value="${ param.user_name }"/>
		<input type='text' class="input-small" name="user_type" placeholder="�û����  0:δ֪����(Ĭ��) 1:����Ա 2:ҽ��   3:ѧ�� 4:ҩ���ҵ��Ա  5:ý���ҵ��Ա  6:���� 7:���� 8:��ʿ 9:ҩ��ʦ 10:����" value="${ param.user_type }"/>
		<input type='text' class="input-small" name="sex" placeholder="1: ��  2:Ů" value="${ param.sex }"/>
		<input type='text' class="input-small" name="birthdate" placeholder="����" value="${ param.birthdate }"/>
		<input type='text' class="input-small" name="province" placeholder="ʡ��" value="${ param.province }"/>
		<input type='text' class="input-small" name="city_code" placeholder="����" value="${ param.city_code }"/>
		<input type='text' class="input-small" name="company_id" placeholder="��˾ID" value="${ param.company_id }"/>
		<input type='text' class="input-small" name="company_name" placeholder="��λ���(ҽԺ,ѧУ)" value="${ param.company_name }"/>
		<input type='text' class="input-small" name="dept_id" placeholder="����ID" value="${ param.dept_id }"/>
		<input type='text' class="input-small" name="dept_name" placeholder="����(����)���" value="${ param.dept_name }"/>
		<input type='text' class="input-small" name="education_level" placeholder="ѧ��             0:�� 1:Сѧ, 2:����,  3:��ר/����,  4:��ר/����  5:ר�� 6:ѧʿ 7:˶ʿ�о��� 8:��ʿ�о��� 9:��ʿ��" value="${ param.education_level }"/>
		<input type='text' class="input-small" name="entry_school_date" placeholder="��ѧʱ��" value="${ param.entry_school_date }"/>
		<input type='text' class="input-small" name="media_type" placeholder="ý������ 1:�ڿ�,  2:��ֽ  3:����" value="${ param.media_type }"/>
		<input type='text' class="input-small" name="professional_title" placeholder="ְ��             0��ְ��(��) 1.����ҽʦ��2������ҽʦ��3.����ҽʦ��4.ҽʦ, 5סԺҽʦ, 6ҽʿ,7 ����ҽʦ��8���ڣ�9������  10��ʦ��11��̣�                          ---20151105 lihui             ҽ��ְ��: 101-����ҽʦ  102-������ҽʦ 103-����ҽʦ 104-סԺҽʦ  105-����ҽʦ  106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���  111-ҽʦ 112-ҽʿ             ҩʦְ��: 201-����ҩʦ  202-������ҩʦ 203-����ҩʦ 204-ҩʦ 205-ҩʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���             ��ʿְ��: 301-���λ�ʦ  302-�����λ�ʦ 303-���ܻ�ʦ 304-��ʦ 305-��ʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���             " value="${ param.professional_title }"/>
		<input type='text' class="input-small" name="job_title" placeholder="ְλ: �����������" value="${ param.job_title }"/>
		<input type='text' class="input-small" name="user_level" placeholder="---- 20160303  maohc             ������ÿλ���α�ʾ:�û���V|��λ��V|������֤             0ΪĬ��(δ��֤) 1Ϊͨ����֤ 2Ϊ����ͨ��             ��:             Ĭ��Ϊ 00000000             �û���Vͨ�� 10000000             �û���V����ͨ�� 20000000" value="${ param.user_level }"/>
		<input type='text' class="input-small" name="user_face_url" placeholder="ͷ��URL" value="${ param.user_face_url }"/>
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
								<!-- ������  �û�ID-->   
								<th align="center" rowName="userSeqId" orderName="user_seq_id:DESC" title='�û�ID'>�û�ID</th>
								<!-- ������  -->   
								<th align="center" rowName="userName" orderName="user_name:DESC" title=''></th>
								<!-- ������  �û����  0:δ֪����(Ĭ��) 1:����Ա 2:ҽ��   3:ѧ�� 4:ҩ���ҵ��Ա  5:ý���ҵ��Ա  6:���� 7:���� 8:��ʿ 9:ҩ��ʦ 10:����-->   
								<th align="center" rowName="userType" orderName="user_type:DESC" title='�û����  0:δ֪����(Ĭ��) 1:����Ա 2:ҽ��   3:ѧ�� 4:ҩ���ҵ��Ա  5:ý���ҵ��Ա  6:���� 7:���� 8:��ʿ 9:ҩ��ʦ 10:����'>�û����  0:δ֪����(Ĭ��) 1:����Ա 2:ҽ��   3:ѧ�� 4:ҩ���ҵ��Ա  5:ý���ҵ��Ա  6:���� 7:���� 8:��ʿ 9:ҩ��ʦ 10:����</th>
								<!-- ������  1: ��  2:Ů-->   
								<th align="center" rowName="sex" orderName="sex:DESC" title='1: ��  2:Ů'>1: ��  2:Ů</th>
								<!-- ������  ����-->   
								<th align="center" rowName="birthdate" orderName="birthdate:DESC" title='����'>����</th>
								<!-- ������  ʡ��-->   
								<th align="center" rowName="province" orderName="province:DESC" title='ʡ��'>ʡ��</th>
								<!-- ������  ����-->   
								<th align="center" rowName="cityCode" orderName="city_code:DESC" title='����'>����</th>
								<!-- ������  ��˾ID-->   
								<th align="center" rowName="companyId" orderName="company_id:DESC" title='��˾ID'>��˾ID</th>
								<!-- ������  ��λ���(ҽԺ,ѧУ)-->   
								<th align="center" rowName="companyName" orderName="company_name:DESC" title='��λ���(ҽԺ,ѧУ)'>��λ���(ҽԺ,ѧУ)</th>
								<!-- ������  ����ID-->   
								<th align="center" rowName="deptId" orderName="dept_id:DESC" title='����ID'>����ID</th>
								<!-- ������  ����(����)���-->   
								<th align="center" rowName="deptName" orderName="dept_name:DESC" title='����(����)���'>����(����)���</th>
								<!-- ������  ѧ��             0:�� 1:Сѧ, 2:����,  3:��ר/����,  4:��ר/����  5:ר�� 6:ѧʿ 7:˶ʿ�о��� 8:��ʿ�о��� 9:��ʿ��-->   
								<th align="center" rowName="educationLevel" orderName="education_level:DESC" title='ѧ��             0:�� 1:Сѧ, 2:����,  3:��ר/����,  4:��ר/����  5:ר�� 6:ѧʿ 7:˶ʿ�о��� 8:��ʿ�о��� 9:��ʿ��'>ѧ��             0:�� 1:Сѧ, 2:����,  3:��ר/����,  4:��ר/����  5:ר�� 6:ѧʿ 7:˶ʿ�о��� 8:��ʿ�о��� 9:��ʿ��</th>
								<!-- ������  ��ѧʱ��-->   
								<th align="center" rowName="entrySchoolDate" orderName="entry_school_date:DESC" title='��ѧʱ��'>��ѧʱ��</th>
								<!-- ������  ý������ 1:�ڿ�,  2:��ֽ  3:����-->   
								<th align="center" rowName="mediaType" orderName="media_type:DESC" title='ý������ 1:�ڿ�,  2:��ֽ  3:����'>ý������ 1:�ڿ�,  2:��ֽ  3:����</th>
								<!-- ������  ְ��             0��ְ��(��) 1.����ҽʦ��2������ҽʦ��3.����ҽʦ��4.ҽʦ, 5סԺҽʦ, 6ҽʿ,7 ����ҽʦ��8���ڣ�9������  10��ʦ��11��̣�                          ---20151105 lihui             ҽ��ְ��: 101-����ҽʦ  102-������ҽʦ 103-����ҽʦ 104-סԺҽʦ  105-����ҽʦ  106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���  111-ҽʦ 112-ҽʿ             ҩʦְ��: 201-����ҩʦ  202-������ҩʦ 203-����ҩʦ 204-ҩʦ 205-ҩʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���             ��ʿְ��: 301-���λ�ʦ  302-�����λ�ʦ 303-���ܻ�ʦ 304-��ʦ 305-��ʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���             -->   
								<th align="center" rowName="professionalTitle" orderName="professional_title:DESC" title='ְ��             0��ְ��(��) 1.����ҽʦ��2������ҽʦ��3.����ҽʦ��4.ҽʦ, 5סԺҽʦ, 6ҽʿ,7 ����ҽʦ��8���ڣ�9������  10��ʦ��11��̣�                          ---20151105 lihui             ҽ��ְ��: 101-����ҽʦ  102-������ҽʦ 103-����ҽʦ 104-סԺҽʦ  105-����ҽʦ  106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���  111-ҽʦ 112-ҽʿ             ҩʦְ��: 201-����ҩʦ  202-������ҩʦ 203-����ҩʦ 204-ҩʦ 205-ҩʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���             ��ʿְ��: 301-���λ�ʦ  302-�����λ�ʦ 303-���ܻ�ʦ 304-��ʦ 305-��ʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���             '>ְ��             0��ְ��(��) 1.����ҽʦ��2������ҽʦ��3.����ҽʦ��4.ҽʦ, 5סԺҽʦ, 6ҽʿ,7 ����ҽʦ��8���ڣ�9������  10��ʦ��11��̣�                          ---20151105 lihui             ҽ��ְ��: 101-����ҽʦ  102-������ҽʦ 103-����ҽʦ 104-סԺҽʦ  105-����ҽʦ  106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���  111-ҽʦ 112-ҽʿ             ҩʦְ��: 201-����ҩʦ  202-������ҩʦ 203-����ҩʦ 204-ҩʦ 205-ҩʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���             ��ʿְ��: 301-���λ�ʦ  302-�����λ�ʦ 303-���ܻ�ʦ 304-��ʦ 305-��ʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���             </th>
								<!-- ������  ְλ: �����������-->   
								<th align="center" rowName="jobTitle" orderName="job_title:DESC" title='ְλ: �����������'>ְλ: �����������</th>
								<!-- ������  ---- 20160303  maohc             ������ÿλ���α�ʾ:�û���V|��λ��V|������֤             0ΪĬ��(δ��֤) 1Ϊͨ����֤ 2Ϊ����ͨ��             ��:             Ĭ��Ϊ 00000000             �û���Vͨ�� 10000000             �û���V����ͨ�� 20000000-->   
								<th align="center" rowName="userLevel" orderName="user_level:DESC" title='---- 20160303  maohc             ������ÿλ���α�ʾ:�û���V|��λ��V|������֤             0ΪĬ��(δ��֤) 1Ϊͨ����֤ 2Ϊ����ͨ��             ��:             Ĭ��Ϊ 00000000             �û���Vͨ�� 10000000             �û���V����ͨ�� 20000000'>---- 20160303  maohc             ������ÿλ���α�ʾ:�û���V|��λ��V|������֤             0ΪĬ��(δ��֤) 1Ϊͨ����֤ 2Ϊ����ͨ��             ��:             Ĭ��Ϊ 00000000             �û���Vͨ�� 10000000             �û���V����ͨ�� 20000000</th>
								<!-- ������  ͷ��URL-->   
								<th align="center" rowName="userFaceUrl" orderName="user_face_url:DESC" title='ͷ��URL'>ͷ��URL</th>
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
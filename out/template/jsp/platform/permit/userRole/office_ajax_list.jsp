<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.offices.data.Office" %>
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
				edit:'Office.mc?method=editOffice&officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual=',
				del:'Office.mc?method=deleteOffice&PK=',
				view:'Office.mc?method=detailOffice&officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual='
			};
			var options = {
				tableId:'pageTable',
				url:'Office.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual'
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
						 <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/office_edit.jsp'">���</button>
						 </td>
						  <td align="right">
							<div class="controls asearch">
								
		<input type='text' class="input-small" name="office_id" placeholder="����������" value="${ param.office_id }"/>
		<input type='text' class="input-small" name="office_halfbody_url" placeholder="�ϰ�����" value="${ param.office_halfbody_url }"/>
		<input type='text' class="input-small" name="offfice_identify_url" placeholder="���֤" value="${ param.offfice_identify_url }"/>
		<input type='text' class="input-small" name="office_qualification_url" placeholder="ִҵ�ʸ���" value="${ param.office_qualification_url }"/>
		<input type='text' class="input-small" name="office_businesslicence_urls" placeholder="Ӫҵִ�յ��ж�����ã�" value="${ param.office_businesslicence_urls }"/>
		<input type='text' class="input-small" name="office_hand_address" placeholder="��������д��ַĬ�ϵ��ڸߵµ�ַ" value="${ param.office_hand_address }"/>
		<input type='text' class="input-small" name="office_gaode_address" placeholder="�����Ҹߵµ�ַ" value="${ param.office_gaode_address }"/>
		<input type='text' class="input-small" name="office_gaode_addr_gps_lng" placeholder="�����Ҹߵµ�ַgps����" value="${ param.office_gaode_addr_gps_lng }"/>
		<input type='text' class="input-small" name="office_gaode_addr_gps_lat" placeholder="�����Ҹߵµ�ַgpsγ ��" value="${ param.office_gaode_addr_gps_lat }"/>
		<input type='text' class="input-small" name="office_scope" placeholder="�����ҹ�ģ(1.����,2.3-10�� 3.10-50��. 4.50-100�� )" value="${ param.office_scope }"/>
		<input type='text' class="input-small" name="office_type" placeholder="����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����" value="${ param.office_type }"/>
		<input type='text' class="input-small" name="office_name" placeholder="����������" value="${ param.office_name }"/>
		<input type='text' class="input-small" name="office_master_name" placeholder="��֤������" value="${ param.office_master_name }"/>
		<input type='text' class="input-small" name="office_master_phone" placeholder="��֤�˵绰" value="${ param.office_master_phone }"/>
		<input type='text' class="input-small" name="office_status" placeholder="1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��" value="${ param.office_status }"/>
		<input type='text' class="input-small" name="office_face_url" placeholder="������ͷͼ" value="${ param.office_face_url }"/>
		<input type='text' class="input-small" name="office_background_urls" placeholder="�����ұ���ͼ���������url,ƴ���ַ���" value="${ param.office_background_urls }"/>
		<input type='text' class="input-small" name="office_desc" placeholder="" value="${ param.office_desc }"/>
		<input type='text' class="input-small" name="office_comment_star" placeholder="�������� ���5��" value="${ param.office_comment_star }"/>
		<input type='text' class="input-small" name="office_service_attitude" placeholder="����̬��(����) ���100" value="${ param.office_service_attitude }"/>
		<input type='text' class="input-small" name="office_service_quality" placeholder="��������(����) ���100" value="${ param.office_service_quality }"/>
		<input type='text' class="input-small" name="office_response_speed" placeholder="��Ӧ�ٶ�(����)" value="${ param.office_response_speed }"/>
		<input type='text' class="input-small" name="office_pushmessagetxtcount" placeholder="���Ͷ�̬�� ��һ����������ֶμ�1" value="${ param.office_pushmessagetxtcount }"/>
		<input type='text' class="input-small" name="office_services_count" placeholder="���������� ÿ����һ��Ŀ��������ֶμ�1" value="${ param.office_services_count }"/>
		<input type='text' class="input-small" name="office_followers_count" placeholder="��˿�� ÿ����һ����˿�������1" value="${ param.office_followers_count }"/>
		<input type='text' class="input-small" name="office_create_user_id" placeholder="�����Ҵ����� ����д����������߳�Ա,��Ա��Ҳͬʱ����������ߵ�useridд��ȥ" value="${ param.office_create_user_id }"/>
		<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
		<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
		<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
		<input type='text' class="input-small" name="office_proficientcount" placeholder="" value="${ param.office_proficientcount }"/>
		<input type='text' class="input-small" name="office_is_set_goodat" placeholder="" value="${ param.office_is_set_goodat }"/>
		<input type='text' class="input-small" name="invite_code" placeholder="" value="${ param.invite_code }"/>
		<input type='text' class="input-small" name="office_copy_id" placeholder="" value="${ param.office_copy_id }"/>
		<input type='text' class="input-small" name="office_copy_status" placeholder="" value="${ param.office_copy_status }"/>
		<input type='text' class="input-small" name="office_businesslicence_urls_status" placeholder="" value="${ param.office_businesslicence_urls_status }"/>
		<input type='text' class="input-small" name="invite_code_phone" placeholder="" value="${ param.invite_code_phone }"/>
		<input type='text' class="input-small" name="office_doctor_visit_schedual" placeholder="" value="${ param.office_doctor_visit_schedual }"/>
		<button type="button" id="searchBtn" class="btn btn-group-vertical">����</button>
							</div>
						</td>
						</tr>
		</table>
				</div>
			</div>
			<!-- ��ѯ������ʾ����end -->
			<!--//������ʾ�б�-->
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
								<!-- ������  ����������-->   
								<th align="center" rowName="officeId" orderName="office_id:DESC" title='����������'>����������</th>
								<!-- ������  �ϰ�����-->   
								<th align="center" rowName="officeHalfbodyUrl" orderName="office_halfbody_url:DESC" title='�ϰ�����'>�ϰ�����</th>
								<!-- ������  ���֤-->   
								<th align="center" rowName="offficeIdentifyUrl" orderName="offfice_identify_url:DESC" title='���֤'>���֤</th>
								<!-- ������  ִҵ�ʸ���-->   
								<th align="center" rowName="officeQualificationUrl" orderName="office_qualification_url:DESC" title='ִҵ�ʸ���'>ִҵ�ʸ���</th>
								<!-- ������  Ӫҵִ�յ��ж�����ã�-->   
								<th align="center" rowName="officeBusinesslicenceUrls" orderName="office_businesslicence_urls:DESC" title='Ӫҵִ�յ��ж�����ã�'>Ӫҵִ�յ��ж�����ã�</th>
								<!-- ������  ��������д��ַĬ�ϵ��ڸߵµ�ַ-->   
								<th align="center" rowName="officeHandAddress" orderName="office_hand_address:DESC" title='��������д��ַĬ�ϵ��ڸߵµ�ַ'>��������д��ַĬ�ϵ��ڸߵµ�ַ</th>
								<!-- ������  �����Ҹߵµ�ַ-->   
								<th align="center" rowName="officeGaodeAddress" orderName="office_gaode_address:DESC" title='�����Ҹߵµ�ַ'>�����Ҹߵµ�ַ</th>
								<!-- ������  �����Ҹߵµ�ַgps����-->   
								<th align="center" rowName="officeGaodeAddrGpsLng" orderName="office_gaode_addr_gps_lng:DESC" title='�����Ҹߵµ�ַgps����'>�����Ҹߵµ�ַgps����</th>
								<!-- ������  �����Ҹߵµ�ַgpsγ ��-->   
								<th align="center" rowName="officeGaodeAddrGpsLat" orderName="office_gaode_addr_gps_lat:DESC" title='�����Ҹߵµ�ַgpsγ ��'>�����Ҹߵµ�ַgpsγ ��</th>
								<!-- ������  �����ҹ�ģ(1.����,2.3-10�� 3.10-50��. 4.50-100�� )-->   
								<th align="center" rowName="officeScope" orderName="office_scope:DESC" title='�����ҹ�ģ(1.����,2.3-10�� 3.10-50��. 4.50-100�� )'>�����ҹ�ģ(1.����,2.3-10�� 3.10-50��. 4.50-100�� )</th>
								<!-- ������  ����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����-->   
								<th align="center" rowName="officeType" orderName="office_type:DESC" title='����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����'>����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����</th>
								<!-- ������  ����������-->   
								<th align="center" rowName="officeName" orderName="office_name:DESC" title='����������'>����������</th>
								<!-- ������  ��֤������-->   
								<th align="center" rowName="officeMasterName" orderName="office_master_name:DESC" title='��֤������'>��֤������</th>
								<!-- ������  ��֤�˵绰-->   
								<th align="center" rowName="officeMasterPhone" orderName="office_master_phone:DESC" title='��֤�˵绰'>��֤�˵绰</th>
								<!-- ������  1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��-->   
								<th align="center" rowName="officeStatus" orderName="office_status:DESC" title='1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��'>1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��</th>
								<!-- ������  ������ͷͼ-->   
								<th align="center" rowName="officeFaceUrl" orderName="office_face_url:DESC" title='������ͷͼ'>������ͷͼ</th>
								<!-- ������  �����ұ���ͼ���������url,ƴ���ַ���-->   
								<th align="center" rowName="officeBackgroundUrls" orderName="office_background_urls:DESC" title='�����ұ���ͼ���������url,ƴ���ַ���'>�����ұ���ͼ���������url,ƴ���ַ���</th>
								<!-- ������  -->   
								<th align="center" rowName="officeDesc" orderName="office_desc:DESC" title=''></th>
								<!-- ������  �������� ���5��-->   
								<th align="center" rowName="officeCommentStar" orderName="office_comment_star:DESC" title='�������� ���5��'>�������� ���5��</th>
								<!-- ������  ����̬��(����) ���100-->   
								<th align="center" rowName="officeServiceAttitude" orderName="office_service_attitude:DESC" title='����̬��(����) ���100'>����̬��(����) ���100</th>
								<!-- ������  ��������(����) ���100-->   
								<th align="center" rowName="officeServiceQuality" orderName="office_service_quality:DESC" title='��������(����) ���100'>��������(����) ���100</th>
								<!-- ������  ��Ӧ�ٶ�(����)-->   
								<th align="center" rowName="officeResponseSpeed" orderName="office_response_speed:DESC" title='��Ӧ�ٶ�(����)'>��Ӧ�ٶ�(����)</th>
								<!-- ������  ���Ͷ�̬�� ��һ����������ֶμ�1-->   
								<th align="center" rowName="officePushmessagetxtcount" orderName="office_pushmessagetxtcount:DESC" title='���Ͷ�̬�� ��һ����������ֶμ�1'>���Ͷ�̬�� ��һ����������ֶμ�1</th>
								<!-- ������  ���������� ÿ����һ��Ŀ��������ֶμ�1-->   
								<th align="center" rowName="officeServicesCount" orderName="office_services_count:DESC" title='���������� ÿ����һ��Ŀ��������ֶμ�1'>���������� ÿ����һ��Ŀ��������ֶμ�1</th>
								<!-- ������  ��˿�� ÿ����һ����˿�������1-->   
								<th align="center" rowName="officeFollowersCount" orderName="office_followers_count:DESC" title='��˿�� ÿ����һ����˿�������1'>��˿�� ÿ����һ����˿�������1</th>
								<!-- ������  �����Ҵ����� ����д����������߳�Ա,��Ա��Ҳͬʱ����������ߵ�useridд��ȥ-->   
								<th align="center" rowName="officeCreateUserId" orderName="office_create_user_id:DESC" title='�����Ҵ����� ����д����������߳�Ա,��Ա��Ҳͬʱ����������ߵ�useridд��ȥ'>�����Ҵ����� ����д����������߳�Ա,��Ա��Ҳͬʱ����������ߵ�useridд��ȥ</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ����ʱ��-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������  ��ע-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������  -->   
								<th align="center" rowName="officeProficientcount" orderName="office_proficientcount:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="officeIsSetGoodat" orderName="office_is_set_goodat:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="inviteCode" orderName="invite_code:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="officeCopyId" orderName="office_copy_id:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="officeCopyStatus" orderName="office_copy_status:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="officeBusinesslicenceUrlsStatus" orderName="office_businesslicence_urls_status:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="inviteCodePhone" orderName="invite_code_phone:DESC" title=''></th>
								<!-- ������  -->   
								<th align="center" rowName="officeDoctorVisitSchedual" orderName="office_doctor_visit_schedual:DESC" title=''></th>
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.offices.data.Office" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
	Page pg = (Page) request.getAttribute("Page");
	PageInfo pginfo = (PageInfo) request.getAttribute("PageInfo");
	Map attributeMap = pg.getAttributeMap();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<TITLE>���Բ�ѯ</TITLE>
	
	<!-- ����JS��CSS��ʽ-->
<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/artDialog/skins/default.css">
<script src="${contextPath}/skins/library/artDialog/jArtDialog.js"></script>
<script type="text/javascript" src="${contextPath}/skins/js/common/list_common_js.js"></script>
<!-- ����ʽ����������� -->
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">

<!-- ��ѯҳ������ checkbox����Ҫ���� -->
<link rel="stylesheet" type="text/css"	href="${contextPath}/skins/library/iCheck-master/skins/square/blue.css">
<script src="${contextPath}/skins/library/iCheck-master/icheck.js"></script>
<script type="text/javascript" src="${contextPath}/skins/js/common/scroll_common_js.js"></script>
	
	<script type="text/javascript">
		function deleteOffice(PK) {
			jQuery.ajax({
				url : "Office.mc?method=deleteOffice",
				type : "post",
				data : {PK:PK},
				success : function(result) {
					if (result > 0) {
						alert("ɾ���ɹ�");
						$("#start").val(0);
						$("#searchForm").submit();
					} else {
						alert("ɾ��ʧ��");
					}
				},
				error : function(result) {
					alert("ɾ��ʧ��");
				}
			});
		}
		
		function searchData(){
			$("#start").val(0);
			$("#searchForm").submit();
		}
		
		$(function(){
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
		/* */
			$('input:checkbox').iCheck({
				 checkboxClass: 'icheckbox_square-blue',
		         radioClass: 'iradio_square'
				});
		/**/
			 $('#selectall_checkbox').on('ifClicked',
		                function () {
		                    $('input:checkbox').iCheck('toggle');
		                });
		
			
		});
	</script>
</head>
<body>
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/Office.mc?method=getAllPageOffice" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
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

								<button type="button" onclick="javascript:searchData();" id="searchbtn"  class="btn btn-group-vertical">����</button>
							</div>
								
							</td>
						</tr>
						
					</table>
			</div>
			<!-- ��ѯ������ʾ����end --> 
			<!-- ������ʾ�б�start -->
	        <div id="tableData" style="position: relative;height: 480px;overflow: auto;">
				<div id="loading" style=" width:100%; height: 340px;position: absolute; top: 0; display:none;">
					<div style="background-color: ; position: absolute; top: 50%; left: 50%; margin: -33px 0 0 -33px;">
						<img src="skins/style/images/loading.gif" />
					</div>
				</div>
				<div class="tabelist">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-hover table-condensed">
	  					<thead>
	                    	<tr height="22" class="tab_title_bg">
	                        	<th align="center">
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="ȫѡ/ȡ��" />
	                            </th>
	                            <!--��ͷѭ����ʼ -->
								<!-- ������{����������}-->   
								<th align="center" rowName="office_id" orderName="office_id:DESC" title='����������'>����������</th>
								<!-- ������{�ϰ�����}-->   
								<th align="center" rowName="office_halfbody_url" orderName="office_halfbody_url:DESC" title='�ϰ�����'>�ϰ�����</th>
								<!-- ������{���֤}-->   
								<th align="center" rowName="offfice_identify_url" orderName="offfice_identify_url:DESC" title='���֤'>���֤</th>
								<!-- ������{ִҵ�ʸ���}-->   
								<th align="center" rowName="office_qualification_url" orderName="office_qualification_url:DESC" title='ִҵ�ʸ���'>ִҵ�ʸ���</th>
								<!-- ������{Ӫҵִ�յ��ж�����ã�}-->   
								<th align="center" rowName="office_businesslicence_urls" orderName="office_businesslicence_urls:DESC" title='Ӫҵִ�յ��ж�����ã�'>Ӫҵִ�յ��ж�����ã�</th>
								<!-- ������{��������д��ַĬ�ϵ��ڸߵµ�ַ}-->   
								<th align="center" rowName="office_hand_address" orderName="office_hand_address:DESC" title='��������д��ַĬ�ϵ��ڸߵµ�ַ'>��������д��ַĬ�ϵ��ڸߵµ�ַ</th>
								<!-- ������{�����Ҹߵµ�ַ}-->   
								<th align="center" rowName="office_gaode_address" orderName="office_gaode_address:DESC" title='�����Ҹߵµ�ַ'>�����Ҹߵµ�ַ</th>
								<!-- ������{�����Ҹߵµ�ַgps����}-->   
								<th align="center" rowName="office_gaode_addr_gps_lng" orderName="office_gaode_addr_gps_lng:DESC" title='�����Ҹߵµ�ַgps����'>�����Ҹߵµ�ַgps����</th>
								<!-- ������{�����Ҹߵµ�ַgpsγ ��}-->   
								<th align="center" rowName="office_gaode_addr_gps_lat" orderName="office_gaode_addr_gps_lat:DESC" title='�����Ҹߵµ�ַgpsγ ��'>�����Ҹߵµ�ַgpsγ ��</th>
								<!-- ������{�����ҹ�ģ(1.����,2.3-10�� 3.10-50��. 4.50-100�� )}-->   
								<th align="center" rowName="office_scope" orderName="office_scope:DESC" title='�����ҹ�ģ(1.����,2.3-10�� 3.10-50��. 4.50-100�� )'>�����ҹ�ģ(1.����,2.3-10�� 3.10-50��. 4.50-100�� )</th>
								<!-- ������{����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����}-->   
								<th align="center" rowName="office_type" orderName="office_type:DESC" title='����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����'>����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����</th>
								<!-- ������{����������}-->   
								<th align="center" rowName="office_name" orderName="office_name:DESC" title='����������'>����������</th>
								<!-- ������{��֤������}-->   
								<th align="center" rowName="office_master_name" orderName="office_master_name:DESC" title='��֤������'>��֤������</th>
								<!-- ������{��֤�˵绰}-->   
								<th align="center" rowName="office_master_phone" orderName="office_master_phone:DESC" title='��֤�˵绰'>��֤�˵绰</th>
								<!-- ������{1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��}-->   
								<th align="center" rowName="office_status" orderName="office_status:DESC" title='1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��'>1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��</th>
								<!-- ������{������ͷͼ}-->   
								<th align="center" rowName="office_face_url" orderName="office_face_url:DESC" title='������ͷͼ'>������ͷͼ</th>
								<!-- ������{�����ұ���ͼ���������url,ƴ���ַ���}-->   
								<th align="center" rowName="office_background_urls" orderName="office_background_urls:DESC" title='�����ұ���ͼ���������url,ƴ���ַ���'>�����ұ���ͼ���������url,ƴ���ַ���</th>
								<!-- ������{}-->   
								<th align="center" rowName="office_desc" orderName="office_desc:DESC" title=''></th>
								<!-- ������{�������� ���5��}-->   
								<th align="center" rowName="office_comment_star" orderName="office_comment_star:DESC" title='�������� ���5��'>�������� ���5��</th>
								<!-- ������{����̬��(����) ���100}-->   
								<th align="center" rowName="office_service_attitude" orderName="office_service_attitude:DESC" title='����̬��(����) ���100'>����̬��(����) ���100</th>
								<!-- ������{��������(����) ���100}-->   
								<th align="center" rowName="office_service_quality" orderName="office_service_quality:DESC" title='��������(����) ���100'>��������(����) ���100</th>
								<!-- ������{��Ӧ�ٶ�(����)}-->   
								<th align="center" rowName="office_response_speed" orderName="office_response_speed:DESC" title='��Ӧ�ٶ�(����)'>��Ӧ�ٶ�(����)</th>
								<!-- ������{���Ͷ�̬�� ��һ����������ֶμ�1}-->   
								<th align="center" rowName="office_pushmessagetxtcount" orderName="office_pushmessagetxtcount:DESC" title='���Ͷ�̬�� ��һ����������ֶμ�1'>���Ͷ�̬�� ��һ����������ֶμ�1</th>
								<!-- ������{���������� ÿ����һ��Ŀ��������ֶμ�1}-->   
								<th align="center" rowName="office_services_count" orderName="office_services_count:DESC" title='���������� ÿ����һ��Ŀ��������ֶμ�1'>���������� ÿ����һ��Ŀ��������ֶμ�1</th>
								<!-- ������{��˿�� ÿ����һ����˿�������1}-->   
								<th align="center" rowName="office_followers_count" orderName="office_followers_count:DESC" title='��˿�� ÿ����һ����˿�������1'>��˿�� ÿ����һ����˿�������1</th>
								<!-- ������{�����Ҵ����� ����д����������߳�Ա,��Ա��Ҳͬʱ����������ߵ�useridд��ȥ}-->   
								<th align="center" rowName="office_create_user_id" orderName="office_create_user_id:DESC" title='�����Ҵ����� ����д����������߳�Ա,��Ա��Ҳͬʱ����������ߵ�useridд��ȥ'>�����Ҵ����� ����д����������߳�Ա,��Ա��Ҳͬʱ����������ߵ�useridд��ȥ</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{}-->   
								<th align="center" rowName="office_proficientcount" orderName="office_proficientcount:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="office_is_set_goodat" orderName="office_is_set_goodat:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="invite_code" orderName="invite_code:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="office_copy_id" orderName="office_copy_id:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="office_copy_status" orderName="office_copy_status:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="office_businesslicence_urls_status" orderName="office_businesslicence_urls_status:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="invite_code_phone" orderName="invite_code_phone:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="office_doctor_visit_schedual" orderName="office_doctor_visit_schedual:DESC" title=''></th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							Office view = new Office();
								for (int i = 0; i < list.size(); i++) {
									view = (Office) list.get(i);
									if (i % 2 == 1) {
						%>
										<tr class="blue">
						<%
									} else {
						%>
										<tr>
						<%
									}
						%>
											<th align="center">
				                            	<input name="selectall_checkbox" type="checkbox" title="ȫѡ/ȡ��" />
				                            </th>
					
											<!-- ������{����������}-->   
											<td><%=view.getOfficeId()%></td>
											<!-- ������{�ϰ�����}-->   
											<td><%=view.getOfficeHalfbodyUrl()%></td>
											<!-- ������{���֤}-->   
											<td><%=view.getOffficeIdentifyUrl()%></td>
											<!-- ������{ִҵ�ʸ���}-->   
											<td><%=view.getOfficeQualificationUrl()%></td>
											<!-- ������{Ӫҵִ�յ��ж�����ã�}-->   
											<td><%=view.getOfficeBusinesslicenceUrls()%></td>
											<!-- ������{��������д��ַĬ�ϵ��ڸߵµ�ַ}-->   
											<td><%=view.getOfficeHandAddress()%></td>
											<!-- ������{�����Ҹߵµ�ַ}-->   
											<td><%=view.getOfficeGaodeAddress()%></td>
											<!-- ������{�����Ҹߵµ�ַgps����}-->   
											<td><%=view.getOfficeGaodeAddrGpsLng()%></td>
											<!-- ������{�����Ҹߵµ�ַgpsγ ��}-->   
											<td><%=view.getOfficeGaodeAddrGpsLat()%></td>
											<!-- ������{�����ҹ�ģ(1.����,2.3-10�� 3.10-50��. 4.50-100�� )}-->   
											<td><%=view.getOfficeScope()%></td>
											<!-- ������{����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù�����}-->   
											<td><%=view.getOfficeType()%></td>
											<!-- ������{����������}-->   
											<td><%=view.getOfficeName()%></td>
											<!-- ������{��֤������}-->   
											<td><%=view.getOfficeMasterName()%></td>
											<!-- ������{��֤�˵绰}-->   
											<td><%=view.getOfficeMasterPhone()%></td>
											<!-- ������{1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ��}-->   
											<td><%=view.getOfficeStatus()%></td>
											<!-- ������{������ͷͼ}-->   
											<td><%=view.getOfficeFaceUrl()%></td>
											<!-- ������{�����ұ���ͼ���������url,ƴ���ַ���}-->   
											<td><%=view.getOfficeBackgroundUrls()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeDesc()%></td>
											<!-- ������{�������� ���5��}-->   
											<td><%=view.getOfficeCommentStar()%></td>
											<!-- ������{����̬��(����) ���100}-->   
											<td><%=view.getOfficeServiceAttitude()%></td>
											<!-- ������{��������(����) ���100}-->   
											<td><%=view.getOfficeServiceQuality()%></td>
											<!-- ������{��Ӧ�ٶ�(����)}-->   
											<td><%=view.getOfficeResponseSpeed()%></td>
											<!-- ������{���Ͷ�̬�� ��һ����������ֶμ�1}-->   
											<td><%=view.getOfficePushmessagetxtcount()%></td>
											<!-- ������{���������� ÿ����һ��Ŀ��������ֶμ�1}-->   
											<td><%=view.getOfficeServicesCount()%></td>
											<!-- ������{��˿�� ÿ����һ����˿�������1}-->   
											<td><%=view.getOfficeFollowersCount()%></td>
											<!-- ������{�����Ҵ����� ����д����������߳�Ա,��Ա��Ҳͬʱ����������ߵ�useridд��ȥ}-->   
											<td><%=view.getOfficeCreateUserId()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeProficientcount()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeIsSetGoodat()%></td>
											<!-- ������{}-->   
											<td><%=view.getInviteCode()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeCopyId()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeCopyStatus()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeBusinesslicenceUrlsStatus()%></td>
											<!-- ������{}-->   
											<td><%=view.getInviteCodePhone()%></td>
											<!-- ������{}-->   
											<td><%=view.getOfficeDoctorVisitSchedual()%></td>

											<td>
												<a class="o-edit" href="Office.mc?method=editOffice&officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual=<%= view.getOfficeId() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeHandAddress() +":"+  view.getOfficeGaodeAddress() +":"+  view.getOfficeGaodeAddrGpsLng() +":"+  view.getOfficeGaodeAddrGpsLat() +":"+  view.getOfficeScope() +":"+  view.getOfficeType() +":"+  view.getOfficeName() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getOfficeFaceUrl() +":"+  view.getOfficeBackgroundUrls() +":"+  view.getOfficeDesc() +":"+  view.getOfficeCommentStar() +":"+  view.getOfficeServiceAttitude() +":"+  view.getOfficeServiceQuality() +":"+  view.getOfficeResponseSpeed() +":"+  view.getOfficePushmessagetxtcount() +":"+  view.getOfficeServicesCount() +":"+  view.getOfficeFollowersCount() +":"+  view.getOfficeCreateUserId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeProficientcount() +":"+  view.getOfficeIsSetGoodat() +":"+  view.getInviteCode() +":"+  view.getOfficeCopyId() +":"+  view.getOfficeCopyStatus() +":"+  view.getOfficeBusinesslicenceUrlsStatus() +":"+  view.getInviteCodePhone() +":"+  view.getOfficeDoctorVisitSchedual() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteOffice('<%= view.getOfficeId() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeHandAddress() +":"+  view.getOfficeGaodeAddress() +":"+  view.getOfficeGaodeAddrGpsLng() +":"+  view.getOfficeGaodeAddrGpsLat() +":"+  view.getOfficeScope() +":"+  view.getOfficeType() +":"+  view.getOfficeName() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getOfficeFaceUrl() +":"+  view.getOfficeBackgroundUrls() +":"+  view.getOfficeDesc() +":"+  view.getOfficeCommentStar() +":"+  view.getOfficeServiceAttitude() +":"+  view.getOfficeServiceQuality() +":"+  view.getOfficeResponseSpeed() +":"+  view.getOfficePushmessagetxtcount() +":"+  view.getOfficeServicesCount() +":"+  view.getOfficeFollowersCount() +":"+  view.getOfficeCreateUserId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeProficientcount() +":"+  view.getOfficeIsSetGoodat() +":"+  view.getInviteCode() +":"+  view.getOfficeCopyId() +":"+  view.getOfficeCopyStatus() +":"+  view.getOfficeBusinesslicenceUrlsStatus() +":"+  view.getInviteCodePhone() +":"+  view.getOfficeDoctorVisitSchedual() %>')" title="ɾ��"></a>
											    <a class="o-view" href="Office.mc?method=detailOffice&officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual=<%= view.getOfficeId() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeHandAddress() +":"+  view.getOfficeGaodeAddress() +":"+  view.getOfficeGaodeAddrGpsLng() +":"+  view.getOfficeGaodeAddrGpsLat() +":"+  view.getOfficeScope() +":"+  view.getOfficeType() +":"+  view.getOfficeName() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getOfficeFaceUrl() +":"+  view.getOfficeBackgroundUrls() +":"+  view.getOfficeDesc() +":"+  view.getOfficeCommentStar() +":"+  view.getOfficeServiceAttitude() +":"+  view.getOfficeServiceQuality() +":"+  view.getOfficeResponseSpeed() +":"+  view.getOfficePushmessagetxtcount() +":"+  view.getOfficeServicesCount() +":"+  view.getOfficeFollowersCount() +":"+  view.getOfficeCreateUserId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeProficientcount() +":"+  view.getOfficeIsSetGoodat() +":"+  view.getInviteCode() +":"+  view.getOfficeCopyId() +":"+  view.getOfficeCopyStatus() +":"+  view.getOfficeBusinesslicenceUrlsStatus() +":"+  view.getInviteCodePhone() +":"+  view.getOfficeDoctorVisitSchedual() %>" title="����"></a> 
												
											</td>
										</tr>
						<%
							}
						%>
						</tbody>      
					</table>
					</div>
			    </div>
	              <div style="height:50px;position: fixed;bottom: 0px;right: 2px;background-color: #f9fbff;width: 100%;padding-right:17px;border-top:1px solid #e2e2e2;">
	    	         <jsp:include page="/jsp/platform/page.jsp" />
		          </div>

	</form>
</body>
</html>
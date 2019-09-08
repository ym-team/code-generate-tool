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
	<TITLE>测试查询</TITLE>
	
	<!-- 导入JS和CSS样式-->
<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/artDialog/skins/default.css">
<script src="${contextPath}/skins/library/artDialog/jArtDialog.js"></script>
<script type="text/javascript" src="${contextPath}/skins/js/common/list_common_js.js"></script>
<!-- 新样式风格必须引入的 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">

<!-- 查询页面上有 checkbox的需要引入 -->
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
						alert("删除成功");
						$("#start").val(0);
						$("#searchForm").submit();
					} else {
						alert("删除失败");
					}
				},
				error : function(result) {
					alert("删除失败");
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
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/office_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="office_id" placeholder="工作室主键" value="${ param.office_id }"/>
						    
						    	<input type='text' class="input-small" name="office_halfbody_url" placeholder="上半身照" value="${ param.office_halfbody_url }"/>
						    
						    	<input type='text' class="input-small" name="offfice_identify_url" placeholder="身份证" value="${ param.offfice_identify_url }"/>
						    
						    	<input type='text' class="input-small" name="office_qualification_url" placeholder="执业资格照" value="${ param.office_qualification_url }"/>
						    
						    	<input type='text' class="input-small" name="office_businesslicence_urls" placeholder="营业执照等有多个则用，" value="${ param.office_businesslicence_urls }"/>
						    
						    	<input type='text' class="input-small" name="office_hand_address" placeholder="工作室手写地址默认等于高德地址" value="${ param.office_hand_address }"/>
						    
						    	<input type='text' class="input-small" name="office_gaode_address" placeholder="工作室高德地址" value="${ param.office_gaode_address }"/>
						    
						    	<input type='text' class="input-small" name="office_gaode_addr_gps_lng" placeholder="工作室高德地址gps经度" value="${ param.office_gaode_addr_gps_lng }"/>
						    
						    	<input type='text' class="input-small" name="office_gaode_addr_gps_lat" placeholder="工作室高德地址gps纬 度" value="${ param.office_gaode_addr_gps_lat }"/>
						    
						    	<input type='text' class="input-small" name="office_scope" placeholder="工作室规模(1.个人,2.3-10人 3.10-50人. 4.50-100人 )" value="${ param.office_scope }"/>
						    
						    	<input type='text' class="input-small" name="office_type" placeholder="工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室" value="${ param.office_type }"/>
						    
						    	<input type='text' class="input-small" name="office_name" placeholder="工作室名称" value="${ param.office_name }"/>
						    
						    	<input type='text' class="input-small" name="office_master_name" placeholder="认证人姓名" value="${ param.office_master_name }"/>
						    
						    	<input type='text' class="input-small" name="office_master_phone" placeholder="认证人电话" value="${ param.office_master_phone }"/>
						    
						    	<input type='text' class="input-small" name="office_status" placeholder="1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过" value="${ param.office_status }"/>
						    
						    	<input type='text' class="input-small" name="office_face_url" placeholder="工作室头图" value="${ param.office_face_url }"/>
						    
						    	<input type='text' class="input-small" name="office_background_urls" placeholder="工作室背景图　最多六个url,拼成字符串" value="${ param.office_background_urls }"/>
						    
						    	<input type='text' class="input-small" name="office_desc" placeholder="" value="${ param.office_desc }"/>
						    
						    	<input type='text' class="input-small" name="office_comment_star" placeholder="几星评价 最多5星" value="${ param.office_comment_star }"/>
						    
						    	<input type='text' class="input-small" name="office_service_attitude" placeholder="服务态度(分数) 最多100" value="${ param.office_service_attitude }"/>
						    
						    	<input type='text' class="input-small" name="office_service_quality" placeholder="服务质量(分数) 最多100" value="${ param.office_service_quality }"/>
						    
						    	<input type='text' class="input-small" name="office_response_speed" placeholder="响应速度(分数)" value="${ param.office_response_speed }"/>
						    
						    	<input type='text' class="input-small" name="office_pushmessagetxtcount" placeholder="推送动态数 发一条推文这个字段加1" value="${ param.office_pushmessagetxtcount }"/>
						    
						    	<input type='text' class="input-small" name="office_services_count" placeholder="服务项总数 每新增一项目服务这个字段加1" value="${ param.office_services_count }"/>
						    
						    	<input type='text' class="input-small" name="office_followers_count" placeholder="粉丝数 每新增一个粉丝，这里加1" value="${ param.office_followers_count }"/>
						    
						    	<input type='text' class="input-small" name="office_create_user_id" placeholder="工作室创建者 这里写了这个创建者成员,成员表也同时把这个创建者的userid写进去" value="${ param.office_create_user_id }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="创建时间" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="操作时间" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="备注" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="office_proficientcount" placeholder="" value="${ param.office_proficientcount }"/>
						    
						    	<input type='text' class="input-small" name="office_is_set_goodat" placeholder="" value="${ param.office_is_set_goodat }"/>
						    
						    	<input type='text' class="input-small" name="invite_code" placeholder="" value="${ param.invite_code }"/>
						    
						    	<input type='text' class="input-small" name="office_copy_id" placeholder="" value="${ param.office_copy_id }"/>
						    
						    	<input type='text' class="input-small" name="office_copy_status" placeholder="" value="${ param.office_copy_status }"/>
						    
						    	<input type='text' class="input-small" name="office_businesslicence_urls_status" placeholder="" value="${ param.office_businesslicence_urls_status }"/>
						    
						    	<input type='text' class="input-small" name="invite_code_phone" placeholder="" value="${ param.invite_code_phone }"/>
						    
						    	<input type='text' class="input-small" name="office_doctor_visit_schedual" placeholder="" value="${ param.office_doctor_visit_schedual }"/>

								<button type="button" onclick="javascript:searchData();" id="searchbtn"  class="btn btn-group-vertical">搜索</button>
							</div>
								
							</td>
						</tr>
						
					</table>
			</div>
			<!-- 查询条件显示区域end --> 
			<!-- 数据显示列表start -->
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
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="全选/取消" />
	                            </th>
	                            <!--表头循环开始 -->
								<!-- 主键列{工作室主键}-->   
								<th align="center" rowName="office_id" orderName="office_id:DESC" title='工作室主键'>工作室主键</th>
								<!-- 主键列{上半身照}-->   
								<th align="center" rowName="office_halfbody_url" orderName="office_halfbody_url:DESC" title='上半身照'>上半身照</th>
								<!-- 主键列{身份证}-->   
								<th align="center" rowName="offfice_identify_url" orderName="offfice_identify_url:DESC" title='身份证'>身份证</th>
								<!-- 主键列{执业资格照}-->   
								<th align="center" rowName="office_qualification_url" orderName="office_qualification_url:DESC" title='执业资格照'>执业资格照</th>
								<!-- 主键列{营业执照等有多个则用，}-->   
								<th align="center" rowName="office_businesslicence_urls" orderName="office_businesslicence_urls:DESC" title='营业执照等有多个则用，'>营业执照等有多个则用，</th>
								<!-- 主键列{工作室手写地址默认等于高德地址}-->   
								<th align="center" rowName="office_hand_address" orderName="office_hand_address:DESC" title='工作室手写地址默认等于高德地址'>工作室手写地址默认等于高德地址</th>
								<!-- 主键列{工作室高德地址}-->   
								<th align="center" rowName="office_gaode_address" orderName="office_gaode_address:DESC" title='工作室高德地址'>工作室高德地址</th>
								<!-- 主键列{工作室高德地址gps经度}-->   
								<th align="center" rowName="office_gaode_addr_gps_lng" orderName="office_gaode_addr_gps_lng:DESC" title='工作室高德地址gps经度'>工作室高德地址gps经度</th>
								<!-- 主键列{工作室高德地址gps纬 度}-->   
								<th align="center" rowName="office_gaode_addr_gps_lat" orderName="office_gaode_addr_gps_lat:DESC" title='工作室高德地址gps纬 度'>工作室高德地址gps纬 度</th>
								<!-- 主键列{工作室规模(1.个人,2.3-10人 3.10-50人. 4.50-100人 )}-->   
								<th align="center" rowName="office_scope" orderName="office_scope:DESC" title='工作室规模(1.个人,2.3-10人 3.10-50人. 4.50-100人 )'>工作室规模(1.个人,2.3-10人 3.10-50人. 4.50-100人 )</th>
								<!-- 主键列{工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室}-->   
								<th align="center" rowName="office_type" orderName="office_type:DESC" title='工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室'>工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室</th>
								<!-- 主键列{工作室名称}-->   
								<th align="center" rowName="office_name" orderName="office_name:DESC" title='工作室名称'>工作室名称</th>
								<!-- 主键列{认证人姓名}-->   
								<th align="center" rowName="office_master_name" orderName="office_master_name:DESC" title='认证人姓名'>认证人姓名</th>
								<!-- 主键列{认证人电话}-->   
								<th align="center" rowName="office_master_phone" orderName="office_master_phone:DESC" title='认证人电话'>认证人电话</th>
								<!-- 主键列{1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过}-->   
								<th align="center" rowName="office_status" orderName="office_status:DESC" title='1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过'>1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过</th>
								<!-- 主键列{工作室头图}-->   
								<th align="center" rowName="office_face_url" orderName="office_face_url:DESC" title='工作室头图'>工作室头图</th>
								<!-- 主键列{工作室背景图　最多六个url,拼成字符串}-->   
								<th align="center" rowName="office_background_urls" orderName="office_background_urls:DESC" title='工作室背景图　最多六个url,拼成字符串'>工作室背景图　最多六个url,拼成字符串</th>
								<!-- 主键列{}-->   
								<th align="center" rowName="office_desc" orderName="office_desc:DESC" title=''></th>
								<!-- 主键列{几星评价 最多5星}-->   
								<th align="center" rowName="office_comment_star" orderName="office_comment_star:DESC" title='几星评价 最多5星'>几星评价 最多5星</th>
								<!-- 主键列{服务态度(分数) 最多100}-->   
								<th align="center" rowName="office_service_attitude" orderName="office_service_attitude:DESC" title='服务态度(分数) 最多100'>服务态度(分数) 最多100</th>
								<!-- 主键列{服务质量(分数) 最多100}-->   
								<th align="center" rowName="office_service_quality" orderName="office_service_quality:DESC" title='服务质量(分数) 最多100'>服务质量(分数) 最多100</th>
								<!-- 主键列{响应速度(分数)}-->   
								<th align="center" rowName="office_response_speed" orderName="office_response_speed:DESC" title='响应速度(分数)'>响应速度(分数)</th>
								<!-- 主键列{推送动态数 发一条推文这个字段加1}-->   
								<th align="center" rowName="office_pushmessagetxtcount" orderName="office_pushmessagetxtcount:DESC" title='推送动态数 发一条推文这个字段加1'>推送动态数 发一条推文这个字段加1</th>
								<!-- 主键列{服务项总数 每新增一项目服务这个字段加1}-->   
								<th align="center" rowName="office_services_count" orderName="office_services_count:DESC" title='服务项总数 每新增一项目服务这个字段加1'>服务项总数 每新增一项目服务这个字段加1</th>
								<!-- 主键列{粉丝数 每新增一个粉丝，这里加1}-->   
								<th align="center" rowName="office_followers_count" orderName="office_followers_count:DESC" title='粉丝数 每新增一个粉丝，这里加1'>粉丝数 每新增一个粉丝，这里加1</th>
								<!-- 主键列{工作室创建者 这里写了这个创建者成员,成员表也同时把这个创建者的userid写进去}-->   
								<th align="center" rowName="office_create_user_id" orderName="office_create_user_id:DESC" title='工作室创建者 这里写了这个创建者成员,成员表也同时把这个创建者的userid写进去'>工作室创建者 这里写了这个创建者成员,成员表也同时把这个创建者的userid写进去</th>
								<!-- 主键列{创建时间}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列{操作时间}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='操作时间'>操作时间</th>
								<!-- 主键列{备注}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!-- 主键列{}-->   
								<th align="center" rowName="office_proficientcount" orderName="office_proficientcount:DESC" title=''></th>
								<!-- 主键列{}-->   
								<th align="center" rowName="office_is_set_goodat" orderName="office_is_set_goodat:DESC" title=''></th>
								<!-- 主键列{}-->   
								<th align="center" rowName="invite_code" orderName="invite_code:DESC" title=''></th>
								<!-- 主键列{}-->   
								<th align="center" rowName="office_copy_id" orderName="office_copy_id:DESC" title=''></th>
								<!-- 主键列{}-->   
								<th align="center" rowName="office_copy_status" orderName="office_copy_status:DESC" title=''></th>
								<!-- 主键列{}-->   
								<th align="center" rowName="office_businesslicence_urls_status" orderName="office_businesslicence_urls_status:DESC" title=''></th>
								<!-- 主键列{}-->   
								<th align="center" rowName="invite_code_phone" orderName="invite_code_phone:DESC" title=''></th>
								<!-- 主键列{}-->   
								<th align="center" rowName="office_doctor_visit_schedual" orderName="office_doctor_visit_schedual:DESC" title=''></th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
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
				                            	<input name="selectall_checkbox" type="checkbox" title="全选/取消" />
				                            </th>
					
											<!-- 主键列{工作室主键}-->   
											<td><%=view.getOfficeId()%></td>
											<!-- 主键列{上半身照}-->   
											<td><%=view.getOfficeHalfbodyUrl()%></td>
											<!-- 主键列{身份证}-->   
											<td><%=view.getOffficeIdentifyUrl()%></td>
											<!-- 主键列{执业资格照}-->   
											<td><%=view.getOfficeQualificationUrl()%></td>
											<!-- 主键列{营业执照等有多个则用，}-->   
											<td><%=view.getOfficeBusinesslicenceUrls()%></td>
											<!-- 主键列{工作室手写地址默认等于高德地址}-->   
											<td><%=view.getOfficeHandAddress()%></td>
											<!-- 主键列{工作室高德地址}-->   
											<td><%=view.getOfficeGaodeAddress()%></td>
											<!-- 主键列{工作室高德地址gps经度}-->   
											<td><%=view.getOfficeGaodeAddrGpsLng()%></td>
											<!-- 主键列{工作室高德地址gps纬 度}-->   
											<td><%=view.getOfficeGaodeAddrGpsLat()%></td>
											<!-- 主键列{工作室规模(1.个人,2.3-10人 3.10-50人. 4.50-100人 )}-->   
											<td><%=view.getOfficeScope()%></td>
											<!-- 主键列{工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室}-->   
											<td><%=view.getOfficeType()%></td>
											<!-- 主键列{工作室名称}-->   
											<td><%=view.getOfficeName()%></td>
											<!-- 主键列{认证人姓名}-->   
											<td><%=view.getOfficeMasterName()%></td>
											<!-- 主键列{认证人电话}-->   
											<td><%=view.getOfficeMasterPhone()%></td>
											<!-- 主键列{1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过}-->   
											<td><%=view.getOfficeStatus()%></td>
											<!-- 主键列{工作室头图}-->   
											<td><%=view.getOfficeFaceUrl()%></td>
											<!-- 主键列{工作室背景图　最多六个url,拼成字符串}-->   
											<td><%=view.getOfficeBackgroundUrls()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getOfficeDesc()%></td>
											<!-- 主键列{几星评价 最多5星}-->   
											<td><%=view.getOfficeCommentStar()%></td>
											<!-- 主键列{服务态度(分数) 最多100}-->   
											<td><%=view.getOfficeServiceAttitude()%></td>
											<!-- 主键列{服务质量(分数) 最多100}-->   
											<td><%=view.getOfficeServiceQuality()%></td>
											<!-- 主键列{响应速度(分数)}-->   
											<td><%=view.getOfficeResponseSpeed()%></td>
											<!-- 主键列{推送动态数 发一条推文这个字段加1}-->   
											<td><%=view.getOfficePushmessagetxtcount()%></td>
											<!-- 主键列{服务项总数 每新增一项目服务这个字段加1}-->   
											<td><%=view.getOfficeServicesCount()%></td>
											<!-- 主键列{粉丝数 每新增一个粉丝，这里加1}-->   
											<td><%=view.getOfficeFollowersCount()%></td>
											<!-- 主键列{工作室创建者 这里写了这个创建者成员,成员表也同时把这个创建者的userid写进去}-->   
											<td><%=view.getOfficeCreateUserId()%></td>
											<!-- 主键列{创建时间}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- 主键列{操作时间}-->   
											<td><%=view.getOptTime()%></td>
											<!-- 主键列{备注}-->   
											<td><%=view.getRemark()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getOfficeProficientcount()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getOfficeIsSetGoodat()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getInviteCode()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getOfficeCopyId()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getOfficeCopyStatus()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getOfficeBusinesslicenceUrlsStatus()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getInviteCodePhone()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getOfficeDoctorVisitSchedual()%></td>

											<td>
												<a class="o-edit" href="Office.mc?method=editOffice&officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual=<%= view.getOfficeId() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeHandAddress() +":"+  view.getOfficeGaodeAddress() +":"+  view.getOfficeGaodeAddrGpsLng() +":"+  view.getOfficeGaodeAddrGpsLat() +":"+  view.getOfficeScope() +":"+  view.getOfficeType() +":"+  view.getOfficeName() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getOfficeFaceUrl() +":"+  view.getOfficeBackgroundUrls() +":"+  view.getOfficeDesc() +":"+  view.getOfficeCommentStar() +":"+  view.getOfficeServiceAttitude() +":"+  view.getOfficeServiceQuality() +":"+  view.getOfficeResponseSpeed() +":"+  view.getOfficePushmessagetxtcount() +":"+  view.getOfficeServicesCount() +":"+  view.getOfficeFollowersCount() +":"+  view.getOfficeCreateUserId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeProficientcount() +":"+  view.getOfficeIsSetGoodat() +":"+  view.getInviteCode() +":"+  view.getOfficeCopyId() +":"+  view.getOfficeCopyStatus() +":"+  view.getOfficeBusinesslicenceUrlsStatus() +":"+  view.getInviteCodePhone() +":"+  view.getOfficeDoctorVisitSchedual() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteOffice('<%= view.getOfficeId() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeHandAddress() +":"+  view.getOfficeGaodeAddress() +":"+  view.getOfficeGaodeAddrGpsLng() +":"+  view.getOfficeGaodeAddrGpsLat() +":"+  view.getOfficeScope() +":"+  view.getOfficeType() +":"+  view.getOfficeName() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getOfficeFaceUrl() +":"+  view.getOfficeBackgroundUrls() +":"+  view.getOfficeDesc() +":"+  view.getOfficeCommentStar() +":"+  view.getOfficeServiceAttitude() +":"+  view.getOfficeServiceQuality() +":"+  view.getOfficeResponseSpeed() +":"+  view.getOfficePushmessagetxtcount() +":"+  view.getOfficeServicesCount() +":"+  view.getOfficeFollowersCount() +":"+  view.getOfficeCreateUserId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeProficientcount() +":"+  view.getOfficeIsSetGoodat() +":"+  view.getInviteCode() +":"+  view.getOfficeCopyId() +":"+  view.getOfficeCopyStatus() +":"+  view.getOfficeBusinesslicenceUrlsStatus() +":"+  view.getInviteCodePhone() +":"+  view.getOfficeDoctorVisitSchedual() %>')" title="删除"></a>
											    <a class="o-view" href="Office.mc?method=detailOffice&officeId,officeHalfbodyUrl,offficeIdentifyUrl,officeQualificationUrl,officeBusinesslicenceUrls,officeHandAddress,officeGaodeAddress,officeGaodeAddrGpsLng,officeGaodeAddrGpsLat,officeScope,officeType,officeName,officeMasterName,officeMasterPhone,officeStatus,officeFaceUrl,officeBackgroundUrls,officeDesc,officeCommentStar,officeServiceAttitude,officeServiceQuality,officeResponseSpeed,officePushmessagetxtcount,officeServicesCount,officeFollowersCount,officeCreateUserId,createTime,optTime,remark,officeProficientcount,officeIsSetGoodat,inviteCode,officeCopyId,officeCopyStatus,officeBusinesslicenceUrlsStatus,inviteCodePhone,officeDoctorVisitSchedual=<%= view.getOfficeId() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeHandAddress() +":"+  view.getOfficeGaodeAddress() +":"+  view.getOfficeGaodeAddrGpsLng() +":"+  view.getOfficeGaodeAddrGpsLat() +":"+  view.getOfficeScope() +":"+  view.getOfficeType() +":"+  view.getOfficeName() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getOfficeFaceUrl() +":"+  view.getOfficeBackgroundUrls() +":"+  view.getOfficeDesc() +":"+  view.getOfficeCommentStar() +":"+  view.getOfficeServiceAttitude() +":"+  view.getOfficeServiceQuality() +":"+  view.getOfficeResponseSpeed() +":"+  view.getOfficePushmessagetxtcount() +":"+  view.getOfficeServicesCount() +":"+  view.getOfficeFollowersCount() +":"+  view.getOfficeCreateUserId() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeProficientcount() +":"+  view.getOfficeIsSetGoodat() +":"+  view.getInviteCode() +":"+  view.getOfficeCopyId() +":"+  view.getOfficeCopyStatus() +":"+  view.getOfficeBusinesslicenceUrlsStatus() +":"+  view.getInviteCodePhone() +":"+  view.getOfficeDoctorVisitSchedual() %>" title="详情"></a> 
												
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
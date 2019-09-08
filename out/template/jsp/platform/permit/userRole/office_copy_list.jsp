<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.offices.data.OfficeCopy" %>
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
		function deleteOfficeCopy(PK) {
			jQuery.ajax({
				url : "OfficeCopy.mc?method=deleteOfficeCopy",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/OfficeCopy.mc?method=getAllPageOfficeCopy" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/office_copy_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="office_copy_id" placeholder="主键" value="${ param.office_copy_id }"/>
						    
						    	<input type='text' class="input-small" name="office_id" placeholder="工作室id" value="${ param.office_id }"/>
						    
						    	<input type='text' class="input-small" name="offfice_identify_url" placeholder="身份证" value="${ param.offfice_identify_url }"/>
						    
						    	<input type='text' class="input-small" name="office_qualification_url" placeholder="执业资格照" value="${ param.office_qualification_url }"/>
						    
						    	<input type='text' class="input-small" name="office_halfbody_url" placeholder="上半身照" value="${ param.office_halfbody_url }"/>
						    
						    	<input type='text' class="input-small" name="office_businesslicence_urls" placeholder="营业执照等有多个则用，" value="${ param.office_businesslicence_urls }"/>
						    
						    	<input type='text' class="input-small" name="office_master_name" placeholder="认证人姓名" value="${ param.office_master_name }"/>
						    
						    	<input type='text' class="input-small" name="office_master_phone" placeholder="认证人电话" value="${ param.office_master_phone }"/>
						    
						    	<input type='text' class="input-small" name="office_status" placeholder="1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过" value="${ param.office_status }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="创建时间" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="操作时间" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="备注" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="office_type" placeholder="工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室" value="${ param.office_type }"/>
						    
						    	<input type='text' class="input-small" name="invite_code" placeholder="使用的邀请码" value="${ param.invite_code }"/>
						    
						    	<input type='text' class="input-small" name="invite_code_phone" placeholder="" value="${ param.invite_code_phone }"/>

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
								<!-- 主键列{主键}-->   
								<th align="center" rowName="office_copy_id" orderName="office_copy_id:DESC" title='主键'>主键</th>
								<!-- 主键列{工作室id}-->   
								<th align="center" rowName="office_id" orderName="office_id:DESC" title='工作室id'>工作室id</th>
								<!-- 主键列{身份证}-->   
								<th align="center" rowName="offfice_identify_url" orderName="offfice_identify_url:DESC" title='身份证'>身份证</th>
								<!-- 主键列{执业资格照}-->   
								<th align="center" rowName="office_qualification_url" orderName="office_qualification_url:DESC" title='执业资格照'>执业资格照</th>
								<!-- 主键列{上半身照}-->   
								<th align="center" rowName="office_halfbody_url" orderName="office_halfbody_url:DESC" title='上半身照'>上半身照</th>
								<!-- 主键列{营业执照等有多个则用，}-->   
								<th align="center" rowName="office_businesslicence_urls" orderName="office_businesslicence_urls:DESC" title='营业执照等有多个则用，'>营业执照等有多个则用，</th>
								<!-- 主键列{认证人姓名}-->   
								<th align="center" rowName="office_master_name" orderName="office_master_name:DESC" title='认证人姓名'>认证人姓名</th>
								<!-- 主键列{认证人电话}-->   
								<th align="center" rowName="office_master_phone" orderName="office_master_phone:DESC" title='认证人电话'>认证人电话</th>
								<!-- 主键列{1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过}-->   
								<th align="center" rowName="office_status" orderName="office_status:DESC" title='1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过'>1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过</th>
								<!-- 主键列{创建时间}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列{操作时间}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='操作时间'>操作时间</th>
								<!-- 主键列{备注}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!-- 主键列{工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室}-->   
								<th align="center" rowName="office_type" orderName="office_type:DESC" title='工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室'>工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室</th>
								<!-- 主键列{使用的邀请码}-->   
								<th align="center" rowName="invite_code" orderName="invite_code:DESC" title='使用的邀请码'>使用的邀请码</th>
								<!-- 主键列{}-->   
								<th align="center" rowName="invite_code_phone" orderName="invite_code_phone:DESC" title=''></th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							OfficeCopy view = new OfficeCopy();
								for (int i = 0; i < list.size(); i++) {
									view = (OfficeCopy) list.get(i);
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
					
											<!-- 主键列{主键}-->   
											<td><%=view.getOfficeCopyId()%></td>
											<!-- 主键列{工作室id}-->   
											<td><%=view.getOfficeId()%></td>
											<!-- 主键列{身份证}-->   
											<td><%=view.getOffficeIdentifyUrl()%></td>
											<!-- 主键列{执业资格照}-->   
											<td><%=view.getOfficeQualificationUrl()%></td>
											<!-- 主键列{上半身照}-->   
											<td><%=view.getOfficeHalfbodyUrl()%></td>
											<!-- 主键列{营业执照等有多个则用，}-->   
											<td><%=view.getOfficeBusinesslicenceUrls()%></td>
											<!-- 主键列{认证人姓名}-->   
											<td><%=view.getOfficeMasterName()%></td>
											<!-- 主键列{认证人电话}-->   
											<td><%=view.getOfficeMasterPhone()%></td>
											<!-- 主键列{1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过}-->   
											<td><%=view.getOfficeStatus()%></td>
											<!-- 主键列{创建时间}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- 主键列{操作时间}-->   
											<td><%=view.getOptTime()%></td>
											<!-- 主键列{备注}-->   
											<td><%=view.getRemark()%></td>
											<!-- 主键列{工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室}-->   
											<td><%=view.getOfficeType()%></td>
											<!-- 主键列{使用的邀请码}-->   
											<td><%=view.getInviteCode()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getInviteCodePhone()%></td>

											<td>
												<a class="o-edit" href="OfficeCopy.mc?method=editOfficeCopy&officeCopyId,officeId,offficeIdentifyUrl,officeQualificationUrl,officeHalfbodyUrl,officeBusinesslicenceUrls,officeMasterName,officeMasterPhone,officeStatus,createTime,optTime,remark,officeType,inviteCode,inviteCodePhone=<%= view.getOfficeCopyId() +":"+  view.getOfficeId() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeType() +":"+  view.getInviteCode() +":"+  view.getInviteCodePhone() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteOfficeCopy('<%= view.getOfficeCopyId() +":"+  view.getOfficeId() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeType() +":"+  view.getInviteCode() +":"+  view.getInviteCodePhone() %>')" title="删除"></a>
											    <a class="o-view" href="OfficeCopy.mc?method=detailOfficeCopy&officeCopyId,officeId,offficeIdentifyUrl,officeQualificationUrl,officeHalfbodyUrl,officeBusinesslicenceUrls,officeMasterName,officeMasterPhone,officeStatus,createTime,optTime,remark,officeType,inviteCode,inviteCodePhone=<%= view.getOfficeCopyId() +":"+  view.getOfficeId() +":"+  view.getOffficeIdentifyUrl() +":"+  view.getOfficeQualificationUrl() +":"+  view.getOfficeHalfbodyUrl() +":"+  view.getOfficeBusinesslicenceUrls() +":"+  view.getOfficeMasterName() +":"+  view.getOfficeMasterPhone() +":"+  view.getOfficeStatus() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOfficeType() +":"+  view.getInviteCode() +":"+  view.getInviteCodePhone() %>" title="详情"></a> 
												
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
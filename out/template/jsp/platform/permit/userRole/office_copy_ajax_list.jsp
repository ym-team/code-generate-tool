<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.offices.data.OfficeCopy" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<TITLE>测试查询</TITLE>
	<!-- 导入JS和CSS样式-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skins/js/common/list_ajax.js"></script>
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
	<!-- 新样式风格必须引入的 -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css"> 
    <script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css">
    <!-- 查询页面上有 checkbox的需要引入 -->
   <script type="text/javascript">
		
		$(function(){
		
			$("input[name='selectall_checkbox']").on('ifClicked',
		                function () {
		                    $('input:checkbox').iCheck('toggle');
		                });
		                          
			var operates = {
				edit:'OfficeCopy.mc?method=editOfficeCopy&officeCopyId,officeId,offficeIdentifyUrl,officeQualificationUrl,officeHalfbodyUrl,officeBusinesslicenceUrls,officeMasterName,officeMasterPhone,officeStatus,createTime,optTime,remark,officeType,inviteCode,inviteCodePhone=',
				del:'OfficeCopy.mc?method=deleteOfficeCopy&PK=',
				view:'OfficeCopy.mc?method=detailOfficeCopy&officeCopyId,officeId,offficeIdentifyUrl,officeQualificationUrl,officeHalfbodyUrl,officeBusinesslicenceUrls,officeMasterName,officeMasterPhone,officeStatus,createTime,optTime,remark,officeType,inviteCode,inviteCodePhone='
			};
			var options = {
				tableId:'pageTable',
				url:'OfficeCopy.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'officeCopyId,officeId,offficeIdentifyUrl,officeQualificationUrl,officeHalfbodyUrl,officeBusinesslicenceUrls,officeMasterName,officeMasterPhone,officeStatus,createTime,optTime,remark,officeType,inviteCode,inviteCodePhone'
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
 		
 		<!-- 查询条件显示区域start -->
 		<div class="tabelist" style="border:1px solid gray;width:100%;padding:10px;margin:0 auto;">
			<div style="margin:0 auto;width:100%;">
			<div class="title-common">
				 	测试查询
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
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
		<button type="button" id="searchBtn" class="btn btn-group-vertical">搜索</button>
							</div>
						</td>
						</tr>
		</table>
				</div>
			</div>
			<!-- 查询条件显示区域end -->
			<!--//数据显示列表-->
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
	                            	<input name="selectall_checkbox" id="selectall_checkbox" type="checkbox" title="全选/取消" />
	                            </th>
	                            <!--表头循环开始 -->
								<!-- 主键列  主键-->   
								<th align="center" rowName="officeCopyId" orderName="office_copy_id:DESC" title='主键'>主键</th>
								<!-- 主键列  工作室id-->   
								<th align="center" rowName="officeId" orderName="office_id:DESC" title='工作室id'>工作室id</th>
								<!-- 主键列  身份证-->   
								<th align="center" rowName="offficeIdentifyUrl" orderName="offfice_identify_url:DESC" title='身份证'>身份证</th>
								<!-- 主键列  执业资格照-->   
								<th align="center" rowName="officeQualificationUrl" orderName="office_qualification_url:DESC" title='执业资格照'>执业资格照</th>
								<!-- 主键列  上半身照-->   
								<th align="center" rowName="officeHalfbodyUrl" orderName="office_halfbody_url:DESC" title='上半身照'>上半身照</th>
								<!-- 主键列  营业执照等有多个则用，-->   
								<th align="center" rowName="officeBusinesslicenceUrls" orderName="office_businesslicence_urls:DESC" title='营业执照等有多个则用，'>营业执照等有多个则用，</th>
								<!-- 主键列  认证人姓名-->   
								<th align="center" rowName="officeMasterName" orderName="office_master_name:DESC" title='认证人姓名'>认证人姓名</th>
								<!-- 主键列  认证人电话-->   
								<th align="center" rowName="officeMasterPhone" orderName="office_master_phone:DESC" title='认证人电话'>认证人电话</th>
								<!-- 主键列  1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过-->   
								<th align="center" rowName="officeStatus" orderName="office_status:DESC" title='1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过'>1.未审核 2.审核中 3.上线(上线后除了类型，其他都可以修改,当类型office_type可修改时也只能往上修改) 4.申请下线（申请下线以后不能接受订单）5.下线 6.审核不通过</th>
								<!-- 主键列  创建时间-->   
								<th align="center" rowName="createTime" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列  操作时间-->   
								<th align="center" rowName="optTime" orderName="opt_time:DESC" title='操作时间'>操作时间</th>
								<!-- 主键列  备注-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!-- 主键列  工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室-->   
								<th align="center" rowName="officeType" orderName="office_type:DESC" title='工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室'>工作室类型,  （3医疗 ，2护理，1陪诊） （类型修改需往上修改不能往下），其它可以任意修改，但地址手动修改导致无法用到高德，无法用到高德,则用户在距离搜索中无法查到该工作室</th>
								<!-- 主键列  使用的邀请码-->   
								<th align="center" rowName="inviteCode" orderName="invite_code:DESC" title='使用的邀请码'>使用的邀请码</th>
								<!-- 主键列  -->   
								<th align="center" rowName="inviteCodePhone" orderName="invite_code_phone:DESC" title=''></th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
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
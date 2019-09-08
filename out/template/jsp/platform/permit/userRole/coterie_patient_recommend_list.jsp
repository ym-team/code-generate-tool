<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.szjk.dhome.coteriepatient.data.CoteriePatientRecommend" %>
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
	<TITLE>锟斤拷锟斤拷查询</TITLE>
	
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
		function deleteCoteriePatientRecommend(PK) {
			jQuery.ajax({
				url : "CoteriePatientRecommend.mc?method=deleteCoteriePatientRecommend",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/CoteriePatientRecommend.mc?method=getAllPageCoteriePatientRecommend" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/coterie_patient_recommend_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="主键" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="name" placeholder="圈子名称  系统圈名参考deptname" value="${ param.name }"/>
						    
						    	<input type='text' class="input-small" name="coterie_desc" placeholder="圈子介绍" value="${ param.coterie_desc }"/>
						    
						    	<input type='text' class="input-small" name="pic_url" placeholder="圈子图 最多6张图 以|分隔" value="${ param.pic_url }"/>
						    
						    	<input type='text' class="input-small" name="coterie_type" placeholder="1 公圈 2 私圈" value="${ param.coterie_type }"/>
						    
						    	<input type='text' class="input-small" name="coterie_service_type" placeholder="圈子业务类型 暂未启用 默认为0" value="${ param.coterie_service_type }"/>
						    
						    	<input type='text' class="input-small" name="coterie_status" placeholder="1 审核中   2 成功   3 拒绝   4. 解散" value="${ param.coterie_status }"/>
						    
						    	<input type='text' class="input-small" name="create_user_id" placeholder="创建者id" value="${ param.create_user_id }"/>
						    
						    	<input type='text' class="input-small" name="channel_type" placeholder="用户类型 1 木棉健康 2 家校健康 3 家校app" value="${ param.channel_type }"/>
						    
						    	<input type='text' class="input-small" name="member_count" placeholder="成员数" value="${ param.member_count }"/>
						    
						    	<input type='text' class="input-small" name="post_count" placeholder="帖子数" value="${ param.post_count }"/>
						    
						    	<input type='text' class="input-small" name="sub_system_type" placeholder="系统圈 为 deptId    自建圈为 0" value="${ param.sub_system_type }"/>
						    
						    	<input type='text' class="input-small" name="system_type" placeholder="1 系统默认圈  2 自建圈" value="${ param.system_type }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="创建时间" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="更新时间" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="备注" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="order1" placeholder="备注1" value="${ param.order1 }"/>
						    
						    	<input type='text' class="input-small" name="source" placeholder="1 系统数据统计来源 2 运营推荐" value="${ param.source }"/>
						    
						    	<input type='text' class="input-small" name="face_url" placeholder="头像" value="${ param.face_url }"/>
						    
						    	<input type='text' class="input-small" name="coterie_id" placeholder="圈子id" value="${ param.coterie_id }"/>

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
								<th align="center" rowName="id" orderName="id:DESC" title='主键'>主键</th>
								<!-- 主键列{圈子名称  系统圈名参考deptname}-->   
								<th align="center" rowName="name" orderName="name:DESC" title='圈子名称  系统圈名参考deptname'>圈子名称  系统圈名参考deptname</th>
								<!-- 主键列{圈子介绍}-->   
								<th align="center" rowName="coterie_desc" orderName="coterie_desc:DESC" title='圈子介绍'>圈子介绍</th>
								<!-- 主键列{圈子图 最多6张图 以|分隔}-->   
								<th align="center" rowName="pic_url" orderName="pic_url:DESC" title='圈子图 最多6张图 以|分隔'>圈子图 最多6张图 以|分隔</th>
								<!-- 主键列{1 公圈 2 私圈}-->   
								<th align="center" rowName="coterie_type" orderName="coterie_type:DESC" title='1 公圈 2 私圈'>1 公圈 2 私圈</th>
								<!-- 主键列{圈子业务类型 暂未启用 默认为0}-->   
								<th align="center" rowName="coterie_service_type" orderName="coterie_service_type:DESC" title='圈子业务类型 暂未启用 默认为0'>圈子业务类型 暂未启用 默认为0</th>
								<!-- 主键列{1 审核中   2 成功   3 拒绝   4. 解散}-->   
								<th align="center" rowName="coterie_status" orderName="coterie_status:DESC" title='1 审核中   2 成功   3 拒绝   4. 解散'>1 审核中   2 成功   3 拒绝   4. 解散</th>
								<!-- 主键列{创建者id}-->   
								<th align="center" rowName="create_user_id" orderName="create_user_id:DESC" title='创建者id'>创建者id</th>
								<!-- 主键列{用户类型 1 木棉健康 2 家校健康 3 家校app}-->   
								<th align="center" rowName="channel_type" orderName="channel_type:DESC" title='用户类型 1 木棉健康 2 家校健康 3 家校app'>用户类型 1 木棉健康 2 家校健康 3 家校app</th>
								<!-- 主键列{成员数}-->   
								<th align="center" rowName="member_count" orderName="member_count:DESC" title='成员数'>成员数</th>
								<!-- 主键列{帖子数}-->   
								<th align="center" rowName="post_count" orderName="post_count:DESC" title='帖子数'>帖子数</th>
								<!-- 主键列{系统圈 为 deptId    自建圈为 0}-->   
								<th align="center" rowName="sub_system_type" orderName="sub_system_type:DESC" title='系统圈 为 deptId    自建圈为 0'>系统圈 为 deptId    自建圈为 0</th>
								<!-- 主键列{1 系统默认圈  2 自建圈}-->   
								<th align="center" rowName="system_type" orderName="system_type:DESC" title='1 系统默认圈  2 自建圈'>1 系统默认圈  2 自建圈</th>
								<!-- 主键列{创建时间}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='创建时间'>创建时间</th>
								<!-- 主键列{更新时间}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='更新时间'>更新时间</th>
								<!-- 主键列{备注}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!-- 主键列{备注1}-->   
								<th align="center" rowName="order1" orderName="order1:DESC" title='备注1'>备注1</th>
								<!-- 主键列{1 系统数据统计来源 2 运营推荐}-->   
								<th align="center" rowName="source" orderName="source:DESC" title='1 系统数据统计来源 2 运营推荐'>1 系统数据统计来源 2 运营推荐</th>
								<!-- 主键列{头像}-->   
								<th align="center" rowName="face_url" orderName="face_url:DESC" title='头像'>头像</th>
								<!-- 主键列{圈子id}-->   
								<th align="center" rowName="coterie_id" orderName="coterie_id:DESC" title='圈子id'>圈子id</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							CoteriePatientRecommend view = new CoteriePatientRecommend();
								for (int i = 0; i < list.size(); i++) {
									view = (CoteriePatientRecommend) list.get(i);
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
											<td><%=view.getId()%></td>
											<!-- 主键列{圈子名称  系统圈名参考deptname}-->   
											<td><%=view.getName()%></td>
											<!-- 主键列{圈子介绍}-->   
											<td><%=view.getCoterieDesc()%></td>
											<!-- 主键列{圈子图 最多6张图 以|分隔}-->   
											<td><%=view.getPicUrl()%></td>
											<!-- 主键列{1 公圈 2 私圈}-->   
											<td><%=view.getCoterieType()%></td>
											<!-- 主键列{圈子业务类型 暂未启用 默认为0}-->   
											<td><%=view.getCoterieServiceType()%></td>
											<!-- 主键列{1 审核中   2 成功   3 拒绝   4. 解散}-->   
											<td><%=view.getCoterieStatus()%></td>
											<!-- 主键列{创建者id}-->   
											<td><%=view.getCreateUserId()%></td>
											<!-- 主键列{用户类型 1 木棉健康 2 家校健康 3 家校app}-->   
											<td><%=view.getChannelType()%></td>
											<!-- 主键列{成员数}-->   
											<td><%=view.getMemberCount()%></td>
											<!-- 主键列{帖子数}-->   
											<td><%=view.getPostCount()%></td>
											<!-- 主键列{系统圈 为 deptId    自建圈为 0}-->   
											<td><%=view.getSubSystemType()%></td>
											<!-- 主键列{1 系统默认圈  2 自建圈}-->   
											<td><%=view.getSystemType()%></td>
											<!-- 主键列{创建时间}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- 主键列{更新时间}-->   
											<td><%=view.getOptTime()%></td>
											<!-- 主键列{备注}-->   
											<td><%=view.getRemark()%></td>
											<!-- 主键列{备注1}-->   
											<td><%=view.getOrder1()%></td>
											<!-- 主键列{1 系统数据统计来源 2 运营推荐}-->   
											<td><%=view.getSource()%></td>
											<!-- 主键列{头像}-->   
											<td><%=view.getFaceUrl()%></td>
											<!-- 主键列{圈子id}-->   
											<td><%=view.getCoterieId()%></td>

											<td>
												<a class="o-edit" href="CoteriePatientRecommend.mc?method=editCoteriePatientRecommend&id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,order1,source,faceUrl,coterieId=<%= view.getId() +":"+  view.getName() +":"+  view.getCoterieDesc() +":"+  view.getPicUrl() +":"+  view.getCoterieType() +":"+  view.getCoterieServiceType() +":"+  view.getCoterieStatus() +":"+  view.getCreateUserId() +":"+  view.getChannelType() +":"+  view.getMemberCount() +":"+  view.getPostCount() +":"+  view.getSubSystemType() +":"+  view.getSystemType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOrder1() +":"+  view.getSource() +":"+  view.getFaceUrl() +":"+  view.getCoterieId() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteCoteriePatientRecommend('<%= view.getId() +":"+  view.getName() +":"+  view.getCoterieDesc() +":"+  view.getPicUrl() +":"+  view.getCoterieType() +":"+  view.getCoterieServiceType() +":"+  view.getCoterieStatus() +":"+  view.getCreateUserId() +":"+  view.getChannelType() +":"+  view.getMemberCount() +":"+  view.getPostCount() +":"+  view.getSubSystemType() +":"+  view.getSystemType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOrder1() +":"+  view.getSource() +":"+  view.getFaceUrl() +":"+  view.getCoterieId() %>')" title="删除"></a>
											    <a class="o-view" href="CoteriePatientRecommend.mc?method=detailCoteriePatientRecommend&id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,order1,source,faceUrl,coterieId=<%= view.getId() +":"+  view.getName() +":"+  view.getCoterieDesc() +":"+  view.getPicUrl() +":"+  view.getCoterieType() +":"+  view.getCoterieServiceType() +":"+  view.getCoterieStatus() +":"+  view.getCreateUserId() +":"+  view.getChannelType() +":"+  view.getMemberCount() +":"+  view.getPostCount() +":"+  view.getSubSystemType() +":"+  view.getSystemType() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getOrder1() +":"+  view.getSource() +":"+  view.getFaceUrl() +":"+  view.getCoterieId() %>" title="详情"></a> 
												
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
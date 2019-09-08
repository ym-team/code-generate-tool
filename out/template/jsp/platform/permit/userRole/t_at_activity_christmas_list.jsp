<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TAtActivityChristmas" %>
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
	<TITLE>圣诞活动�?��ѯ</TITLE>
	
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
		function deleteTAtActivityChristmas(PK) {
			jQuery.ajax({
				url : "TAtActivityChristmas.mc?method=deleteTAtActivityChristmas",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TAtActivityChristmas.mc?method=getAllPageTAtActivityChristmas" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_at_activity_christmas_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="主键" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="user_id" placeholder="用户id 0为游�?" value="${ param.user_id }"/>
						    
						    	<input type='text' class="input-small" name="make_time" placeholder="卡片制作时间" value="${ param.make_time }"/>
						    
						    	<input type='text' class="input-small" name="card_id" placeholder="前端八种卡片id" value="${ param.card_id }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="1:无效 2有效 默认2" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="user_phone" placeholder="卡片制作者电�? 游客�?0" value="${ param.user_phone }"/>
						    
						    	<input type='text' class="input-small" name="christmas_word" placeholder="卡片祝福�?" value="${ param.christmas_word }"/>
						    
						    	<input type='text' class="input-small" name="share_count" placeholder="分享�?" value="${ param.share_count }"/>
						    
						    	<input type='text' class="input-small" name="open_count" placeholder="打开次数" value="${ param.open_count }"/>
						    
						    	<input type='text' class="input-small" name="db_update_time" placeholder="更新时间" value="${ param.db_update_time }"/>
						    
						    	<input type='text' class="input-small" name="db_create_time" placeholder="创建时间" value="${ param.db_create_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="备注" value="${ param.remark }"/>

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
								<!-- ������{主键}-->   
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='主键'>主键</th>
								<!-- ������{用户id 0为游�?}-->   
								<th align="center" rowName="user_id" orderName="user_id:DESC" title='用户id 0为游�?'>用户id 0为游�?</th>
								<!-- ������{卡片制作时间}-->   
								<th align="center" rowName="make_time" orderName="make_time:DESC" title='卡片制作时间'>卡片制作时间</th>
								<!-- ������{前端八种卡片id}-->   
								<th align="center" rowName="card_id" orderName="card_id:DESC" title='前端八种卡片id'>前端八种卡片id</th>
								<!-- ������{1:无效 2有效 默认2}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='1:无效 2有效 默认2'>1:无效 2有效 默认2</th>
								<!-- ������{卡片制作者电�? 游客�?0}-->   
								<th align="center" rowName="user_phone" orderName="user_phone:DESC" title='卡片制作者电�? 游客�?0'>卡片制作者电�? 游客�?0</th>
								<!-- ������{卡片祝福�?}-->   
								<th align="center" rowName="christmas_word" orderName="christmas_word:DESC" title='卡片祝福�?'>卡片祝福�?</th>
								<!-- ������{分享�?}-->   
								<th align="center" rowName="share_count" orderName="share_count:DESC" title='分享�?'>分享�?</th>
								<!-- ������{打开次数}-->   
								<th align="center" rowName="open_count" orderName="open_count:DESC" title='打开次数'>打开次数</th>
								<!-- ������{更新时间}-->   
								<th align="center" rowName="db_update_time" orderName="db_update_time:DESC" title='更新时间'>更新时间</th>
								<!-- ������{创建时间}-->   
								<th align="center" rowName="db_create_time" orderName="db_create_time:DESC" title='创建时间'>创建时间</th>
								<!-- ������{备注}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							TAtActivityChristmas view = new TAtActivityChristmas();
								for (int i = 0; i < list.size(); i++) {
									view = (TAtActivityChristmas) list.get(i);
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
					
											<!-- ������{主键}-->   
											<td><%=view.getPkId()%></td>
											<!-- ������{用户id 0为游�?}-->   
											<td><%=view.getUserId()%></td>
											<!-- ������{卡片制作时间}-->   
											<td><%=view.getMakeTime()%></td>
											<!-- ������{前端八种卡片id}-->   
											<td><%=view.getCardId()%></td>
											<!-- ������{1:无效 2有效 默认2}-->   
											<td><%=view.getStatus()%></td>
											<!-- ������{卡片制作者电�? 游客�?0}-->   
											<td><%=view.getUserPhone()%></td>
											<!-- ������{卡片祝福�?}-->   
											<td><%=view.getChristmasWord()%></td>
											<!-- ������{分享�?}-->   
											<td><%=view.getShareCount()%></td>
											<!-- ������{打开次数}-->   
											<td><%=view.getOpenCount()%></td>
											<!-- ������{更新时间}-->   
											<td><%=view.getDbUpdateTime()%></td>
											<!-- ������{创建时间}-->   
											<td><%=view.getDbCreateTime()%></td>
											<!-- ������{备注}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="TAtActivityChristmas.mc?method=editTAtActivityChristmas&pkId,userId,makeTime,cardId,status,userPhone,christmasWord,shareCount,openCount,dbUpdateTime,dbCreateTime,remark=<%= view.getPkId() +":"+  view.getUserId() +":"+  view.getMakeTime() +":"+  view.getCardId() +":"+  view.getStatus() +":"+  view.getUserPhone() +":"+  view.getChristmasWord() +":"+  view.getShareCount() +":"+  view.getOpenCount() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTAtActivityChristmas('<%= view.getPkId() +":"+  view.getUserId() +":"+  view.getMakeTime() +":"+  view.getCardId() +":"+  view.getStatus() +":"+  view.getUserPhone() +":"+  view.getChristmasWord() +":"+  view.getShareCount() +":"+  view.getOpenCount() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>')" title="ɾ��"></a>
											    <a class="o-view" href="TAtActivityChristmas.mc?method=detailTAtActivityChristmas&pkId,userId,makeTime,cardId,status,userPhone,christmasWord,shareCount,openCount,dbUpdateTime,dbCreateTime,remark=<%= view.getPkId() +":"+  view.getUserId() +":"+  view.getMakeTime() +":"+  view.getCardId() +":"+  view.getStatus() +":"+  view.getUserPhone() +":"+  view.getChristmasWord() +":"+  view.getShareCount() +":"+  view.getOpenCount() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>" title="����"></a> 
												
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
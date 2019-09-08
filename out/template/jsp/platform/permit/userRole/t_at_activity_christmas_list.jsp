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
	<TITLE>鍦ｈ癁娲诲姩琛?查询</TITLE>
	
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
		function deleteTAtActivityChristmas(PK) {
			jQuery.ajax({
				url : "TAtActivityChristmas.mc?method=deleteTAtActivityChristmas",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TAtActivityChristmas.mc?method=getAllPageTAtActivityChristmas" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_at_activity_christmas_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="pk_id" placeholder="涓婚敭" value="${ param.pk_id }"/>
						    
						    	<input type='text' class="input-small" name="user_id" placeholder="鐢ㄦ埛id 0涓烘父瀹?" value="${ param.user_id }"/>
						    
						    	<input type='text' class="input-small" name="make_time" placeholder="鍗＄墖鍒朵綔鏃堕棿" value="${ param.make_time }"/>
						    
						    	<input type='text' class="input-small" name="card_id" placeholder="鍓嶇鍏鍗＄墖id" value="${ param.card_id }"/>
						    
						    	<input type='text' class="input-small" name="status" placeholder="1:鏃犳晥 2鏈夋晥 榛樿2" value="${ param.status }"/>
						    
						    	<input type='text' class="input-small" name="user_phone" placeholder="鍗＄墖鍒朵綔鑰呯數璇? 娓稿涓?0" value="${ param.user_phone }"/>
						    
						    	<input type='text' class="input-small" name="christmas_word" placeholder="鍗＄墖绁濈璇?" value="${ param.christmas_word }"/>
						    
						    	<input type='text' class="input-small" name="share_count" placeholder="鍒嗕韩鏁?" value="${ param.share_count }"/>
						    
						    	<input type='text' class="input-small" name="open_count" placeholder="鎵撳紑娆℃暟" value="${ param.open_count }"/>
						    
						    	<input type='text' class="input-small" name="db_update_time" placeholder="鏇存柊鏃堕棿" value="${ param.db_update_time }"/>
						    
						    	<input type='text' class="input-small" name="db_create_time" placeholder="鍒涘缓鏃堕棿" value="${ param.db_create_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="澶囨敞" value="${ param.remark }"/>

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
								<!-- 主键列{涓婚敭}-->   
								<th align="center" rowName="pk_id" orderName="pk_id:DESC" title='涓婚敭'>涓婚敭</th>
								<!-- 主键列{鐢ㄦ埛id 0涓烘父瀹?}-->   
								<th align="center" rowName="user_id" orderName="user_id:DESC" title='鐢ㄦ埛id 0涓烘父瀹?'>鐢ㄦ埛id 0涓烘父瀹?</th>
								<!-- 主键列{鍗＄墖鍒朵綔鏃堕棿}-->   
								<th align="center" rowName="make_time" orderName="make_time:DESC" title='鍗＄墖鍒朵綔鏃堕棿'>鍗＄墖鍒朵綔鏃堕棿</th>
								<!-- 主键列{鍓嶇鍏鍗＄墖id}-->   
								<th align="center" rowName="card_id" orderName="card_id:DESC" title='鍓嶇鍏鍗＄墖id'>鍓嶇鍏鍗＄墖id</th>
								<!-- 主键列{1:鏃犳晥 2鏈夋晥 榛樿2}-->   
								<th align="center" rowName="status" orderName="status:DESC" title='1:鏃犳晥 2鏈夋晥 榛樿2'>1:鏃犳晥 2鏈夋晥 榛樿2</th>
								<!-- 主键列{鍗＄墖鍒朵綔鑰呯數璇? 娓稿涓?0}-->   
								<th align="center" rowName="user_phone" orderName="user_phone:DESC" title='鍗＄墖鍒朵綔鑰呯數璇? 娓稿涓?0'>鍗＄墖鍒朵綔鑰呯數璇? 娓稿涓?0</th>
								<!-- 主键列{鍗＄墖绁濈璇?}-->   
								<th align="center" rowName="christmas_word" orderName="christmas_word:DESC" title='鍗＄墖绁濈璇?'>鍗＄墖绁濈璇?</th>
								<!-- 主键列{鍒嗕韩鏁?}-->   
								<th align="center" rowName="share_count" orderName="share_count:DESC" title='鍒嗕韩鏁?'>鍒嗕韩鏁?</th>
								<!-- 主键列{鎵撳紑娆℃暟}-->   
								<th align="center" rowName="open_count" orderName="open_count:DESC" title='鎵撳紑娆℃暟'>鎵撳紑娆℃暟</th>
								<!-- 主键列{鏇存柊鏃堕棿}-->   
								<th align="center" rowName="db_update_time" orderName="db_update_time:DESC" title='鏇存柊鏃堕棿'>鏇存柊鏃堕棿</th>
								<!-- 主键列{鍒涘缓鏃堕棿}-->   
								<th align="center" rowName="db_create_time" orderName="db_create_time:DESC" title='鍒涘缓鏃堕棿'>鍒涘缓鏃堕棿</th>
								<!-- 主键列{澶囨敞}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='澶囨敞'>澶囨敞</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
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
				                            	<input name="selectall_checkbox" type="checkbox" title="全选/取消" />
				                            </th>
					
											<!-- 主键列{涓婚敭}-->   
											<td><%=view.getPkId()%></td>
											<!-- 主键列{鐢ㄦ埛id 0涓烘父瀹?}-->   
											<td><%=view.getUserId()%></td>
											<!-- 主键列{鍗＄墖鍒朵綔鏃堕棿}-->   
											<td><%=view.getMakeTime()%></td>
											<!-- 主键列{鍓嶇鍏鍗＄墖id}-->   
											<td><%=view.getCardId()%></td>
											<!-- 主键列{1:鏃犳晥 2鏈夋晥 榛樿2}-->   
											<td><%=view.getStatus()%></td>
											<!-- 主键列{鍗＄墖鍒朵綔鑰呯數璇? 娓稿涓?0}-->   
											<td><%=view.getUserPhone()%></td>
											<!-- 主键列{鍗＄墖绁濈璇?}-->   
											<td><%=view.getChristmasWord()%></td>
											<!-- 主键列{鍒嗕韩鏁?}-->   
											<td><%=view.getShareCount()%></td>
											<!-- 主键列{鎵撳紑娆℃暟}-->   
											<td><%=view.getOpenCount()%></td>
											<!-- 主键列{鏇存柊鏃堕棿}-->   
											<td><%=view.getDbUpdateTime()%></td>
											<!-- 主键列{鍒涘缓鏃堕棿}-->   
											<td><%=view.getDbCreateTime()%></td>
											<!-- 主键列{澶囨敞}-->   
											<td><%=view.getRemark()%></td>

											<td>
												<a class="o-edit" href="TAtActivityChristmas.mc?method=editTAtActivityChristmas&pkId,userId,makeTime,cardId,status,userPhone,christmasWord,shareCount,openCount,dbUpdateTime,dbCreateTime,remark=<%= view.getPkId() +":"+  view.getUserId() +":"+  view.getMakeTime() +":"+  view.getCardId() +":"+  view.getStatus() +":"+  view.getUserPhone() +":"+  view.getChristmasWord() +":"+  view.getShareCount() +":"+  view.getOpenCount() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTAtActivityChristmas('<%= view.getPkId() +":"+  view.getUserId() +":"+  view.getMakeTime() +":"+  view.getCardId() +":"+  view.getStatus() +":"+  view.getUserPhone() +":"+  view.getChristmasWord() +":"+  view.getShareCount() +":"+  view.getOpenCount() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>')" title="删除"></a>
											    <a class="o-view" href="TAtActivityChristmas.mc?method=detailTAtActivityChristmas&pkId,userId,makeTime,cardId,status,userPhone,christmasWord,shareCount,openCount,dbUpdateTime,dbCreateTime,remark=<%= view.getPkId() +":"+  view.getUserId() +":"+  view.getMakeTime() +":"+  view.getCardId() +":"+  view.getStatus() +":"+  view.getUserPhone() +":"+  view.getChristmasWord() +":"+  view.getShareCount() +":"+  view.getOpenCount() +":"+  view.getDbUpdateTime() +":"+  view.getDbCreateTime() +":"+  view.getRemark() %>" title="详情"></a> 
												
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
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TPmBillJoinNc" %>
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
	<TITLE>閿熸枻鎷烽敓鏂ゆ嫹查询</TITLE>
	
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
		function deleteTPmBillJoinNc(PK) {
			jQuery.ajax({
				url : "TPmBillJoinNc.mc?method=deleteTPmBillJoinNc",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/TPmBillJoinNc.mc?method=getAllPageTPmBillJoinNc" id="searchForm">
 		<!-- 查询条件显示区域start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/t_pm_bill_join_nc_edit.jsp'">添加</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="join_id" placeholder="璐﹀崟缁撶畻ID" value="${ param.join_id }"/>
						    
						    	<input type='text' class="input-small" name="balance_id" placeholder="璐﹀崟缁撶畻ID" value="${ param.balance_id }"/>
						    
						    	<input type='text' class="input-small" name="bill_code" placeholder="璐﹀崟缂栧彿" value="${ param.bill_code }"/>
						    
						    	<input type='text' class="input-small" name="type_code" placeholder="璐﹀崟绫诲瀷缂栫爜" value="${ param.type_code }"/>
						    
						    	<input type='text' class="input-small" name="nrevmny" placeholder="缂磋垂閲戦锛堝厓锛?" value="${ param.nrevmny }"/>
						    
						    	<input type='text' class="input-small" name="nrevlfmny" placeholder="婊炵撼閲戯紙鍏冿級" value="${ param.nrevlfmny }"/>
						    
						    	<input type='text' class="input-small" name="pay_time" placeholder="鏀粯鏃堕棿" value="${ param.pay_time }"/>
						    
						    	<input type='text' class="input-small" name="company_account" placeholder="鐗╀笟鍏徃鐨勮祫閲戣处鎴?" value="${ param.company_account }"/>
						    
						    	<input type='text' class="input-small" name="nc_bill_id" placeholder="nc_bill_id" value="${ param.nc_bill_id }"/>
						    
						    	<input type='text' class="input-small" name="nc_company_id" placeholder="NC鐗╀笟鍏徃涓婚敭" value="${ param.nc_company_id }"/>
						    
						    	<input type='text' class="input-small" name="nc_manage_id" placeholder="绠＄悊澶勪富閿?" value="${ param.nc_manage_id }"/>
						    
						    	<input type='text' class="input-small" name="join_status" placeholder="缂寸撼鐘舵?侊紙0-寰呭悓姝ワ紝1-鎴愬姛锛?2-澶辫触锛?" value="${ param.join_status }"/>
						    
						    	<input type='text' class="input-small" name="join_time" placeholder="鍚屾NC鏃堕棿" value="${ param.join_time }"/>
						    
						    	<input type='text' class="input-small" name="nc_ts" placeholder="" value="${ param.nc_ts }"/>
						    
						    	<input type='text' class="input-small" name="nc_return_status" placeholder="鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫??(0锛氭湭鍚屾锛? 1锛氭墽琛岄敊璇紱 2锛氭湭鎺堟潈(瀹夊叏妫?楠屼笉閫氳繃)锛? 3锛氭湇鍔″凡鍋滄(涓嶆彁渚涙湇鍔?)锛? 4锛氳垂鐢ㄥ湪NC绔彂鐢熷彉鍖栵紱 5锛氫紶鍏ョ殑璐圭敤鏇存柊銆佹煡璇㈠弬鏁版湁璇紱 6锛歂C绔煡璇㈤敊璇? 锛? 7锛氶噸澶嶇即璐?)锛? 8锛歂C鏈嶅姟缁存姢涓紱99锛氬瘑铚滀紶鍏C鍙傛暟鏈夎銆?" value="${ param.nc_return_status }"/>
						    
						    	<input type='text' class="input-small" name="nc_return_message" placeholder="鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫け璐ユ弿杩颁俊鎭?" value="${ param.nc_return_message }"/>
						    
						    	<input type='text' class="input-small" name="refund_user_id" placeholder="閫?娆句汉id" value="${ param.refund_user_id }"/>
						    
						    	<input type='text' class="input-small" name="refund_time" placeholder="閫?娆炬椂闂?" value="${ param.refund_time }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="璁板綍娣诲姞鏃堕棿" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="db_create_time" placeholder="鍒涘缓鏃堕棿" value="${ param.db_create_time }"/>
						    
						    	<input type='text' class="input-small" name="db_update_time" placeholder="鏇存柊鏃堕棿" value="${ param.db_update_time }"/>
						    
						    	<input type='text' class="input-small" name="refund_status" placeholder="閲嶅缂磋垂锛岄??娆剧姸鎬侊紙0:榛樿鍊硷紱1:閫?娆句腑锛涘凡閫?娆撅級" value="${ param.refund_status }"/>
						    
						    	<input type='text' class="input-small" name="community_id" placeholder="灏忓尯ID" value="${ param.community_id }"/>
						    
						    	<input type='text' class="input-small" name="house_id" placeholder="鎴夸骇ID" value="${ param.house_id }"/>
						    
						    	<input type='text' class="input-small" name="year" placeholder="璐﹀崟骞翠唤" value="${ param.year }"/>
						    
						    	<input type='text' class="input-small" name="month" placeholder="璐﹀崟鏈堜唤" value="${ param.month }"/>
						    
						    	<input type='text' class="input-small" name="processing_status" placeholder="寮傚父鍗曞鐞嗙姸鎬?(0-鏈鐞?,1-宸插鐞?,2-浜哄伐閫?娆句腑,3-宸茬‘璁ら??娆?,4-宸茬‘璁よ浆棰勫瓨)" value="${ param.processing_status }"/>
						    
						    	<input type='text' class="input-small" name="unit_id" placeholder="鍗曞厓ID" value="${ param.unit_id }"/>

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
								<!-- 主键列{璐﹀崟缁撶畻ID}-->   
								<th align="center" rowName="join_id" orderName="join_id:DESC" title='璐﹀崟缁撶畻ID'>璐﹀崟缁撶畻ID</th>
								<!-- 主键列{璐﹀崟缁撶畻ID}-->   
								<th align="center" rowName="balance_id" orderName="balance_id:DESC" title='璐﹀崟缁撶畻ID'>璐﹀崟缁撶畻ID</th>
								<!-- 主键列{璐﹀崟缂栧彿}-->   
								<th align="center" rowName="bill_code" orderName="bill_code:DESC" title='璐﹀崟缂栧彿'>璐﹀崟缂栧彿</th>
								<!-- 主键列{璐﹀崟绫诲瀷缂栫爜}-->   
								<th align="center" rowName="type_code" orderName="type_code:DESC" title='璐﹀崟绫诲瀷缂栫爜'>璐﹀崟绫诲瀷缂栫爜</th>
								<!-- 主键列{缂磋垂閲戦锛堝厓锛?}-->   
								<th align="center" rowName="nrevmny" orderName="nrevmny:DESC" title='缂磋垂閲戦锛堝厓锛?'>缂磋垂閲戦锛堝厓锛?</th>
								<!-- 主键列{婊炵撼閲戯紙鍏冿級}-->   
								<th align="center" rowName="nrevlfmny" orderName="nrevlfmny:DESC" title='婊炵撼閲戯紙鍏冿級'>婊炵撼閲戯紙鍏冿級</th>
								<!-- 主键列{鏀粯鏃堕棿}-->   
								<th align="center" rowName="pay_time" orderName="pay_time:DESC" title='鏀粯鏃堕棿'>鏀粯鏃堕棿</th>
								<!-- 主键列{鐗╀笟鍏徃鐨勮祫閲戣处鎴?}-->   
								<th align="center" rowName="company_account" orderName="company_account:DESC" title='鐗╀笟鍏徃鐨勮祫閲戣处鎴?'>鐗╀笟鍏徃鐨勮祫閲戣处鎴?</th>
								<!-- 主键列{nc_bill_id}-->   
								<th align="center" rowName="nc_bill_id" orderName="nc_bill_id:DESC" title='nc_bill_id'>nc_bill_id</th>
								<!-- 主键列{NC鐗╀笟鍏徃涓婚敭}-->   
								<th align="center" rowName="nc_company_id" orderName="nc_company_id:DESC" title='NC鐗╀笟鍏徃涓婚敭'>NC鐗╀笟鍏徃涓婚敭</th>
								<!-- 主键列{绠＄悊澶勪富閿?}-->   
								<th align="center" rowName="nc_manage_id" orderName="nc_manage_id:DESC" title='绠＄悊澶勪富閿?'>绠＄悊澶勪富閿?</th>
								<!-- 主键列{缂寸撼鐘舵?侊紙0-寰呭悓姝ワ紝1-鎴愬姛锛?2-澶辫触锛?}-->   
								<th align="center" rowName="join_status" orderName="join_status:DESC" title='缂寸撼鐘舵?侊紙0-寰呭悓姝ワ紝1-鎴愬姛锛?2-澶辫触锛?'>缂寸撼鐘舵?侊紙0-寰呭悓姝ワ紝1-鎴愬姛锛?2-澶辫触锛?</th>
								<!-- 主键列{鍚屾NC鏃堕棿}-->   
								<th align="center" rowName="join_time" orderName="join_time:DESC" title='鍚屾NC鏃堕棿'>鍚屾NC鏃堕棿</th>
								<!-- 主键列{}-->   
								<th align="center" rowName="nc_ts" orderName="nc_ts:DESC" title=''></th>
								<!-- 主键列{鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫??(0锛氭湭鍚屾锛? 1锛氭墽琛岄敊璇紱 2锛氭湭鎺堟潈(瀹夊叏妫?楠屼笉閫氳繃)锛? 3锛氭湇鍔″凡鍋滄(涓嶆彁渚涙湇鍔?)锛? 4锛氳垂鐢ㄥ湪NC绔彂鐢熷彉鍖栵紱 5锛氫紶鍏ョ殑璐圭敤鏇存柊銆佹煡璇㈠弬鏁版湁璇紱 6锛歂C绔煡璇㈤敊璇? 锛? 7锛氶噸澶嶇即璐?)锛? 8锛歂C鏈嶅姟缁存姢涓紱99锛氬瘑铚滀紶鍏C鍙傛暟鏈夎銆?}-->   
								<th align="center" rowName="nc_return_status" orderName="nc_return_status:DESC" title='鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫??(0锛氭湭鍚屾锛? 1锛氭墽琛岄敊璇紱 2锛氭湭鎺堟潈(瀹夊叏妫?楠屼笉閫氳繃)锛? 3锛氭湇鍔″凡鍋滄(涓嶆彁渚涙湇鍔?)锛? 4锛氳垂鐢ㄥ湪NC绔彂鐢熷彉鍖栵紱 5锛氫紶鍏ョ殑璐圭敤鏇存柊銆佹煡璇㈠弬鏁版湁璇紱 6锛歂C绔煡璇㈤敊璇? 锛? 7锛氶噸澶嶇即璐?)锛? 8锛歂C鏈嶅姟缁存姢涓紱99锛氬瘑铚滀紶鍏C鍙傛暟鏈夎銆?'>鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫??(0锛氭湭鍚屾锛? 1锛氭墽琛岄敊璇紱 2锛氭湭鎺堟潈(瀹夊叏妫?楠屼笉閫氳繃)锛? 3锛氭湇鍔″凡鍋滄(涓嶆彁渚涙湇鍔?)锛? 4锛氳垂鐢ㄥ湪NC绔彂鐢熷彉鍖栵紱 5锛氫紶鍏ョ殑璐圭敤鏇存柊銆佹煡璇㈠弬鏁版湁璇紱 6锛歂C绔煡璇㈤敊璇? 锛? 7锛氶噸澶嶇即璐?)锛? 8锛歂C鏈嶅姟缁存姢涓紱99锛氬瘑铚滀紶鍏C鍙傛暟鏈夎銆?</th>
								<!-- 主键列{鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫け璐ユ弿杩颁俊鎭?}-->   
								<th align="center" rowName="nc_return_message" orderName="nc_return_message:DESC" title='鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫け璐ユ弿杩颁俊鎭?'>鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫け璐ユ弿杩颁俊鎭?</th>
								<!-- 主键列{閫?娆句汉id}-->   
								<th align="center" rowName="refund_user_id" orderName="refund_user_id:DESC" title='閫?娆句汉id'>閫?娆句汉id</th>
								<!-- 主键列{閫?娆炬椂闂?}-->   
								<th align="center" rowName="refund_time" orderName="refund_time:DESC" title='閫?娆炬椂闂?'>閫?娆炬椂闂?</th>
								<!-- 主键列{璁板綍娣诲姞鏃堕棿}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='璁板綍娣诲姞鏃堕棿'>璁板綍娣诲姞鏃堕棿</th>
								<!-- 主键列{鍒涘缓鏃堕棿}-->   
								<th align="center" rowName="db_create_time" orderName="db_create_time:DESC" title='鍒涘缓鏃堕棿'>鍒涘缓鏃堕棿</th>
								<!-- 主键列{鏇存柊鏃堕棿}-->   
								<th align="center" rowName="db_update_time" orderName="db_update_time:DESC" title='鏇存柊鏃堕棿'>鏇存柊鏃堕棿</th>
								<!-- 主键列{閲嶅缂磋垂锛岄??娆剧姸鎬侊紙0:榛樿鍊硷紱1:閫?娆句腑锛涘凡閫?娆撅級}-->   
								<th align="center" rowName="refund_status" orderName="refund_status:DESC" title='閲嶅缂磋垂锛岄??娆剧姸鎬侊紙0:榛樿鍊硷紱1:閫?娆句腑锛涘凡閫?娆撅級'>閲嶅缂磋垂锛岄??娆剧姸鎬侊紙0:榛樿鍊硷紱1:閫?娆句腑锛涘凡閫?娆撅級</th>
								<!-- 主键列{灏忓尯ID}-->   
								<th align="center" rowName="community_id" orderName="community_id:DESC" title='灏忓尯ID'>灏忓尯ID</th>
								<!-- 主键列{鎴夸骇ID}-->   
								<th align="center" rowName="house_id" orderName="house_id:DESC" title='鎴夸骇ID'>鎴夸骇ID</th>
								<!-- 主键列{璐﹀崟骞翠唤}-->   
								<th align="center" rowName="year" orderName="year:DESC" title='璐﹀崟骞翠唤'>璐﹀崟骞翠唤</th>
								<!-- 主键列{璐﹀崟鏈堜唤}-->   
								<th align="center" rowName="month" orderName="month:DESC" title='璐﹀崟鏈堜唤'>璐﹀崟鏈堜唤</th>
								<!-- 主键列{寮傚父鍗曞鐞嗙姸鎬?(0-鏈鐞?,1-宸插鐞?,2-浜哄伐閫?娆句腑,3-宸茬‘璁ら??娆?,4-宸茬‘璁よ浆棰勫瓨)}-->   
								<th align="center" rowName="processing_status" orderName="processing_status:DESC" title='寮傚父鍗曞鐞嗙姸鎬?(0-鏈鐞?,1-宸插鐞?,2-浜哄伐閫?娆句腑,3-宸茬‘璁ら??娆?,4-宸茬‘璁よ浆棰勫瓨)'>寮傚父鍗曞鐞嗙姸鎬?(0-鏈鐞?,1-宸插鐞?,2-浜哄伐閫?娆句腑,3-宸茬‘璁ら??娆?,4-宸茬‘璁よ浆棰勫瓨)</th>
								<!-- 主键列{鍗曞厓ID}-->   
								<th align="center" rowName="unit_id" orderName="unit_id:DESC" title='鍗曞厓ID'>鍗曞厓ID</th>
								<!--表头循环结束 -->	
	                    		<th align="center">操 作</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							TPmBillJoinNc view = new TPmBillJoinNc();
								for (int i = 0; i < list.size(); i++) {
									view = (TPmBillJoinNc) list.get(i);
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
					
											<!-- 主键列{璐﹀崟缁撶畻ID}-->   
											<td><%=view.getJoinId()%></td>
											<!-- 主键列{璐﹀崟缁撶畻ID}-->   
											<td><%=view.getBalanceId()%></td>
											<!-- 主键列{璐﹀崟缂栧彿}-->   
											<td><%=view.getBillCode()%></td>
											<!-- 主键列{璐﹀崟绫诲瀷缂栫爜}-->   
											<td><%=view.getTypeCode()%></td>
											<!-- 主键列{缂磋垂閲戦锛堝厓锛?}-->   
											<td><%=view.getNrevmny()%></td>
											<!-- 主键列{婊炵撼閲戯紙鍏冿級}-->   
											<td><%=view.getNrevlfmny()%></td>
											<!-- 主键列{鏀粯鏃堕棿}-->   
											<td><%=view.getPayTime()%></td>
											<!-- 主键列{鐗╀笟鍏徃鐨勮祫閲戣处鎴?}-->   
											<td><%=view.getCompanyAccount()%></td>
											<!-- 主键列{nc_bill_id}-->   
											<td><%=view.getNcBillId()%></td>
											<!-- 主键列{NC鐗╀笟鍏徃涓婚敭}-->   
											<td><%=view.getNcCompanyId()%></td>
											<!-- 主键列{绠＄悊澶勪富閿?}-->   
											<td><%=view.getNcManageId()%></td>
											<!-- 主键列{缂寸撼鐘舵?侊紙0-寰呭悓姝ワ紝1-鎴愬姛锛?2-澶辫触锛?}-->   
											<td><%=view.getJoinStatus()%></td>
											<!-- 主键列{鍚屾NC鏃堕棿}-->   
											<td><%=view.getJoinTime()%></td>
											<!-- 主键列{}-->   
											<td><%=view.getNcTs()%></td>
											<!-- 主键列{鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫??(0锛氭湭鍚屾锛? 1锛氭墽琛岄敊璇紱 2锛氭湭鎺堟潈(瀹夊叏妫?楠屼笉閫氳繃)锛? 3锛氭湇鍔″凡鍋滄(涓嶆彁渚涙湇鍔?)锛? 4锛氳垂鐢ㄥ湪NC绔彂鐢熷彉鍖栵紱 5锛氫紶鍏ョ殑璐圭敤鏇存柊銆佹煡璇㈠弬鏁版湁璇紱 6锛歂C绔煡璇㈤敊璇? 锛? 7锛氶噸澶嶇即璐?)锛? 8锛歂C鏈嶅姟缁存姢涓紱99锛氬瘑铚滀紶鍏C鍙傛暟鏈夎銆?}-->   
											<td><%=view.getNcReturnStatus()%></td>
											<!-- 主键列{鍚屾NC澶辫触鍚庯紝NC杩斿洖鐨勫け璐ユ弿杩颁俊鎭?}-->   
											<td><%=view.getNcReturnMessage()%></td>
											<!-- 主键列{閫?娆句汉id}-->   
											<td><%=view.getRefundUserId()%></td>
											<!-- 主键列{閫?娆炬椂闂?}-->   
											<td><%=view.getRefundTime()%></td>
											<!-- 主键列{璁板綍娣诲姞鏃堕棿}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- 主键列{鍒涘缓鏃堕棿}-->   
											<td><%=view.getDbCreateTime()%></td>
											<!-- 主键列{鏇存柊鏃堕棿}-->   
											<td><%=view.getDbUpdateTime()%></td>
											<!-- 主键列{閲嶅缂磋垂锛岄??娆剧姸鎬侊紙0:榛樿鍊硷紱1:閫?娆句腑锛涘凡閫?娆撅級}-->   
											<td><%=view.getRefundStatus()%></td>
											<!-- 主键列{灏忓尯ID}-->   
											<td><%=view.getCommunityId()%></td>
											<!-- 主键列{鎴夸骇ID}-->   
											<td><%=view.getHouseId()%></td>
											<!-- 主键列{璐﹀崟骞翠唤}-->   
											<td><%=view.getYear()%></td>
											<!-- 主键列{璐﹀崟鏈堜唤}-->   
											<td><%=view.getMonth()%></td>
											<!-- 主键列{寮傚父鍗曞鐞嗙姸鎬?(0-鏈鐞?,1-宸插鐞?,2-浜哄伐閫?娆句腑,3-宸茬‘璁ら??娆?,4-宸茬‘璁よ浆棰勫瓨)}-->   
											<td><%=view.getProcessingStatus()%></td>
											<!-- 主键列{鍗曞厓ID}-->   
											<td><%=view.getUnitId()%></td>

											<td>
												<a class="o-edit" href="TPmBillJoinNc.mc?method=editTPmBillJoinNc&joinId,balanceId,billCode,typeCode,nrevmny,nrevlfmny,payTime,companyAccount,ncBillId,ncCompanyId,ncManageId,joinStatus,joinTime,ncTs,ncReturnStatus,ncReturnMessage,refundUserId,refundTime,createTime,dbCreateTime,dbUpdateTime,refundStatus,communityId,houseId,year,month,processingStatus,unitId=<%= view.getJoinId() +":"+  view.getBalanceId() +":"+  view.getBillCode() +":"+  view.getTypeCode() +":"+  view.getNrevmny() +":"+  view.getNrevlfmny() +":"+  view.getPayTime() +":"+  view.getCompanyAccount() +":"+  view.getNcBillId() +":"+  view.getNcCompanyId() +":"+  view.getNcManageId() +":"+  view.getJoinStatus() +":"+  view.getJoinTime() +":"+  view.getNcTs() +":"+  view.getNcReturnStatus() +":"+  view.getNcReturnMessage() +":"+  view.getRefundUserId() +":"+  view.getRefundTime() +":"+  view.getCreateTime() +":"+  view.getDbCreateTime() +":"+  view.getDbUpdateTime() +":"+  view.getRefundStatus() +":"+  view.getCommunityId() +":"+  view.getHouseId() +":"+  view.getYear() +":"+  view.getMonth() +":"+  view.getProcessingStatus() +":"+  view.getUnitId() %>" title="编辑"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteTPmBillJoinNc('<%= view.getJoinId() +":"+  view.getBalanceId() +":"+  view.getBillCode() +":"+  view.getTypeCode() +":"+  view.getNrevmny() +":"+  view.getNrevlfmny() +":"+  view.getPayTime() +":"+  view.getCompanyAccount() +":"+  view.getNcBillId() +":"+  view.getNcCompanyId() +":"+  view.getNcManageId() +":"+  view.getJoinStatus() +":"+  view.getJoinTime() +":"+  view.getNcTs() +":"+  view.getNcReturnStatus() +":"+  view.getNcReturnMessage() +":"+  view.getRefundUserId() +":"+  view.getRefundTime() +":"+  view.getCreateTime() +":"+  view.getDbCreateTime() +":"+  view.getDbUpdateTime() +":"+  view.getRefundStatus() +":"+  view.getCommunityId() +":"+  view.getHouseId() +":"+  view.getYear() +":"+  view.getMonth() +":"+  view.getProcessingStatus() +":"+  view.getUnitId() %>')" title="删除"></a>
											    <a class="o-view" href="TPmBillJoinNc.mc?method=detailTPmBillJoinNc&joinId,balanceId,billCode,typeCode,nrevmny,nrevlfmny,payTime,companyAccount,ncBillId,ncCompanyId,ncManageId,joinStatus,joinTime,ncTs,ncReturnStatus,ncReturnMessage,refundUserId,refundTime,createTime,dbCreateTime,dbUpdateTime,refundStatus,communityId,houseId,year,month,processingStatus,unitId=<%= view.getJoinId() +":"+  view.getBalanceId() +":"+  view.getBillCode() +":"+  view.getTypeCode() +":"+  view.getNrevmny() +":"+  view.getNrevlfmny() +":"+  view.getPayTime() +":"+  view.getCompanyAccount() +":"+  view.getNcBillId() +":"+  view.getNcCompanyId() +":"+  view.getNcManageId() +":"+  view.getJoinStatus() +":"+  view.getJoinTime() +":"+  view.getNcTs() +":"+  view.getNcReturnStatus() +":"+  view.getNcReturnMessage() +":"+  view.getRefundUserId() +":"+  view.getRefundTime() +":"+  view.getCreateTime() +":"+  view.getDbCreateTime() +":"+  view.getDbUpdateTime() +":"+  view.getRefundStatus() +":"+  view.getCommunityId() +":"+  view.getHouseId() +":"+  view.getYear() +":"+  view.getMonth() +":"+  view.getProcessingStatus() +":"+  view.getUnitId() %>" title="详情"></a> 
												
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
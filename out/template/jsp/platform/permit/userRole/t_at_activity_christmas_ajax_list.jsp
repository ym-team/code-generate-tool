<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="com.evergrande.pm.bill.data.TAtActivityChristmas" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<TITLE>圣诞活动�?��ѯ</TITLE>
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
				edit:'TAtActivityChristmas.mc?method=editTAtActivityChristmas&pkId,userId,makeTime,cardId,status,userPhone,christmasWord,shareCount,openCount,dbUpdateTime,dbCreateTime,remark=',
				del:'TAtActivityChristmas.mc?method=deleteTAtActivityChristmas&PK=',
				view:'TAtActivityChristmas.mc?method=detailTAtActivityChristmas&pkId,userId,makeTime,cardId,status,userPhone,christmasWord,shareCount,openCount,dbUpdateTime,dbCreateTime,remark='
			};
			var options = {
				tableId:'pageTable',
				url:'TAtActivityChristmas.mc?method=ajax',
				operates:operates,
				formId:'searchForm',
				searchId:'searchBtn',
				primaryKey:'pkId,userId,makeTime,cardId,status,userPhone,christmasWord,shareCount,openCount,dbUpdateTime,dbCreateTime,remark'
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
				 	圣诞活动�?��ѯ
			</div>
				<div class="control-group">
					<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
						<tr class="theight">
						 <td >
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
								<!-- ������  主键-->   
								<th align="center" rowName="pkId" orderName="pk_id:DESC" title='主键'>主键</th>
								<!-- ������  用户id 0为游�?-->   
								<th align="center" rowName="userId" orderName="user_id:DESC" title='用户id 0为游�?'>用户id 0为游�?</th>
								<!-- ������  卡片制作时间-->   
								<th align="center" rowName="makeTime" orderName="make_time:DESC" title='卡片制作时间'>卡片制作时间</th>
								<!-- ������  前端八种卡片id-->   
								<th align="center" rowName="cardId" orderName="card_id:DESC" title='前端八种卡片id'>前端八种卡片id</th>
								<!-- ������  1:无效 2有效 默认2-->   
								<th align="center" rowName="status" orderName="status:DESC" title='1:无效 2有效 默认2'>1:无效 2有效 默认2</th>
								<!-- ������  卡片制作者电�? 游客�?0-->   
								<th align="center" rowName="userPhone" orderName="user_phone:DESC" title='卡片制作者电�? 游客�?0'>卡片制作者电�? 游客�?0</th>
								<!-- ������  卡片祝福�?-->   
								<th align="center" rowName="christmasWord" orderName="christmas_word:DESC" title='卡片祝福�?'>卡片祝福�?</th>
								<!-- ������  分享�?-->   
								<th align="center" rowName="shareCount" orderName="share_count:DESC" title='分享�?'>分享�?</th>
								<!-- ������  打开次数-->   
								<th align="center" rowName="openCount" orderName="open_count:DESC" title='打开次数'>打开次数</th>
								<!-- ������  更新时间-->   
								<th align="center" rowName="dbUpdateTime" orderName="db_update_time:DESC" title='更新时间'>更新时间</th>
								<!-- ������  创建时间-->   
								<th align="center" rowName="dbCreateTime" orderName="db_create_time:DESC" title='创建时间'>创建时间</th>
								<!-- ������  备注-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='备注'>备注</th>
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
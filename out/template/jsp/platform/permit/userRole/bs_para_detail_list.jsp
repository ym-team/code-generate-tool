<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.BsParaDetail" %>
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
		function deleteBsParaDetail(PK) {
			jQuery.ajax({
				url : "BsParaDetail.mc?method=deleteBsParaDetail",
				type : "post",
				data : {PK:PK},
				success : function(result) {
					if (result > 0) {
						alert("ɾ��ɹ�");
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/BsParaDetail.mc?method=getAllPageBsParaDetail" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/bs_para_detail_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="region_id" placeholder="" value="${ param.region_id }"/>
						    
						    	<input type='text' class="input-small" name="para_type" placeholder="" value="${ param.para_type }"/>
						    
						    	<input type='text' class="input-small" name="para_code" placeholder="" value="${ param.para_code }"/>
						    
						    	<input type='text' class="input-small" name="para_name" placeholder="" value="${ param.para_name }"/>
						    
						    	<input type='text' class="input-small" name="para1" placeholder="" value="${ param.para1 }"/>
						    
						    	<input type='text' class="input-small" name="para2" placeholder="" value="${ param.para2 }"/>
						    
						    	<input type='text' class="input-small" name="para3" placeholder="" value="${ param.para3 }"/>
						    
						    	<input type='text' class="input-small" name="para4" placeholder="" value="${ param.para4 }"/>
						    
						    	<input type='text' class="input-small" name="para5" placeholder="" value="${ param.para5 }"/>
						    
						    	<input type='text' class="input-small" name="para_desc" placeholder="" value="${ param.para_desc }"/>
						    
						    	<input type='text' class="input-small" name="state" placeholder="" value="${ param.state }"/>
						    
						    	<input type='text' class="input-small" name="op_id" placeholder="" value="${ param.op_id }"/>
						    
						    	<input type='text' class="input-small" name="state_date" placeholder="" value="${ param.state_date }"/>
						    
						    	<input type='text' class="input-small" name="remarks" placeholder="" value="${ param.remarks }"/>

								<button type="button" onclick="javascript:searchData();" id="searchbtn"  class="btn btn-group-vertical">����</button>
							</div>
								
							</td>
						</tr>
						
					</table>
			</div>
			<!-- ��ѯ������ʾ����end --> 
			<!-- �����ʾ�б�start -->
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
								<!-- ������{}-->   
								<th align="center" rowName="region_id" orderName="region_id:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="para_type" orderName="para_type:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="para_code" orderName="para_code:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="para_name" orderName="para_name:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="para1" orderName="para1:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="para2" orderName="para2:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="para3" orderName="para3:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="para4" orderName="para4:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="para5" orderName="para5:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="para_desc" orderName="para_desc:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="state" orderName="state:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="op_id" orderName="op_id:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="state_date" orderName="state_date:DESC" title=''></th>
								<!-- ������{}-->   
								<th align="center" rowName="remarks" orderName="remarks:DESC" title=''></th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							BsParaDetail view = new BsParaDetail();
								for (int i = 0; i < list.size(); i++) {
									view = (BsParaDetail) list.get(i);
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
					
											<!-- ������{}-->   
											<td><%=view.getRegionId()%></td>
											<!-- ������{}-->   
											<td><%=view.getParaType()%></td>
											<!-- ������{}-->   
											<td><%=view.getParaCode()%></td>
											<!-- ������{}-->   
											<td><%=view.getParaName()%></td>
											<!-- ������{}-->   
											<td><%=view.getPara1()%></td>
											<!-- ������{}-->   
											<td><%=view.getPara2()%></td>
											<!-- ������{}-->   
											<td><%=view.getPara3()%></td>
											<!-- ������{}-->   
											<td><%=view.getPara4()%></td>
											<!-- ������{}-->   
											<td><%=view.getPara5()%></td>
											<!-- ������{}-->   
											<td><%=view.getParaDesc()%></td>
											<!-- ������{}-->   
											<td><%=view.getState()%></td>
											<!-- ������{}-->   
											<td><%=view.getOpId()%></td>
											<!-- ������{}-->   
											<td><%=view.getStateDate()%></td>
											<!-- ������{}-->   
											<td><%=view.getRemarks()%></td>

											<td>
												<a class="o-edit" href="BsParaDetail.mc?method=editBsParaDetail&regionId,paraType,paraCode,paraName,para1,para2,para3,para4,para5,paraDesc,state,opId,stateDate,remarks=<%= view.getRegionId() +":"+  view.getParaType() +":"+  view.getParaCode() +":"+  view.getParaName() +":"+  view.getPara1() +":"+  view.getPara2() +":"+  view.getPara3() +":"+  view.getPara4() +":"+  view.getPara5() +":"+  view.getParaDesc() +":"+  view.getState() +":"+  view.getOpId() +":"+  view.getStateDate() +":"+  view.getRemarks() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteBsParaDetail('<%= view.getRegionId() +":"+  view.getParaType() +":"+  view.getParaCode() +":"+  view.getParaName() +":"+  view.getPara1() +":"+  view.getPara2() +":"+  view.getPara3() +":"+  view.getPara4() +":"+  view.getPara5() +":"+  view.getParaDesc() +":"+  view.getState() +":"+  view.getOpId() +":"+  view.getStateDate() +":"+  view.getRemarks() %>')" title="ɾ��"></a>
											    <a class="o-view" href="BsParaDetail.mc?method=detailBsParaDetail&regionId,paraType,paraCode,paraName,para1,para2,para3,para4,para5,paraDesc,state,opId,stateDate,remarks=<%= view.getRegionId() +":"+  view.getParaType() +":"+  view.getParaCode() +":"+  view.getParaName() +":"+  view.getPara1() +":"+  view.getPara2() +":"+  view.getPara3() +":"+  view.getPara4() +":"+  view.getPara5() +":"+  view.getParaDesc() +":"+  view.getState() +":"+  view.getOpId() +":"+  view.getStateDate() +":"+  view.getRemarks() %>" title="����"></a> 
												
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
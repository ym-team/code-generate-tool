<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="red.sea.commons.jdbc.db.adapter.PageInfo" %>
<%@ page import="red.sea.commons.jdbc.db.adapter.Page" %>
<%@ page import="server1.UserCmcc" %>
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
		function deleteUserCmcc(PK) {
			jQuery.ajax({
				url : "UserCmcc.mc?method=deleteUserCmcc",
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
	<form name="searchForm" method="post" class="form-search" action="${contextPath}/UserCmcc.mc?method=getAllPageUserCmcc" id="searchForm">
 		<!-- ��ѯ������ʾ����start -->
 		<div style="height: 50px;">
					<table id="tblSearch" width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr class="theight">
						<td>
							<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='<%=contextPath%>/jsp/platform/permit/userRole/user_cmcc_edit.jsp'">���</button>
						</td>
						<td align="right">
								<div class="controls asearch">
						    
						    	<input type='text' class="input-small" name="id" placeholder="����" value="${ param.id }"/>
						    
						    	<input type='text' class="input-small" name="cmcc_user_id" placeholder="���ƶ��û�id" value="${ param.cmcc_user_id }"/>
						    
						    	<input type='text' class="input-small" name="user_name" placeholder="�û���" value="${ param.user_name }"/>
						    
						    	<input type='text' class="input-small" name="user_type" placeholder="app(�Լ�app),cmcc(�й��ƶ�)" value="${ param.user_type }"/>
						    
						    	<input type='text' class="input-small" name="face_url" placeholder="ͷ��" value="${ param.face_url }"/>
						    
						    	<input type='text' class="input-small" name="passwd" placeholder="����" value="${ param.passwd }"/>
						    
						    	<input type='text' class="input-small" name="tel_phone" placeholder="�绰" value="${ param.tel_phone }"/>
						    
						    	<input type='text' class="input-small" name="email" placeholder="����" value="${ param.email }"/>
						    
						    	<input type='text' class="input-small" name="age" placeholder="����" value="${ param.age }"/>
						    
						    	<input type='text' class="input-small" name="sex" placeholder="�Ա�1�� 2Ů" value="${ param.sex }"/>
						    
						    	<input type='text' class="input-small" name="nick_name" placeholder="�ǳ�" value="${ param.nick_name }"/>
						    
						    	<input type='text' class="input-small" name="describ" placeholder="���" value="${ param.describ }"/>
						    
						    	<input type='text' class="input-small" name="goodat" placeholder="�ó�" value="${ param.goodat }"/>
						    
						    	<input type='text' class="input-small" name="dept_id" placeholder="����id" value="${ param.dept_id }"/>
						    
						    	<input type='text' class="input-small" name="job_id" placeholder="ְ��id" value="${ param.job_id }"/>
						    
						    	<input type='text' class="input-small" name="address" placeholder="��ַ" value="${ param.address }"/>
						    
						    	<input type='text' class="input-small" name="province_code" placeholder="ʡ" value="${ param.province_code }"/>
						    
						    	<input type='text' class="input-small" name="city_code" placeholder="��" value="${ param.city_code }"/>
						    
						    	<input type='text' class="input-small" name="district_code" placeholder="��" value="${ param.district_code }"/>
						    
						    	<input type='text' class="input-small" name="create_time" placeholder="����ʱ��" value="${ param.create_time }"/>
						    
						    	<input type='text' class="input-small" name="opt_time" placeholder="����ʱ��" value="${ param.opt_time }"/>
						    
						    	<input type='text' class="input-small" name="remark" placeholder="��ע" value="${ param.remark }"/>
						    
						    	<input type='text' class="input-small" name="char1" placeholder="��ע1" value="${ param.char1 }"/>
						    
						    	<input type='text' class="input-small" name="char2" placeholder="��ע2" value="${ param.char2 }"/>

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
								<!-- ������{����}-->   
								<th align="center" rowName="id" orderName="id:DESC" title='����'>����</th>
								<!-- ������{���ƶ��û�id}-->   
								<th align="center" rowName="cmcc_user_id" orderName="cmcc_user_id:DESC" title='���ƶ��û�id'>���ƶ��û�id</th>
								<!-- ������{�û���}-->   
								<th align="center" rowName="user_name" orderName="user_name:DESC" title='�û���'>�û���</th>
								<!-- ������{app(�Լ�app),cmcc(�й��ƶ�)}-->   
								<th align="center" rowName="user_type" orderName="user_type:DESC" title='app(�Լ�app),cmcc(�й��ƶ�)'>app(�Լ�app),cmcc(�й��ƶ�)</th>
								<!-- ������{ͷ��}-->   
								<th align="center" rowName="face_url" orderName="face_url:DESC" title='ͷ��'>ͷ��</th>
								<!-- ������{����}-->   
								<th align="center" rowName="passwd" orderName="passwd:DESC" title='����'>����</th>
								<!-- ������{�绰}-->   
								<th align="center" rowName="tel_phone" orderName="tel_phone:DESC" title='�绰'>�绰</th>
								<!-- ������{����}-->   
								<th align="center" rowName="email" orderName="email:DESC" title='����'>����</th>
								<!-- ������{����}-->   
								<th align="center" rowName="age" orderName="age:DESC" title='����'>����</th>
								<!-- ������{�Ա�1�� 2Ů}-->   
								<th align="center" rowName="sex" orderName="sex:DESC" title='�Ա�1�� 2Ů'>�Ա�1�� 2Ů</th>
								<!-- ������{�ǳ�}-->   
								<th align="center" rowName="nick_name" orderName="nick_name:DESC" title='�ǳ�'>�ǳ�</th>
								<!-- ������{���}-->   
								<th align="center" rowName="describ" orderName="describ:DESC" title='���'>���</th>
								<!-- ������{�ó�}-->   
								<th align="center" rowName="goodat" orderName="goodat:DESC" title='�ó�'>�ó�</th>
								<!-- ������{����id}-->   
								<th align="center" rowName="dept_id" orderName="dept_id:DESC" title='����id'>����id</th>
								<!-- ������{ְ��id}-->   
								<th align="center" rowName="job_id" orderName="job_id:DESC" title='ְ��id'>ְ��id</th>
								<!-- ������{��ַ}-->   
								<th align="center" rowName="address" orderName="address:DESC" title='��ַ'>��ַ</th>
								<!-- ������{ʡ}-->   
								<th align="center" rowName="province_code" orderName="province_code:DESC" title='ʡ'>ʡ</th>
								<!-- ������{��}-->   
								<th align="center" rowName="city_code" orderName="city_code:DESC" title='��'>��</th>
								<!-- ������{��}-->   
								<th align="center" rowName="district_code" orderName="district_code:DESC" title='��'>��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="create_time" orderName="create_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{����ʱ��}-->   
								<th align="center" rowName="opt_time" orderName="opt_time:DESC" title='����ʱ��'>����ʱ��</th>
								<!-- ������{��ע}-->   
								<th align="center" rowName="remark" orderName="remark:DESC" title='��ע'>��ע</th>
								<!-- ������{��ע1}-->   
								<th align="center" rowName="char1" orderName="char1:DESC" title='��ע1'>��ע1</th>
								<!-- ������{��ע2}-->   
								<th align="center" rowName="char2" orderName="char2:DESC" title='��ע2'>��ע2</th>
								<!--��ͷѭ������ -->	
	                    		<th align="center">�� ��</th>                    
							</tr>
						</thead>
	                   	<tbody>
						<%
							List list = pg.getDatas();
							UserCmcc view = new UserCmcc();
								for (int i = 0; i < list.size(); i++) {
									view = (UserCmcc) list.get(i);
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
					
											<!-- ������{����}-->   
											<td><%=view.getId()%></td>
											<!-- ������{���ƶ��û�id}-->   
											<td><%=view.getCmccUserId()%></td>
											<!-- ������{�û���}-->   
											<td><%=view.getUserName()%></td>
											<!-- ������{app(�Լ�app),cmcc(�й��ƶ�)}-->   
											<td><%=view.getUserType()%></td>
											<!-- ������{ͷ��}-->   
											<td><%=view.getFaceUrl()%></td>
											<!-- ������{����}-->   
											<td><%=view.getPasswd()%></td>
											<!-- ������{�绰}-->   
											<td><%=view.getTelPhone()%></td>
											<!-- ������{����}-->   
											<td><%=view.getEmail()%></td>
											<!-- ������{����}-->   
											<td><%=view.getAge()%></td>
											<!-- ������{�Ա�1�� 2Ů}-->   
											<td><%=view.getSex()%></td>
											<!-- ������{�ǳ�}-->   
											<td><%=view.getNickName()%></td>
											<!-- ������{���}-->   
											<td><%=view.getDescrib()%></td>
											<!-- ������{�ó�}-->   
											<td><%=view.getGoodat()%></td>
											<!-- ������{����id}-->   
											<td><%=view.getDeptId()%></td>
											<!-- ������{ְ��id}-->   
											<td><%=view.getJobId()%></td>
											<!-- ������{��ַ}-->   
											<td><%=view.getAddress()%></td>
											<!-- ������{ʡ}-->   
											<td><%=view.getProvinceCode()%></td>
											<!-- ������{��}-->   
											<td><%=view.getCityCode()%></td>
											<!-- ������{��}-->   
											<td><%=view.getDistrictCode()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getCreateTime()%></td>
											<!-- ������{����ʱ��}-->   
											<td><%=view.getOptTime()%></td>
											<!-- ������{��ע}-->   
											<td><%=view.getRemark()%></td>
											<!-- ������{��ע1}-->   
											<td><%=view.getChar1()%></td>
											<!-- ������{��ע2}-->   
											<td><%=view.getChar2()%></td>

											<td>
												<a class="o-edit" href="UserCmcc.mc?method=editUserCmcc&id,cmccUserId,userName,userType,faceUrl,passwd,telPhone,email,age,sex,nickName,describ,goodat,deptId,jobId,address,provinceCode,cityCode,districtCode,createTime,optTime,remark,char1,char2=<%= view.getId() +":"+  view.getCmccUserId() +":"+  view.getUserName() +":"+  view.getUserType() +":"+  view.getFaceUrl() +":"+  view.getPasswd() +":"+  view.getTelPhone() +":"+  view.getEmail() +":"+  view.getAge() +":"+  view.getSex() +":"+  view.getNickName() +":"+  view.getDescrib() +":"+  view.getGoodat() +":"+  view.getDeptId() +":"+  view.getJobId() +":"+  view.getAddress() +":"+  view.getProvinceCode() +":"+  view.getCityCode() +":"+  view.getDistrictCode() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() %>" title="�༭"></a> 
												<a class="cbtn o-trash" href="javascript:void(0)" onclick="deleteUserCmcc('<%= view.getId() +":"+  view.getCmccUserId() +":"+  view.getUserName() +":"+  view.getUserType() +":"+  view.getFaceUrl() +":"+  view.getPasswd() +":"+  view.getTelPhone() +":"+  view.getEmail() +":"+  view.getAge() +":"+  view.getSex() +":"+  view.getNickName() +":"+  view.getDescrib() +":"+  view.getGoodat() +":"+  view.getDeptId() +":"+  view.getJobId() +":"+  view.getAddress() +":"+  view.getProvinceCode() +":"+  view.getCityCode() +":"+  view.getDistrictCode() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() %>')" title="ɾ��"></a>
											    <a class="o-view" href="UserCmcc.mc?method=detailUserCmcc&id,cmccUserId,userName,userType,faceUrl,passwd,telPhone,email,age,sex,nickName,describ,goodat,deptId,jobId,address,provinceCode,cityCode,districtCode,createTime,optTime,remark,char1,char2=<%= view.getId() +":"+  view.getCmccUserId() +":"+  view.getUserName() +":"+  view.getUserType() +":"+  view.getFaceUrl() +":"+  view.getPasswd() +":"+  view.getTelPhone() +":"+  view.getEmail() +":"+  view.getAge() +":"+  view.getSex() +":"+  view.getNickName() +":"+  view.getDescrib() +":"+  view.getGoodat() +":"+  view.getDeptId() +":"+  view.getJobId() +":"+  view.getAddress() +":"+  view.getProvinceCode() +":"+  view.getCityCode() +":"+  view.getDistrictCode() +":"+  view.getCreateTime() +":"+  view.getOptTime() +":"+  view.getRemark() +":"+  view.getChar1() +":"+  view.getChar2() %>" title="����"></a> 
												
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
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.szjk.dhome.coteriepatient.data.CoteriePatientRecommend" %>
<%@ page import="com.szjk.dhome.coteriepatient.view.CoteriePatientRecommendView" %>
<%@page import="red.sea.commons.util.RequestUtil"%>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>
		<%
			if (request.getAttribute("CoteriePatientRecommend") == null) {
				out.print( "新增信息" );
			} else {
				out.print( "修改信息" );
			}
		%>
	</title>
	
	
	<!--jquery 放最上面，否则可能样式冲突导致效果丢失  -->
	<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
 
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>	
	<!-- 自定义样式 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css"> 
	<!-- 开关 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap-switch.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap-switch.min.js"></script>	
 
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>
	<!-- 需要引入的js -->
	<script type="text/javascript" src="${contextPath}/skins/library/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${contextPath}/skins/js/common/jLayer/jLayer.js"></script>	
	<script type="text/javascript" src="${contextPath}/skins/js/common/jValidation/jValidate.js"></script>

	<script type="text/javascript"> 
		function updateCoteriePatientRecommend() {
			jQuery.ajax({
				url : "${contextPath}/CoteriePatientRecommend.mc?method=updateCoteriePatientRecommend",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result > 0) {
						alert("编辑成功！");
						window.location.href = "${contextPath}/CoteriePatientRecommend.mc?method=getAllPageCoteriePatientRecommend";
					} else {
						alert("编辑失败！");
					}
				},
				error : function(result) {
					alert("编辑失败！");
				}
	
			});
		}
	
		function insertCoteriePatientRecommend() {
			jQuery.ajax({
				url : "${contextPath}/CoteriePatientRecommend.mc?method=insertCoteriePatientRecommend",
				type : "post",
				data : $("#form1").serialize(),
				success : function(result) {
					if (result.id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,order1,source,faceUrl,coterieId != "") {
						alert("新增成功！");
						window.location.href = "${contextPath}/CoteriePatientRecommend.mc?method=getAllPageCoteriePatientRecommend";
					} else {
						alert("新增失败！");
					}
				},
				error : function(result) {
					alert("新增失败！");
				}
	
			});
		}
		function submitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			var val = $g("PK").value;
			if ( val == "" || val == null ) {
				$("#form1").attr("action", "${contextPath}/CoteriePatientRecommend.mc?method=insertCoteriePatientRecommendJsp");
				$("#form1").submit();
			} else {
				$("#form1").attr("action", "${contextPath}/CoteriePatientRecommend.mc?method=updateCoteriePatientRecommendJsp");
				$("#form1").submit();
			}
		}
	   }  
		function ajaxSubmitForm() {
		 var isValidation = $("#form1").validate();
			
			if(isValidation){
			if ($g("PK").value == "") {
				insertCoteriePatientRecommend();
			} else {
				updateCoteriePatientRecommend();
			}
		}
		}
			$(function(){
			//时间控件调用
			$('input[class^=date]').focus(function(){
				WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd'});
			});
		});
		
	</script>
</head>
<body class="bg-fd">
<ul class="breadcrumb">
  <li class="active">锟斤拷锟斤拷修改</li>
</ul>


	<%
		CoteriePatientRecommendView view = (CoteriePatientRecommendView) request.getAttribute("CoteriePatientRecommend");
		if (view == null) {
			view = new CoteriePatientRecommendView();
		}
	%>
	<div style="width: 100%;">
	<form id="form1" name="form1" method="post" action="${contextPath}/CoteriePatientRecommend.mc?method=updateCoteriePatientRecommendJsp" border="0">
    <input type="hidden"   name="PK" value="<%=RequestUtil.getPara2String(request, "id,name,coterieDesc,picUrl,coterieType,coterieServiceType,coterieStatus,createUserId,channelType,memberCount,postCount,subSystemType,systemType,createTime,optTime,remark,order1,source,faceUrl,coterieId" )%>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableedit" align="center">
		 		<!-- start:信息录入部分-->
				<tr>
					<td class="textr">主键 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="id" value="<%=view.getId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">圈子名称  系统圈名参考deptname ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="name" value="<%=view.getName()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">圈子介绍 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieDesc" value="<%=view.getCoterieDesc()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">圈子图 最多6张图 以|分隔 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="picUrl" value="<%=view.getPicUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 公圈 2 私圈 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieType" value="<%=view.getCoterieType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">圈子业务类型 暂未启用 默认为0 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieServiceType" value="<%=view.getCoterieServiceType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 审核中   2 成功   3 拒绝   4. 解散 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieStatus" value="<%=view.getCoterieStatus()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">创建者id ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="createUserId" value="<%=view.getCreateUserId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">用户类型 1 木棉健康 2 家校健康 3 家校app ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="channelType" value="<%=view.getChannelType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">成员数 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="memberCount" value="<%=view.getMemberCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">帖子数 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="postCount" value="<%=view.getPostCount()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">系统圈 为 deptId    自建圈为 0 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="subSystemType" value="<%=view.getSubSystemType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 系统默认圈  2 自建圈 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="systemType" value="<%=view.getSystemType()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">创建时间 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="createTime" value="<%=view.getCreateTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">更新时间 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="optTime" value="<%=view.getOptTime()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">备注 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="remark" value="<%=view.getRemark()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">备注1 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="order1" value="<%=view.getOrder1()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">1 系统数据统计来源 2 运营推荐 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="source" value="<%=view.getSource()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">头像 ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="faceUrl" value="<%=view.getFaceUrl()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<tr>
					<td class="textr">圈子id ：</td>
					<td>

      
          <input type="text" class="input" validate="required" name="coterieId" value="<%=view.getCoterieId()%>"/>
     <span class="red1">*</span> 
     						
                     </td>
				</tr>
				<!-- end:信息录入部分 -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" onclick="submitForm()" value="Form提交"  class="btn btn-primary"/>&nbsp;&nbsp;
					    <input type="button" onclick="ajaxSubmitForm()" value="Ajax提交"  class="btn btn-primary"/>&nbsp;&nbsp;
						<input type="button" class="btn-return" onclick="javascript:window.location.href='${contextPath}/CoteriePatientRecommend.mc?method=getAllPageCoteriePatientRecommend'" value="返回" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
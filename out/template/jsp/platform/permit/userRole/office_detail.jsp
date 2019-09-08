<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="com.szjk.dhome.offices.data.Office" %>
<%@ page import="com.szjk.dhome.offices.view.OfficeView" %>
<%@ page import="red.sea.commons.util.DateUtil" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>�鿴��Ϣ</title>
	<script type="text/javascript" src="${contextPath}/skins/library/jquery/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/library/bootstrap/css/bootstrap.min.css">
	<script src="${contextPath}/skins/library/bootstrap/js/bootstrap.min.js"></script>	
	<!-- �Զ�����ʽ -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/skins/style/css/icon.css"> 
	<script type="text/javascript" src="${contextPath}/skins/js/common/pubfunction.js"></script>	
</head>
<body class="bgcolor3">
	<%
		OfficeView vo = (OfficeView) request.getAttribute("Office");
		if (vo == null) {
			vo = new OfficeView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>���Բ鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="Office.mc?method=updateOfficeJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���������� ��</td>
					<td>
						<%=vo.getOfficeId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�ϰ����� ��</td>
					<td>
						<%=vo.getOfficeHalfbodyUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���֤ ��</td>
					<td>
						<%=vo.getOffficeIdentifyUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ִҵ�ʸ��� ��</td>
					<td>
						<%=vo.getOfficeQualificationUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">Ӫҵִ�յ��ж�����ã� ��</td>
					<td>
						<%=vo.getOfficeBusinesslicenceUrls()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��������д��ַĬ�ϵ��ڸߵµ�ַ ��</td>
					<td>
						<%=vo.getOfficeHandAddress()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����Ҹߵµ�ַ ��</td>
					<td>
						<%=vo.getOfficeGaodeAddress()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����Ҹߵµ�ַgps���� ��</td>
					<td>
						<%=vo.getOfficeGaodeAddrGpsLng()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����Ҹߵµ�ַgpsγ �� ��</td>
					<td>
						<%=vo.getOfficeGaodeAddrGpsLat()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����ҹ�ģ(1.����,2.3-10�� 3.10-50��. 4.50-100�� ) ��</td>
					<td>
						<%=vo.getOfficeScope()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����������,  ��3ҽ�� ��2����1��� �������޸��������޸Ĳ������£����������������޸ģ�����ַ�ֶ��޸ĵ����޷��õ��ߵ£��޷��õ��ߵ�,���û��ھ����������޷��鵽�ù����� ��</td>
					<td>
						<%=vo.getOfficeType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���������� ��</td>
					<td>
						<%=vo.getOfficeName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��֤������ ��</td>
					<td>
						<%=vo.getOfficeMasterName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��֤�˵绰 ��</td>
					<td>
						<%=vo.getOfficeMasterPhone()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1.δ��� 2.����� 3.����(���ߺ�������ͣ������������޸�,������office_type���޸�ʱҲֻ�������޸�) 4.�������ߣ����������Ժ��ܽ��ܶ�����5.���� 6.��˲�ͨ�� ��</td>
					<td>
						<%=vo.getOfficeStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">������ͷͼ ��</td>
					<td>
						<%=vo.getOfficeFaceUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����ұ���ͼ���������url,ƴ���ַ��� ��</td>
					<td>
						<%=vo.getOfficeBackgroundUrls()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOfficeDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�������� ���5�� ��</td>
					<td>
						<%=vo.getOfficeCommentStar()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����̬��(����) ���100 ��</td>
					<td>
						<%=vo.getOfficeServiceAttitude()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��������(����) ���100 ��</td>
					<td>
						<%=vo.getOfficeServiceQuality()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��Ӧ�ٶ�(����) ��</td>
					<td>
						<%=vo.getOfficeResponseSpeed()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���Ͷ�̬�� ��һ����������ֶμ�1 ��</td>
					<td>
						<%=vo.getOfficePushmessagetxtcount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���������� ÿ����һ��Ŀ��������ֶμ�1 ��</td>
					<td>
						<%=vo.getOfficeServicesCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��˿�� ÿ����һ����˿�������1 ��</td>
					<td>
						<%=vo.getOfficeFollowersCount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����Ҵ����� ����д����������߳�Ա,��Ա��Ҳͬʱ����������ߵ�useridд��ȥ ��</td>
					<td>
						<%=vo.getOfficeCreateUserId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getCreateTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getOptTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ע ��</td>
					<td>
						<%=vo.getRemark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOfficeProficientcount()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOfficeIsSetGoodat()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getInviteCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOfficeCopyId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOfficeCopyStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOfficeBusinesslicenceUrlsStatus()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getInviteCodePhone()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getOfficeDoctorVisitSchedual()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='Office.mc?method=getAllPageOffice&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="red.sea.platform.code.CodeFactory"%>
<%@ page import="server1.DoctorList" %>
<%@ page import="server1.DoctorListView" %>
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
		DoctorListView vo = (DoctorListView) request.getAttribute("DoctorList");
		if (vo == null) {
			vo = new DoctorListView();
		}
	%>
	<div class="breadcrumb">
		<div class="active">
		 	<a>�����鿴</a>
		</div>
		<form id="form1" name="form1" method="post" action="DoctorList.mc?method=updateDoctorListJsp" border="0">
			<table width="100%" border="0" cellpadding="4" cellspacing="0" class="table table-bordered table-striped" align="center">
		 		
		 		
				<tr>
					<td class="titleright">���ȼ� ��</td>
					<td>
						<%=vo.getRowno()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ҽ������ xl(����),yy(Ӫ��),zj(ר��),pl(��ͨ) ��</td>
					<td>
						<%=vo.getDocType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�û�ID ��</td>
					<td>
						<%=vo.getUserSeqId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright"> ��</td>
					<td>
						<%=vo.getUserName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�û����  0:δ֪����(Ĭ��) 1:����Ա 2:ҽ��   3:ѧ�� 4:ҩ���ҵ��Ա  5:ý���ҵ��Ա  6:���� 7:���� 8:��ʿ 9:ҩ��ʦ 10:���� ��</td>
					<td>
						<%=vo.getUserType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">1: ��  2:Ů ��</td>
					<td>
						<%=vo.getSex()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getBirthdate()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ʡ�� ��</td>
					<td>
						<%=vo.getProvince()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���� ��</td>
					<td>
						<%=vo.getCityCode()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��˾ID ��</td>
					<td>
						<%=vo.getCompanyId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��λ���(ҽԺ,ѧУ) ��</td>
					<td>
						<%=vo.getCompanyName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ID ��</td>
					<td>
						<%=vo.getDeptId()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����(����)��� ��</td>
					<td>
						<%=vo.getDeptName()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ѧ��             0:�� 1:Сѧ, 2:����,  3:��ר/����,  4:��ר/����  5:ר�� 6:ѧʿ 7:˶ʿ�о��� 8:��ʿ�о��� 9:��ʿ�� ��</td>
					<td>
						<%=vo.getEducationLevel()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ѧʱ�� ��</td>
					<td>
						<%=vo.getEntrySchoolDate()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ý������ 1:�ڿ�,  2:��ֽ  3:���� ��</td>
					<td>
						<%=vo.getMediaType()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ְ��             0��ְ��(��) 1.����ҽʦ��2������ҽʦ��3.����ҽʦ��4.ҽʦ, 5סԺҽʦ, 6ҽʿ,7 ����ҽʦ��8���ڣ�9������  10��ʦ��11��̣�                          ---20151105 lihui             ҽ��ְ��: 101-����ҽʦ  102-������ҽʦ 103-����ҽʦ 104-סԺҽʦ  105-����ҽʦ  106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���  111-ҽʦ 112-ҽʿ             ҩʦְ��: 201-����ҩʦ  202-������ҩʦ 203-����ҩʦ 204-ҩʦ 205-ҩʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���             ��ʿְ��: 301-���λ�ʦ  302-�����λ�ʦ 303-���ܻ�ʦ 304-��ʦ 305-��ʿ 106-Ժʿ 107-���� 108-������ 109-��ʦ 110-���              ��</td>
					<td>
						<%=vo.getProfessionalTitle()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ְλ: ����������� ��</td>
					<td>
						<%=vo.getJobTitle()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">---- 20160303  maohc             ������ÿλ���α�ʾ:�û���V|��λ��V|������֤             0ΪĬ��(δ��֤) 1Ϊͨ����֤ 2Ϊ����ͨ��             ��:             Ĭ��Ϊ 00000000             �û���Vͨ�� 10000000             �û���V����ͨ�� 20000000 ��</td>
					<td>
						<%=vo.getUserLevel()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">ͷ��URL ��</td>
					<td>
						<%=vo.getUserFaceUrl()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">����ʱ�� ��</td>
					<td>
						<%=vo.getOpTime()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ע ��</td>
					<td>
						<%=vo.getRemark()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�Ķ�Э��״̬0:δ�Ķ�ͬ��;1:���Ķ���ͬ�� ��</td>
					<td>
						<%=vo.getAgreementState()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�ó���״ ��</td>
					<td>
						<%=vo.getGoodAtSymptom()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���ҵ绰 ��</td>
					<td>
						<%=vo.getDeptPhone()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����ֶ�1 ��</td>
					<td>
						<%=vo.getReserve1()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">�����ֶ�2 ��</td>
					<td>
						<%=vo.getReserve2()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">���˼�� ��</td>
					<td>
						<%=vo.getUserBrifeDesc()%>
   					</td>
				</tr>
				<tr>
					<td class="titleright">��ѯ������ ��</td>
					<td>
						<%=vo.getAdviceNum()%>
   					</td>
				</tr>
				<!-- end:��Ϣ¼�벿�� -->
				<tr>
					<td >&nbsp;</td>
					<td height="60">
						<input type="button" class="btn-return" onclick="javascript:window.location.href='DoctorList.mc?method=getAllPageDoctorList&start=0&pageSize=10'" value="����" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
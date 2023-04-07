<%@page import="shop.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mgr" class="shop.MemberMgr"/>
<%
		request.setCharacterEncoding("UTF-8");
		String search = request.getParameter("search");
		String area3 = null;
		Vector<ZipcodeBean> vlist = null;
		if(search.equals("y")){ //검색 버튼을 클릭시
			area3 = request.getParameter("area3");
			vlist = mgr.zipcodeRead(area3);
		}
%>
<html>
<head>
<title>우편번호 검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loadSearch() {
		frm = document.zipFrm;
		if(frm.area3.value==""){
			alert("도로명을 입력하세요.");
			return;
		}
		frm.action = "zipSearch.jsp";
		frm.submit();
	}
	
	function sendAdd(zipcode, adds) {
		opener.document.regForm.zipcode.value = zipcode;
		opener.document.regForm.address.value = adds;
		self.close();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td>
					<br/>도로명 입력 : 	<input name="area3">
						<input type="button" value="검색" 
						onclick="loadSearch()">
					</td>
				</tr>
				<!-- 검색결과 시작 -->
				<%
						if(search.equals("y")){
							if(vlist.isEmpty()){
				%>
				<tr>
					<td align="center"><br/>검색된 결과가 없습니다.</td>
				</tr>
				<% }else{%>
				<tr>
					<td align="center"><br/>※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
				</tr>
				<%
						for(int i=0;i<vlist.size();i++){
							ZipcodeBean bean = vlist.get(i);
							String rZipcode = bean.getZipcode();
							String rArea1 = bean.getArea1();
							String rArea2 = bean.getArea2();
							String rArea3 = bean.getArea3();
							String adds = rArea1 +" " + rArea2 +" " + rArea3+" ";						
				%>
				<tr>
					<td>
					<a href="#" onclick="javascript:sendAdd('<%=rZipcode%>','<%=adds%>')">
					<%=rZipcode+" " + adds%></a></td>
				</tr>
				<%			}//---for
							}//---if2
						}//---if1	
				%>
				<!-- 검색결과 끝 -->
				<tr>
					<td align="center"><br/>
					<a href="#" onClick="self.close()">닫기</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
</body>
</html>
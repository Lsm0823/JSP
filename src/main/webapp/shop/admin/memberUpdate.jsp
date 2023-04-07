<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,shop.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mMgr" class="shop.MemberMgr" />
<html>
<head>
<title>회원수정</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600">
	<br>
	<%@ include file="top.jsp"%>
	<%
		String id = request.getParameter("id");
		MemberBean mBean = mMgr.getMember(id);
	%>
	<form name="regForm" method="post" action="memberUpdateProc.jsp">
		<table width="75%" align="center" bgcolor="#FFFF99">
			<tr>
				<td align="center" bgcolor="#FFFFCC">
					<table width="95%" align="center" bgcolor="#FFFF99" border="1">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b> <%=mBean.getName()%>
										회원님의 정보를 수정합니다.
								</b></font></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><%=mBean.getId()%></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input name="pwd" value="<%=mBean.getPwd()%>"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input name="name" value="<%=mBean.getName()%>"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td>남<input type="radio" name="gender" value="1"
								<%=mBean.getGender().equals("1") ? "checked" : ""%>> 여<input
								type="radio" name="gender" value="2"
								<%=mBean.getGender().equals("2") ? "checked" : ""%>>
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input name="email" size="30"
								value="<%=mBean.getEmail()%>"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input name="birthday" value="<%=mBean.getBirthday()%>"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input name="zipcode" value="<%=mBean.getZipcode()%>">
								<input type="button" value="우편번호찾기" onClick="zipCheck()">
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input name="address" size="50"
								value="<%=mBean.getAddress()%>"></td>
						</tr>
						<tr>
							<td>직업</td>
							<td><select name="job">
									<option value="0">선택하세요.</option>
									<option value="회사원">회사원</option>
									<option value="연구전문직">연구전문직</option>
									<option value="교수학생">교수학생</option>
									<option value="일반자영업">일반자영업</option>
									<option value="공무원">공무원</option>
									<option value="의료인">의료인</option>
									<option value="법조인">법조인</option>
									<option value="종교,언론,에술인">종교.언론/예술인</option>
									<option value="농,축,수산,광업인">농/축/수산/광업인</option>
									<option value="주부">주부</option>
									<option value="무직">무직</option>
									<option value="기타">기타</option>
							</select> 
							<script>document.regForm.job.value="<%=mBean.getJob()%>"</script>
							</td>
						</tr>
						<tr>
							<td>취미</td>
							<td>
								<%
									String list[] = { "인터넷", "여행", "게임", "영화", "운동" };
									String hobbys[] = mBean.getHobby();
									for (int i = 0; i < list.length; i++) {
										out.println("<input type=checkbox name=hobby ");
										out.println("value=" + list[i] + " " + (hobbys[i].equals("1") ? "checked" : "") + ">" + list[i]);
									}
								%>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="수정완료"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<input type="reset" value="다시쓰기"></td>
						</tr>
						<input type="hidden" name="id" value="<%=id%>">
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="bottom.jsp"%>
</body>
</html>

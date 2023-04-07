<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*,shop.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mBean" class="shop.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<html>
<head>
<title>회원가입 확인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600">
	<br>
	<%@ include file="top.jsp"%>
	<table width="75%" align="center" bgcolor="#FFFF99">
		<tr>
			<td align="center" bgcolor="#FFFFCC">

				<table width="95%" align="center" bgcolor="#FFFF99" border="1">
					<form name="regForm" method="post" action="memberProc.jsp">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b> <jsp:getProperty
											name="mBean" property="name" /> 회원님이 작성하신 내용입니다. 확인해 주세요
								</b></font></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input name="id"
								value="<jsp:getProperty name="mBean" property="id" />"></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input name="pwd"
								value="<jsp:getProperty name="mBean" property="pwd" />"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input name="name"
								value="<jsp:getProperty name="mBean" property="name" />"></td>
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
							<td>생년월일</td>
							<td><input name="birthday"
								value="<jsp:getProperty name="mBean" property="birthday" />"></td>
						</tr>
					<tr>
						<td>이메일</td>
						<td><input name="email" size="30"
							value="<jsp:getProperty name="mBean" property="email" />"></td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td><input name="zipcode"
							value="<jsp:getProperty name="mBean" property="zipcode" />"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input name="address" size="50"
							value="<jsp:getProperty name="mBean" property="address" />"></td>
					</tr>
					<tr>
						<td>직업</td>
						<td><input name="job"
							value="<jsp:getProperty name="mBean" property="job" />"></td>
					</tr>
					<tr>
						<td>취미</td>
						<td>
							<%
								if (mBean.getHobby() != null) {
									String list[] = {"인터넷", "여행", "게임", "영화", "운동"}; 
									String hobbys[] = mBean.getHobby();

									for (int i = 0; i < hobbys.length; i++) {
										out.print("<input type=checkbox name=hobby" + " checked value=" + hobbys[i] + ">" + hobbys[i]);
									}
								} else {
									out.println("선택된 취미가 없습니다.");
								}
							%>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="확인완료"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input
							type="button" value="다시쓰기" onClick="history.back()"></td>
					</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
	<%@ include file="bottom.jsp"%>
</body>
</html>

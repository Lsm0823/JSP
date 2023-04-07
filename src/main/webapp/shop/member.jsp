<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>Simple Shopping Mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>

<body bgcolor="#996600" topmargin="100">

	<%@ include file="top.jsp"%>

	<table width="75%" align="center" bgcolor="#FFFF99">
		<tr>
			<td align="center" bgcolor="#FFFFCC">

				<table width="95%" align="center" bgcolor="#FFFF99" border="1">
					<form name="regForm" method="post" action="memberInsert.jsp">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
						</tr>
						<tr>
							<td width="16%">아이디</td>
							<td width="57%"><input name="id" size="15"> <input
								type="button" value="ID중복확인"
								onClick="idCheck(this.form.id.value)"></td>
							<td width="27%">아이디를 적어 주세요.</td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="password" name="pwd" size="15"></td>
							<td>패스워드를 적어주세요.</td>
						</tr>
						<tr>
							<td>패스워드 확인</td>
							<td><input type="password" name="repwd" size="15"></td>
							<td>패스워드를 확인합니다.</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input name="name" size="15"></td>
							<td>고객실명을 적어주세요.</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>남<input type="radio" name="gender" value="1" checked>
								여<input type="radio" name="gender" value="2">
							</td>
							<td>성별을 선택 하세요.</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input name="birthday" size="6"> ex)830815</td>
							<td>생년월일를 적어 주세요.</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input name="email" size="27"></td>
							<td>이메일을 적어주세요.</td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input name="zipcode" size="5"> <input
								type="button" value="우편번호찾기" onClick="zipCheck()"></td>
							<td>우편번호를 검색 하세요.</td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input name="address" size="40"></td>
							<td>주소를 적어 주세요.</td>
						</tr>
						<tr>
							<td>직업</td>
							<td><select name=job>
									<option value="0" selected>선택하세요.</option>
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
							</select></td>
							<td>직업을 선택 하세요.</td>
						</tr>
						<tr>
							<td>취미</td>
							<td><input type="checkbox" name="hobby" value="인터넷" checked>인터넷
								<input type="checkbox" name="hobby" value="여행">여행 <input
								type="checkbox" name="hobby" value="게임">게임 <input
								type="checkbox" name="hobby" value="영화">영화 <input
								type="checkbox" name="hobby" value="운동">운동</td>
							<td>취미을 선택 하세요.</td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="button"
								value="회원가입" onclick="inputCheck()"> &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; <input type="reset" value="다시쓰기">
							</td>
						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
	<%@ include file="bottom.jsp"%>
</body>
</html>


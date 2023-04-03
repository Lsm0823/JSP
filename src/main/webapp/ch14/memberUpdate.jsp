<!-- memberUpdate.jsp -->
<%@page import="ch14.MemberBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch14.MemberMgr"/>
<%
      String id = (String)session.getAttribute("idKey");
      if(id==null){
         response.sendRedirect("login.jsp");
         return;
      }
      MemberBean bean = mgr.getMember(id);
%>
<html>
<head>
<title>회원수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
   function zipCheck() {
      url = "zipSearch.jsp?search=n";
      window.open(url, "ZipCodeSearch","width=500, height=300, top=100, left=100, scrollbars=yes");
   }
</script>
</head>
<body bgcolor="#FFFFCC" onLoad="regFrm.id.focus()">
   <div align="center">
      <br /> <br />
      <form name="regFrm" method="post" action="memberUpdateProc.jsp">
         <table align="center" cellpadding="5" >
            <tr>
               <td align="center" valign="middle" bgcolor="#FFFFCC">
                  <table border="1" cellpadding="2" align="center" width="600">
                     <tr align="center" bgcolor="#996600">
                        <td colspan="3"><font color="#FFFFFF"><b>회원 수정</b></font></td>
                     </tr>
                     <tr>
                        <td width="20%">아이디</td>
                        <td width="80%"><input name="id" size="15"
                           value="<%=bean.getId() %>" readonly></td>
                     </tr>
                     <tr>
                        <td>패스워드</td>
                        <td><input type="password" name="pwd" size="15"
                           value="<%=bean.getPwd()%>"></td>
                     </tr>
                     <tr>
                        <td>이름</td>
                        <td><input name="name" size="15"
                           value="<%=bean.getName()%>"></td>
                     </tr>
                     <tr>
                        <td>성별</td>
                        <td>
                           남<input type="radio" name="gender" value="1"
                           <%if(bean.getGender().equals("1")) out.print("checked"); %>>
                           여<input type="radio" name="gender" value="2"
                           <%if(bean.getGender().equals("2")) out.print("checked"); %>>
                        </td>
                     </tr>
                     <tr>
                        <td>생년월일</td>
                        <td><input name="birthday" size="6"
                           value="<%=bean.getBirthday()%>"> ex)830815</td>
                     </tr>
                     <tr>
                        <td>Email</td>
                        <td><input name="email" size="30"
                           value="<%=bean.getEmail()%>"></td>
                     </tr>
                     <tr>
                        <td>우편번호</td>
                        <td><input name="zipcode" size="5"
                           value="<%=bean.getZipcode()%>" readonly> <input
                           type="button" value="우편번호찾기" onClick="zipCheck()"></td>
                     </tr>
                     <tr>
                        <td>주소</td>
                        <td><input name="address" size="45" value="<%=bean.getAddress()%>"></td>
                     </tr>
                     <tr>
                        <td>취미</td>
                        <td>
                        <%
                              String list[] = {"인터넷", "여행", "게임", "영화", "운동"};
                              String hb[] = bean.getHobby();//{"1","0","1,"0,"1"}
                              for(int i=0;i<hb.length;i++){
                        %>
                        <%=list[i] %>
                        <input type="checkbox" name="hobby" value="<%=list[i]%>"
                        <%=hb[i].equals("1")?"checked":"" %>>
                        <%}//---for%>   
                        </td>
                     </tr>
                     <tr>
                        <td>직업</td>
                        <td><select name="job">
                              <option value="0">선택하세요.
                              <option value="회사원">회사원
                              <option value="연구전문직">연구전문직
                              <option value="교수학생">교수학생
                              <option value="일반자영업">일반자영업
                              <option value="공무원">공무원
                              <option value="의료인">의료인
                              <option value="법조인">법조인
                              <option value="종교,언론,에술인">종교.언론/예술인
                              <option value="농,축,수산,광업인">농/축/수산/광업인
                              <option value="주부">주부
                              <option value="무직">무직
                              <option value="기타">기타
                        </select>
                        <script type="text/javascript">
                           document.regFrm.job.value="<%=bean.getJob()%>";
                        </script>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="3" align="center">
                        <input type="submit" value="수정완료"> &nbsp; &nbsp; 
                        <input type="reset" value="다시쓰기"></td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
      </form>
   </div>
</body>
</html>
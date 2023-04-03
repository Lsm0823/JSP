<%@page import="ch09.TeamBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
try {
   String _driver = "com.mysql.cj.jdbc.Driver",
   _url = "jdbc:mysql://localhost:3306/mydb2?characterEncoding=UTF-8&serverTimezone=UTC", _user = "root",
   _password = "1234";
   Class.forName(_driver); //Driver객체 생성

   Connection con = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   con = DriverManager.getConnection(_url, _user, _password);
   String sql = "select * from tblTeam";
   pstmt = con.prepareStatement(sql);
   rs = pstmt.executeQuery();
   Vector<TeamBean> vlist = new Vector<TeamBean>();
   while (rs.next()) {
      TeamBean bean = new TeamBean();
      bean.setNum(rs.getInt("num"));
      bean.setName(rs.getString("name"));
      bean.setCity(rs.getString("city"));
      bean.setAge(rs.getInt("age"));
      bean.setTeam(rs.getString("team"));
      vlist.addElement(bean);

   }

   //out.print(vlist.size());
%>

<div align="center">
   <h1>Team List</h1>
   <table border="1">
      <tr>
         <th>번호</th>
         <th>이름</th>
         <th>사는곳</th>
         <th>나이</th>
         <th>팀명</th>
      </tr>
      <%
      for (int i = 0; i < vlist.size(); i++) {
         TeamBean bean = vlist.get(i);
      %>

      <tr align="center">
         <td><%=bean.getNum()%></td>
         <td><%=bean.getName()%></td>
         <td><%=bean.getCity()%></td>
         <td><%=bean.getAge()%></td>
         <td><%=bean.getTeam()%></td>
      </tr>

      <%
      }
      %>

   </table>
</div>

<%
} catch (Exception e) {
e.printStackTrace();
}
%>
<%@page contentType="text/html; charset=UTF-8"%>
<h1 align="center"><font color="gray">구구단</font></h1>
<table style="background-color: pink", border="1", align="center">
  <thead>
    <tr>
      <% for (int i = 1; i <= 9; i++) { %>
        <th><%= i+"단" %></th>
      <% } %>
    </tr>
  </thead>
  <tbody>
    <% for (int j = 1; j <= 9; j++) { %>
      <tr>    
        <% for (int k = 1; k <= 9; k++) { %>
          <td align="center"><%= k +" X " + j + " = " + j*k %></td>
        <% } %>
      </tr>
    <% } %>
  </tbody>
</table>;
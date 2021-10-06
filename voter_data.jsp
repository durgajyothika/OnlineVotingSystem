<html>
<head>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script defer src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>

  <!-- Including Bootstrap CSS -->
  <link rel="stylesheet" href=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="voter_data.css">

  <!-- Including jQuery -->
  <script src=
"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js">
  </script>

  <!-- Including Bootstrap JS -->
  <script src=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
  </script>
</head>
<body>
  <ul>
    <li>
      <a href="admin.jsp ">HOME</a>
    </li>
    <li class="active"><a href="voter_data.jsp" class="active-link" >VOTER DETAILS</a></li>
  <li><a href="voter_login_data.jsp">LOGIN DETAILS</a></li>
  <li><a href="count_votes.jsp">VOTES</a></li>

  <li><a href="update.html">UPDATE</a></li>
  <li>
    <a href="delete.html">DELETE</a>
  </li>
  <li>
    <a href="index.html">LOGOUT</a>
  </li>
  </ul>
  <br>
    <br>

        <div class="a">
<table>
<th>name</th>
<th>dateofbirth</th>
<th>age</th>
<th>gender</th>
<th cellspacing='3'>address</th>
<th>phoneno</th>
<th>voterid</th>
<th>voted_for</th>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Statement st=con1.createStatement();
ResultSet rs=st.executeQuery("select * from voter_details");
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getDate(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
</tr>
<%}
con1.close();
%>

</table>
</div>
</body>
</html>

<html>
<head>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script defer src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>

  <!-- Including Bootstrap CSS -->
  <link rel="stylesheet" href=
  "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="voter_login_data.css">

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
    <li ><a href="voter_data.jsp" >VOTER DETAILS</a></li>
  <li class="active"><a href="voter_login_data.jsp">LOGIN DETAILS</a></li>
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

<th>voterid</th>
<th>loginid</th>
<th>password</th>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Statement st=con1.createStatement();
ResultSet rs=st.executeQuery("select * from voter_login");
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
</tr>
<%}
con1.close();
%>
</table>
</div>
</body>
</html>

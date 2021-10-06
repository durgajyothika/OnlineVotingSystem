<html>
<head>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script defer src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>

  <!-- Including Bootstrap CSS -->
  <link rel="stylesheet" href=
  "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="count_vote.css">

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
    <li ><a href="voter_data.jsp"  >VOTER DETAILS</a></li>
  <li><a href="voter_login_data.jsp">LOGIN DETAILS</a></li>
  <li class="active"><a href="count_votes.jsp">VOTES</a></li>

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
<th>PARTY</th>
<th>TOTAL VOTES</th>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
int a=0;
int b=0;
int c=0;
int d=0;
int e=0;
Statement st=con1.createStatement();
ResultSet rs=st.executeQuery("select sum(bjp),sum(ysrcp),sum(janasena),sum(tdp),sum(congress) from vote_count ");
if(rs.next())
{
a=rs.getInt(1);
b=rs.getInt(2);
c=rs.getInt(3);
d=rs.getInt(4);
e=rs.getInt(5);
%>
<tr>
<td>BJP</td>
<td><%=rs.getString(1)%></td>
</tr>
<tr>
<td>YSRCP</td>
<td><%=rs.getString(2)%></td>
</tr>
<tr>
<td>JANASENA</td>
<td><%=rs.getString(3)%></td>
</tr>
<tr>
  <td>
    TDP
  </td>
  <td><%=rs.getString(4)%></td>
</tr>
<tr>
  <td>CONGRESS</td>
  <td><%=rs.getString(5)%></td>
</tr>

</table>
<br>
<br>
<%}
if ((a >= b) && (a >= c) && (a >= d) && (a >= e)) {%>

    <h1> <%="BJP WON with "+a+" Votes"%></h1>
<%} else if ((b >= c) && (b >= d) && (b >= e)) {%>
<h1><%="YSRCP WON with "+b+" Votes"%></h1>
<%} else if ((c >= d) && (c >= e)) {%>
    <h1><%="JANASENA WON with "+c+" Votes"%></h1>
<%} else if (d >= e) {%>
    <h1><%="TDP WON with "+d+" Votes"%></h1>
<%} else {%>
    <h1><%="CONGRESS WON with "+ e +" Votes"%></h1>
<%}
con1.close();
%>
</div>
</body>
</html>

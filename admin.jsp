<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <script defer src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>

    <!-- Including Bootstrap CSS -->
    <link rel="stylesheet" href=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="admin.css">

    <!-- Including jQuery -->
    <script src=
"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js">
    </script>

    <!-- Including Bootstrap JS -->
    <script src=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
    </script>
    <%-- for barchart jquery --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
  </head>
  <body>


    <ul>

<li class="active">
  <a href="admin.jsp " >HOME</a>
</li>
      <li><a href="voter_data.jsp">VOTER DETAILS</a></li>
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
    <%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Statement st=con.createStatement();
Statement st1=con.createStatement();
ResultSet rs=st.executeQuery("select count(*) as votercount from voter_details");
ResultSet rs1=st1.executeQuery("select count(vote) as voted from voter_details");
Statement st2=con1.createStatement();
Statement st3=con1.createStatement();
Statement st4=con1.createStatement();
Statement st5=con1.createStatement();
Statement st6=con1.createStatement();
ResultSet rs2=st2.executeQuery("select sum(bjp) as bjp from vote_count");
ResultSet rs3=st3.executeQuery("select sum(ysrcp) as ysrcp from vote_count");
ResultSet rs4=st4.executeQuery("select sum(janasena) as janasena from vote_count");
ResultSet rs5=st5.executeQuery("select sum(tdp) as tdp from vote_count");
ResultSet rs6=st6.executeQuery("select sum(congress) as congress from vote_count");
int a=0;
int b=0;
int x=0;
int y=0;
int z=0;
int w=0;
int k=0;
if(rs.next()){
  a=rs.getInt("votercount");
}
if(rs1.next()){
  b=rs1.getInt("voted");
}
if(rs2.next()){
  x=rs2.getInt("bjp");
}
if(rs3.next()){
  y=rs3.getInt("ysrcp");
}
if(rs4.next()){
  z=rs4.getInt("janasena");
}
if(rs5.next()){
  w=rs5.getInt("tdp");
}
if(rs6.next()){
  k=rs6.getInt("congress");
}
%>
<div class="container-fluid">
<div class="row">
<div class="col-lg-6"style="margin-left:220px; background-image:url(blue.jpg);padding:10px 0 5px 10px;width:28%;border-radius:5px;color:#000;font-weight:900;">
  <h1><%=a%></h1>
  <h4 >VOTERS REGISTERED</h4>

  <p>
    <%=a%> voters have been registered with their details like name,dob,age,gender,phonenumber,address,voterid...
<a href="voter_data.jsp">more details<i class="fas fa-arrow-circle-right"></i></a>
  </p>

</div>
<div class="col-lg-6"style="margin-left:20px; background-image:url(yellow.jpg);padding:10px 0 5px 10px;width:28%;border-radius:5px;color:#000;font-weight:900;">
  <h1><%=b%></h1>
  <h4 >VOTERS VOTED</h4>
  <p>
    <%=b%> voters have been voted to their willing parties
    <br>
      BJP,ysrcp,janasena..
      <br>
<a href="count_votes.jsp">more details<i class="fas fa-arrow-circle-right"></i></a>
  </p>

</div>

<div class="col-lg-6" style="margin:70px 0 0 210px;">

  <canvas id="myChart" style="width:100%;max-width:600px"></canvas>

  <script>
  var xValues = ["BJP","YSRCP","JANASENA","TDP","CONGRESS"];
  var yValues = [<%=x%>, <%=y%>, <%=z%>,<%=w%>,<%=k%>];
  var barColors = ["red", "green","blue","orange","brown"];

  new Chart("myChart", {
    type: "bar",
    data: {
      labels: xValues,
      datasets: [{
        backgroundColor: barColors,
        data: yValues
      }]
    },
    options: {
      legend: {display: false},
      title: {
        display: true,
        text: "Votes for Parties"
      }
    }
  });
  </script>

</div>
</div>
</div>
</body>
</html>

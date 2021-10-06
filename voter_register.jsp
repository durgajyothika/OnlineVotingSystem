<html>
<head>

<style>
h3{
  position: absolute;
  top:10%;
  left: 20%;
color:green;
width:25%;
padding:30px;
margin:100px 0 0 300px;

}
h4{
background-color:#D83A56;
text-align:center;
width:100%;
padding:20px;
font-size:1.5rem;

}
.validdate{
  background-color:#D83A56;
  text-align: center;
  margin-left: 100px;
  margin-right: 100px;
}
</style>


</head>
<body>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String name=request.getParameter("voter_name");
String dob=request.getParameter("voter_dob");
String age=request.getParameter("voter_age");
String gender=request.getParameter("voter_gender");
String address=request.getParameter("voter_address");
String phoneno=request.getParameter("voter_phoneno");
String voterid=request.getParameter("voter_id");
String loginid=request.getParameter("login_id");
String pass=request.getParameter("psw");
String pass1=request.getParameter("psw1");
try{
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
Date db = sdf.parse(dob);
java.sql.Date sd = new java.sql.Date(db.getTime());
int i=Integer.parseInt(age);
if(phoneno.length()==10){
if(i>18){

if(pass.equals(pass1)){
PreparedStatement ps=con.prepareStatement("insert into voter_details values(?,?,?,?,?,?,?,?)");
PreparedStatement ps1=conn.prepareStatement("insert into voter_login values(?,?,?)");
ps.setString(1,name);
ps.setDate(2,sd);
ps.setString(3,age);
ps.setString(4,gender);
ps.setString(5,address);
ps.setString(6,phoneno);
ps.setString(7,voterid);
ps.setString(8,"null");
ps1.setString(1,voterid);
ps1.setString(2,loginid);
ps1.setString(3,pass);
int r=ps.executeUpdate();
int r1=ps1.executeUpdate();
if(r==0 & r1==0){%><p>please enter a valid data
<%@ include file="register.html" %>
<%}
else{%>
<h3>registration successfull</h3>
<%@ include file="index.html"%>
<%}
}
else{%>
<h4>your confrim password and password are not matched please enter a matching one</h4>
<%@ include file="register.html"%>
<%}
}
else{%>
<p>your age is below 18</p>
<h1>you can not vote</h1>
<%}

}
else{%>
  <script type="text/javascript">
   alert("enter a valid 10 digit mobile number");
</script>
<%@ include file="register.html"%>
<%}
}
catch(SQLException e){%>
  <script type="text/javascript">
   alert("you can not  register with the same voterid:<%=voterid%>");
</script>
<%@ include file="register.html"%>
<%}
catch(Exception e){%>
  <div class="validdate">
  <h2>please enter a valid date</h2>
  </div>
  <%@ include file="register.html"%>
<%}

con.close();
conn.close();
%>

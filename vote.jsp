<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String id=request.getParameter("login_id");
String psw=request.getParameter("password");
Statement st=con1.createStatement();
ResultSet rs=st.executeQuery("select * from voter_login where loginid='"+id+"' and password='"+psw+"'");
if(rs.next())
{%><p style="text-align:center;">YOUR VOTERID IS <%=rs.getString("voterid") %></p>
<%@ include file="vote.html"%>
<%}
else{
%><p style="position:absolute;top:10.5%;left:40%;color:red;">login failure</p>
<%@ include file="index.html" %>
<%}
con1.close();
%>

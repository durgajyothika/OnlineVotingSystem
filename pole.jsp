<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String pole=request.getParameter("pole");
String vid=request.getParameter("voter_id");
int i=0;
int j=0;
int k=0;
int l=0;
int m=0;

String b="bjp";
String y="ysrcp";
String a="janasena";
String t="tdp";
String c="congress";
String v="";
Statement st=con.createStatement();
Statement st1=con1.createStatement();
Statement st12=con2.createStatement();
Statement st13=con.createStatement();
ResultSet rs11=st13.executeQuery("select vote from voter_details where voterid='"+vid+"'");
if(rs11.next()){
  v=rs11.getString("vote");
  if(v.equals("null")){

int r=st.executeUpdate("update voter_details set vote='"+pole+"' where voterid='"+vid+"'");
ResultSet rs=st1.executeQuery("select vote from voter_details where vote='"+pole+"'");
ResultSet rs1=st12.executeQuery("select voterid from voter_details where voterid='"+vid+"'");
if(r!=0)
{
if(rs.next())
{
if(pole.equals(b)){
i=1;
}
else if(pole.equals(y)){
j=1;
}
else if(pole.equals(a)){//janasena
k=1;
}
else if(pole.equals(t)){
l=1;
}
else{
m=1;}

PreparedStatement ps=con3.prepareStatement("insert into vote_count values(?,?,?,?,?)");
ps.setInt(1,i);
ps.setInt(2,j);
ps.setInt(3,k);
ps.setInt(4,l);
ps.setInt(5,m);
int r1=ps.executeUpdate();
if(r1!=0)
{%>
<h1 style="position:absolute;top:2%;left:20%;font-weight:bold;">You Have Voted To
<%=rs.getString("vote")%></h1>
<%@ include file="final.html" %>
<%}
else{
out.println("insertion failuer");
}
}
else{%>
you have not voted correctly !!please vote again
<%@ include file="vote.html"%>
<%}

}

else{
if(rs1.next()){%>
enter your voterid correctly,please check , your voterid =
<%=rs1.getString("voterid")%>
<%@ include file="vote.html" %>
<%}
}
}
else{%>
  <jsp:forward page="restrict.html"></jsp:forward>
<%}
}
else{
  out.println("smtg wrong");
}
con.close();
con1.close();
con2.close();
con3.close();
%>

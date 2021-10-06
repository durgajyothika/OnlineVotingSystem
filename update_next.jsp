<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con11=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
// Statement stu=conu.createStatement();
// Statement stu1=conun1.createStatement();
String v=(String)session.getAttribute("voterid");
String name=request.getParameter("n");

String dob=request.getParameter("d");
String age=request.getParameter("a");
String gender=request.getParameter("g");
String address=request.getParameter("a1");
String phoneno=request.getParameter("p");
String lid=request.getParameter("l");
String pass=request.getParameter("psw");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

Date db = sdf.parse(dob);
java.sql.Date sd = new java.sql.Date(db.getTime());


PreparedStatement ps=con1.prepareStatement("update voter_login set loginid=?,password=? where voterid=?");
PreparedStatement ps1=con11.prepareStatement("update voter_details set name=?,dateofbirth=?,age=?,gender=?,address=?,phoneno=? where voterid=?");
ps.setString(1,lid);
ps.setString(2,pass);
ps.setString(3,v);
ps1.setString(1,name);
ps1.setDate(2,sd);
ps1.setString(3,age);
ps1.setString(4,gender);
ps1.setString(5,address);
ps1.setString(6,phoneno);
ps1.setString(7,v);
int re=ps.executeUpdate();
int re1=ps1.executeUpdate();
if(re!=0&& re1!=0){%>
<script type="text/javascript">
  alert("updation successfull")
</script>
<%@ include file="update.html" %>
  <%
}
else{
  out.println("no");
}
con1.close();
con11.close();
%>


<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");

String vid=request.getParameter("vid");
PreparedStatement ps=con.prepareStatement("delete  voter_login where voterid=?");

ps.setString(1,vid);
int r=ps.executeUpdate();
PreparedStatement ps1=con1.prepareStatement("delete  voter_details where voterid=?");
ps1.setString(1,vid);
int r1=ps1.executeUpdate();
if(r!=0 && r1!=0){%>
<script type="text/javascript">
  alert("deletion successfull");
</script>
<%@ include file="delete.html"%>
<%}
else{
  out.println("no");
}
con.close();
con1.close();
%>

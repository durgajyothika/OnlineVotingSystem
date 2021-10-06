<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conw=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String id=request.getParameter("admin_id");
String n=request.getParameter("admin_psw");
Statement ste=conw.createStatement();
ResultSet rsw=ste.executeQuery("select * from v_admin where admin_id='"+id+"'and password='"+n+"'");
	if(rsw.next())
	{%> <div id="alert" class="alert alert-success">
			<i class="fas fa-check-circle"></i>login successfull
	</div>

	<script type="text/javascript">
			setTimeout(function () {

					// Closing the alert
					$('#alert').alert('close');
			}, 1000);
	</script>
        <%@ include file="admin.jsp" %>
        <%}
        else
        {%>
<p>LOGIN FAILURE PLEASE ENTER A VALID DATA</p>
<%@ include file="admin_login.html" %>
<%}
conw.close();
%>

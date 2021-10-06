
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style media="screen">
    body{

      background: #74ebd5;  /* fallback for old browsers */
  background: -webkit-linear-gradient(to right, #ACB6E5, #74ebd5);  /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to right, #ACB6E5, #74ebd5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
font-size: 1.2rem;
font-weight: bold;


    }
      table, th, td{
        border:1px solid black;
      }
      table{
        margin:100px 0 20px 350px;
        border-collapse: collapse;


      }
th, td{
  padding-right: 30px;
  width: 300px;
  text-align: left;
  padding-left: 15px;
}
input{
  border:none;
  background:transparent ;
  width: 110%;

font-size: 1.3rem;
}
button{
  margin: 0 0 20px 600px;
border: none;
background-color: black;
color: white;
padding: 5px;
font-size: 1.2rem;

}
a{
  margin-left: 550px;
  color: white;
}
    </style>
  </head>
  <body>
<form class="" action="update_next.jsp" method="post">

      <%@ page import="java.io.*" %>
      <%@ page import="java.sql.*" %>
      <%
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection conu=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
      Connection conuu=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
      String vid2=request.getParameter("vid");

            session.setAttribute("voterid",vid2);

      Statement stu=conu.createStatement();
    Statement stuu=conuu.createStatement();
      ResultSet rsu=stu.executeQuery("select * from voter_details where voterid='"+vid2+"'");
    ResultSet rsuu=stuu.executeQuery("select * from voter_login where voterid='"+vid2+"'");
    if(rsu.next() && rsuu.next()){%>
    <table>
      <tr>
          <th> Name </th>
          <td><input type="text" name="n" value="<%=rsu.getString(1)%>"></td>
      </tr>
<tr>
  <th>Dateofbirth</th>
  <td><input type="date" name="d" value="<%=rsu.getDate(2)%>"></td>
</tr>
<tr>
  <th>Age</th>
  <td><input type="text" name="a" value="<%=rsu.getString(3)%>"></td>
</tr>
<tr>
  <th>Gender</th>
  <td><input type="text" name="g" value="<%=rsu.getString(4)%>"></td>
</tr>
<tr>
  <th>Address</th>
  <td><input type="text" name="a1" value="<%=rsu.getString(5)%>"></td>
</tr>

<tr>
    <th>Phoneno</th>
    <td><input type="text" name="p" value="<%=rsu.getString(6)%>"></td>
</tr>
<tr>
    <th>Loginid</th>
    <td><input type="text" name="l" value="<%=rsuu.getString(2)%>"></td>
</tr>
<tr>
  <th>Password</th>
  <td><input type="text" name="psw" value="<%=rsuu.getString(3)%>"></td>
</tr>

      </table>

    <%

  }%>


<button type="submit" class="btn btn-success"name="update">Update</button>
<br>
  <a href="admin.jsp"><<-GoBackToHomePage</a>
  </form>

    <%
    conu.close();
    conuu.close();
    %>

  </body>
</html>

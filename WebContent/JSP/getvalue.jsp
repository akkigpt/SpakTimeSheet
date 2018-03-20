<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
 <%@ page import="com.login.util.DBConnection" %>

<%

String data="";
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "customers";
String driver = "com.mysql.jdbc.Driver";
String userName = "root"; 
String password = "root";

int sumcount=0; 
Statement st;
try {
	String emp_id = request.getParameter("name");
	
System.out.println("got name");
Class.forName(driver).newInstance();

conn = DriverManager.getConnection(url+dbName,userName,password);
String query = "select * from employee where name='"+emp_id+"'";

st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next())
{
data = ":" + rs.getString("address") +":"+  rs.getString("email");
}
out.println(data);
}
catch (Exception e) {
e.printStackTrace();
}
%>
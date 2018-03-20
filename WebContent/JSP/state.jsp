<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
 <%@ page import="com.login.util.DBConnection" %>




 
<% response.setContentType("text/html");%>
<%
String str=request.getParameter("queryString");
try {
String connectionURL = "jdbc:mysql://localhost:3306/customers";
Connection con;
Class.forName("com.mysql.jdbc.Driver");
// Get a Connection to the database
con = DriverManager.getConnection(connectionURL, "root", "root"); 
//Add the data into the database
//System.out.println("Connection established....");
String sql = "SELECT EmployeeName FROM users WHERE EmployeeName LIKE '"
+str+"%' LIMIT 10";
Statement stm = con.createStatement();
stm.executeQuery(sql);
ResultSet rs= stm.getResultSet();
while (rs.next ()){
out.println("<li onclick='fill("+rs.getString("EmployeeName")+");'>"
+rs.getString("EmployeeName")+ "</i>");
}}catch(Exception e){
out.println("Exception is ;"+e);
}
%>
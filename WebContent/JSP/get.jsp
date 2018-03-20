<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
 <%@ page import="com.login.util.DBConnection" %>
 <%  
 
 
 String s[]=null;
 Connection con = null;
    response.setContentType("text/html");
con = DBConnection.createConnection();
 //Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/customers","root","Datamato@123");
 System.out.println("test:"+con);
 
String name=request.getParameter("count");  
 String buffer="<div>";  
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
// Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","root");  
 Statement stmt = con.createStatement();  
 System.out.println("Conected.........");
 
 ResultSet rs = stmt.executeQuery("Select * from users where EmployeeName LIKE '"+name+"%'");  
   while(rs.next()){
   buffer=buffer+rs.getString(2)+"<br>";  
   }  
 buffer=buffer+"</div>";  
 response.getWriter().println(buffer); 
 System.out.println("Disconnected");
%>
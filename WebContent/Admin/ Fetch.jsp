<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%
    try
    {
    	System.out.println("In userlist.jsp page");
        String query = (String)request.getParameter("search");

        JSONArray json=new JSONArray();

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/customers","root","root");
       
        System.out.println("connected...............");
        Statement st=con.createStatement();
        ResultSet rs;

        rs=st.executeQuery("select EmployeeName from users where EmployeeName like '"+query+"%'");
        while(rs.next())
        {
             json.put(rs.getString("EmployeeName"));
             System.out.println(rs.getString("EmployeeName"));
        }
        out.print(json.toString());
      }
      catch(Exception e1)
      {
      out.println(e1);
      }
%> 
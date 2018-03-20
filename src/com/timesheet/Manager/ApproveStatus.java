package com.timesheet.Manager;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.util.DBConnection;

import java.sql.Statement;
import java.util.Arrays;
import java.util.List;

/**
 * Servlet implementation class ApproveStatus
 */
@WebServlet("/ApproveStatus")
public class ApproveStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("inside Approval status");
		String selectopt = request.getParameter("select");
		System.out.println(selectopt);
		//String taskID = request.getParameter("taskid");
		//System.out.println(taskID);
		String[] list= request.getParameterValues("list");
		
		List l =  Arrays.asList(list); 
		  //request.setAttribute("names", l);
		  //System.out.println(Arrays.toString(l.toArray()));
		System.out.println(l.size());
		  for(int i = 0; i < l.size(); i++) {
	            System.out.println(l.get(i));
	        }
		try {
			
			 Connection con = null;
	      	 con = DBConnection.createConnection();
	      	 
	      	 switch(selectopt) {
	      	 	case "approve": System.out.println("Approve case");
	      	 					for(int i=0;i<l.size();i++) {
	      	 						Statement st =con.createStatement();
	      	 						st.executeUpdate("Update task set approval='yes' where taskid="+l.get(i));
	      	 					}
	      	 					//request.getRequestDispatcher("DisplayApproval").forward(request, response);
	      	 					break;
	      	 					
	      	 	case "reject": System.out.println("reject case");
							   for(int i=0;i<l.size();i++) {
							   Statement st =con.createStatement();
							   st.executeUpdate("Update task set approval='no' where taskid="+l.get(i));
							   }
							   //request.getRequestDispatcher("DisplayApproval").forward(request, response);
							   break;
					
	      	 	case "pending": System.out.println("pending case");
								/*for(int i=0;i<l.size();i++) {
									Statement st =con.createStatement();
									st.executeUpdate("Update task set approval='yes' where taskid="+l.get(i));
								}*/
								//request.getRequestDispatcher("DisplayApproval").forward(request, response);
								break;
	      	 }
		
	      	request.getRequestDispatcher("DisplayApproval").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

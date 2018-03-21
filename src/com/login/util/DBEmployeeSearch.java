package com.login.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBEmployeeSearch {
	private int totalEmp;
	private List<String> employees;
	
	public DBEmployeeSearch() throws SQLException {
		java.sql.Connection conn = null;
		conn = DBConnection.createConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select EmployeeName from users");
		
		while(rs.next()) {
			System.out.println(rs.getString(1));
			employees.add(rs.getString(1));
			
		}
		
		totalEmp = employees.size();
	}
	
	public List<String>  getData(String query) {
		String empName = null;
		query = query.toLowerCase();
		List<String> matched = new ArrayList<String>();
		for(int i=0;i<totalEmp;i++) {
			empName = employees.get(i).toLowerCase();
			if(empName.startsWith(query)) {
				matched.add(employees.get(i));
			}
		}
		return matched;
	}
}

package com.email.notification;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
//This servelt is to initialize emails notification on container load
//Checking for merge request for akshay
//test

public class InitializeServlet extends HttpServlet {


 public void init() throws ServletException {
    
    try {
        System.out.println("Initializing NewsLetter PlugIn");
        
      //  CronScheluder objPlugin = new CronScheluder();
        DBScheduler dbs=new DBScheduler();
        dbs.callScheduler();
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }
    
  }
 
}
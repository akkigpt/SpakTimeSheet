package com.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import net.sf.json.JSONArray;

import java.io.PrintWriter;







/**
 * Servlet implementation class AjaxRequest
 */
@WebServlet("/AjaxRequest")
public class AjaxRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	

	
	   
    private static final String[] COUNTRIES = new String[] {
          "Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra",
          "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina",
          "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan",
          "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium",
          "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia",
          "Bosnia and Herzegovina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory",
          "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burundi",
          "Cote d'Ivoire", "Cambodia", "Cameroon", "Canada", "Cape Verde",
          "Cayman Islands", "Central African Republic", "Chad", "Chile", "China",
          "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo",
          "Cook Islands", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic",
          "Democratic Republic of the Congo", "Denmark", "Djibouti", "Dominica", "Dominican Republic",
          "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea",
          "Estonia", "Ethiopia", "Faeroe Islands", "Falkland Islands", "Fiji", "Finland",
          "Former Yugoslav Republic of Macedonia", "France", "French Guiana", "French Polynesia",
          "French Southern Territories", "Gabon", "Georgia", "Germany", "Ghana", "Gibraltar",
          "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau",
          "Guyana", "Haiti", "Heard Island and McDonald Islands", "Honduras", "Hong Kong", "Hungary",
          "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica",
          "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Laos",
          "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg",
          "Macau", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands",
          "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia", "Moldova",
          "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia",
          "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand",
          "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "North Korea", "Northern Marianas",
          "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru",
          "Philippines", "Pitcairn Islands", "Poland", "Portugal", "Puerto Rico", "Qatar",
          "Reunion", "Romania", "Russia", "Rwanda", "Sqo Tome and Principe", "Saint Helena",
          "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon",
          "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Saudi Arabia", "Senegal",
          "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands",
          "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "South Korea",
          "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard and Jan Mayen", "Swaziland", "Sweden",
          "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "The Bahamas",
          "The Gambia", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey",
          "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Virgin Islands", "Uganda",
          "Ukraine", "United Arab Emirates", "United Kingdom",
          "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan",
          "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Wallis and Futuna", "Western Sahara",
          "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"
        };


    public AjaxRequest() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       System.out.println("In Ajax request.......");
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
       
        JSONArray arrayObj=new JSONArray();
       
        String query = request.getParameter("term");
        System.out.println(query);
        query = query.toLowerCase();
        for(int i=0; i<COUNTRIES.length; i++) {
            String country = COUNTRIES[i].toLowerCase();
            if(country.startsWith(query)) {
                arrayObj.add(COUNTRIES[i]);
            }
        }
       
        out.println(arrayObj.toString());
        out.close();
       
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Do something       
    }

}
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <script src="http://code.jquery.com/jquery-1.2.6.js" type="text/javascript"></script>
  
<script>
  
$(document).ready(function(){
	 
    var xmlhttp;
    var urls="http://localhost:9444/TimeSheet/Admin/UserList.jsp"
 
    if (window.XMLHttpRequest)
    {
         xmlhttp=new XMLHttpRequest();
    }
    else
    {
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
 
    xmlhttp.onreadystatechange=function()
   {
 
      z=0;
      removeall();
 
    if (xmlhttp.readyState==4)
    {
            var roott=xmlhttp.responseXML.documentElement;
            var ress=roott.getElementsByTagName("empname")[z].childNodes[0].nodeValue;
            var ress1=roott.getElementsByTagName("empname");
            alert(ress1);
 
            while(ress!=null)
            {
                    addoptions(ress)
                    z++
              var ress=roott.getElementsByTagName("empname")[z].childNodes[0].nodeValue;
            }
     }
 
    function removeall()
    {
 
        var ct=document.dummy.sele2.length;
        for(i=ct; i>=0; i--)    {    
            document.dummy.sele2.options[i]=null;
             }
    }
 
    function addoptions(reslt)
    {
 
        var ct1=document.createElement("OPTION");
        alert(ct1);
        ct1.text=reslt;
        ct1.value=reslt;
        document.dummy.sele2.options.add(ct1);
 
    }
 }    //onreadystatechnge function end
 
xmlhttp.open("GET",urls,true);
xmlhttp.send();
 
});
</script>
</head>
<body>


<form name="dummy">
EName:    <select name="sele2">
            <option>--choose--</option>
    </select>
 
</form>

</body>
</html>
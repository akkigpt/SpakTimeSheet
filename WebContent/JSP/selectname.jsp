<html>
<head>
<script type="text/javascript">
function showEmp(emp_value){ 
 if(document.getElementById("address").value!="-1"){
 xmlHttp=GetXmlHttpObject()
if (xmlHttp==null){
 alert ("Browser does not support HTTP Request")
 return
 }
var url="getvalue.jsp"
url=url+"name= priyanka"
xmlHttp.onreadystatechange=stateChanged 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
}
else{
 alert("Please Select Employee Id");
}
}
function stateChanged(){ 
document.getElementById("email").value ="";
document.getElementById("address").value ="";


if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete") { 
var showdata = xmlHttp.responseText; 
    var strar = showdata.split(":");
if(strar.length==1){
  document.getElementById("address").focus();
  
  alert("Please Select Employee Id");
  document.getElementById("email").value =" ";
document.getElementById("address").value =" ";
 }
 else if(strar.length>1) {
var strname = strar[1];
document.getElementById("address").value= strar[1];
document.getElementById("email").value= strar[2];
 }
 } 
}

function GetXmlHttpObject(){
var xmlHttp=null;
try{
 xmlHttp=new XMLHttpRequest();
 }
 
 
 
 
catch (e) {
 try {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}
</script>
</head>
<body>
<form name="employee">
<br><br>
<table border="0" width="400px" align="center" bgcolor="#CDFFFF">
<div id="mydiv"></div>
   <tr><td><b>Select Employee Name</b></td><td> 
   <select name="name" onchange="showEmp(this.value);">
   <option value="-1">Select</option> 
<option value="Angelina">Angelina</option>
<option value="Martina">Martina</option>
<option value="Julia">Julia</option>
<option value="Angel">Angel</option>
 </select>
</td></tr>
<tr><td ><b>Employee Address:</b></td><td>
<input  type="text" name="address" id="address" value=""></td></tr>
<tr><td><b>Employee Email:</b></td><td>
<input  type="text" name="email" id="email" value=""></td></tr>

</table>
</form>    
<table border="0" width="100%" align="center">
<br>
<br>
</table>
</body>
</html>
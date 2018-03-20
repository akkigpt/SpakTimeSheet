<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 
Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1
-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery Auto Complete</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script><!-- search textbox -->
<script type="text/javascript">
function lookup(inputString) {
if(inputString.length == 0) {
$('#suggestions').hide();
} else {
$.post("state.jsp", {queryString: ""+inputString+""}, function(data){
if(data.length >0) {
$('#suggestions').show();
$('#autoSuggestionsList').html(data);
}
});
}
}
function fill(thisValue) {
$('#inputString').val(thisValue).text;
setTimeout("$('#suggestions').hide();", 5000);
}

$(document).ready(function (){
    $("##suggestions").change(function () {
        $("#Text1").val($(this).val());
    });
});
</script>



</script>
<style type="text/css">
body {
font-family: Helvetica;
font-size: 13px;
color: #000;
}
h3 {
margin: 0px;
padding: 0px;
}
.suggestionsBox {
position: relative;
left: 260px;
margin: 0px 0px 0px 0px;
width: 200px;
background-color: #7845DD;
-moz-border-radius: 7px;
-webkit-border-radius: 7px;
border: 2px solid #000;
color: #fff;
}
.suggestionList {
margin: 0px;
padding: 0px;
}
.suggestionList li {
margin: 0px 0px 3px 0px;
padding: 3px;
cursor: pointer;
}
.suggestionList li:hover {
background-color: #DD45CD;
}
</style>
</head>
<body>
<div>
<form>
<div> <h3><font color="red">Indian States</states></font></h3> 
<br /> Enter India State Name to see autocomplete
<input type="text" size="30" value="" id="inputString" 
onkeyup="lookup(this.value);" onblur="fill();" />
</div>
<div class="suggestionsBox" id="suggestions" ;">
<div class="suggestionList" id="autoSuggestionsList">
</div>
</div>
</form>
</div>
</body>
</html>
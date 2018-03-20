<%-- 
    Document   : Auto
    Created on : Feb 13, 2018, 4:24:31 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <title>JSP Page</title>
    </head>
    <body>


        <div class="ui-widget">
            <input type="text" id="auto"/>  
        </div>


        <script type="text/javascript">
           $(function()
           {
        	   alert("in function")
            $('#auto').autocomplete(
            	
            {
      
            source:function(request,response)
            {
            //Fetch data
            $.ajax({
                url:"Fetch.jsp",
                method:"post",
                dataType:'json',
                
                data:{search:request.term},
                success:function(data)
                {
                    response(data);
                }
            });
            }
            });   
           }); 
        </script>

    </body>
</html>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Autocomplete in java web application using Jquery and JSON</title>
<script src="https:/code.jquery.com/jquery-1.10.2.js"></script>
<script src="https:/code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="autocompleter.js"></script>
<link rel="stylesheet" 
  href="https:/code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<!-- User defied css -->
<link rel="stylesheet" href="style.css">

<script>
            $(document).ready(function() {
                $(function() {
                    $("#search").autocomplete({
                        source: function(request, response) {
                            $.ajax({
                                url: "/SearchController",
                                type: "GET",
                                data: {
                                    term: request.term
                                },
                                dataType: "json",
                                success: function(data) {
                                    response(data);
                                }
                            });
                        }
                    });
                });
            });
        </script>



</head>
<body>
<div class="header">
        <h3>Autocomplete in java web application using Jquery and JSON</h3>
</div>
<br />
<br />
<div class="search-container">
        <div class="ui-widget">
                <input type="text" id="search" name="search" class="search" />
        </div>
</div>
</body>
</html>
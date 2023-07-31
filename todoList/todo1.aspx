<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="todo1.aspx.cs" Inherits="todoList.todo1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
                
    <title> TODO1</title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container text-center">

            <div class="row">

                <div class="col-5  mr-auto alert alert-primary" role="alert">

                    col1

                </div>

                <div class="col-2 ml- auto bg-success-subtle text-emphasis-success">

                    col2                    

                </div>

                <div class="col-3 alert alert-danger" role="alert">

                    col3

                </div>

            </div>

        </div>

    </form>

</body>
</html>

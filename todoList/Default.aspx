<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="todoList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TODO - Günlük İş Takibi</title>
    <link href="style/default.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            TODO Ana Sayfa
        </div>
        <div>
            <asp:Button ID="btnHello" runat="server" Text="Button" OnClick="btnHello_Click" />
        </div>
        <div>
            <asp:Label ID="lblMerhaba" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="todo.aspx.cs" Inherits="todoList.todo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style/todo.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="baslık" style="background:yellow;">

            <div class="tarih">
                 <span> Tarih</span><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>            
            
        </div>

        <div class="baslık" style="background:red;">

            <div class="not">
                <span>Not</span> <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </div>
            
        </div>      
      
        <div class="baslık" style="background:pink;">

            <div class="durum">
                DURUM
            </div>

            <div>
              <asp:RadioButton ID="rbacil" runat="server" Text="Acil" GroupName="Durum" />
             <asp:RadioButton ID="rbnormal" runat="server" Text="Normal" GroupName="Durum" />
            </div>    
            
        </div>  




      
        <div class="kaydet">
            <asp:Button ID="btnKaydet" runat="server" Text="KAYDET" OnClick="btnKaydet_Click" />
        </div>
    </form>
</body>
</html>

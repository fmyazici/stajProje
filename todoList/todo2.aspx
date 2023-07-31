<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="todo2.aspx.cs" Inherits="todoList.todo2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server">
    <title> KORTEKS </title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link href="NewFolder1/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    
    <form id="form1" runat="server" style="background-color:#e5e5e5">
       
      <div class="container-lg">
           <nav class="navbar navbar-light" style="background-color:#e5e5e5;">
             <img src="Resources/logo-korteks.png" style ="width:150px" />
           
            <asp:DropDownList class="form-select" ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" runat="server" AutoPostBack="True" Width="246px" >                 
                   <asp:ListItem>Tümünü Göster</asp:ListItem>
                   <asp:ListItem>Devam Ediyor</asp:ListItem>
                   <asp:ListItem>Tamamlandı</asp:ListItem>
                    

            </asp:DropDownList>
          

        </nav>
      </div>   
       
      
        <div class="container-lg" style="margin-top:1%"> 
            
            <div class="row" >
                
                <div class="col-3 alert alert-danger shadow"> 

                    <div class="row-1">
                        
                        <div class="col font-weight-bold mt-3" >

                             <asp:Label ID="lblSıraNo" Text="SIRA NO" runat="server" />

                        </div>

                        <div class="col mt-1">
                            <asp:TextBox ID="tbID" class="form-control" runat="server" Visible="True" Width="100%" Enabled="False"></asp:TextBox> 

                        </div>

                    </div>
                    
                    <div class="row-1">
                        
                        <div class="col font-weight-bold mt-3">
                            
                            TARİH

                        </div>

                        <div class="col mt-1">     
                            
                            <asp:TextBox ID="tbTarih" class="form-control" runat="server" Width="100%"></asp:TextBox>


                        </div>

                    </div>
                    <div class="row-1 ">
                        
                        <div class="col font-weight-bold mt-3">
                            
                            NOT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Font-Names="Baskerville Old Face" Font-Size="Medium" ForeColor="Red"></asp:Label>

                        </div>
                        <div class="col mt-1" >
                            
                            <asp:TextBox ID="tbNot" class="form-control" runat="server" BorderStyle="Solid" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>

                        </div>

                    </div>
                    <div class="row-1">
                        
                        <div class="col font-weight-bold mt-2">
                            
                            ÖNEM&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Baskerville Old Face" Font-Size="Medium" ForeColor="Red"></asp:Label>

                        </div>
                       
                        <div class="col border-dark mt-1">
                            
                            <asp:RadioButtonList class="" ID="rbOnem" runat="server"  RepeatDirection="Horizontal">
                                                           
                                <asp:ListItem>NORMAL</asp:ListItem> 
                                <asp:ListItem style="margin-left:10px">ACİL</asp:ListItem>

                            </asp:RadioButtonList>

                        </div>

                    </div>
                    
                    <div class="row-1 ">
                        
                        <div class=" col font-weight-bold mt-1">
                            
                            DURUM

                        </div>
                        
                        <div class="col mt-1 "> 
                            
                            <asp:DropDownList class="form-select" AutoPostBack="true"   ID="dlDurum" OnSelectedIndexChanged="dlDurum_SelectedIndexChanged" runat="server" Width="100%">
                                
                                <asp:ListItem>Devam Ediyor</asp:ListItem>
                                <asp:ListItem>Tamamlandı</asp:ListItem>

                            </asp:DropDownList>

                        </div>  

                    </div>
                    
                    <div class="row-2">
                        
                        <div class="col font-weight-bold mt-3">
                          
                            <asp:Button class="btn btn-secondary" runat="server" Text="TEMİZLE" ID="btnTemizle"  OnClick="btnTemizle_Click" Width="123px" />
                            &nbsp;
                            <asp:Button class="btn btn-danger" runat="server" Text="KAYDET" ID="btnKaydet" OnClick="btnKaydet_Click" Width="123px"  />

                        </div>
                        
                        <div class="col font-weight-bold mt-3 ">

                            <asp:Button class="btn btn-primary" runat="server" Text="GÜNCELLE" ID="btnguncelle" style="background-color:#0026ff;color:white" OnClick="btnguncelle_Click" Width="100%" />

                        </div>
                        
                    </div>

                    <div class="row-1 ">
                        
                        <div class="col font-weight-bold mt-3 " runat="server" >
                            <asp:Label ID="lblDurumDegisim" Text="DURUM DEĞİŞİM TARİHİ" runat="server" />
                            

                        </div>
                        
                        <div class="col mt-1">
                            
                            <asp:TextBox class="form-control" ID="tbDegisimTarihi" runat="server" Width="100%"></asp:TextBox>

                        </div>

                    </div>

            </div>
              
                   
               <div class="col-9">
                   
                    <div class="row ">               
                
                        <div class="col table table-bordered table-hover shadow" style="margin-left:5px;padding:0px">
                            
                             <asp:GridView ID="GridView1" Width="100%" runat="server"   OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False" CellPadding="3" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                                 GridLines="Horizontal" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" Font-Bold="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" >

                                 <AlternatingRowStyle BackColor="#F7F7F7" />

                                 <Columns>

                                     <asp:ButtonField ButtonType="Button" CommandName="Select" Text=">" />

                                    <asp:TemplateField HeaderText="SIRA NO" >
                                        
                                        <ItemTemplate >
                                           
                                            <asp:Label runat="server" id="id" Text='<%# Eval("id") %>'></asp:Label>
                                        </ItemTemplate>


                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TARİH" >

                                        <ItemTemplate>

                                            
                                            <asp:Label runat="server" id="Tarih" Text='<%# Eval("Tarih") %>'></asp:Label>


                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="NOT">

                                        <ItemTemplate>

                                              
                                            <asp:Label runat="server" id="Not" Text='<%# Eval("Not") %>'></asp:Label>
                                            
                                            
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ÖNEM">

                                        <ItemTemplate>
                                            
                                            <asp:Label runat="server" id="Onem" Text='<%# Eval("Onem") %>'></asp:Label>

                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DURUM">

                                        <ItemTemplate>

                                            
                                            <asp:Label runat="server" id="Durum" Text='<%# Eval("Durum") %>'></asp:Label>


                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DURUM DEĞİŞİM TARİHİ">

                                        <ItemTemplate>
                                            
                                            <asp:Label runat="server" id="DurumDegisimTarihi" Text='<%# Eval("DurumDegisimTarihi") %>'></asp:Label>


                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:CommandField ShowDeleteButton="True"  ButtonType="Button" />


                                </Columns>
                               
                                 <EditRowStyle HorizontalAlign="Right" Wrap="False" />
                               
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#DC3545" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" Wrap="False" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle BackColor="#f8d7da" ForeColor="#721c24" Font-Bold="False" VerticalAlign="Middle" />
                                <SelectedRowStyle BackColor="  " Font-Bold="True" ForeColor="#721c24" />
                                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                <SortedAscendingHeaderStyle BackColor="#5A4C9D" Font-Size="Medium" />
                                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                               
                            </asp:GridView>

                        </div>
                        
                    </div>

               </div>

            </div>

        </div>

    <script> src = "https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" </script> 

        

    </form> 

    </body>

 </html>

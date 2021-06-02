<%@ Page Language="C#" AutoEventWireup="true" CodeFile="selectCourse.aspx.cs" Inherits="selectCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
<body>
    <form id="form1" runat="server">
     <div class="selectCourse">
         選課
     </div>
     <div class="courseWrapper">
         <div class="left">
         <div class="items">
             課程名稱
             <asp:TextBox ID="courseName" CssClass="professorUnique" runat="server"></asp:TextBox>
         </div>
         <div class="items">
             教授名稱
             <asp:TextBox ID="professorName" CssClass="professorUnique" runat="server"></asp:TextBox>
         </div>
         </div>
         <div class="right">
         <asp:Button ID="searchBtn" CssClass="btnStyle" runat="server" Text="搜尋按鈕" />
         </div>
     </div>
        <center>
<asp:GridView ID="GridView1"  RowStyle-CssClass="bottomBorder"  runat="server" DataSourceID="SqlDataSource1">    <HeaderStyle BackColor="royalblue" Font-Bold="True" ForeColor="White" />
    <RowStyle CssClass="bottomBorder" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </center>
        <div style="font-size:25px;font-weight:bold;">
            已勾選學分： <asp:Label ID="checkCreditSum" runat="server" Text="0/30"></asp:Label>
        </div>
        <div class="selectFooter">
                <asp:Button ID="reset" runat="server" CssClass="btnStyle" Text="重新選擇" />                
            <asp:Button ID="Button1" runat="server" CssClass="btnStyle" Text="選擇完成" />
        </div>
    </form>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

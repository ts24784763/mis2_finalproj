<%@ Page Language="C#" AutoEventWireup="true" CodeFile="setting.aspx.cs" Inherits="setting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>個人資料設定</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText">
            <a href="index.aspx">首頁</a>
            <a href="#">探索學校</a>
            <a href="#">關於我們</a>
            <a href="Login.aspx">登入/註冊</a>
            </div>
        </div>
        <div class="area">
           <div class="wrapper">
           <div class="photoItems">
               <img src="https://picsum.photos/300/150?random=1"/>
               <asp:Label ID="myName" CssClass="myName" runat="server" Text="試試看"></asp:Label>
               <asp:Label ID="title" CssClass="nameSub" runat="server" Text="身分：(學生/校長/老師)"></asp:Label>
               <asp:Label ID="school" CssClass="school" runat="server" Text="• 會計學校"></asp:Label>
               <asp:Label ID="money" CssClass="money" runat="server" Text="錢包餘額： $ 15"></asp:Label>
           </div>
           <div class="certification">
               <asp:Label ID="myCertification" runat="server" Text="• 我的證書："></asp:Label>
               <asp:Label ID="certifications" CssClass="certificationLabel" runat="server" Text="XXXX"></asp:Label>
           </div>
           </div>
           <div class="setting">
               <asp:Label ID="settings" CssClass="settingFonts" runat="server" Text="個人資料設定"></asp:Label><hr />
                       Email<br /><br />
            <asp:Label ID="email" CssClass="emailFonts" runat="server" Text="xxxx@mail.com"></asp:Label>
               <br /><br />姓名<br /><br />
               <asp:TextBox ID="enterName" runat="server"></asp:TextBox><br /><br />
               電話<br /><br />
               <asp:TextBox ID="cellPhone" runat="server"></asp:TextBox><br /><br />
               <br />
               <asp:Button ID="update" CssClass="updateBtn" runat="server" Text="更新資訊" />
           </div>
      
        </div>
    </form>
</body>
</html>

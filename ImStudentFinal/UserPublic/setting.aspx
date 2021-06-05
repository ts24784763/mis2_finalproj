<%@ Page Language="C#" AutoEventWireup="true" CodeFile="setting.aspx.cs" Inherits="setting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 個人資料設定</title>
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
            <a href="../Student/selectCourse.aspx">選課</a>
            <a href="../Student/mainSchool.aspx">我的學校</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
        </div>
        <div class="area">
           <div class="wrapper">
           <div class="photoItems">
               <asp:Image ID="imgRole" runat="server" CssClass="imgCircle"/>
               <asp:Label ID="lbName" CssClass="myName" runat="server" Text="試試看"></asp:Label>
               <asp:Label ID="lbRole" CssClass="nameSub" runat="server" Text="身分：(學生/校長/老師)"></asp:Label>
               <asp:Label ID="lbSchool" CssClass="school" runat="server" Text="• 會計學校"></asp:Label>
               <asp:Label ID="lbMoney" CssClass="money" runat="server" Text="錢包餘額： $ 15"></asp:Label>
           </div>
           <div class="certification">
               <asp:Label ID="myCertification" runat="server" Text="• 我的證書："></asp:Label>
               <asp:Label ID="certifications" CssClass="certificationLabel" runat="server" Text="XXXX"></asp:Label>
           </div>
           </div>
           <div class="setting">
               <asp:Label ID="settings" CssClass="settingFonts" runat="server" Text="個人資料設定"></asp:Label><hr />
                       帳號<br /><br />
            <asp:Label ID="lbEmail" CssClass="emailFonts" runat="server" Text="xxxx@mail.com"></asp:Label>
               <br /><br />姓名<br /><br />
               <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br /><br />
               電話<br /><br />
               <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox><br /><br />
               <br />
               <asp:Button ID="update" CssClass="updateBtn" runat="server" Text="更新資訊" OnClick="update_Click" />
           </div>
      
        </div>
    </form>
</body>
</html>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
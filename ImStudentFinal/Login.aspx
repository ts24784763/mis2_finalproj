<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/KenStyle.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 279px;
        }
        .auto-style3 {
            height: 197px;
        }
        .auto-style4 {
            width: 278px;
        }
        .auto-style5 {
            width: 290px;
            height: 27px;
        }
    </style>
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
        <div id="loginLeft" class="auto-style1">
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>
                <center>
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size:xx-large; padding-left: 150px;">歡迎您回來！</label>
                </center>
            </div>
        </div>
        <div id="loginRight">
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div class="auto-style3">
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium">*Email :<br />
                </label>&nbsp;<br />
                <asp:TextBox id="txtEmail" type="text" placeholder="Enter your email" runat="server" Width="276px" BackColor="#F7F7F7"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="emailValidator" runat="server" ErrorMessage="請輸入信箱" ForeColor="#CC0000" ControlToValidate="txtEmail" Enabled="False"></asp:RequiredFieldValidator>
                <br />
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium">*密碼 :<br />
                </label>&nbsp;<br />
                <asp:TextBox id="txtPassword" placeholder="Enter your password" class="auto-style4" runat="server" BackColor="#F7F7F7" TextMode="Password"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ErrorMessage="請輸入密碼" ControlToValidate="txtPassword" ForeColor="#CC0000" Enabled="False"></asp:RequiredFieldValidator>
                <br />
                <asp:Button id="btnLogin" class="auto-style5" runat="server" Text="登入" OnClick="btnLogin_Click" Height="32px"></asp:Button>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button id="btnRegister" class="loginBtn" runat="server" Text="註冊" BackColor="#F7F7F7" OnClick="btnRegister_Click"></asp:Button><b>｜</b><asp:Button id="btnForgetPassword" class="loginBtn" runat="server" Text="忘記密碼" BackColor="#F7F7F7"></asp:Button>
            </div>
        </div>
    </form>
</body>
</html>


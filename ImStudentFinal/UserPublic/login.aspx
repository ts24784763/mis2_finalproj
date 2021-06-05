<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Login" %>

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
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText">
            <a href="index.aspx">首頁</a>
            <a href="#">探索學校</a>
            <a href="#">關於我們</a>
            <a href="register.aspx">註冊</a>
            </div>
        </div>
        <div id="loginArea">
            <div id="loginLeft" class="auto-style1">
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>
                    <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size:xx-large; padding-left:250px">歡迎您回來！</label>
                </div>
            </div>
            <div id="loginRight">
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>
                <br />
                <br />
                &nbsp;</div>
            <div class="auto-style3">
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium">*帳號 :<br />
                </label>&nbsp;<br />
                <asp:TextBox id="txtEmail" type="text" CssClass="blueBtmLine" placeholder="Enter your email" runat="server" Width="276px" BackColor="#F0F0F0"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="emailValidator" CssClass="blueBtmLine" runat="server" ErrorMessage="請輸入信箱" ForeColor="#CC0000" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                <br />
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium">*密碼 :<br />
                </label>&nbsp;<br />
                <asp:TextBox id="txtPassword" placeholder="Enter your password" class="blueBtmLine auto-style4" runat="server" BackColor="#F0F0F0" TextMode="Password"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="passwordValidator" CssClass="blueBtmLine" runat="server" ErrorMessage="請輸入密碼" ControlToValidate="txtPassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <asp:Button id="btnLogin" CssClass="blueBtmLine" class="auto-style5" runat="server" Text="登入" CausesValidation="true" OnClick="btnLogin_Click" Height="32px" Width="283px"></asp:Button>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button id="btnRegister" class="loginBtn" runat="server" Text="註冊" CausesValidation="false" BackColor="#F7F7F7" OnClick="btnRegister_Click"></asp:Button><b>｜</b><asp:Button id="btnForgetPassword" class="loginBtn" runat="server" Text="忘記密碼" CausesValidation="false" BackColor="#F7F7F7"></asp:Button>
                </div>
            </div>
       </div>
    </form>
</body>
</html>


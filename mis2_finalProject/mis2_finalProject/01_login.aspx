<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01_login.aspx.cs" Inherits="mis2_finalProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="reset.css" rel="stylesheet" />
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
    <form id="form1" runat="server">
        <div>
            <div id="menu">
                <asp:Menu ID="Menu1" runat="server" Font-Names="Microsoft JhengHei UI" ForeColor="#336699" Orientation="Horizontal" StaticSubMenuIndent="16px">
                <Items>
                <asp:MenuItem Text="首頁" Value="首頁"></asp:MenuItem>
                <asp:MenuItem Text="探索學校" Value="探索學校"></asp:MenuItem>
                <asp:MenuItem Text="關於我們" Value="關於我們"></asp:MenuItem>
                <asp:MenuItem Text="登入/註冊" Value="登入/註冊"></asp:MenuItem>
                </Items>
                <StaticMenuItemStyle HorizontalPadding="10px" />
                </asp:Menu>
            </div>
        </div>
        <p class="platformName">IM STUDENT</p>
        <div id="loginLeft" class="auto-style1">
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>
                <center>
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size:xx-large; padding-left:100px">歡迎您回來！</label>
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
                </label>&nbsp;<input id="labEmail" type="text" value="Enter your email" class="auto-style1" /><br />
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium">*密碼 :<br />
                </label>&nbsp;<input id="labPassword" type="text" value="Enter your password" class="auto-style4" /><br />
                <button id="btnLogin" class="auto-style5">登入</button>
                <br />
                <asp:Label id="labRegister" class="loginLabel" runat="server">註冊</asp:Label><b>｜</b><asp:Label id="labForgetPassword" class="loginLabel" runat="server">忘記密碼</asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

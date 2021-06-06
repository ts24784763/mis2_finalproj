<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkHW.aspx.cs" Inherits="Teacher_checkHW" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 作業區</title>
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/ChenStyle.css" rel="stylesheet" />
    <link href="../Css/KenStyle.css" rel="stylesheet" />
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText" style="padding-right:40px">
            <a href="../Teacher/schoolInfo.aspx">管理我的課程</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
        </div>
        <center>
            <br /><br />
                <asp:Label ID="lblHWArea" ForeColor="DarkBlue" runat="server" Text="作業區" Font-Size="XX-Large"></asp:Label>
            <div class="HWblock">
                <div class="wrap">
                <br />
                <asp:Label ID="lblStudentName" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-top: 40px; padding-right: 20px; " runat="server" Text="*查詢學生名稱：" ></asp:Label>
                <asp:TextBox ID="txtStudentName" CssClass="Cohwtxt" placeholder=" 輸入學生名稱" runat="server" Width="250px" Height="45px" ></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:Button ID="btnSearch" runat="server" Width="150px" Height="40px" Text="搜尋" />
                </div>
            </div>
            <br /><br />
            <asp:Label ID="lblUploaded" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; elevation:0; font-size: medium; padding-right: 300px" runat="server" Text="作業繳交狀況：" ></asp:Label>
            <br /><br />
            <asp:GridView ID="GV"  CssClass="mGrid"  runat="server" >
            </asp:GridView>
        </center>
        <br />
    </form>
</body>
</html>

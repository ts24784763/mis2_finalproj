﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addCourse.aspx.cs" Inherits="Course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 新增課程</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/ChenStyle.css" rel="stylesheet" />
    <link href="../Css/KenStyle.css" rel="stylesheet" />
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText">
            <a href="../Teacher/schoolInfo.aspx">管理我的課程</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
        </div>
        <br /><br /><br />
        <center>
            <asp:Label ID="lbCourse" ForeColor="DarkBlue" runat="server" Text="在 新增課程" Font-Size="XX-Large"></asp:Label>
            <br /><br />
        <div class="HWContent">
            <asp:Label ID="lblCourseName" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*課程名稱："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtCourseName" CssClass="Cohwtxt" placeholder=" 輸入課程名稱"  runat="server" Width="400px" Height="45px" ></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCourseName" ErrorMessage="請輸入課程名稱" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblCredit" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 335px" runat="server" Text="*學分數："></asp:Label>
            <asp:RadioButtonList ID="RadioCredit" CssClass="rdBtnCredit" RepeatDirection="Horizontal" runat="server" >
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioCredit" ErrorMessage="請選擇學分數" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblCourseInfo" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*課程資訊："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtCourseInfo" CssClass="Cohwtxt" placeholder=" 輸入課程資訊"  runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCourseInfo" ErrorMessage="請輸入課程資訊" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Width="400px" Height="50px" Text="確認送出" OnClick="btnSubmit_Click" />
            <br />
        </div>
        </center>
    </form>
</body>
</html>

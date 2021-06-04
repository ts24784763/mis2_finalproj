﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="buildSchool.aspx.cs" Inherits="Principal_buildSchool" %>

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
        <div class="bar">
            IM STUDENT
            <div class="rightText">
            <a href="#">建立學校</a>
            <a href="#">個人資料設定</a>
            <a href="#">登出</a>
            </div>
        </div>
        <div class="wrapperBuilding">
            <asp:Label ID="starting" CssClass="labelItems" runat="server" Text="開始建立屬於您的學校" ></asp:Label>
            <div class="wrapper">
                <asp:Label ID="schoolName" runat="server" Text="學校名稱*"></asp:Label><br />
                <asp:TextBox id="enterName" CssClass="textWraper" type="text" placeholder="Enter the name of the school" runat="server" Width="100%" BackColor="#F0F0F0"></asp:TextBox><br />
                <asp:Label ID="dateNum" runat="server" Text="一個學期的長度*"></asp:Label><br />
                <asp:TextBox id="enterDate"  CssClass="textWraper" type="text" placeholder="Enter the date of the school" runat="server" Width="100%" BackColor="#F0F0F0"></asp:TextBox><br />
                <asp:Label ID="introduct" runat="server" Text="簡介*"></asp:Label><br />
                <asp:TextBox id="enterIntro"  CssClass="textWraper" type="text" placeholder="Enter the introduction of your school" runat="server" Width="100%" BackColor="#F0F0F0"></asp:TextBox>
                <br /><asp:Button ID="checkBtn" CssClass="checkBtn" runat="server" Text="創建完畢，進入整修" />
            </div>
        </div>
    </form>
</body>
</html>
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SchoolInviteMe.aspx.cs" Inherits="Teacher_SchoolInviteMe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="../Css/reset.css" rel="stylesheet" />
<link href="../Css/pageStyle.css" rel="stylesheet" />
<link href="../Css/ChenStyle.css" rel="stylesheet" />
<body>
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText">
            <a href="../Student/searchSchool.aspx">探索學校</a>
            <a href="../Student/uploadMaterial.aspx">上傳履歷</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
        </div>
        <br /><br /><br /><br />
            <div class="wrapperTeacher">
            <asp:Label ID="starting" CssClass="labelItems" runat="server" Text="學校邀請通知" ></asp:Label>
            <div class="wrapper">
            <asp:DataList ID="InvitedList" runat="server" CellPadding="4"  ForeColor="#333333" RepeatColumns="1" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center">
            <AlternatingItemStyle BackColor="#F0F0F" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="white" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="white" />
            <ItemStyle BackColor="#EFF3FB" CssClass="resultTd"/>
                <ItemTemplate>
                   <div class="teacherTitle">
                       <asp:Label ID="teacherTitle" runat="server" Text="學校1"></asp:Label>  <asp:Label ID="lblStatus" runat="server" Text="邀請中/已加入"></asp:Label>
                       <asp:Button ID="btnJoin" runat="server" CssClass="Applybtn" Text="加入" />
                   </div>
                    <div class="teacherName">
                        <asp:TextBox ID="teacher" CssClass="teacherName" runat="server"  BackColor="#F0F0F0"></asp:TextBox>
                    </div>
                </ItemTemplate>
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>  
            </div>
        </div>
    </form>
</body>
</html>

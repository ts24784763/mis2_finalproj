<%@ Page Language="C#" AutoEventWireup="true" CodeFile="buildSchool.aspx.cs" Inherits="Principal_buildSchool" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 建立學校</title>
</head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/KenStyle.css" rel="stylesheet" />
<body>
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText">
                <a href="../Principal/buildSchool.aspx">建立學校</a>
                <a href="../UserPublic/setting.aspx">個人資料設定</a>
                <a href="../UserPublic/login.aspx">登出</a>
            </div>
        </div>
        <div class="wrapperBuilding" style="width:80%;margin:0 auto;">
            <asp:Label ID="starting" CssClass="labelItems" runat="server" Text="開始建立屬於您的學校" style="padding-top:50px"></asp:Label>
            <div class="wrapper">
                <asp:Label ID="schoolName" runat="server" style="color:midnightblue;" Text="學校名稱*"></asp:Label><br />
                <asp:TextBox id="txtSchoolName" CssClass="textWraper" type="text" placeholder="Enter the name of the school" runat="server" Width="100%" BackColor="#F0F0F0"></asp:TextBox><br />
                <asp:Label ID="dateNum" runat="server" style="color:midnightblue;" Text="一個學期的長度*"></asp:Label><br />
                <div style="padding-bottom:20px">
                    <asp:TextBox id="txtSchoolDay"  CssClass="textWraper" type="text" placeholder="Enter the semester days of the school" runat="server" Width="95%" BackColor="#F0F0F0"></asp:TextBox>
                <asp:Label ID="labDay" Width="5%" style="float:right" runat="server" Text="　天"></asp:Label><br />
                </div>
                <asp:Label ID="introduct" style="color:midnightblue;" runat="server" Text="簡介*"></asp:Label><br />
                <asp:TextBox id="txtIntro"  CssClass="textWraper" type="text" placeholder="Enter the introduction of your school" runat="server" Width="100%" BackColor="#F0F0F0"></asp:TextBox>
                <br />
                <br /><asp:Button ID="checkBtn" CssClass="checkBtn" runat="server" Text="創建完畢，進入整修" OnClick="checkBtn_Click" />
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Course.aspx.cs" Inherits="Course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
            <a href="#">首頁</a>
            <a href="#">探索學校</a>
            <a href="#">關於我們</a>
            <a href="#">登入/註冊</a>
            </div>
        </div>
        <br /><br /><br />
        <center>
            <asp:Label ID="lblCourse" runat="server" Text="新增課程" Font-Size="XX-Large"></asp:Label>
            <br /><br /><br /><br />
        <div class="HWContent">
            <asp:Label ID="lblCourseName" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*課程名稱："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtCourseName" CssClass="Cohwtxt" placeholder=" 輸入課程名稱"  runat="server" Width="400px" Height="45px" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblInvited" runat="server" Text="已受邀至XX學校開課"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblCredit" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 335px" runat="server" Text="*學分數："></asp:Label>
            <%--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--%>
            <br />
            <br />
            <asp:DropDownList ID="ddlCredit" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 335px;" Width="" runat="server"></asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblCourseInfo" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*課程資訊："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtCourseInfo" CssClass="Cohwtxt" placeholder=" 輸入課程資訊"  runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
            <br /><br /><br /><br />
            <asp:Button ID="btnSubmit" runat="server" CssClass="button" Width="400px" Height="50px"  Text="確認送出"
                style="background-color: midnightblue; color: white;" />
            <br /><br /><br /><br />
        </div>
        </center>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="04_SearchCourse.aspx.cs" Inherits="mis2_finalProject.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="reset.css" rel="stylesheet" />
    <link href="pageStyle.css" rel="stylesheet" />
    <link href="ChenStyle.css" rel="stylesheet" />
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <form id="form2" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText">
            <a href="#">首頁</a>
            <a href="#">探索學校</a>
            <a href="#">關於我們</a>
            <a href="#">登入/註冊</a>
            </div>
        </div>
        <div class="bluebar" aria-orientation="vertical">
            <div class="textWrap">挑選您有興趣的課程</div>
            <div>
                <asp:DropDownList ID="ddlType" runat="server" CssClass="select" ForeColor="White"></asp:DropDownList>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:DropDownList ID="ddlUpdateTime" CssClass="select" ForeColor="White" runat="server"></asp:DropDownList>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:DropDownList ID="ddlCondition" CssClass="select" ForeColor="White" runat="server"></asp:DropDownList>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:Button ID="btnSearch" runat="server" CssClass="button"  Text="搜尋"  />
            </div>
            
        </div>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>

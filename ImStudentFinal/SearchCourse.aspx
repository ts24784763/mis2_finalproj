<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchCourse.aspx.cs" Inherits="SearchCourse"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/ChenStyle.css" rel="stylesheet" />
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
        <div class="bluebar">
            <br /><br /><br />
            <div class="textWrap">挑選您有興趣的學校課程</div>
            <br /><br />
            <div class="wrap">
                <asp:TextBox ID="txtSearch" placeholder="輸入你想查詢的學校" CssClass="box" runat="server"></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:Button ID="btnSearch" runat="server" CssClass="button"  Text="搜尋" OnClick="btnSearch_Click"  />
            </div>
        </div>
        <center>
        <asp:DataList ID="DataListSchoolInfo" runat="server" CellPadding="3" ForeColor="#333333" EnableViewState="False" RepeatDirection="Horizontal">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
            <ItemStyle BackColor="#EFF3FB" />
            <ItemTemplate>
                <center>
                    <asp:Image ID="lblCoursePhoto" runat="server" ></asp:Image>
                    <br />
                    <asp:Label ID="lblCourseName" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                    <br />
                    <asp:Label ID="lblCourseInfo" runat="server" Text='<%# Eval("SchoolIntroduction") %>'></asp:Label>
                    <br />
                    <asp:Label ID="lblCoursePeroid" runat="server" Text='<%# Eval("License") %>'></asp:Label>
                    <br />
                    <asp:Button ID="btnCheck" runat="server" Text="查看"></asp:Button>
                </center>
            </ItemTemplate>
        </asp:DataList>
        </center>
    </form>
</body>
</html>
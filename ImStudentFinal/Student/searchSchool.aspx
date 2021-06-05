<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchSchool.aspx.cs" Inherits="SearchCourse"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
        ::placeholder {
          color: white;
          opacity: 1;
        }
    </style>
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
            <a href="../Student/searchSchool.aspx">探索學校</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
        </div>
        </div>
        <div class="bluebar">
            <br /><br /><br />
            <div class="textWrap">挑選您有興趣的學校課程</div>
            <br /><br />
            <div class="wrap">
                <asp:TextBox ID="txtSearch" placeholder=" 輸入你想查詢的學校" CssClass="box" runat="server"></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:Button ID="btnSearch" runat="server" CssClass="button" Text="搜尋" OnClick="btnSearch_Click"  />
            </div>
        </div>
        <center>
            <asp:Button ID="btnApplyOutCome" runat="server" CssClass="Applybtn" Text="查看申請學校結果" />
        </center>
        <div class="courseInfo">
        <center>
        <asp:DataList ID="DataListSchoolInfo" runat="server" EnableViewState="False" RepeatDirection="Horizontal" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1">
            <FooterStyle BackColor="#507CD1" ForeColor="Black" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="true" ForeColor="#E7E7FF" />
            <ItemStyle BackColor="white" CssClass="courseTd" ForeColor="Black"/>
            <ItemTemplate>
                <center>
                    <asp:Image ID="lblCoursePhoto" runat="server" ImageUrl="../image/YZULogo.png"></asp:Image>
                    <br />
                    <asp:Label ID="lblCourseName" Font-Size="X-Large" ForeColor="DarkBlue" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblCourseInfo" Font-Size="Larger" ForeColor="#93a7ce" runat="server" Text='<%# Eval("SchoolIntro") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblCoursePeroid" Font-Size="Larger" ForeColor="#93a7ce" runat="server" Text='<%# Eval("License") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnCheck" style="background-color: midnightblue; color: white;" runat="server" Text="查看"></asp:Button>
                </center>
            </ItemTemplate>
            <SelectedItemStyle BackColor="white" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        </center>
        </div>
    </form>
</body>
</html>
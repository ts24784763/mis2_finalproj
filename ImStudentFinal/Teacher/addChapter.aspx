<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addChapter.aspx.cs" Inherits="Student_addChapter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 新增章節</title>
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
        <center>
            <br /><br />
            <asp:Label ID="lblCourse" ForeColor="DarkBlue" runat="server" Text="新增章節" Font-Size="XX-Large"></asp:Label>
            <br /><br /><br />
            <asp:Label ID="lblChapterName" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*章節名稱：" ></asp:Label>
            <br /><br />
            <asp:TextBox ID="txtChapterName" CssClass="Cohwtxt" placeholder=" 輸入章節名稱" runat="server" Width="400px" Height="45px" ></asp:TextBox>
            <br /><br />
            <asp:Label ID="lblannex" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*影片網址："></asp:Label>
            <br /><br />         
            <asp:TextBox ID="txtVideoUrl" CssClass="Cohwtxt" placeholder=" 輸入影片網址" runat="server" Width="400px" Height="45px" ></asp:TextBox>
            <br /><br />
            <br />
            <asp:Button ID="btnUpload" runat="server"  Width="100px" Height="30px"  Text="上傳影片" OnClick="btnUpload_Click"/>
            <br /><br /><br /><br />
            <asp:Label ID="lblUploaded" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; elevation:0; font-size: medium; padding-right: 300px" runat="server" Text="已上傳影片：" ></asp:Label>
            <br /><br />
            <asp:GridView ID="ChapterGridView"  CssClass="mGrid"  runat="server" >
                <HeaderStyle BackColor="royalblue" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </center>
        <br />
    </form>
</body>
</html>

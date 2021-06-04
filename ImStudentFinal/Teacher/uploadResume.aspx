<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploadResume.aspx.cs" Inherits="Teacher_uploadResume" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>申請學校</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/ChenStyle.css" rel="stylesheet" />
    <link href="../Css/KenStyle.css" rel="stylesheet" />
    </head>
<body>
    <form id="form1" runat="server">
        <div class="bar">
        IM STUDENT
            <div class="rightText">
                <a href="index.aspx">首頁</a>
                <a href="#">探索學校</a>
                <a href="#">關於我們</a>
                <a href="Login.aspx">登入/註冊</a>
            </div>
        </div>
        <br />
        <center>
            <br />
            <asp:Label ID="lbluploadResume" runat="server" Text="上傳自我介紹及履歷" Font-Size="XX-Large" ForeColor="DarkBlue"></asp:Label>
            <br /><br /><br />
            <asp:Label ID="lblHello" style="color:midnightblue;" Font-Size="X-Large" runat="server" Text="您好~XXX老師"></asp:Label>
        
        <div style="position: relative; line-height: 30px">
            <br />
            <br />
            <asp:Label ID="lblIntro" style="color:midnightblue; padding-right:300px;" runat="server" Text="自我介紹："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtIntro" CssClass="Cohwtxt" placeholder=" 輸入自我介紹" runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblResume" style="color:midnightblue;" runat="server" Text="上傳履歷："></asp:Label>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:FileUpload ID="uploadResume" runat="server" />
            <br />
            <br />
        </div>
        <br />
        
            <asp:Button ID="btnSubmit" CssClass="button" Width="300px" Height="50px" runat="server" style="background-color: midnightblue; color: white;" Text="送出" />
            <br /><br /><br /><br />
        </center>
    </form>
</body>
</html>
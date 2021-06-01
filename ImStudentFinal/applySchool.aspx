<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applySchool.aspx.cs" Inherits="applySchool" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>申請學校</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
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
    <div>
    </div>
        <br />
        <center>
            <br />
        <asp:Label ID="applyTitle" runat="server" Text="申請學校" Font-Size="XX-Large" ForeColor="DarkBlue"></asp:Label>
        </center>
        <br />
        <br />
        <div style="position: relative; padding-left:35%; line-height: 30px">
        <asp:Label class="schoolName" runat="server" Text="申請學校："></asp:Label>
            <asp:Label class="schoolName" runat="server" Text="ＸＸ大學" Font-Size="large"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="上傳履歷："></asp:Label>
            <asp:TextBox ID="resumePath" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="uploadBtn" runat="server" CssClass="mt-0" Height="36px" Text="上傳" Font-Size="Small" Width="105px" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="自我介紹："></asp:Label>
        </div>
            <center>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="introTextbox" ErrorMessage="請輸入自我介紹！" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="introTextbox" runat="server" Height="155px" TextMode="MultiLine" Width="394px"></asp:TextBox>
                <br />
            </center>
            <br />
            <br />
            <center>
                <asp:Button ID="cancleBtn" CssClass="applySchoolBtn" runat="server" CausesValidation="false" Text="取 消" BackColor="#99CCFF" Height="44px" Width="170px" OnClick="cancleBtn_Click" />
                　　　　
                <asp:Button ID="confirmSubmitBtn" CssClass="applySchoolBtn" runat="server" Text="確 認 送 出 &gt;" BackColor="#99CCFF" Height="44px" Width="170px" />
            </center>
    </form>
</body>
</html>

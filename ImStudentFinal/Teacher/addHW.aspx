<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addHW.aspx.cs" Inherits="HomeWork" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 新增作業</title>
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
            <br /><br /><br />
            <asp:Label ID="lblHomeWork" ForeColor="DarkBlue" runat="server" Text="新增作業" Font-Size="XX-Large"></asp:Label>
            <br /><br /><br /><br />
        <div class="HWContent">
            <asp:Label ID="lblHWName" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*作業名稱："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtHWName" CssClass="Cohwtxt" placeholder=" 輸入作業名稱" runat="server" Width="400px" Height="45px" ></asp:TextBox>
            <br />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHWName" ErrorMessage="請輸入作業名稱" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblHWContent" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*作業內容："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtHWDetail" CssClass="Cohwtxt" placeholder=" 輸入作業內容"  runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHWDetail" ErrorMessage="請輸入作業內容" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblDeadLine" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 290px" runat="server" Text="*設定繳交期限："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtHWDeadlineDays" placeholder=" 從學期開始算幾天內須繳交 例：21" CssClass="Cohwtxt" runat="server" Width="350px" Height="45px" TextMode="Number" ></asp:TextBox>
            &nbsp&nbsp&nbsp&nbsp
            <asp:Label ID="lblDay" style="font-size: x-large;" runat="server" Text="天"></asp:Label><br />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtHWDeadlineDays" ErrorMessage="請輸入繳交期限" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br /><br />
            <asp:Button ID="btnAddHW" runat="server" Width="300px" Height="50px" Text="新增作業" OnClick="btnAddHW_Click"  />
            <br />
            <br />
        </div>
            <br /><br /><br /><br /><br /><br />
        </center>
    </form>
</body>
</html>

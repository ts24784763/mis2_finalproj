<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomeWork.aspx.cs" Inherits="HomeWork" %>

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
        <center>
            <asp:Label ID="lblHomeWork" runat="server" Text="新增作業" Font-Size="XX-Large"></asp:Label>
            <br /><br /><br /><br /><br /><br />
        <div class="HWContent">
            <asp:Label ID="lblHWName" runat="server" Text="*作業名稱："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtHWName" placeholder="輸入作業名稱"  runat="server" Width="400px" Height="45px"  BackColor="#F7F7F7" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblHWContent" runat="server" Text="*作業內容："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtHWContent" placeholder="輸入作業內容"  runat="server" Height="100px" Width="400px" BackColor="#F7F7F7" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblDeadLine" runat="server" Text="*繳交期限："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtDate" placeholder="選擇日期"  runat="server" Width="400px" Height="45px" BackColor="#F7F7F7"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Calendar ID="CalDate" runat="server" OnSelectionChanged="CalDate_SelectionChanged" Height="291px" Width="443px">
                <DayHeaderStyle BorderStyle="Dotted" />
                <DayStyle BorderStyle="Dashed" />
            </asp:Calendar>
            <br /><br />
            <asp:Button ID="btnSearch" runat="server" CssClass="button" Width="400px" Height="50px"  Text="搜尋"
                style="background-color: midnightblue; color: white;"  />
        </div>
        </center>
    </form>
</body>
</html>

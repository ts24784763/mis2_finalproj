<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomeWork.aspx.cs" Inherits="HomeWork" MaintainScrollPositionOnPostback="true" %>

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
        <center>
            <br /><br /><br />
            <asp:Label ID="lblHomeWork" runat="server" Text="新增作業" Font-Size="XX-Large"></asp:Label>
            <br /><br /><br /><br />
        <div class="HWContent">
            <asp:Label ID="lblHWName" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*作業名稱："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtHWName" CssClass="Cohwtxt" placeholder=" 輸入作業名稱"  runat="server" Width="400px" Height="45px" ></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHWName" ErrorMessage="請輸入作業名稱" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblHWContent" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*作業內容："></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtHWDetail" CssClass="Cohwtxt" placeholder=" 輸入作業內容"  runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHWDetail" ErrorMessage="請輸入作業內容" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblDeadLine" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*繳交期限："></asp:Label>
            <br />
            <%--<br />
            <asp:TextBox ID="txtDeadline" placeholder="選擇日期"  runat="server" Width="400px" Height="45px" BackColor="#F7F7F7"></asp:TextBox>
            <br />--%>
            <br />
            <asp:Calendar ID="CalDate" runat="server" Width="400px" Height="200px" Font-Names="Tahoma" Font-Size="11px" NextMonthText="." PrevMonthText="." SelectMonthText="»" SelectWeekText="›" CssClass="myCalendar" OnSelectionChanged="CalDate_SelectionChanged"  CellPadding="0">
                <OtherMonthDayStyle ForeColor="#b0b0b0" />
                <DayStyle CssClass="myCalendarDay" ForeColor="#2d3338" />
                <DayHeaderStyle CssClass="myCalendarDayHeader" ForeColor="#2d3338" />
                <SelectedDayStyle Font-Bold="True" Font-Size="12px" CssClass="myCalendarSelector" />
                <TodayDayStyle CssClass="myCalendarToday" />
                <SelectorStyle CssClass="myCalendarSelector" />
                <NextPrevStyle CssClass="myCalendarNextPrev" />
                <TitleStyle CssClass="myCalendarTitle" />
            </asp:Calendar>

            <br /><br />
            <asp:Button ID="btnAddHW" runat="server" CssClass="button" Width="300px" Height="50px"  Text="新增作業"
                style="background-color: midnightblue; color: white;" OnClick="btnAddHW_Click"  />
            <br />
            <br />
        </div>
            <br /><br /><br /><br /><br /><br />
        </center>
    </form>
</body>
</html>

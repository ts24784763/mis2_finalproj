<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkHW.aspx.cs" Inherits="Teacher_checkHW" enableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 作業區</title>
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/ChenStyle.css" rel="stylesheet" />
    <link href="../Css/KenStyle.css" rel="stylesheet" />
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText" style="padding-right:40px">
            <a href="../Teacher/schoolInfo.aspx">管理我的課程</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
        </div>
        <center>
            <br /><br />
                <asp:Label ID="lblHWArea" ForeColor="DarkBlue" runat="server" Text="作業區" Font-Size="XX-Large"></asp:Label>
            <div class="HWblock">
                <div class="wrap">
                <br />
                <asp:Label ID="lblStudentName" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-top: 40px; padding-right: 20px; " runat="server" Text="查詢學生名稱：" ></asp:Label>
                <asp:TextBox ID="txtStudentName" CssClass="Cohwtxt" placeholder=" 輸入學生名稱" runat="server" Width="250px" Height="45px" ></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:Label ID="lblCourseName" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-top: 40px; padding-right: 20px; " runat="server" Text="查詢課程名稱：" ></asp:Label>
                <asp:TextBox ID="txtCourseName" CssClass="Cohwtxt" placeholder=" 輸入課程名稱" runat="server" Width="250px" Height="45px" ></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:Button ID="btnSearch" runat="server" Width="150px" Height="40px" Text="搜尋" OnClick="btnSearch_Click" />
                </div>
            </div>
            <br /><br />
            <asp:Label ID="lblUploaded" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; elevation:0; font-size: medium; padding-right: 300px" runat="server" Text="作業繳交狀況：" ></asp:Label>
            <br /><br />
        </center>
        <br />
            <center>
            <asp:DataList ID="StudentHWDataList" runat="server" CellPadding="4"  RepeatColumns="1" ForeColor="#333333" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" >
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EFF3FB" CssClass="studentTd"/>
                <ItemTemplate>
                    學生姓名：<asp:Label ID="lbStudentName" Font-Size="Larger" ForeColor="#93a7ce" Font-Bold="true" Text='<%# Eval("Name") %>' runat="server" />
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:Button ID="btnAllow" CssClass="AllowBtn" runat="server" Text='通過' Width="120px" Onclick="btnAllow_Click"/>
                    <br />
                    課程名稱：<asp:Label ID="lbSelfIntro" Font-Size="Larger" ForeColor="#93a7ce" Font-Bold="true" CssClass="introLab" Text='<%# Eval("CourseName") %>' runat="server" />
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:Button ID="btnDownloadHW" CssClass="DownloadResumeBtn" runat="server" Text='檢視作業' Width="200px" Onclick="btnDownloadHW_Click"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <br />
                    作業名稱：<asp:Label ID="Label1" Font-Size="Larger" ForeColor="DimGray" Font-Bold="true" CssClass="introLab" Text='<%# Eval("HWFileName") %>' runat="server" />
                    <asp:Button ID="btnDeny" CssClass="DenyBtn" runat="server" Text='不通過' Width="120px" Onclick="btnDeny_Click"/>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
            </center>
    </form>
</body>
</html>

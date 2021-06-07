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
                <asp:Button ID="btnSearch" runat="server" Width="150px" Height="40px" Text="搜尋" OnClick="btnSearch_Click" />
                </div>
            </div>
            <br /><br />
            <div style="margin:auto">
                <asp:Label ID="lblUploaded" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; elevation:0; font-size: large" runat="server" Text="作業繳交狀況" ></asp:Label>
            <br /><br />
            </div>
        </center>
        <br />
            <center>
                <div style="width:50%">
                    <asp:DataList ID="StudentHWDataList" runat="server" CellPadding="4"  RepeatColumns="1" style="width:100%" ForeColor="#333333" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" OnItemDataBound="StudentHWDataList_ItemDataBound" >
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#EFF3FB" CssClass="studentTd"/>
                    <ItemTemplate>
                    <div style="width:100%">
                        <div style="float:left; width:50%">
                            課程名稱：<asp:Label ID="lblCourseName" Font-Size="Larger" ForeColor="#93a7ce" Font-Bold="true" CssClass="introLab" Text='<%# Eval("CourseName") %>' runat="server" />
                            <br />
                            學生姓名：<asp:Label ID="lblStudentName" Font-Size="Larger" ForeColor="#93a7ce" Font-Bold="true" Text='<%# Eval("Name") %>' runat="server" />
                            <br />
                            作業名稱：<asp:Label ID="lblHWName" Font-Size="Larger" ForeColor="DimGray" Font-Bold="true" CssClass="introLab" Text='<%# Eval("HWFileName") %>' runat="server" />
                            <br />
                            繳交狀態：<asp:Label ID="lblPassOrNot" Font-Size="Larger" ForeColor="Red" Font-Bold="true" CssClass="introLab" Text='<%# Eval("PassOrNot") %>' runat="server" />
                        </div>
                        <div style="float:right; width:50%">
                            <div style="float:left; width:60%; padding-top:30px; margin:auto">
                                <asp:Button ID="btnDownloadHW" CssClass="DownloadResumeBtn" runat="server" Text='檢視作業' Height="50px" Width="120px" Onclick="btnDownloadHW_Click" CommandArgument ='<%# Eval("HWFilePath") %>'/>
                            </div>
                            <div style="float:right; width:40%; padding-top:5%; line-height:3">
                                <asp:Button ID="btnAllow" CssClass="AllowBtn" runat="server" Text='通過' Width="120px" Onclick="btnAllow_Click" CommandArgument ='<%# Eval("Student") %>'/><br />
                                <asp:Button ID="btnDeny" CssClass="DenyBtn" runat="server" Text='不通過' Width="120px" Onclick="btnDeny_Click" CommandArgument ='<%# Eval("Student") %>'/>
                            </div>
                        </div>
                        
                        
                    
                    
                    
                </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
                </div>
            </center>
    </form>
</body>
</html>

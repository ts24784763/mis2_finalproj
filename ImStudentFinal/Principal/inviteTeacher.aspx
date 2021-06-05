<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inviteTeacher.aspx.cs" Inherits="Principal_inviteTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 邀請老師</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="../Css/reset.css" rel="stylesheet" />
<link href="../Css/pageStyle.css" rel="stylesheet" />
<body>
    <form id="form1" runat="server">
    <div class="bar">
            IM STUDENT
        <div class="rightText">
            <a href="../Principal/fixSchool.aspx">整修學校</a>
            <a href="../Principal/inviteTeacher.aspx">邀請老師</a>
            <a href="../Principal/manageStudent.aspx">管理學生</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
        </div>
    </div>
        <div class="wrapperTeacher" style="padding-top:30px">
            <asp:Label ID="starting" CssClass="labelItems" runat="server" Text="老師管理列表"></asp:Label>
            <div class="wrapper">
            <asp:DataList ID="invitedTeacherDataList" runat="server" CellPadding="4"  ForeColor="#333333" RepeatColumns="1" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" OnItemDataBound="invitedTeacherDataList_ItemDataBound">
            <AlternatingItemStyle BackColor="#F0F0F" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="white" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="white" />
            <ItemStyle BackColor="#EFF3FB" CssClass="resultTd"/>
                <ItemTemplate>
                   <div class="teacherTitle">
                       <asp:Label ID="lbTeacherName" runat="server" Text='<%# Eval("Receiver") %>'></asp:Label>  
                       <asp:Label ID="lbApplyResult" runat="server"  Text='<%# Eval("ApplyResult") %>'></asp:Label>
                   </div>
                    <div class="teacherName">
                        <asp:TextBox ID="teacher" CssClass="teacherName" runat="server"  BackColor="#F0F0F0"></asp:TextBox>
                    </div>
                </ItemTemplate>
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>  
                <asp:Button ID="inviteTeacher" CssClass="inviteBtn" runat="server" Text="邀請老師" OnClick="inviteTeacher_Click" />
            </div>
        </div>
    </form>
</body>
</html>

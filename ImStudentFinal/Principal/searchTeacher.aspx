﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchTeacher.aspx.cs" Inherits="Principal_searchTeacher" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 老師總表</title>
</head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="../Css/reset.css" rel="stylesheet" />
<link href="../Css/pageStyle.css" rel="stylesheet" />
<link href="../Css/KenStyle.css" rel="stylesheet" />
<body>
    <form id="form1" runat="server">
    <div class="bar">
            IM STUDENT
        <div class="rightText">
            <a href="../Principal/fixSchool.aspx">整修學校</a>
            <a href="../Principal/inviteTeacher.aspx">邀請老師</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
        </div>
    </div>
    <div class="searchTeacher">
        <div class="searchTop">
            <asp:Label ID="searchTitle" CssClass="titleStyle" style="padding-top: 30px" runat="server" Text="老師總表"></asp:Label>
            <div style="display:flex; flex-direction:row; justify-content:center; width:100%;">
                   想邀請哪位老師：<asp:TextBox ID="searchTeacher" CssClass="searchTxt" runat="server"></asp:TextBox><asp:Button ID="searchBtn" CssClass="searchChecked" runat="server" Text="搜尋＞" Width="90px" OnClick="searchBtn_Click" />
            </div>
        </div>
        <div class="searchBottom" style="width:60%; margin: auto; padding-top:30px">
            <asp:DataList ID="teacherDatalist" style="width:100%" runat="server" CellPadding="4" ForeColor="#333333" RepeatColumns="2" RepeatDirection="Horizontal" HorizontalAlign="Center">
            <AlternatingItemStyle BackColor="#F0F0F0" />
            <FooterStyle BackColor="#F0F0F0" Font-Bold="True" ForeColor="white" />
            <HeaderStyle BackColor="#F0F0F0" Font-Bold="True" ForeColor="white" />
            <ItemStyle BackColor="#EFF3FB" CssClass="resultTd"/>
                <ItemTemplate>
                    <center>
                    <div style="margin:auto; line-height:2">
                    <asp:Image ID="teacherImage" Height="190px" Width="180px" runat="server" ImageUrl="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Crystal_personal.svg/1024px-Crystal_personal.svg.png"/>
                    <br />
                    <asp:Label ID="teacherName" CssClass="name" runat="server" Text='<%# Eval("ApplicantName") %>'></asp:Label>
                    <br />
                    <asp:Label ID="introduction" CssClass="intro" style="word-break:break-word" runat="server" Text='<%# Eval("ApplyIntro") %>'></asp:Label></div>
                    <div class="btn" style="padding-bottom:10%; position:relative; bottom:0">
                        <center>
                        <asp:Button ID="btnviewResume" OnClick="btnviewResume_Click" runat="server" CommandArgument ='<%# Eval("ResumeFilePath") %>' CssClass="viewStyle" Text="檢視履歷" />
                        <asp:Button ID="btnInvite" OnClick="btnInvite_Click" runat="server" CssClass="inviteStyle" Text="寄送邀請" CommandArgument='<%# Eval("Applicant") %>' />
                        </center>
                    </div>
                    </center>
                </ItemTemplate>
            <SelectedItemStyle BackColor="#F0F0F0" Font-Bold="True" ForeColor="#F0F0F0" />
            </asp:DataList>  
        </div>
    </div>
    </form>
</body>
</html>

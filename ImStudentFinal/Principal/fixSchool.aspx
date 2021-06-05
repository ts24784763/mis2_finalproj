<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fixSchool.aspx.cs" Inherits="Principal_fixSchool" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
        <div class="wrapperBuilding" style="width:80%;margin:0 auto;">
            <asp:Label ID="lbSchoolName" CssClass="labelItems" runat="server" Text="整修您的學校資料" ></asp:Label>
            <div class="wrapper">
                <br />
                <asp:Label ID="schoolDate" runat="server" Text="一個學期的長度"></asp:Label><br />
                <asp:TextBox id="txtDays" CssClass="textWraper" type="text" placeholder="Update the date of the school" runat="server" Width="100%" BackColor="#F0F0F0"></asp:TextBox><br />
                <asp:Label ID="addCertification" runat="server" Text="證書"></asp:Label><br />
                <asp:TextBox id="txtCertification" CssClass="textWraper" type="text" placeholder="Add the certification of the school" runat="server" Width="100%" BackColor="#F0F0F0"></asp:TextBox><br />
                <asp:Label ID="graduationCredit" runat="server" Text="畢業門檻學分"></asp:Label><br />
                <asp:TextBox id="txtCredit" CssClass="textWraper" type="text" placeholder="Update the credit of the school" runat="server" Width="100%" BackColor="#F0F0F0"></asp:TextBox><br />
                <asp:Label ID="dateNum" runat="server" Text="學費"></asp:Label><br />
                <asp:TextBox id="txtFee"  CssClass="textWraper" type="text" placeholder="Update the money of the school" runat="server" Width="100%" BackColor="#F0F0F0"></asp:TextBox><br />
                <asp:Label ID="introduct" runat="server" Text="簡介"></asp:Label><br />
                <asp:TextBox id="txtIntro"  CssClass="textWraper" type="text" placeholder="Update the introduction of your school" runat="server" Width="100%" BackColor="#F0F0F0"></asp:TextBox>
                <br />
                <div class="btnArea" style="margin-top:20px;">
                         <asp:Button ID="viewCourse" CssClass="checkBtn2" runat="server" Text="查看目前課程" OnClick="viewCourse_Click" />
                          <asp:Button ID="savingBtn" CssClass="checkBtn2" runat="server" Text="儲存" BackColor="Black" OnClick="savingBtn_Click"/>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

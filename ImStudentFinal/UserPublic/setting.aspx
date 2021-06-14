<%@ Page Language="C#" AutoEventWireup="true" CodeFile="setting.aspx.cs" Inherits="setting" enableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 個人資料設定</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText" id="studentBar" runat="server" visible="false">
            <a href="../Student/selectCourse.aspx">選課</a>
            <a href="../Student/mainSchool.aspx">我的學校</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
            <div class="rightText" id="teacherBar" runat="server" visible="false">
            <a href="../Teacher/schoolInfo.aspx">管理我的課程</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
            <div class="rightText" id="principalFixSchoolBar" runat="server" visible="false">
            <a href="../Principal/fixSchool.aspx">整修學校</a>
            <a href="../Principal/inviteTeacher.aspx">邀請老師</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
            <div class="rightText" id="studentNoSchoolBar" runat="server" visible="false">
            <a href="../Student/searchSchool.aspx">探索學校</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
            <div class="rightText" id="principalNoSchoolBar" runat="server" visible="false">
            <a href="../Principal/buildSchool.aspx">建立學校</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
            <div class="rightText" id="teacherNoSchoolBar" runat="server" visible="false">
            <a href="../Teacher/schoolInviteMe.aspx">探索學校</a>
            <a href="../Teacher/uploadResume.aspx">上傳履歷</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
            <div class="rightText" id="principalSellSchoolBar" runat="server" visible="false">
            <a href="../Principal/mainSchool.aspx">我的學校</a>
            <a href="../Principal/manageStudent.aspx">管理學生</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>

        </div>
        <div class="area">
           <div class="wrapper">
               <div class="photoItems">
                   <asp:Image ID="imgRole" runat="server" CssClass="imgCircle"/>
                   <asp:Label ID="lbName" CssClass="myName" runat="server" Text="試試看"></asp:Label>
                   <asp:Label ID="lbRole" CssClass="nameSub" runat="server" Text="身分：(學生/校長/老師)"></asp:Label>
                   <asp:Label ID="lbSchool" CssClass="school" runat="server" Text="• 會計學校"></asp:Label>
                   <asp:Label ID="lbMoney" CssClass="money" runat="server" Text="錢包餘額： $ 15"></asp:Label>
               </div>
               <div class="certificationList">
                   <asp:Label ID="Label1" runat="server" Text="已獲得的證書" style="color:#294f74; font-weight:bold"></asp:Label>
                   <asp:DataList ID="LicenseDataList" runat="server">
                       <ItemTemplate>
                           <div class="teacherTitle" style="margin:10px 0;">
                              <asp:Label ID="lbSchool" runat="server" Text='<%# Eval("School") %>'></asp:Label><br />
                              <asp:Label ID="lbCertification" runat="server" Text='<%# Eval("License") %>' style="color:#294f74;padding-right:10px"></asp:Label>
                               <asp:Button ID="btnDownloadCertification" CssClass="downloadCertificationBtn" runat="server" Text="下載證書" CommandArgument='<%# Eval("School") %>' OnClick="btnDownloadCertification_Click"/>
                           </div>
                        </ItemTemplate>
                   </asp:DataList>
               </div>
           </div>
           <div class="setting">
               <asp:Label ID="settings" CssClass="settingFonts" runat="server" Text="個人資料設定"></asp:Label><hr />
                       帳號<br />
            <asp:Label ID="lbEmail" CssClass="emailFonts" runat="server" Text="xxxx@mail.com"></asp:Label>
               <br /><br />姓名<br />
               <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br /><br />
               電話<br />
               <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox><br />
               <br />
               <asp:Button ID="update" CssClass="updateBtn" runat="server" Text="更新資訊" OnClick="update_Click" />
           </div>
      
        </div>
    </form>
</body>
</html>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="schoolInfo.aspx.cs" Inherits="Teacher_schoolInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 課程主頁</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="../Css/reset.css" rel="stylesheet" />
<link href="../Css/pageStyle.css" rel="stylesheet" />
<link href="../Css/ChenStyle.css" rel="stylesheet" />
<body>
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText">
            <a href="../Teacher/schoolInfo.aspx">管理我的課程</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
        </div>
            <div class="schoolBody">
                <div class="schoolTable">
                    <div class="schoolLeft">
                        <div class="items">
                            <div class="itemsProcess">
                                <asp:Label ID="lbSchoolName" runat="server" Text="學校名稱"></asp:Label>
                            </div>
                        </div>
                        <div class="items">
                            <div class="itemsFont">
                               🛈  總覽
                            </div>
                        </div>
                        <div class="accordion" id="accordionPanelsStayOpenExample" runat="server">


                        </div>
                        <div class="btn" style="margin-top: auto; ">
                            <asp:Button ID="addCourse" CssClass="btnCourse" runat="server" Text="新增課程" OnClick="addCourse_Click" />
                        </div>
                    </div>
                    <div class="schoolRight">
                        <div style="display:inline-block;padding-left:30px;padding-top:20px;">
                        <div class="teacherSubCourseArea">
                           <asp:Label ID="lbSchoolDays" CssClass="Items3" runat="server" Text="幾天"></asp:Label>
                        </div>
                        <asp:Image ID="schoolImage" CssClass="schoolImg" runat="server"  src="https://picsum.photos/300/150?random=1"/>
                        <div style="margin-top:20px; display:flex; flex-direction:column;">
                            <asp:Label ID="intro" CssClass="schoolIntroTitle" runat="server" Text="簡介"></asp:Label>
                            <asp:Label ID="lbSchoolIntro" CssClass="schoolIntro" runat="server" Text="好學校"></asp:Label>
                        </div>
                    </div>
                    <div style="padding:30px; margin-top: auto; display:flex; flex-direction:column; font-size:20px; font-weight:bold;color: rgb(51,121,173);">
                        <asp:Label ID="principle" runat="server" Text="校長"></asp:Label>
                        <asp:Label ID="lbPrincipalName" runat="server" Text="xxx" Font-Size="15"></asp:Label>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
<script>
    function test(check) {
        course = check.id.split(":");
        window.location.href = "../Teacher/manageChapter.aspx?courseId=" + course[0]+"&chapter="+course[1];
    }
    function course(check) {
        course = check.id.split(":");
        window.location.href = "../Teacher/manageCourse.aspx?courseId=" + course[0];  
    }
</script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

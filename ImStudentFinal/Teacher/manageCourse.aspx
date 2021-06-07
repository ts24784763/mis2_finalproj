<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageCourse.aspx.cs" Inherits="Student_manageCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 管理課程</title>
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
                                <asp:Label ID="lbSchoolName" runat="server" Text="會計學校"></asp:Label>
                            </div>
                        </div>
                        <div class="items">
                            <div class="itemsFont">
                               🛈  總覽
                            </div>
                        </div>
                        <div class="accordion" id="accordionPanelsStayOpenExample" runat="server">
                        </div>
                         <div class="btn" style="margin-top: auto; padding-bottom:10% ">
                            <asp:Button ID="btnAddChapter" CssClass="btnCourse" style="border-radius: 5px;" runat="server" Text="新增章節" OnClick="btnAddChapter_Click" />
                        </div>
                    </div>
                    <div class="schoolRight">
                        <div style="display:flex;flex-direction:row;"> 
                            <asp:Label ID="lbCourseName" CssClass="courseFonts" runat="server" Text="基礎會計"></asp:Label>
                            <asp:Button ID="editBtn" CssClass="editButton" style="border-radius: 5px;" runat="server" Text="編輯" Width="60px" OnClick="editBtn_Click" />
                        </div>                  
                        <br />
                        <div class="teacherArea">
                           <asp:Label ID="lbTeacherName" CssClass="Items" runat="server" Text="XXX"></asp:Label>
                           老師
                        </div>
                        <asp:Image ID="schoolImage" CssClass="courseImg" runat="server"  src="https://picsum.photos/300/150?random=1"/>
                        <div style="padding-left:30px; padding-top:30px; padding-right:30px"><asp:Label ID="lbCourseIntro" runat="server" Text="Label"></asp:Label></div>
                        <asp:Label ID="lbCourseCredit" CssClass="creditStyle" runat="server" Text="3學分"></asp:Label>
                        <div class="subHomeworkArea" style="display:block; line-height:1.5">
                            <asp:Button ID="addHomework" CssClass="homeworkButton" style="border-radius: 5px;" runat="server" Text="新增作業" OnClick="addHomework_Click" />
                            <div style="float: left">
                                <asp:Label ID="lbHWName" runat="server" Text="作業名稱："></asp:Label><br />
                                <asp:Label ID="lbHWDetail" runat="server" Text="作業內容："></asp:Label><br />
                                <asp:Label ID="lbHWDeadline" runat="server" Text="繳交期限："></asp:Label>
                            </div>
                            <div style="float: right;padding-top: 30px">
                                <asp:Button ID="checkHwBtn" runat="server" Text="檢查作業" OnClick="checkHwBtn_Click"/>
                            </div>
                        </div>
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

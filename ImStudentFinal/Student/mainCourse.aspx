<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mainCourse.aspx.cs" Inherits="mainCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Css/kendo.common-material.min.css">
    <link rel="stylesheet" href="../Css/kendo.material.min.css">
    <link rel="stylesheet" href="../Css/kendo.materialblack.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText">
            <a href="../Student/selectCourse.aspx">選課</a>
            <a href="../Student/mainSchool.aspx">我的學校</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
        </div>
            <div class="schoolBody">
                <div class="schoolTable">
                    <div class="schoolLeft">
                        <div class="items">
                            <div class="itemsProcess">
                                <asp:Label ID="lbSchoolName" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="items">
                            <div class="itemsFont">
                               🛈  總覽
                            </div>
                        </div>
                        <div class="accordion" id="accordionPanelsStayOpenExample" runat="server">
                         
                        </div>
                          
                    </div>
                    <div class="schoolRight">
                        <asp:Label ID="lbCourseName" CssClass="courseFonts" runat="server" Text="基礎會計"></asp:Label>
                        <br />
                        <div class="teacherArea">
                           <asp:Label ID="lbTeacherName" CssClass="Items" runat="server" Text="XXX"></asp:Label>
                           老師
                        </div>
                        <asp:Image ID="schoolImage" CssClass="courseImg" runat="server"  src="https://picsum.photos/300/150?random=1"/>
                        <div> <a href="#" class="courseLink">(課程簡介)</a></div>
                        <asp:Label ID="lbCourseCredit" CssClass="creditStyle" runat="server" Text="3學分"></asp:Label>
                        <div class="homeworkArea">
                            <button class="k-button k-primary btn-open-school" id="btn-open-window">查看作業</button>
                            <asp:FileUpload ID="uploadHW" runat="server" />
                            <asp:Button ID="uploadHomework" CssClass="homeworkButton" runat="server" Text="上傳作業" OnClick="uploadHomework_Click" />
                            <asp:Label ID="lbHWPass" CssClass="fontStyle" runat="server" Text="尚未通過"></asp:Label>
                        </div>

                        <div id="window" style="text-align: center;background-color: white;color: black; display: none" >
                            <div id="openSchoolForm">
                                <ul class="fieldlist">
                                    <li>
                                        <asp:Label ID="lbHW" Font-Size="X-Large" ForeColor="DarkBlue" runat="server" Text="作業名稱"/>
                                    </li>
                                    <li>
                                        <asp:Label ID="lbHWDetail" Font-Size="X-Large" ForeColor="DarkBlue" runat="server" Text="作業細節"/>
                                    </li>
                                    <li>
                                        <asp:Label ID="lbDeadline" Font-Size="X-Large" ForeColor="DarkBlue" runat="server" Text="截止日期"/>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
    </form>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="../Script/wangJs.js"></script>
<script type="text/javascript" src="../Script/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../Script/kendo.all.min.js"></script>
<script type="text/javascript" src="../Script/uikit.min.js"></script>
<script type="text/javascript" src="../Script/kenJs.js"></script>
<script>
    function test(check) {
        course = check.id.split(":");
        window.location.href = "../Student/mainChapter.aspx?courseId=" + course[0]+"&chapter="+course[1];
    }
    function courseChange(check) {
        course = check.id.split(":");
        window.location.href = "../Student/mainCourse.aspx?courseId=" + course[0];  
    }

</script>

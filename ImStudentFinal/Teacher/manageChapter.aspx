﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageChapter.aspx.cs" Inherits="Teacher_manageChapter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 管理課程章節</title>
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
                        <div style="display:inline-block;padding-left:30px;padding-top:20px;">
                        <asp:Label ID="lbCourseName" CssClass="subCourseFonts" runat="server" Text="基礎會計"></asp:Label>＞<asp:Label ID="lbChapterName" CssClass="subCourseFonts" runat="server" Text="第一章"></asp:Label></div>
                        <br />
                        <div class="subCourseArea" style="padding-bottom:20px">
                           <asp:Label ID="lbChapterName2" CssClass="Items" runat="server" Text="第一章"></asp:Label>
                        </div>
                        <iframe id="playVideo" style="padding-left:10%" runat="server" width="90%" height="300px" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen />
                        <div style="padding-top:30px; padding-left:10%">
                            <asp:FileUpload ID="uploadMaterialFile" style="height:28px" runat="server" />
                            <asp:Button ID="uploadMaterial" CssClass="btnUploadMaterial" style="border-radius: 5px;height: 30px" runat="server" Text="上傳教材" OnClick="btnUploadMaterial_Click" />
                        </div>
                        <br />
                    </div>
                </div>
            </div>
    </form>
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
    </body>
</html>


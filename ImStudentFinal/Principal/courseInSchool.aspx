<%@ Page Language="C#" AutoEventWireup="true" CodeFile="courseInSchool.aspx.cs" Inherits="Principal_courseInSchool" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/KenStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Css/kendo.common-material.min.css">
    <link rel="stylesheet" href="../Css/kendo.material.min.css">
    <link rel="stylesheet" href="../Css/kendo.materialblack.min.css">
    <title></title>
</head>
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
        <div class="schoolCoursesArea">
            <div class="verifyTitle" style="color:DarkBlue; padding-top: 30px">
                <asp:Label ID="lbSchool" runat="server" Text="目前開設課程"></asp:Label>
            </div>
            <div class="uk-container align-center">
            <div style="text-align: center">
                <button class="k-button k-primary btn-open-school" id="btn-open-window">上架學校</button>
            </div>
                <div id="window" style="text-align: center;background-color: white;color: black; display: none" >
                    <div id="openSchoolForm">
                        <ul class="fieldlist">
                            <li>
                                <asp:Image id="schoolImg" runat="server" />
                            </li>
                            <li>
                                <asp:Label ID="lbSchoolName" Font-Size="X-Large" ForeColor="DarkBlue" runat="server" Text="XX大學"/>
                            </li>
                            <li>
                                <label style="font-size: large;">選課日期</label>
                                <input id="selectCourseTimeRange_datepicker" name="selectCourseTimeRange_datepicker" class="kendo_datepicker" style="width: 100%"/>
                                <span class="k-invalid-msg" data-for="bought_datepicker"></span>
                            </li>
                            <li style="padding-top: 5px">
                                <label style="font-size: large;">開學日期</label>
                                <input id="startSemester_datepicker" name="startSemester_datepicker" class="kendo_datepicker" style="width: 100%"/>
                                <span class="k-invalid-msg" data-for="bought_datepicker"></span>
                            </li>
                            <li class="uk-text-right" style="padding-top: 30px">
                                <button class="k-button k-primary" id="btnOpenSchool">完 成</button>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="courseDetailsArea">
                    <div class="courseInfo">
                        <asp:DataList ID="CourseDataList" runat="server" CellPadding="8" RepeatColumns="2" ForeColor="#333333" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="White" CssClass="courseTd" />
                            <ItemTemplate>
                                <center>
                                <asp:Image id="courseImg" runat="server" ImageUrl="https://picsum.photos/300/150?random=1" Height="150px" Width="220px"/>
                                <br />
                                <br />
                                <asp:Label ID="courseName" Font-Size="X-Large" ForeColor="DarkBlue" runat="server" Text='<%# Eval("CourseName") %>'/>
                                <br />
                                <br />
                                <asp:Label ID="courseDescription" Font-Size="Larger" ForeColor="#93a7ce" style="word-break:break-word" runat="server" Text='<%# Eval("CourseIntro") %>'/>
                                <br />
                                <br />
                                <asp:Label ID="label1" runat="server" Text="授課教師："></asp:Label>
                                <asp:Label ID="teacherName" Font-Size="Larger" ForeColor="#004B97" runat="server" Text='<%# Eval("TeacherName") %>'/>
                                </center>
                            </ItemTemplate>
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="../Script/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="../Script/kendo.all.min.js"></script>
    <script type="text/javascript" src="../Script/uikit.min.js"></script>
    <script type="text/javascript" src="../Script/kenJs.js"></script>
    <script>
        $("#btnOpenSchool").click(function (e) {
            var OpenSelectCourseDate = kendo.toString($("#selectCourseTimeRange_datepicker").data("kendoDatePicker").value(),"yyyy/MM/dd");
            var OpenSemesterDate = kendo.toString($("#startSemester_datepicker").data("kendoDatePicker").value(), "yyyy/MM/dd");
            console.log("type=openSchool&OpenSelectCourseDate=" + OpenSelectCourseDate + "&OpenSemesterDate=" + OpenSemesterDate);
            $.ajax({
                type: "Post",
                url: "courseInSchool.aspx?type=openSchool&OpenSelectCourseDate=" + OpenSelectCourseDate + "&OpenSemesterDate=" + OpenSemesterDate,
                success: function (response) {
                    alert("學校上架成功");
                    location.href = "manageStudent.aspx";
                }, error: function (error) {
                    alert("學校上架失敗");
                }
            });
        });
</script>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="schoolDetail.aspx.cs" Inherits="schoolDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/KenStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="bar">
        IM STUDENT
        <div class="rightText">
            <a href="index.aspx">首頁</a>
            <a href="#">探索學校</a>
            <a href="#">關於我們</a>
            <a href="Login.aspx">登入/註冊</a>
        </div>
     </div>
        <div class="schoolDetailsArea">
            <center>
                <div style="padding-top: 30px">
                    <br />
                <asp:Label CssClass="schoolName" runat="server" Text="ＸＸ大學" Font-Size="XX-Large" ForeColor="DarkBlue" Font-Bold="True" ID="lbSchoolName"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="applyBtn" CssClass="applyBtn" runat="server" Text="申請加入" Width="161px" Height="38px" OnClick="applyBtn_Click"/>
                </div>
            </center>
                <div class="schoolIntro">
                    <div class="leftIntro">
                        <div class="IntroConent">
                            <asp:Label ID="Label1" runat="server" Text="學校簡介" ForeColor="DarkBlue"></asp:Label>
                            <br />
                            　　<asp:Label ID="lbSchoolIntro" runat="server" Text="簡介內容...."></asp:Label>
                        </div>
                        <div class="necessaryCredits">
                            <asp:Label ID="creditLab" runat="server" Text="畢業所需學分數："></asp:Label>
                            <asp:Label ID="lbCreditNum" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>
                    <div class="rightIntro">
                        <img id="schoolImg" src="https://s30876.pcdn.co/wp-content/uploads/discussion-1170x630.jpg" alt="測試圖片"/>
                    </div>
                </div>
             <center>
                <div style="padding-top: 50px">
                    <asp:Label runat="server" Text="師資陣容" Font-Size="XX-Large" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                </div>
             </center>
                <div class="teacherIntro">
                <asp:DataList ID="TeacherDataList" runat="server" CellPadding="4" RepeatColumns="4" ForeColor="#333333" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" CssClass="teacherTd" />
                    <ItemTemplate>
                        <center>
                        <asp:Image id="teacherImg" runat="server" ImageUrl="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Crystal_personal.svg/1024px-Crystal_personal.svg.png" Height="190px" Width="180px"/>
                        <br />
                        <asp:Label ID="lbTeacherName" Font-Size="X-Large" ForeColor="DarkBlue" runat="server" Text='<%# Eval("TeacherName") %>'/>
                        <br />
                        <asp:Label ID="lbCourseName" runat="server" Font-Size="Larger" ForeColor="#93a7ce" Text='<%# Eval("CourseName") %>'/>
                        <br />
                        </center>
                    </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
                </div> 
             <center>
                <div style="padding-top: 50px">
                    <asp:Label runat="server" Text="課程總表" Font-Size="XX-Large" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                    <br />
                </div>
             </center>
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
                        <asp:Label ID="courseDescription" Font-Size="Larger" ForeColor="#93a7ce" runat="server" Text='<%# Eval("CourseIntro") %>'/>
                        <br />
                        </center>
                    </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
                </div>
            <center>
                <div style="padding-top: 50px">
                    <asp:Label runat="server" Text="校友清單" Font-Size="XX-Large" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                    <br />
                </div>
             </center>
                <div class="graduatedMemberInfo">
                <asp:DataList ID="GraduatedMemberDataList" runat="server" CellPadding="8" RepeatColumns="4" ForeColor="#333333" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" CssClass="memberTd" />
                    <ItemTemplate>
                        <center>
                        <asp:Image id="memberImg" runat="server" ImageUrl="https://img.88icon.com/download/jpg/201912/cb36087ee5a2ac01449eeb0f549e5704.jpg!88bg" Height="180px" Width="180px"/>
                        <br />
                        <br />
                        <asp:Label ID="memberName" Font-Size="X-Large" ForeColor="DarkBlue" runat="server" Text='<%# Eval("MemberName") %>'/>
                        <br />
                        </center>
                    </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
                    <br />
                </div>
        </div>
    </form>
</body>
</html>

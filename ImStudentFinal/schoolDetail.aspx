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
                <asp:Label CssClass="schoolName" runat="server" Text="ＸＸ大學" Font-Size="XX-Large" ForeColor="DarkBlue"></asp:Label>
                </div>
            </center>
                <div class="schoolIntro">
                    <div class="leftIntro">
                        <div class="IntroConent">
                            <asp:Label ID="Label1" runat="server" Text="學校簡介"></asp:Label>
                            <br />
                            <asp:Label ID="schoolIntroContent" runat="server" Text="簡介內容...."></asp:Label>
                        </div>
                        <div class="necessaryCredits">
                            <asp:Label ID="creditLab" runat="server" Text="畢業所需學分數："></asp:Label>
                            <asp:Label ID="creditNum" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>
                    <div class="rightIntro">
                        <img id="schoolImg" src="https://s30876.pcdn.co/wp-content/uploads/discussion-1170x630.jpg" alt="測試圖片"/>
                    </div>
                </div>
            <center>
                <div style="padding-top: 30px">
                    <asp:Label runat="server" Text="師資陣容" Font-Size="XX-Large" ForeColor="DarkBlue"></asp:Label>
                </div>
             </center>
                <div class="teacherIntro">
                    <div class="leftTeacherInfo">
                        <div class="teacherImg">
                            <img id="teacherImg" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Crystal_personal.svg/1024px-Crystal_personal.svg.png" alt="測試圖片"/>
                        </div>
                        <div class="teacherDetail">
                            <asp:Label ID="teacherName" runat="server" Text="教師姓名" Font-Size="X-Large" ForeColor="DarkBlue"></asp:Label>
                            <br />
                            <asp:Label ID="teacherDepartment" runat="server" Text="授課領域" Font-Size="Larger" ForeColor="#93a7ce"></asp:Label>
                            <br />
                            <asp:Label ID="teacherIntroduction" runat="server" Text="教師詳細介紹"></asp:Label>
                        </div>
                    </div>
                    <div class="rightTeacherInfo">
                        <div class="teacherImg">
                            <img id="teacherImg" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Crystal_personal.svg/1024px-Crystal_personal.svg.png" alt="測試圖片"/>
                        </div>
                        <div class="teacherDetail">
                            <asp:Label ID="Label2" runat="server" Text="教師姓名" Font-Size="X-Large" ForeColor="DarkBlue"></asp:Label>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="授課領域" Font-Size="Larger" ForeColor="#93a7ce"></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="教師詳細介紹"></asp:Label>
                        </div>
                    </div>
                </div> 
                    
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageStudent.aspx.cs" Inherits="verifyStudent" enableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/KenStyle.css" rel="stylesheet" />
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
            <div class="studentManageArea">
                    <div class="verifyTitle" style="color:DarkBlue; padding-top: 30px">
                        管理學生
                    </div>
            <center>
            <ul class="nav nav-tabs" style="justify-content: center; align-items:center">
		        <li class="active"><a data-toggle="tab" href="#approval">審 核 學 生</a></li>
		        <li><a data-toggle="tab" href="#paystatus">繳 費 狀 況</a></li>
		    </ul>
            </center>
            <div class="tab-content">
		    <div id="approval" class="tab-pane fade in active">
                <div class="manageStudentTable">
            <%--審核學生--%>
            <asp:DataList ID="StudentResumeDataList" runat="server" CellPadding="4"  RepeatColumns="1" ForeColor="#333333" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" >
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EFF3FB" CssClass="studentTd"/>
                <ItemTemplate>
                    <div class="studentImg">
                        <asp:Image id="memberImg" runat="server" ImageUrl="https://img.88icon.com/download/jpg/201912/cb36087ee5a2ac01449eeb0f549e5704.jpg!88bg" Height="190px" Width="180px"/>
                    </div>
                    <div class="studentInfo">
                        <div class="stuInfoLeft">
                            <asp:Label ID="lbStudentName" Font-Size="Larger" ForeColor="#93a7ce" Font-Bold="true" runat="server" Text='<%# Eval("StudentName") %>'/>
                            <br />
                            <div style="padding-top: 10px">
                                <asp:Label ID="lbSelfIntro" ForeColor="DimGray" CssClass="introLab" runat="server" Text='<%# Eval("ApplyIntro") %>'/>
                            </div>
                            <div style="padding-top: 15%">
                                <asp:Button ID="btnDownloadResume" OnClick="btnDownloadResume_Click" CssClass="DownloadResumeBtn" runat="server" Text='檢視履歷' Width="200px"/>
                            </div>
                        </div>
                        <div class="stuInfoRight">
                                <asp:Button ID="btnDeny" CssClass="DenyBtn" runat="server" Text='拒絕' Width="120px"/>
                            <div style="padding-top:50px">
                                <asp:Button ID="btnAllow" CssClass="AllowBtn" runat="server" Text='允許入學' Width="120px"/>
                            </div>
                        </div>
                    </div>
                    </center>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
                </div>
		    </div>
            <div id="paystatus" class="tab-pane fade">
                <div class="manageStudentTable">
            <%--繳費狀況--%>
            <asp:DataList ID="StudentPaymentDataList" runat="server" CellPadding="4"  ForeColor="#333333" RepeatColumns="1" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EFF3FB" CssClass="studentTd"/>
                <ItemTemplate>
                    <div class="studentImg">
                        <asp:Image id="memberImg" runat="server" ImageUrl="https://img.88icon.com/download/jpg/201912/cb36087ee5a2ac01449eeb0f549e5704.jpg!88bg" Height="190px" Width="180px"/>
                    </div>
                    <div class="studentInfo">
                        <asp:Label ID="lbStudentName" Font-Size="Larger" ForeColor="#93a7ce" Font-Bold="true" runat="server" Text='<%# Eval("StudentName") %>'/>
                        <br />
                        <div style="padding-top: 10px">
                            <asp:Label ID="lbSelfIntro" ForeColor="DimGray" runat="server" Text='<%# Eval("ApplyIntro") %>'/>
                        </div>
                    </div>
                        <div style="padding-top: 15%">
                            繳費狀況：<asp:Label ID="lbPaymentStatus" ForeColor="darkblue" Font-Bold="true" runat="server" Text='<%# Eval("PaymentStatus") %>'/>
                        </div>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

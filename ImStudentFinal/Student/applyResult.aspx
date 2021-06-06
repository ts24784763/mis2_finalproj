<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applyResult.aspx.cs" Inherits="applyOutcome"  EnableEventValidation="false"%>

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
            <a href="../Student/searchSchool.aspx">探索學校</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
        </div>
            <div class="schoolApplyResultArea">
                <div class="verifyTitle" style="color:DarkBlue; padding-top: 30px">
                    學校申請結果
                </div>
            <div class="applyResultList">
            <asp:DataList ID="StudentResumeDataList" runat="server" CellPadding="4"  ForeColor="#333333" RepeatColumns="1" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#EFF3FB" CssClass="resultTd"/>
                <ItemTemplate>
                    <div class="resultSchoolImg">
                        <asp:Image id="schoolImg" runat="server" ImageUrl="https://picsum.photos/300/150?random=1" Height="120px" Width="180px"/>
                    </div>
                    <div class="resultSchoolInfo">
                        <asp:Label ID="lbStudentName" Font-Size="X-Large" ForeColor="DarkBlue" runat="server" Text='<%# Eval("Receiver") %>'/>
                    <br />
                    <div style="padding-top: 30px">
                        申請狀況：
                    </div>
                    <asp:Label ID="lbSelfIntro"  Font-Size="Larger" ForeColor="#93a7ce" Font-Bold="true" runat="server" Text='<%# Eval("ApplyResult") %>'/>
                    <asp:Button ID="goToPayBtn" CssClass="ToPayBtn" runat="server" Text='繳費入學'  Width="120px"/>
                    </div>
                </ItemTemplate>
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>                               
            </div>
        </div>
    </form>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

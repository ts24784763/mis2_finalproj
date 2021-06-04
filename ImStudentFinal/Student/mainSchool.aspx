<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mainSchool.aspx.cs" Inherits="mainSchool" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
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
                               <asp:Label ID="lbSchoolName" runat="server" Text="學校名字"></asp:Label>
                            </div>
                        </div>
                        <div class="items">
                            <div class="itemsFont">
                               🛈  總覽
                            </div>
                        </div>
                        <div class="accordion" id="accordionPanelsStayOpenExample">
                          <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                <div class="accordionFonts">
                                基礎會計 <br /><br /> <asp:Label ID="classFigure" runat="server" Text="0/1 堂"></asp:Label>
                                 </div>
                              </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                              <div class="accordion-body">
                                <strong>第一章</strong>
                              </div>
                            </div>
                          </div>
                          <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                <div class="accordionFonts">                                
                                  進階會計<br /><br />
                                  <asp:Label ID="classFigure2" runat="server" Text="0/2 堂"></asp:Label>
                              </div>
                               </button>
                            </h2>
                            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                              <div class="accordion-body">
                                <strong>第一章</strong>
                              </div>
                               <div class="accordion-body">
                                <strong>第二章</strong>
                              </div>
                            </div>
                          </div>
                         
                        </div>
                          
                    </div>
                    <div class="schoolRight">
                        <asp:Label ID="schoolFonts1" CssClass="schoolFonts" runat="server" Text="🏆️取得畢業門檻學分將可獲得證書"></asp:Label>
                        <br />
                        <div class="schoolItems">
                            <asp:Label ID="lbCredit" CssClass="schoolFonts" runat="server" Text="3學分數"></asp:Label>
                        </div>
                        <asp:Image ID="schoolImage" CssClass="schoolImg" runat="server"  src="https://picsum.photos/300/150?random=1"/>
                         <asp:Label ID="intro" CssClass="schoolTitle" runat="server" Text="簡介"></asp:Label>     
                         <asp:Label ID="lbSchoolIntro" CssClass="schoolFonts" runat="server" Text="好學校"></asp:Label>
                         <asp:Label ID="schoolCertification" CssClass="schoolTitle" runat="server" Text="證書"></asp:Label>
                         <asp:Label ID="lbLicense" CssClass="schoolFonts" runat="server" Text="IMS認證會計"></asp:Label>
                         <asp:Label ID="schoolPrinciple" CssClass="schoolTitle" runat="server" Text="校長"></asp:Label>
                         <asp:Label ID="lbPrincipal" CssClass="schoolFonts" runat="server" Text="XXX"></asp:Label>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
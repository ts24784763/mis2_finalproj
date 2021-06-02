<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploadMaterial.aspx.cs" Inherits="Material" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/ChenStyle.css" rel="stylesheet" />
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText">
            <a href="#">首頁</a>
            <a href="#">探索學校</a>
            <a href="#">關於我們</a>
            <a href="#">登入/註冊</a>
            </div>
        </div>
        <center>
            <br /><br />
            <asp:Label ID="lblCourse" runat="server" Text="教材上傳區" Font-Size="XX-Large"></asp:Label>
            <br /><br /><br />
            <asp:Label ID="lblMaterialName" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*教材名稱：" ></asp:Label>
            <br /><br />
            <asp:TextBox ID="txtMaterialName" CssClass="HWContent" placeholder="輸入教材名稱" runat="server" Width="400px" Height="45px"  BackColor="#F7F7F7" ></asp:TextBox>
            <br /><br />
            <asp:Label ID="lblMemo" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 350px" runat="server" Text="備註："></asp:Label>
            <br /><br />
            <asp:TextBox ID="txtMemo" CssClass="HWContent" runat="server" Height="45px" Width="400px" BackColor="#F7F7F7"></asp:TextBox>
            <br /><br />
            <asp:Label ID="lblannex" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 350px" runat="server" Text="*附件："></asp:Label>
            <br /><br />
            <asp:Button ID="btnDoc" runat="server"  Width="100px" Height="30px"  Text="瀏覽檔案" style="background-color: black; color: white;" />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:Button ID="btnUpload" runat="server"  Width="100px" Height="30px"  Text="上傳教材" style="color: black; border-radius:10px" />
            <br /><br /><br /><br />
            <asp:Label ID="lblUploaded" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 300px" runat="server" Text="已上傳教材：" ></asp:Label>
            <br /><br />
            <asp:DataList ID="DataListSchoolInfo" runat="server" CellPadding="3" ForeColor="#333333" EnableViewState="False" RepeatDirection="Horizontal">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
            <ItemStyle BackColor="#EFF3FB" />
            <ItemTemplate>
                <center>
                    <asp:Label ID="lblCourseName" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                    <br />
                    <asp:Label ID="lblCourseInfo" runat="server" Text='<%# Eval("SchoolIntroduction") %>'></asp:Label>
                    <br />
                    <asp:Label ID="lblCoursePeroid" runat="server" Text='<%# Eval("License") %>'></asp:Label>
                </center>
            </ItemTemplate>
        </asp:DataList>
        </center>
        <br />
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploadMaterial.aspx.cs" Inherits="Material" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 上傳教材</title>
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/ChenStyle.css" rel="stylesheet" />
    <link href="../Css/KenStyle.css" rel="stylesheet" />
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="bar">
            IM STUDENT
            <div class="rightText" style="padding-right:40px">
            <a href="../Teacher/schoolInfo.aspx">管理我的課程</a>
            <a href="../UserPublic/setting.aspx">個人資料設定</a>
            <a href="../UserPublic/login.aspx">登出</a>
            </div>
        </div>
        <center>
            <br /><br />
            <asp:Label ID="lblCourse" ForeColor="DarkBlue" runat="server" Text="教材上傳區" Font-Size="XX-Large"></asp:Label>
            <br /><br /><br />
            <asp:Label ID="lblMaterialName" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px" runat="server" Text="*教材名稱：" ></asp:Label>
            <br /><br />
            <asp:TextBox ID="txtMaterialName" CssClass="Cohwtxt" placeholder=" 輸入教材名稱" runat="server" Width="400px" Height="45px" ></asp:TextBox>
            <br /><br />
            <asp:Label ID="lblMemo" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 350px" runat="server" Text="備註："></asp:Label>
            <br /><br />
            <asp:TextBox ID="txtMemo" CssClass="Cohwtxt" placeholder=" 輸入備註" runat="server" Height="45px" Width="400px"></asp:TextBox>
            <br /><br />
            <asp:Label ID="lblannex" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 350px" runat="server" Text="*附件："></asp:Label>
            <br /><br />
			<asp:FileUpload ID="uploadMaterialFile" runat="server" />
            <asp:Button ID="btnUpload" runat="server"  Width="100px" Height="30px"  Text="上傳教材" OnClick="btnUpload_Click" />
            <br /><br /><br /><br />
            <asp:Label ID="lblUploaded" style="font-family:'Microsoft JhengHei UI'; color:midnightblue; elevation:0; font-size: medium; padding-right: 300px" runat="server" Text="已上傳教材：" ></asp:Label>
            <br /><br />
            <asp:GridView ID="GridView1"  CssClass="mGrid"  runat="server" >    
            </asp:GridView>
        </center>
        <br />
    </form>
</body>
</html>

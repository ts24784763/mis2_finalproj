<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
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
        <div>
        </div>
        <form id="regisForm" class="regisArea">
            <center>
                <br />
                <br />
                <asp:Label ID="labJoinus" runat="server" Text="加入我們" Font-Size="XX-Large"></asp:Label>
                <br />
                <br />
                <br />
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 350px">*姓名 :<br />
                </label>
                &nbsp;<br />
                <br />
                <asp:TextBox id="txtName" type="text" CssClass="blueBtmLine" placeholder="Enter your name" runat="server" Width="393px" BackColor="#F7F7F7"></asp:TextBox>
                <br />
                <br />
                <asp:RequiredFieldValidator ID="nameValidator" runat="server" ErrorMessage="請輸入姓名" ForeColor="#CC0000" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                <br />
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 340px">*帳號:<br />
                </label>
                &nbsp;<br />
                <br />
                <asp:TextBox id="txtEmail" type="text" CssClass="blueBtmLine" placeholder="Enter your email" runat="server" Width="393px" BackColor="#F7F7F7"></asp:TextBox>
                <br />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="請輸入帳號" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="帳號需為8~16碼，其中須包括英文及數字。" ForeColor="#CC0000" ValidationExpression="^.*(?=.{8,16})(?=.*\d)(?=.*[a-zA-Z]).*$"></asp:RegularExpressionValidator>
                <br />
                <br />
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 320px">*手機號碼 :<br />
                </label>
                &nbsp;<br />
                <br />
                <asp:TextBox id="txtPhone" type="text" CssClass="blueBtmLine" placeholder="Enter your phoneNumber" runat="server" Width="393px" BackColor="#F7F7F7"></asp:TextBox>
                <br />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="請輸入手機號碼" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="手機號碼格式錯誤（ex : 0988888888 )" ForeColor="#CC0000" ValidationExpression="[0]{1}[9]{1}[0-9]{8}"></asp:RegularExpressionValidator>
                <br />
                <br />
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 350px">*密碼 :<br />
                </label>
                &nbsp;<br />
                <br />
                <asp:TextBox id="txtPassword" type="text" CssClass="blueBtmLine" placeholder="Enter your password" runat="server" Width="393px" BackColor="#F7F7F7"></asp:TextBox>
                <br />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="請輸入密碼" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="密碼長度為8到16碼" ForeColor="#CC0000" ValidationExpression="[0-9,a-z,A-Z,_,@,#,$,%,^,&amp;,*]{8,16}"></asp:RegularExpressionValidator>
                <br />
                <br />
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 290px">*再次輸入密碼 :<br />
                </label>
                &nbsp;<br />
                <br />
                <asp:TextBox id="txtPassword2" type="text" CssClass="blueBtmLine" placeholder="Enter your password again" runat="server" Width="393px" BackColor="#F7F7F7"></asp:TextBox>
                <br />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword2" ErrorMessage="請再次輸入密碼" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPassword2" ErrorMessage="密碼輸入不符！" ForeColor="#CC0000"></asp:CompareValidator>
                <br />
                <label style="font-family:'Microsoft JhengHei UI'; color:midnightblue; font-size: medium; padding-right: 350px">*身分 :<br />
                </label>
                &nbsp;<br />
                <br />
                <asp:RadioButtonList ID="RadioButtonList1" CssClass="spaced"  runat="server">
                    <asp:ListItem>學生</asp:ListItem>
                    <asp:ListItem>老師</asp:ListItem>
                    <asp:ListItem>校長</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="請選擇身分" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button ID="btnSubmitRegister" runat="server" Text="註冊" Width="388px" Height="31px" />
                <br />
                <br />
                <br />
                <br />
            </center>
        </form>
    </form>
</body>
</html>

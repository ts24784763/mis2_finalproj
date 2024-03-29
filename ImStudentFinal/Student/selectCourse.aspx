﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="selectCourse.aspx.cs" Inherits="selectCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT - 選課</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
    <link href="../Css/ChenStyle.css" rel="stylesheet" />
    <script>
        $("#btnCheck").click(function (e) {
            e.preventDefault();
        })
    </script>
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
     <div class="selectCourse">
         <asp:Label ID="lbTitle" runat="server" Text="Label"></asp:Label>
     </div>
     <div class="courseWrapper">
         <div class="left">
         <div class="items">
             教授名稱
             <asp:TextBox ID="professorName" CssClass="professorUnique" runat="server"></asp:TextBox>
         </div>
         <div class="items">
             課程名稱
             <asp:TextBox ID="courseName" CssClass="professorUnique" runat="server"></asp:TextBox>
         </div>
         </div>
         <div class="right">
         <asp:Button ID="searchBtn" CssClass="btnStyle" runat="server" Text="搜尋按鈕" OnClick="searchBtn_Click" />
         </div>
     </div>
        <center>
            <br /><br />
    <asp:GridView ID="GVCourse" CssClass="mGrid" HorizontalAlign="Center" runat="server"  >
        <Columns>
            <asp:TemplateField HeaderText="選擇課程">
                <ItemStyle CssClass="GV"/>
                <ItemTemplate>
                    <asp:CheckBox ID="chkAdd"  runat="server"  ></asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            <br />
        <div style="font-size:25px;font-weight:bold;">
               <asp:Button ID="btnCheck" runat="server" Text="查看是否超過畢業門檻" CssClass="checkBtn" OnClick="btnCheck_Click" ></asp:Button>
                <br /><br />
            <asp:Label ID="checkCreditSum" runat="server" Text="0/30"></asp:Label>
        </div>
        </center>
        <div class="selectFooter">
            <asp:Button ID="reset" runat="server" CssClass="btnStyle" Text="重新選擇" OnClick="reset_Click" />                
            <asp:Button ID="btnSubmit" runat="server" CssClass="btnStyle" Text="選擇完成" OnClick="btnSubmit_Click" />
        </div>
        <br />
    </form>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>


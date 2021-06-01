﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payMoney.aspx.cs" Inherits="payMoney" %>

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
            <a href="index.aspx">首頁</a>
            <a href="#">探索學校</a>
            <a href="#">關於我們</a>
            <a href="Login.aspx">登入/註冊</a>
            </div>
        </div>
            <div class="schoolBody2">
                    <div class="verifyTitle">
                        繳費狀況
                    </div>
                <div class="mainTable">
<asp:DataList ID="DataList1" runat="server" CellPadding="4"  ForeColor="#333333" RepeatDirection="Horizontal" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EFF3FB" />
                <ItemTemplate>
                    <center>
                    <asp:Image ID="學生照片" runat="server" Text='<%# Eval("學生照片") %>' ImageUrl='<%# Eval("學生照片", "~/images/{0}.jpg") %>' Height="200px" Width="180px" />
                    <br />
                    <asp:Label ID="學生名稱" runat="server" Text='<%# Eval("學生名稱") %>'/>
                    <br />
                    繳費狀況：<asp:Label ID="繳費狀況" runat="server" Text='<%# Eval("完成", "{0:C}") %>'/>
                    <div style="float:right;">
                    <asp:Button ID="收錢" runat="server" Text='收取學費' PostBackUrl='<%# Eval("商品照片", "05.BookDetail.aspx?field={0}") %>' Width="200px"/>
                   </div>
                   </center>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>       
            </div>
    </form>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

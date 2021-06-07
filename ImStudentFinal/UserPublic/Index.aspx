<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>IM STUDENT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../Css/reset.css" rel="stylesheet" />
    <link href="../Css/pageStyle.css" rel="stylesheet" />
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <form id="form1" runat="server">
        <div class="bar">
            <a href="../UserPublic/index.aspx" style="font-size: 30px;">IM STUDENT</a>
            <div class="rightText">
            <a href="../UserPublic/login.aspx">登入</a>
            <a href="../UserPublic/register.aspx">註冊</a>
            </div>
        </div>
        <div class="block">
            <div class="textWrap">
            IM Student 數位學校平台<br> <br />
            輕鬆在家進行課程，取得學位！</div>
            <div class="wrap">
                <button class="button1">
                    申請學校<img src="../image/image_01.png" />
                </button>
                <button class="button2">
                    建立學校<img src="../image/image_02.png" />
                </button>
            </div>
        </div>
        <div class="footer">
            <div class="wrap">
            <img src="https://picsum.photos/300/150?random=1" alt="測試圖片1"/>
            <img src="https://picsum.photos/300/150?random=2" alt="測試圖片2"/>
            <img src="https://picsum.photos/300/150?random=3" alt="測試圖片3"/>
            <img src="https://picsum.photos/300/150?random=4" alt="測試圖片4"/>
            </div>
            <div class="wrap">
            <img src="https://picsum.photos/300/150?random=5" alt="測試圖片5"/>
            <img src="https://picsum.photos/300/150?random=6" alt="測試圖片6"/>
            <img src="https://picsum.photos/300/150?random=7" alt="測試圖片7"/>
            <img src="https://picsum.photos/300/150?random=8" alt="測試圖片8"/>
            </div>
         </div>
    </form>
    <script type="text/javascript" src="../Script/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="../Script/kenJs.js"></script>
</body>
</html>

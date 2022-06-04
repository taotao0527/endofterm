<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAZURU留言頁面</title>
    <style>
     
     body{
        margin: 0px;
     }
     
    </style>
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/goods.css">
</head>
<body>
    <header id="top">
        <p>PAZURU</p>     <!--名字-->
    </header>
    <nav>
        <a href="#landscape">風景拼圖</a> 
        <a href="#painting">古典畫作</a> 
        <a href="#others">其他</a> 
    </nav>
    
    <main class="card">
        <form name="form1" method="get" action="add.jsp" >
用戶名：<input type="text" name="name"><br>
內容：<textarea rows=5 name="content"></textarea><br>
<input type="submit" name="Submit" value="送出">
<input type="Reset" name="Reset" value="重新填寫">
</form>
    <script>
        function minusNUM(){
            let value = Number(document.getElementById('num').value);
            if(value!=1){
                document.getElementById('num').value=value-1;
            }
            
        }
        function addNUM(){
            let value = Number(document.getElementById('num').value);
            document.getElementById('num').value=value+1;
            
        }
    </script>
    <article>


</body>
</html>

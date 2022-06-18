<%@ page contentType="text/html" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAZURU</title>
    <style>
        @import url("assets/css/all.css");
        @import url("assets/css/index.css");
     body{
        margin: 0px;
     }
     
    </style>
    
   
</head>
<body>
<%
  int counter;
  String strNo = (String)application.getAttribute("counter1");//讀application變數
  counter = Integer.parseInt(strNo); //轉成整數
 if (session.isNew()==true)
 {
	 counter++;//計數器加1
 }                                     
  strNo = String.valueOf(counter);    //轉成字串
  application.setAttribute("counter1", strNo);//寫application變數
%>
    <header id="top">
        <div class="container">
<p ><a class="name" herf="index.html">PAZURU</a></p>     <!--名字-->
        
        </div>
        
        
    </header>
    <nav><!--選單!!!大幅度更改!!!-->
        <div class="container">
        <ul>
            <li><a href="index.jsp">PAZURU</a></li>
            <li><a href="page/landscape.jsp">商品</a>
            <ul>
                <li><a href="page/landscape.jsp">風景拼圖</a>
                <ul>
                    <li><a href="page/landscape4.jsp">義大利</a></li>
                    <li><a href="page/landscape3.jsp">日本富士山</a></li>
                    <li><a href="page/landscape6.jsp">老街</a></li>
                    <li><a href="page/landscape1.jsp">色彩繽紛的小鎮</a></li>
                    <li><a href="page/landscape2.jsp">愛丁堡馬戲團巷</a></li>
                    <li><a href="page/landscape3.jsp">瓦胡島</a></li>
                </ul>
                </li>
                <li><a href="page/painting.jsp">古典畫作</a>
                    <ul>
                        <li><a href="page/painting1.jsp">清明上河圖</a></li>
                        <li><a href="page/painting2.jsp">拾穗者</a></li>
                        <li><a href="page/painting3.jsp">戴珍珠耳環的少女</a></li>
                        <li><a href="page/painting4.jsp">吶喊</a></li>
                        <li><a href="page/painting5.jsp">星空</a></li>
                        <li><a href="page/painting6.jsp">自由引導人民</a></li>
                    </ul>
                </li>
                <li><a href="page/stars.jsp">星空</a>
                    <ul>
                        <li><a href="page/star1.jsp">雪</a></li>
                        <li><a href="page/star2.jsp">生存</a></li>
                        <li><a href="page/star3.jsp">嚮往</a></li>
                        <li><a href="page/star4.jsp">盡頭</a></li>
                        <li><a href="page/star5.jsp">凌晨</a></li>
                        <li><a href="page/star6.jsp">銀河</a></li>
                    </ul>
                </li>
            </ul>
            </li>
            <li><a href="page/memberprofile.jsp">會員專區</a>
            <ul>
            <li><a href="page/signin.jsp">註冊</a></li>
            <li><a href="page/login.jsp">登入</a></li>
            <li><a href="page/shoppingCar.jsp">購物車</a></li>
            </ul>
            </li>
            <li><a href="page/aboutUs.html">關於我們</a></li>
            <li><img class="shoppingCar" src="assets/img/shoppingCar.png"></li>
        </div>
    </nav>
    <main >
        <div class="card">
            <!--這裡是廣告-->
            <div >
                <div class="container">
                    <div>
    
                        
                        <div  class="container">
                                <img class="mySlides adimg" src="assets/img/ad1.png" >
                                <img class="mySlides adimg" src="assets/img/ad2.png" >
                                <img class="mySlides adimg" src="assets/img/ad3.png" >
                                <img class="mySlides adimg" src="assets/img/ad4.png" >
                        </div>
                          
                        
                        <div style="text-align:center">
                            <span class="dot" onclick="currentSlide(1)"></span> 
                            <span class="dot" onclick="currentSlide(2)"></span> 
                            <span class="dot" onclick="currentSlide(3)"></span>
                            <span class="dot" onclick="currentSlide(4)"></span>
                          </div>
                        
                        
                    </div>
                </div>
                <script>
                    var slideIndex = 0;
                    showSlides();
    
                    function showSlides() {
                    var i;
                    var slides = document.getElementsByClassName("mySlides");
                    var dots = document.getElementsByClassName("dot");
                    for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";  
                    }
                    slideIndex++;
                    if (slideIndex > slides.length) {slideIndex = 1}    
                    for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                    }
                    slides[slideIndex-1].style.display = "block";  
                    dots[slideIndex-1].className += " active";
                    setTimeout(showSlides, 3000); 
                    }
                </script>
            </div>


        </div>
        <div id="hot">
            <h4 class="title">熱銷排行榜</h4>
        <figure> 
            <div class="card">
                <img class="goods_s" src="assets/img/product/landscape_sea.jpg" >
                <div>
                    <a href="page/landscape3.jsp">瓦胡島</a>
                </div>
                
            </div> 
            <div class="card">
                <img class="goods_s" src="assets/img/product/stars_3.jpg" >
                <div>
                    <a href="page/star3.jsp">嚮往</a>
                </div>
            </div> 
            <div class="card">
                <img class="goods_s" src="assets/img/product/painting_skrik.jpg" >
                <div>
                    <a href="page/painting4.jsp">吶喊</a>
                </div>
            </div> 

        </figure>
          

        </div>
        <aside id="landscape">      <!--風景拼圖-->
            <h4 class="title">風景地圖</h4>
        <figure> 
            <div class="card">
                <img class="goods_s" src="assets/img/product/landscape_city.jpg" >
                <div>
                    <a href="page/landscape4.jsp">義大利</a>
                </div>
            </div> 
            <div class="card">
                <img class="goods_s" src="assets/img/product/landscape_fuji.jpg" >
                <div>
                    <a href="page/landscape3.jsp">日本富士山</a>
                </div>
            </div> 
            <div class="card">
                <img class="goods_s" src="assets/img/product/landscape_river.jpg" >
                <div>
                    <a href="page/landscape1.jsp">色彩繽紛的小鎮</a>
                </div>
            </div> 

        </figure>
        <p class="more"><a href="page/landscape.jsp" >more...</a></p>  
        </aside>
        <section id="painting">     <!--古典畫作-->
            <h4 class="title">古典畫作</h4>
            <figure> 
                <div class="card">
                    <img class="goods_s" src="assets/img/product/painting_pearl.jpg" >
                    <div>
                        <a href="page/painting3.jsp">戴珍珠耳環的少女</a>
                    </div>
                </div> 
                <div class="card">
                    <img class="goods_s" src="assets/img/product/painting_skrik.jpg" >
                    <div>
                        <a href="page/painting4.jsp">吶喊</a>
                    </div>
                </div> 
                <div class="card">
                    <img class="goods_h" src="assets/img/product/painting_stars.jpg" >
                    <div>
                        <a href="page/painting5.jsp">星空</a>
                    </div>
                </div> 

            </figure>
            <p class="more"><a href="page/painting.jsp" >more...</a></p>  
        </section>
        <article id="stars"><!--星空-->
            <h4 class="title">星空</h4>
            <figure> 
                <div class="card">
                    <img class="goods_s" src="assets/img/product/stars_1.jpg" >
                    
                    <div>
                        <a href="page/star1.jsp">雪</a>
                    </div>
                </div> 
                <div class="card">
                    <img class="goods_s" src="assets/img/product/stars_2.jpg" >
                    <div>
                        <a href="page/star2.jsp">生存</a>
                    </div>
                </div> 
                <div class="card">
                    <img class="goods_s" src="assets/img/product/stars_3.jpg" >
                    <div>
                        <a href="page/star3.jsp">嚮往</a>
                    </div>
                </div> 

            </figure>
            <p class="more"><a href="page/stars.jsp" >more...</a></p>  
        </article>
    </main>


    
      <footer>  
          <p>連絡電話：02-21345678</p>
          <p>服務時間：10:00～20：00</p>
          <p>客服信箱：abc@gmail.com</p>
          <blockquote class="blockquote text-right">
              <p><a href="#top">回頂部</a></p>
              <p>可刷卡</p> 
<a href="page/Managelogin.jsp" style="background-color:#B096A7;">進入系統後台</a>
			  
              <p>網頁瀏覽人數:<%=counter%>人</p>
          </blockquote>
          
      </footer>
      
  </body>
  </html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAZURU</title>
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
        <form>
        <div class="container"><!--商品圖片&說明-->
            <div class="row">
                <div class="row-left">
                    <img class="goods" src="../img/阿黑.png" >
                </div>
                <div class="row-right">
                    <h3>品名</h3>
                    <p>
                        商品敘述
                    </p>
                    
                    <div class="button"> <!--數量按鈕-->
                        <input type="button" class="mun-button" value="-" id="btnOne" onclick="minusNUM()">
                        <input type="text" id="num" class="number" value="1">
                        <input type="button" class="mun-button" value="+" id="btnTwo" onclick="addNUM()">
                        <p><a href="">加入購物車</a></p>
                    </div>
                </div>

            </div>
            
        </div>
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
	<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="USE `MEBboard`";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="SELECT * FROM `guestbook`"; //算出共幾筆留言
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           //ResultSet.TYPE_SCROLL_INSENSITIVE表紀錄指標可前後移動，ResultSet.CONCUR_READ_ONLY表唯讀
           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int total_content=rs.getRow();
           out.print("共"+total_content+"筆留言<p>");
		   
		   
           //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
           //讀取page變數
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "0";          
           int current_page=Integer.valueOf(page_string);
           if(current_page==0) //若未指定page, 令current_page為1
	          current_page=1;
	       //計算開始記錄位置   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM `guestbook` ORDER BY `Putdate` DESC LIMIT ";
           sql+=start_record+",5";

// current_page... SELECT * FROM `guestbook` ORDER BY `Putdate` DESC LIMIT
//      current_page=1: SELECT * FROM `guestbook` ORDER BY `Putdate` DESC LIMIT 0, 5
//      current_page=2: SELECT * FROM `guestbook` ORDER BY `Putdate` DESC LIMIT 5, 5
//      current_page=3: SELECT * FROM `guestbook` ORDER BY `Putdate` DESC LIMIT 10, 5
           rs=con.createStatement().executeQuery(sql);
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs.next())
                {
                 out.println("<div class='Row'>"+"<div class='Row-left'><h3  margin-bottom= '0px'>"+rs.getString(2)+"<div margin-top='0px'style='font-weight: lighter;font-size: 10pt;'>"+rs.getString(4)+"</div></h3>");
                 out.println(rs.getString(3)+"</div></div>");
          }
		  out.println("請選擇頁數");
           //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
           for(int i=1;i<=page_num;i++) //建立1,2,...頁超連結
			   out.print("<a href='view.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白

           out.println("<p>");
//Step 6: 關閉連線
          con.close();
      }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>
	<!--留言板-->
            <!-- <div class="Row">
                <div class="Row-left">
                    <img class="custum" src="../img/阿黑.png" >
                </div>
                <div class="Row-left">
                    <h3>用戶名</h3>
                    <p>
                        評價
                        AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    </p>
                </div>
                
            </div>
            <div class="Row">
                <div class="Row-left">
                    <img class="custum" src="../img/阿黑.png" >
                </div>
                <div class="Row-left">
                    <h3>用戶名</h3>
                    <p>
                        評價
                        AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    </p>
                </div>
                
            </div>
            <div class="Row">
                <div class="Row-left">
                    <img class="custum" src="../img/阿黑.png" >
                </div>
                <div class="Row-left">
                    <h3>用戶名</h3>
                    <p>
                        評價
                        AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    </p>
                </div>
                
            </div> -->
    </article>
        
</form>
    </main>


    <footer>  
        <p>連絡電話：02-21345678</p>
        <p>服務時間：10:00～20：00</p>
        <p>客服信箱：abc@gmail.com</p>
        <blockquote class="blockquote text-right">
            <p><a href="#top">回頂部</a></p>
            <p>可刷卡</p> 
        </blockquote>
        
    </footer>
</body>
</html>
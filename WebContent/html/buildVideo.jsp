<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>教練上傳影片</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/buildVideo.css">
</head>
<body>
    <div id="bar">
        <div id="title">
            <ul>
                <li class="bar_li">
                    <img src="../img/logo.png" alt="" for="#CloudGYM">
                </li>
                <li class="bar_li">
                    <a href="#" id="CloudGYM">CloudGYM</a>
                </li>
            </ul>
        </div>
        <div id="option">
            <ul>
                <li class="option">運動類型</li>
                <li class="option">教練</li>
                <li class="option">個人專區</li>
                <li class="option">討論區</li>
                <li class="option">註冊/登入</li>
                <li class="option">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                      </svg>
                </li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div id="form">
            <div id="box1">
                <ul>
                    <h3 id="form_title">建立教練影片</h3>
                </ul>
            </div>
            <div id="box2">
                <ul>
                    <li id="video_name">影片名稱:<input id="name_input" type="text" placeholder="輸入影片名稱" aria-label="default input example"></li><br>
                    
                    <li id="video_intro">影片簡介:</li><br>
                    <textarea id="intro_input" rows="3"></textarea>
                    <div id="post_box">
                        <li id="post_name">動作名稱:<br><br>
                            <input id="post_input" type="text" placeholder="輸入動作名稱" aria-label="default input example"><input id="set" type="number" placeholder="幾組" aria-label="default input example">
                        </li>
                        <li id="post_name">動作名稱:<br><br>
                            <input id="post_input" type="text" placeholder="輸入動作名稱" aria-label="default input example"><input id="set" type="number" placeholder="幾組" aria-label="default input example">
                        </li>
                        <li id="post_name">動作名稱:<br><br>
                            <input id="post_input" type="text" placeholder="輸入動作名稱" aria-label="default input example"><input id="set" type="number" placeholder="幾組" aria-label="default input example">
                        </li>
                        <div id="button_area">
                            <button type="button" id="button" class="btn btn-primary btn-lg">確認</button>
                            <button type="button" id="button" class="btn btn-primary btn-lg">取消</button>
                        </div>
                    </div>
                </ul>
            </div>
            <div id="box3">
                <img src="../img/work_out_1.jpg" alt="" class="video_pic">
                <div id="public_box">
                    <input type="radio" id="userGender_01" name="userGender" value="0" checked="checked" />公開  
                    <input type="radio" id="userGender_02" name="userGender" value="1" />不公開
                    <br><br><br>
                    <h3>價錢:<input id="price" type="number" placeholder="選擇價格" aria-label="default input example"></h3>
                    <br><br>
                    <h3><input type="file" id="file-uploader"></h3>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
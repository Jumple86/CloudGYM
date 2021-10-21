<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�s����</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/buildMenu.css">
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
                <li class="option">�B������</li>
                <li class="option">�нm</li>
                <li class="option">�ӤH�M��</li>
                <li class="option">�Q�װ�</li>
                <li class="option">���U/�n�J</li>
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
                    <h3 id="form_title">�s����</h3>
                </ul>
            </div>
            <div id="box2">
                <ul>
                    <li id="menu_name">���W��:<input id="name_input" type="text" placeholder="��J���W��" aria-label="default input example"></li><br>
                </ul>
                <br>
                <ul>
                    <li>����:<input id="price" type="number" placeholder="��ܻ���" aria-label="default input example"></li>
                </ul>
                <br><br>
                <ul>������:</ul>
                <br>
                <ul>
                    <select>
                        <option>�п�ܳ���</option>
                        <option>����1</option>
                        <option>����2</option>
                        <option>����3</option>
                        <option>����4</option>
                        <option>����5</option>
                        <option>����6</option>
                    </select>
                </ul>
                <br><br>
                <ul>
                    <input type="radio" id="userGender_01" name="userGender" value="0" checked="checked" />���}  
                    <input type="radio" id="userGender_02" name="userGender" value="1" />�����}
                </ul>
            </div>
            <div id="post_box">
                        <li id="post_name">�ʧ@�W��:<br><br>
                            <input id="post_input" type="text" placeholder="��J�ʧ@�W��" aria-label="default input example"><input id="set" type="number" placeholder="�X��" aria-label="default input example">
                        </li>
                        <li id="post_name">�ʧ@�W��:<br><br>
                            <input id="post_input" type="text" placeholder="��J�ʧ@�W��" aria-label="default input example"><input id="set" type="number" placeholder="�X��" aria-label="default input example">
                        </li>
                        <li id="post_name">�ʧ@�W��:<br><br>
                            <input id="post_input" type="text" placeholder="��J�ʧ@�W��" aria-label="default input example"><input id="set" type="number" placeholder="�X��" aria-label="default input example">
                        </li>
            </div>
            <div id="button_area">
                <button type="button" id="button" class="btn btn-primary btn-lg">�T�{</button>
                <button type="button" id="button" class="btn btn-primary btn-lg">����</button>
                <button type="button" id="button" class="btn btn-primary btn-lg">�R�����</button>
            </div>
        </div>
    </div>
</body>
</html>
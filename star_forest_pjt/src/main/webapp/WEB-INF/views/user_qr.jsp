<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	h1 {text-align:center;}
</style>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/qrcode.js"></script>
<meta charset="UTF-8">
<title>나의QR</title>
</head>
<body>
<h1>별숲회원 QR Code 발급</h1><hr><br><br>
		<div id="qrcode"></div>
</body>
<script type="text/javascript">
//다른 위치에서 실행이 안됨_
	var qrcode = new QRCode(document.getElementById("qrcode"), {
		text: "yeji", //user_id값으로 넣는방법....?
		width: 128,
		height: 128,
		colorDark : "#000000",
		colorLight : "#ffffff",
		correctLevel : QRCode.CorrectLevel.H
	});

	$("#qrcode > img").css({"margin":"auto"});
</script>
</html>
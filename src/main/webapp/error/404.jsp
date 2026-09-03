<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="false" %><%-- Static on purpose (no taglibs/EL/scriptlets) so it renders even when the app or DB is down. --%><!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="noindex, follow">
<title>ไม่พบหน้านี้ | Cube SoftTech</title>
<style>
  html, body { margin: 0; padding: 0; height: 100%; }
  body {
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f5f5f5;
    color: #1c1b1a;
    font-family: 'Google Sans', 'Open Sans', 'Sarabun', 'Noto Sans Thai', 'Segoe UI', Tahoma, sans-serif;
    line-height: 1.6;
    -webkit-text-size-adjust: 100%;
  }
  .box {
    width: 100%;
    max-width: 420px;
    padding: 40px 24px;
    text-align: center;
  }
  .code {
    font-size: 72px;
    font-weight: 700;
    color: #BD2125;
    letter-spacing: -0.02em;
    line-height: 1;
    margin: 0;
  }
  h1 {
    font-size: 20px;
    font-weight: 600;
    margin: 20px 0 4px;
  }
  p {
    margin: 0 0 24px;
    color: #5c5c5c;
    font-size: 15px;
  }
  .en { display: block; font-size: 13px; color: #8a8a8a; }
  a.home {
    display: inline-block;
    padding: 11px 24px;
    background: #BD2125;
    color: #fff;
    text-decoration: none;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
  }
  a.home:hover { background: #9d1a1d; }
</style>
</head>
<body>
  <div class="box">
    <p class="code">404</p>
    <h1>ไม่พบหน้าที่คุณกำลังมองหา</h1>
    <p>
      หน้านี้อาจถูกย้ายหรือลบไปแล้ว
      <span class="en">The page you were looking for could not be found.</span>
    </p>
    <a class="home" href="/">กลับสู่หน้าแรก</a>
  </div>
</body>
</html>

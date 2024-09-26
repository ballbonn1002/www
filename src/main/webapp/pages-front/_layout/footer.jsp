<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Footer -->
<footer>
    <div class="footerbg">
        <div class="container" style="padding-top:20px;">
            <div class="row">
                <div class="col-md col-sm col-xs " align="left">
                	<img src="/pages-front/img/logo/logo2-w.png" alt="Cube SoftTech Co., Ltd." style="width:200px; padding-bottom:16px; ">
                    <div class="footer-section">
                        <p class="footer-heading">Cube SoftTech Co., Ltd.</p><br>
                        <a href="https://maps.app.goo.gl/a1N8Xi2qvhbVKFsW8" class="footer-link" target="_blank">
                            160/170-2, 12A Fl., ITF Silom Palace Building Silom Rd., Suriyawong, Bangrak, Bangkok 10500 Thailand
                        </a>
                    </div>
                    <div class="footer-section">
                        <p class="footer-heading">Phone</p>
                        <p><a href="tel:026798855" class="footer-link">02 679 8855,</a> <a href="tel:026344449" class="footer-link">  02 634 4449,</a><br>
                        <a href="tel:0880229400" class="footer-link"> 088 022 9400</a></p>
                    </div>
                    <div class="footer-section">
                        <p class="footer-heading">E-mail</p>
                        <p><a href="mailto:info@cubesofttech.com" class="footer-link">info@cubesofttech.com</a></p>
                        <p><a href="mailto:hr@cubesofttech.com" class="footer-link">hr@cubesofttech.com</a></p>
                    </div>
					<div class="footer-section">
    					<p class="footer-heading">Social</p>
    					<div class="d-flex">
        					<div style="margin-right: 10px;">
            					<a href="https://www.facebook.com/CubeSoftTech" class="footer-link" target="_blank" aria-label="Facebook">
                				<i class="bi bi-facebook" style="font-size:24px;  color:#FFFFFF; margin-right:10px;"></i>
            					</a>
        					</div>
        					<div style="margin-right: 10px;">
            					<a href="https://lin.ee/2zYeCXX" class="footer-link" target="_blank" aria-label="Line">
                				<i class="bi bi-line" style="font-size:24px; color:#FFFFFF; margin-right:10px;"></i>
            					</a>
        					</div>
        					<div style="margin-right: 10px;">
            					<a href="https://www.tiktok.com/@cubesofttech" class="footer-link" target="_blank" aria-label="TikTok">
                				<i class="bi bi-tiktok" style="font-size:24px;  color:#FFFFFF; margin-right:10px;"></i>
            					</a>
        					</div>
        					<div style="margin-right: 10px;">
            					<a href="https://www.linkedin.com/company/cubesofttech" class="footer-link" target="_blank" aria-label="LinkedIn">
                				<i class="bi bi-linkedin" style="font-size:24px;  color:#FFFFFF; margin-right:10px;"></i>
            					</a>
        					</div>
        					<div style="margin-right: 10px;">
            					<a href="https://www.youtube.com/channel/UCSYGv-HblWhASgyvD6TJthw" class="footer-link" target="_blank" aria-label="YouTube">
                				<i class="bi bi-youtube" style="font-size:24px; color:#FFFFFF;"></i>
            					</a>
        					</div>
    					</div>
					</div>
                </div>
                <div class="col-md col-sm col-xs " align="left">
                    <div class="footer-section">
                        <a href="/services" class="footer-heading">Services</a><br>
                        <a href="/services" class="footer-link1">Services</a><br>
                        <a href="/software-development" class="footer-link1">Software Development</a><br>
                        <a href="/it-outsource" class="footer-link1">IT Outsource</a><br>
                        <a href="/mobile-app-development" class="footer-link1">Mobile App Development</a><br>
                        
                    </div>
                    <div class="footer-section">
                        <a href="/careers" class="footer-heading">Careers</a><br>
                        <c:forEach var="career" items="${Careers}">
                            <a href="${career.footer_url}" class="footer-link2">${career.footer_name}</a><br/>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md col-sm col-xs " align="left">
                    <div class="footer-section">
                        <a href="/blog" class="footer-heading">Blog</a><br>
                        <c:forEach var="blog" items="${Blog}">
                            <a href="${blog.footer_url}" class="footer-link2">${blog.footer_name}</a><br/>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md col-sm col-xs " align="left">
                    <div class="footer-section">
                        <a href="/news" class="footer-heading">News</a><br>
                        <c:forEach var="news" items="${News}">
                            <a href="${news.footer_url}" class="footer-link2">${news.footer_name}</a><br/>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    	<div class="footerbg" align="center">
    	<div style="border-top: 1px solid #FFFFFF; width: 70%; margin: 0 auto;"></div>
    	<font size="2px" style="color:#FFFFFF;"> © 2024. Cube SoftTech Co., Ltd. All rights reserved.</font>
	</div>

</footer>
<!-- Footer -->

<script>
    $(document).ready(function () {
        $.ajax({
            url: "footer",
            method: "POST",
            success: function (data) {
            }
        });
    });
</script>

<style>
.footerbg {
    color: #1a1a1a !important;
    padding: 20px 0;
    height:100%;
}

.footer-section {
    margin-bottom: 20px;
}

.footer-heading {
    font-weight: bold;
    color: #FFFFFF !important;
    display:inline-block; 
    margin-bottom:16px;
    text-decoration: none !important;
}

.footer-heading:hover {
    color: #FFFFFF !important;
    text-decoration: none !important;
}

.footer-heading.active {
    color: #FFFFFF !important;
}

.footer-heading.active:hover {
    color: #FFFFFF !important;
    text-decoration: none !important;
}

.footer-link {
    color:  #999 !important;
}

.footer-link1 {
    color:  #999 !important;
    display: inline-block;
    width: 200px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.footer-link2 {
    color:  #999 !important;
    display: inline-block;
    width: 200px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}


.footer-link1:hover, .footer-link2:hover, .footer-link:hover {
    color: #FFFFFF !important;
    text-decoration: none !important;
}

footer .active {
    border: none !important;
    color: none !important;

}

.d-flex {
    display: flex;
}

.col-md-3 img {
    display: block;
    margin-left: 0;
}

@media (max-width: 767px) {
    .footer-section {
        text-align: center !important;
    }
    .col-md-3 img {
        display: block;
        margin: 0 auto 10px;
    }
    .d-flex {
        justify-content: center;
        flex-wrap: wrap;
        gap: 10px;
    }

    .d-flex > div {
        margin: 0;
    }
    i{
    	margin-right:5px;
    }
}




</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

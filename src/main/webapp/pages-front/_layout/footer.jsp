<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Footer -->
<%@ taglib prefix="s" uri="/struts-tags" %>
	<div id="footer" style="display: none;">
    	<s:action name="footer" />
	</div>
<footer>
    <div class="footerbg">
        <div class="container" style="padding-top:20px;">
        <div class="dropdown1">
            <div class="row">
                <div class="col-md col-sm col-xs " align="left">
                	<img src="/pages-front/img/logo/logo2-w.png" alt="Cube SoftTech Co., Ltd." style="width:200px; padding-bottom:16px; ">
                    <div class="footer-section">
                        <p class="footer-heading">Cube SoftTech Co., Ltd.</p><br>
                        <a href="https://maps.app.goo.gl/a1N8Xi2qvhbVKFsW8" class="footer-link" target="_blank">
                            160/170-2, 12A Fl., ITF Silom Palace Building Silom Rd., Suriyawong, Bangrak, Bangkok 10500 Thailand
                        </a>
                    </div>
                    <div class="footer-section" style="text-align: left!important;">
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
                <c:forEach var="ft" items="${Footer}">
                	<div class="footer-section">
                		<a href="${ft.footer_url}" class="footer-heading">${ft.footer_name}</a><br>
                		<c:forEach var="cft" items="${ChildFooter}"> 
                			<c:if test="${cft.parent_footer_id == ft.footer_id}">
                			<a href="${cft.footer_url}" class="footer-link2">${cft.footer_name}</a><br/></c:if>
                		</c:forEach>
                	</div>
                </c:forEach>
                </div>
                
 <%--                <div class="col-md col-sm col-xs " align="left">
                	<c:forEach var="article" items="${Article}" varStatus="status" end="0">
                	<div class="footer-section">
                		<c:if test="${article.article_type_id == 2}">
                			<a href="${article.page_uri_id}" class="footer-heading" style="text-transform: capitalize;">${article.header_name}</a><br>
                		</c:if>
                		<c:set var="count" value="0" />
                		<c:forEach var="a" items="${Article}" varStatus="status">
                			<c:if test="${a.article_type_id == 2 and count <= 10}">
                			<a href="${a.page_uri_id}" class="footer-link2">${a.topic}</a><br/>
                			<c:set var="count" value="${count + 1}" />
                			</c:if>
                		</c:forEach>
                	</div>
                	</c:forEach>
                </div> --%>
                <div class="col-md col-sm col-xs " align="left">
                	<div class="footer-section">
                		<c:set var="count" value="0"/>
                		<c:forEach var="article" items="${Article}" varStatus="status">
                			<c:if test="${article.article_type_id == 2 and count < 1}">
                				<a href="/${article.header_name}" class="footer-heading" style="text-transform: capitalize;">${article.header_name}</a><br>
                				<c:set var="count" value="${count + 1}"/>
                			</c:if>
                		</c:forEach>
                		<c:set var="count1" value="0" />
                		<c:forEach var="a" items="${Article}">
							<c:if test="${a.article_type_id == 2 and count1 < 10}">
							<a href="${a.page_uri_id}" class="footer-link2">${a.topic}</a><br/>
							<c:set var="count1" value="${count1 + 1}" />
							</c:if>
						</c:forEach>
                	</div>
                </div>
                
                <div class="col-md col-sm col-xs " align="left">
					<div class="footer-section">
					<c:set var="count" value="0"/>
					<c:forEach var="article" items="${Article}" varStatus="status">
						<c:if test="${article.article_type_id == 1 and count < 1}">
							<a href="/${article.header_name}" class="footer-heading" style="text-transform: capitalize;">${article.header_name}</a><br>
							<c:set var="count" value="${count + 1}"/>
						</c:if>
					</c:forEach>
					<c:set var="count1" value="0" />
					<c:forEach var="a" items="${Article}">
						<c:if test="${a.article_type_id == 1 and count1 < 10}">
						<a href="${a.page_uri_id}" class="footer-link2">${a.topic}</a><br/>
						<c:set var="count1" value="${count1 + 1}" />
						</c:if>
					</c:forEach>
					</div>
                </div>
                
            </div>
            <br>
        </div>
        <div class="dropdown2">
        
        	<div align="center">
        		<img src="/pages-front/img/logo/logo2-w.png" alt="Cube SoftTech Co., Ltd." style="width:200px; padding-bottom:16px; ">
                <div class="footer-section">
                	<p class="footer-heading">Cube SoftTech Co., Ltd.</p><br>
                    <a href="https://maps.app.goo.gl/a1N8Xi2qvhbVKFsW8" class="footer-link" target="_blank">
                     	160/170-2, 12A Fl., ITF Silom Palace Building Silom Rd., Suriyawong, Bangrak, Bangkok 10500 Thailand
                    </a>
            	</div>
            </div>
            <div align="left">
            	<button class="btn btn-link text-white d-flex justify-content-between align-items-center w-100 no-underline" 
            	type="button" data-bs-toggle="collapse" data-bs-target="#contactDetails" aria-expanded="false" 
            	aria-controls="contactDetails" id="contactToggle" style="text-decoration:none;">
        			<span><b>Contact Us</b></span>
        			<span id="toggleIconContact" class="bi bi-chevron-right transition"></span>
    			</button>
    			<br>
    			<div class="collapse" id="contactDetails" style="margin-left:12px;">
            	<div class="footer-section2">
                        <p class="footer-heading">Phone</p>
                        <p><a href="tel:026798855" class="footer-link">02 679 8855&nbsp;</a> <a href="tel:026344449" class="footer-link"> &nbsp;02-634-4449 </a>
                        <a href="tel:0880229400" class="footer-link"> &nbsp;088-022-9400</a></p>
                </div>
                    <div class="footer-section2">
                        <p class="footer-heading">E-mail</p>
                        <p><a href="mailto:info@cubesofttech.com" class="footer-link">info@cubesofttech.com</a></p>
                        <p><a href="mailto:hr@cubesofttech.com" class="footer-link">hr@cubesofttech.com</a></p>
                    </div>
					<div class="footer-section2">
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
					</div><br>
					</div>
    				
    				<button class="btn btn-link text-white d-flex justify-content-between align-items-center w-100 no-underline" 
					type="button" data-bs-toggle="collapse" data-bs-target="#servicesDetails" aria-expanded="false" 
					aria-controls="servicesDetails" id="servicesToggle" style="text-decoration:none;">
        				<span><b>Services</b></span>
        				<span id="toggleIconServices" class="bi bi-chevron-right transition"></span>
    				</button>
    				<br>
					<div class="collapse" id="servicesDetails" style="margin-left:12px;">
    					<a href="/services" class="footer-link1">Services</a><br>
                        <a href="/software-development" class="footer-link1">Software Development</a><br>
                        <a href="/it-outsource" class="footer-link1">IT Outsource</a><br>
                        <a href="/mobile-app-development" class="footer-link1">Mobile App Development</a><br>
    				</div>
    				
					<button class="btn btn-link text-white d-flex justify-content-between align-items-center w-100 no-underline" 
					type="button" data-bs-toggle="collapse" data-bs-target="#careersDetails" aria-expanded="false" 
					aria-controls="careersDetails" id="servicesToggle" style="text-decoration:none;">
        				<span><b>Careers</b></span>
        				<span id="toggleIconServices" class="bi bi-chevron-right transition"></span>
    				</button><br>
					<div class="collapse" id="careersDetails" style="margin-left:12px;">
    					<c:forEach var="career" items="${Careers}">
                            <a href="${career.footer_url}" class="footer-link2">${career.footer_name}</a><br/>
                        </c:forEach>
                        <br>
    				</div>
    				
    				<button class="btn btn-link text-white d-flex justify-content-between align-items-center w-100 no-underline" 
					type="button" data-bs-toggle="collapse" data-bs-target="#blogDetails" aria-expanded="false" 
					aria-controls="blogDetails" id="servicesToggle" style="text-decoration:none;">
        				<span><b>Blog</b></span>
        				<span id="toggleIconServices" class="bi bi-chevron-right transition"></span>
    				</button><br>
    				<div class="collapse" id="blogDetails" style="margin-left:12px;">
    					<c:forEach var="blog" items="${Blog}">
                            <a href="${blog.footer_url}" class="footer-link2">${blog.footer_name}</a><br/>
                        </c:forEach>
                        <br>
    				</div>
    				
    				<button class="btn btn-link text-white d-flex justify-content-between align-items-center w-100 no-underline" 
					type="button" data-bs-toggle="collapse" data-bs-target="#newsDetails" aria-expanded="false" 
					aria-controls="newsDetails" id="servicesToggle" style="text-decoration:none;">
        				<span><b>News</b></span>
        				<span id="toggleIconServices" class="bi bi-chevron-right transition"></span>
    				</button><br>
    				<div class="collapse" id="newsDetails" style="margin-left:12px;">
    					<c:forEach var="news" items="${News}">
                            <a href="${news.footer_url}" class="footer-link2">${news.footer_name}</a><br/>
                        </c:forEach>
                        <br>
    				</div>
            </div>
                        
        </div>
        	<div style="border-top: 1px solid #FFFFFF; width: 95%; margin: 0 auto;"></div>
    		<font size="2px" style="color:#FFFFFF;"> © 2024. Cube SoftTech Co., Ltd. All rights reserved.</font>
       </div>
       


</footer>
<!-- Footer -->

<script>
$(document).ready(function () {

    // Event delegation for collapsible buttons
    document.querySelector('.dropdown2').addEventListener('click', function(event) {
        const target = event.target.closest('.btn-link');

        if (target) {
            const toggleIcon = target.querySelector('.bi'); // Select the icon directly
            
            // Close other dropdowns and reset their icons
            const allButtons = document.querySelectorAll('.btn-link');
            allButtons.forEach(button => {
                if (button !== target) {
                    const icon = button.querySelector('.bi');
                    if (icon) {
                        icon.classList.remove('rotate-90'); // Rotate back to right
                    }
                    const collapse = button.getAttribute('data-bs-target');
                    if (collapse) {
                        const collapseElement = document.querySelector(collapse);
                        if (collapseElement) {
                            collapseElement.classList.remove('show'); // Close other dropdowns
                        }
                    }
                }
            });

            // Toggle current dropdown icon
            toggleIcon.classList.toggle('rotate-90');
        }
    });
});

(function() {

    if (window.localStorage) {
        if (!localStorage.getItem('reload')) {
            localStorage.setItem('reload', 'true');
            window.location.reload();
        } else {
            localStorage.removeItem('reload');
        }
    }
})();
</script>


<style>
.bi {
    transition: transform 0.3s ease; /* Smooth transition for rotation */
}

.rotate-90 {
    transform: rotate(90deg); /* Rotate arrow */
}


#footer-section .toggle-icon {
        transition: transform 0.3s ease;
    }
    .rotate-90 {
        transform: rotate(90deg);
    }
    .btn-link.no-underline {
        text-decoration: none; /* Removes the underline */
    }
    .btn-link.no-underline:hover {
        text-decoration: none; /* Prevents underline on hover */
    }

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

.footer-section2 {
		margin-bottom: 20px;
        text-align: left !important;
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
        justify-content: left;
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

@media screen and (max-width: 768px) {

	.footer-link2 {
    width: 400px;
}
	.dropdown1 {
		display: none;
	}
	.footer-heading-dd {
    cursor: pointer;
    font-weight: bold;
    background-color: #007bff; /* Bootstrap primary color */
    color: white;
    padding: 10px; /* Add padding for better spacing */
    border-radius: 5px; /* Rounded corners */
    display: flex; /* Use flexbox */
    justify-content: space-between; /* Space out children */
    align-items: center; /* Center vertically */
    margin-bottom: 5px; /* Space below the heading */
}

.sub-menu {
    margin-left: 15px; /* Indentation for sub-menu */
    display: none; /* Keep it hidden initially */
}

.toggle-icon {
    margin-left: 10px; /* Space between text and icon */
    font-size: 1.5rem; /* Adjust the size */
    transition: transform 0.3s; /* Smooth transition for rotation */
    display: inline-block; /* Make the icon inline-block for rotation */
}


}

@media screen and (min-width: 768px) {
	.dropdown2 {
		display: none;
	}

}


</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

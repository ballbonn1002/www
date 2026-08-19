<!-- New SoftDev -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "${constant.webPath}/"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Software development",
      "item": "${constant.webPath}"
    }
  ]
}
</script>
<style>

* {
	font-family: 'Open Sans', 'Sarabun', 'Noto Sans Thai', sans-serif;
	font-size: 15px;
	scroll-behavior: smooth;
}
.parallax {
	background-image: url("pages-front/img/services/bg2.jpg");
}

.pad{
	padding-left:39px;
}


.parallax2 {
	background-image: url("pages-front/img/services/bgsmall.jpg");
}

@media screen and (max-width: 870px) {
	.vl {
		display: none;
	}
	.imgservices {
        display: block;
        margin: 0 auto;
        text-align: center;
        max-width: 100%;
    }
	.welcomecon {
		margin-left: 5%;
		margin-right: 5%;
		padding-top: 5%;
		padding-bottom: 15px;
	}
	p ,div {
	margin:auto;
	}

}

@media screen and (min-width: 870px) {
	.imgservices2 {
		display: none;
	}

}
</style>


<div class="parallax show-on-scroll">
	<div align="center" class="logoservices" data-aos="fade-up"
		data-aos-duration="800">
		<div class="services-block" style="width:500px;">
    		<h1 style="font-weight:bold;">Software Development</h1>
		</div>
		<br> <font size="5px">Professional IT People ~ Innovative
			IT Solutions<br>
		</font> <font size="3px">IT Staff Outsourcing Services | IT
			consultants | Custom Software Solutions</font> <br> <br>
	</div>

	<div class="welcomebg">
			<div>
				<ul class="breadcrumb">
					<li><a href="/home">Home</a>&nbsp;/&nbsp;</li>
					<li><a href="/services" id="model">Services</a>&nbsp;/&nbsp;</li>
					<li><a class="currentPage">Software Development</a></li>
				</ul>
			</div>
		<div class="welcomecon">
		<div style="padding:40px, 0px, 40px, 0px;">
			<div data-aos="zoom-out-up" data-aos-duration="800">
				<div style="text-align: center;">
    				<img src="/pages-front/img/services/it_developer_bg.jpg" width="60%" height="60%" 
    				alt="software development"
    				style="object-fit: cover; margin-bottom: 50px;">
				</div> 
			</div>
			<div data-aos="zoom-out-up" data-aos-duration="800">
				<h2 style="color:#BD2125; font-weight:bold;">Cube SoftTech บริษัทพัฒนาซอฟต์แวร์ครบวงจร</h2>
			</div>
			<div data-aos="zoom-out-up" data-aos-duration="800">
				<p style="word-break: break-word;">Cube SoftTech เราคือผู้ให้บริการด้าน IT Solution เน้นการสรรหาผู้เชี่ยวชาญด้านไอที 
				พร้อมให้บริการพัฒนาซอฟต์แวร์ ครอบคลุมไปถึงการพัฒนาเว็บไซต์ และเว็บแอปพลิเคชัน และให้คำปรึกษาเกี่ยวกับระบบไอทีครบวงจร</p>
				<br>
			</div>
			<div data-aos="zoom-out-up" data-aos-duration="800">
				เรามุ่งมั่นที่จะพัฒนาระบบการทำงานผ่านการนำเสนอ Solution ที่ล้ำสมัย ด้วยบริการ Software Development
				ที่จะช่วยเพิ่มประสิทธิภาพในการทำงานให้กับทุกองค์กร
				เรามีทีมงานมืออาชีพที่พร้อมให้คำแนะนำระบบซอฟต์แวร์ที่ตอบสนองต่อการทำงานสำหรับองค์กร ด้วยประสบการณ์กว่า
				10 ปี เราสามารถวิเคราะห์ความต้องการของลูกค้าได้อย่างตรงจุด และออกแบบหรือจัดหา <a href="https://www.cubesofttech.com/it-outsource" 
				target="_blank">IT Outsource</a>
				ให้ตรงกับความต้องการสำหรับลูกค้าแต่ละรายโดยเฉพาะ หากคุณกำลังมองหาผู้พัฒนาซอฟต์แวร์ Cube SoftTech
				ยินดีให้บริการ</p>
				<br><br>
			</div>
		</div>
		<div style="padding:40px, 0px, 40px, 0px;">
			<div data-aos="zoom-out-up" data-aos-duration="800">
				<h2 style="color:#BD2125; font-weight:bold;">Software Development คืออะไร</h2>
			</div>
			<div data-aos="zoom-out-up" data-aos-duration="800">
				<p style="word-break: break-word;">Software Development คือการพัฒนาซอฟต์แวร์เพื่อให้รองรับกับการทำงานให้ตอบโจทย์กับเทคโนโลยีที่มีอยู่หลากหลายรูปแบบ เช่น สมาร์ตโฟน,
				คอมพิวเตอร์, แท็บเล็ต และยังครอบคลุมไปถึงแอปพลิเคชันอีกด้วย ทั้งนี้ ก็เพื่อเพิ่มศักยภาพประสิทธิภาพการใช้งานของซอฟต์แวร์ต่าง ๆ
				ให้ใช้งานได้ดีมากยิ่งขึ้น อีกทั้งยังออกแบบการทำงานภายในองค์กรให้ครอบคลุมได้ตามความต้องการ เพื่อยกระดับให้กับองค์กร และธุรกิจของคุณ</p>
				<br><br>
			</div>
		</div>
			
			<div style="padding:40px, 0px, 40px, 0px;">
			<div data-aos="zoom-out-up" data-aos-duration="800">
				<h2 style="color:#BD2125; font-weight:bold;">บริการของเรา</h2>
				<br><br>
			</div>
		
			<div class="row">
        		<div class="col-lg-4 col-sm-12" data-aos="fade-up" data-aos-duration="800">
            		<img src="/pages-front/img/services/softdev_icon/web_design_icon.png" 
            		alt="Responsive image" style="width: 85px; height: 85px; object-fit: cover;" class="imgservices mb-3">
            		<h3 style="color:#BD2125; font-weight:bold;">Custom Web and Mobile Applications</h3>
            		<p style="word-break: break-word; ">บริการออกแบบเว็บไซต์และโมบายแอปพลิเคชัน <a href="https://www.cubesofttech.com/blog/what-is-mobile-application" 
				target="_blank">Mobile application</a> 
            		ยกระดับการดำเนินงานด้วยแอปพลิเคชันบนมือถือและเว็บไซต์ที่ออกแบบเฉพาะสำหรับองค์กรของคุณ
            		เพิ่มประสิทธิภาพและสร้างความประทับใจให้ลูกค้า</p>
        		</div>
        		<div class="col-lg-4 col-sm-12" data-aos="fade-up" data-aos-duration="800">
            		<img src="/pages-front/img/services/softdev_icon/cloudbase_icon.png" 
            		alt="Responsive image" style="width: 85px; height: 85px; object-fit: cover;" class="imgservices mb-3">
            		<h3 style="color:#BD2125; font-weight:bold;">Cloud-Based Solutions</h3>
            		<p style="word-break: break-word;">เพิ่มศักยภาพการทำธุรกิจด้วยโซลูชันคลาวด์
            		ปรับขนาดให้เหมาะสมกับความต้องการของลูกค้า
            		เพื่อสร้างพื้นที่จัดเก็บที่ครอบคลุมกับการทำงานร่วมกันภายในองค์กร
            		และเพิ่มความรวดเร็วในการทำงาน ยกระดับความปลอดภัยของข้อมูลและลดต้นทุนสำหรับค่าใช้จ่ายด้านระบบ IT</p>
        		</div>
        		<div class="col-lg-4 col-sm-12" data-aos="fade-up" data-aos-duration="800">
            		<img src="/pages-front/img/services/softdev_icon/data_analys.png" 
            		alt="Responsive image" style="width: 85px; height: 85px; object-fit: cover;" class="imgservices mb-3">
            		<h3 style="color:#BD2125; font-weight:bold;">Data Analytics and Business Intelligence</h3>
            		<p style="word-break: break-word;">พัฒนา Software Development 
            		ที่จะช่วยรวบรวมข้อมูลเพื่อใช้สำหรับการวิเคราะห์แนวทางในการพัฒนาโปรแกรมและระบบในการทำงานได้ตรงจุดประสงค์มากยิ่งขึ้น
            		เพื่อต่อยอดไปสู่ความสำเร็จทางธุรกิจของลูกค้า</p>
        		</div>
    		<br><br>
    		
    		<div class="row">
        		<div class="col-lg-4 col-sm-12" data-aos="fade-up" data-aos-duration="800">
            		<img src="/pages-front/img/services/softdev_icon/AI_icon.png" 
            		alt="Responsive image" style="width: 85px; height: 85px; object-fit: cover;" class="imgservices mb-3">
            		<h3 style="color:#BD2125; font-weight:bold;">Artificial Intelligence (AI) and Machine Learning (ML) Applications</h3>
            		<p style="word-break: break-word;">บริการที่นำเอาระบบปัญญาประดิษฐ์ช่วยวิเคราะห์และประมวลเพื่อหาผลลัพธ์ที่ดีที่สุดในธุรกิจของลูกค้า 
            		นอกจากนี้ยังควบคู่ไปกับการพัฒนาระบบ Machine Learning 
            		ที่จะช่วยพัฒนาแอปพลิเคชันที่ตอบสนองต่อการทำงานมากที่สุด</p>
        		</div>
        		<div class="col-lg-4 col-sm-12" data-aos="fade-up" data-aos-duration="800">
            		<img src="/pages-front/img/services/softdev_icon/API_icon.png" 
            		alt="Responsive image" style="width: 85px; height: 85px; object-fit: cover;" class="imgservices mb-3">
            		<h3 style="color:#BD2125; font-weight:bold;">API Development and Integration</h3>
            		<p style="word-break: break-word;">การวางระบบระหว่างแพลตฟอร์มต่าง ๆ ภายในองค์กรให้เชื่อมถึงกัน 
            		เพื่อให้เกิดการทำงานที่รวดเร็ว ลดความซับซ้อนในการทำงาน 
            		พร้อมเพิ่มประสิทธิภาพในการทำงานให้ทะลุขีดจำกัด</p>
        		</div>
        		<div class="col-lg-4 col-sm-12" data-aos="fade-up" data-aos-duration="800">
            		<img src="/pages-front/img/services/softdev_icon/Agile_icon.png" 
            		alt="Responsive image" style="width: 85px; height: 85px; object-fit: cover;" class="imgservices mb-3">
            		<h3 style="color:#BD2125; font-weight:bold;">Agile Project Management</h3>
            		<p style="word-break: break-word;">บริการที่ช่วยเพิ่มความรวดเร็วในการบริหารจัดการเครื่องมือต่าง ๆ ภายในองค์กร 
            		ผ่านการวางแผน วิเคราะห์เพื่อให้เกิดประสิทธิภาพ 
            		โดยใช้แพลตฟอร์มที่มีความยืดหยุ่น ที่นักพัฒนาระบบได้ออกแบบมาเป็นที่เรียบร้อยแล้ว</p>
        		</div>
    		</div>
    		</div>
    		</div>

    		
    		<br><br><br><br>
    		<div style="padding:40px, 0px, 40px, 0px !important;">
			<div data-aos="zoom-out-up" data-aos-duration="800">
    			<h2 style="color: #BD2125; font-weight:bold;">เพิ่มประสิทธิภาพของงานซอฟต์แวร์ ด้วยการทำงานอย่างมืออาชีพ</h2>
    			<br>
    		</div>
    		<div data-aos="zoom-out-up" data-aos-duration="800">
        			<p style="margin-bottom:15px">1. การประชุมเริ่มต้น: พบกับลูกค้าเพื่อหารือเกี่ยวกับวิสัยทัศน์ผลิตภัณฑ์และรวบรวมความต้องการเบื้องต้น</p>
        			<p style="margin-bottom:15px">2. การวิเคราะห์ความต้องการ: จัดทำเอกสารความต้องการทั้งหมดทั้งด้านฟังก์ชันและไม่ใช่ฟังก์ชัน</p>
        			<p style="margin-bottom:15px">3. การวิจัยตลาด: ดำเนินการวิจัยเพื่อทำความเข้าใจสภาพการแข่งขันและความต้องการของตลาด</p>
        			<p style="margin-bottom:15px">4. ขั้นตอนการออกแบบ: สร้างไวร์เฟรม โมคอัพ และต้นแบบเพื่อรับข้อเสนอแนะจากลูกค้า</p>
        			<p style="margin-bottom:15px">5. ขั้นตอนการพัฒนา: เริ่มการพัฒนาโดยใช้วิธีการแบบ Agile ด้วยสปรินท์และการทำซ้ำอย่างสม่ำเสมอ</p>
        			<p style="margin-bottom:15px">6. ขั้นตอนการทดสอบ: ดำเนินการทดสอบอย่างละเอียด รวมถึง UAT เพื่อให้แน่ใจว่าผลิตภัณฑ์ตรงตามความต้องการทั้งหมด</p>
        			<p style="margin-bottom:15px">7. การติดตั้ง: ติดตั้งผลิตภัณฑ์ในสภาพแวดล้อมการใช้งานจริง</p>
        			<p style="margin-bottom:15px">8. หลังการเปิดตัว: ให้การสนับสนุน การบำรุงรักษา และรวบรวมข้อเสนอแนะจากผู้ใช้เพื่อการปรับปรุงอย่างต่อเนื่อง</p>
    			<br><br>
			</div>
			</div>
			<div style="padding: 40px 0px !important;">
    <div data-aos="zoom-out-up" data-aos-duration="800">
        <h2 style="color: #BD2125; font-weight:bold;">ตอบโจทย์ทุกความต้องการด้านซอฟต์แวร์กับ Cube SoftTech</h2>
        <br>
    </div>
    <div data-aos="zoom-out-up" data-aos-duration="800">
        <p style="word-break: break-word;">
            Cube SoftTech เราคือผู้ให้บริการรับพัฒนาระบบซอฟต์แวร์ที่เน้นผลลัพธ์ของลูกค้าเป็นเรื่องสำคัญ เรามุ่งมั่นที่จะพัฒนาโซลูชันซอฟต์แวร์ที่ตอบโจทย์กับความต้องการให้กับธุรกิจของคุณ 
            เรามีทีมงานมืออาชีพที่มีประสบการณ์ด้าน Software Development 
            ที่พร้อมให้คำแนะนำและออกแบบนวัตกรรมที่ช่วยขับเคลื่อนให้กับทุกความสำเร็จของคุณ
        </p>
        <br>
    </div>
    
    <div data-aos="zoom-out-up" data-aos-duration="800">
        <div>
            <i class="bi bi-check-circle-fill p-2" style="font-size: 1.2em; vertical-align: middle; color:green"></i> 
            <span style="color:#BD2125; font-weight:bold; word-break: break-all;">Customer-Focused Software Development Services</span>
            <p class="pad">
            เรามุ่งมั่นในการพัฒนาโซลูชันซอฟต์แวร์ที่ตอบสนองความต้องการเฉพาะของธุรกิจคุณ 
            ด้วยทีมผู้เชี่ยวชาญที่เข้าใจความท้าทายและเป้าหมายของคุณอย่างลึกซึ้ง พร้อมสร้างสรรค์นวัตกรรมเพื่อขับเคลื่อนความสำเร็จของคุณ
        	</p>
        </div>
        

        <div>
            <i class="bi bi-check-circle-fill p-2" style="font-size: 1.2em; vertical-align: middle; color:green"></i> 
            <span style="color:#BD2125; font-weight:bold; word-break: break-all;">Custom Web and Mobile Applications</span>      
            <p class="pad">
            แอปพลิเคชันเว็บและมือถือแบบกำหนดเอง พัฒนาแอปพลิเคชันที่ออกแบบมาเฉพาะสำหรับธุรกิจของคุณ ทั้งบนเว็บและมือถือ 
            ด้วยประสบการณ์ผู้ใช้ที่ยอดเยี่ยมและฟังก์ชันการทำงานที่ตรงตามความต้องการของคุณอย่างแท้จริง
        	</p>
        </div>

        <div>
            <i class="bi bi-check-circle-fill p-2" style="font-size: 1.2em; vertical-align: middle; color:green"></i> 
            <span style="color:#BD2125; font-weight:bold; word-break: break-all;">Data Analytics and Business Intelligence</span>
            <p class="pad">
            การวิเคราะห์ข้อมูลและธุรกิจอัจฉริยะ แปลงข้อมูลให้เป็นข้อมูลเชิงลึกที่มีคุณค่า เพื่อการตัดสินใจทางธุรกิจที่ชาญฉลาด
        	</p>
        </div>

        <div>
            <i class="bi bi-check-circle-fill p-2" style="font-size: 1.2em; vertical-align: middle; color:green"></i> 
            <span style="color:#BD2125; font-weight:bold; word-break: break-word;">Artificial Intelligence (AI) and Machine Learning (ML) Applications</span>
            <p class="pad">
            แอปพลิเคชัน AI และ Machine Learning นำเทคโนโลยี AI และ ML มาใช้เพื่อเพิ่มประสิทธิภาพและสร้างนวัตกรรมให้กับธุรกิจของคุณ
        	</p>
        </div>

        <div>
            <i class="bi bi-check-circle-fill p-2" style="font-size: 1.2em; vertical-align: middle; color:green"></i> 
            <span style="color:#BD2125; font-weight:bold; word-break: break-all;">API Development and Integration</span>
            <p class="pad">
            การพัฒนาและบูรณาการ API เชื่อมต่อระบบและบริการต่างๆ เข้าด้วยกันอย่างราบรื่นด้วย API ที่ออกแบบมาอย่างดี
        	</p>
        </div>

        <div>
            <i class="bi bi-check-circle-fill p-2" style="font-size: 1.2em; vertical-align: middle; color:green"></i> 
            <span style="color:#BD2125; font-weight:bold; word-break: break-all;">Agile Project Management</span>
            <p class="pad">
            การบริหารโครงการแบบ Agile ใช้วิธีการ Agile เพื่อความยืดหยุ่น การส่งมอบที่รวดเร็ว และการปรับปรุงอย่างต่อเนื่อง
        	</p>
        </div>
    </div>
</div>
			<div data-aos="zoom-out-up" data-aos-duration="800">
				<p>หากคุณต้องการพัฒนาระบบเพื่อเพิ่มประสิทธิภาพและยกระดับการทำงานให้กับองค์กรของคุณ สามารถติดต่อเราเพื่อรับคำแนะนำจากทีมงานมืออาชีพได้ทันที</p>	
			</div>		
	</div>
</div>
</div>

<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap&subset=latin,thai" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Thai:wght@100..900&display=swap" rel="stylesheet">

<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
	
<script>
	document.addEventListener('DOMContentLoaded', function() {
		AOS.init();
	});
	window.onscroll = function () { scrollFunction() };
	
	function scrollFunction() {
		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			document.getElementById("myBtn").style.display = "block";
		} else {
			document.getElementById("myBtn").style.display = "none";
		}
	}
	
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
	
	function showNav() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}
	
</script>
	
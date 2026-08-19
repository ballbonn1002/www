<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="comp"%>

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
      "name": "Services",
      "item": "${constant.webPath}/services"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Mobile App Development",
      "item": "${constant.webPath}/mobile-app-development"
    }
  ]
}
</script>

<style type="text/css">
.appdev-header {
	padding-top: calc(3% + var(--navbar-offset, 80px));
	padding-left: 10%;
	padding-right: 10%;
}

.appdev-hero {
	position: relative;
	height: 75vh;
	min-height: 420px;
	display: flex;
	align-items: center;
	background-image: url("/pages-front/img/redesign/services/app-dev-intro.png");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

.appdev-hero__overlay {
	position: absolute;
	inset: 0;
	background: linear-gradient(90deg, rgba(15, 14, 18, 0.88) 0%, rgba(15, 14, 18, 0.75) 52%, rgba(15, 14, 18, 0.4) 100%);
}

.appdev-hero__content {
	position: relative;
	z-index: 1;
	max-width: 860px;
	padding: 0 10%;
}

.appdev-hero__title {
	margin: 0 0 24px;
	font-size: 40px;
	font-weight: 700;
	line-height: 1.3;
	color: #FFFFFF;
}

.appdev-hero__body {
	margin: 0 0 16px;
	font-size: 16px;
	line-height: 1.6;
	color: rgba(255, 255, 255, 0.9);
}

/* Grid, not flex - same fix as software_dev.jsp (flex let text squeeze the image). */
.appdev-definition {
	max-width: 1360px;
	margin: 0 auto;
	padding: 96px 80px;
	display: grid;
	grid-template-columns: 1fr 480px;
	align-items: center;
	gap: 72px;
}

.appdev-definition__text {
	min-width: 0;
}

.appdev-definition__title {
	margin: 0 0 24px;
	font-size: 32px;
	font-weight: 800;
	line-height: 1.3;
	color: #000000;
}

.appdev-definition__body {
	margin: 0;
	font-size: 17px;
	line-height: 1.7;
	color: #3F3F3F;
}

.appdev-definition__image {
	width: 100%;
	height: 320px;
	border-radius: 16px;
	object-fit: cover;
}

.appdev-section-heading {
	max-width: 900px;
	margin: 0 auto 40px;
	padding: 0 80px;
	text-align: center;
}

.appdev-section-heading__title {
	margin: 0 0 16px;
	font-size: 40px;
	font-weight: 700;
	line-height: 1.25;
	color: var(--brand-red);
}

.appdev-section-heading__body {
	margin: 0;
	font-size: 16px;
	line-height: 1.5;
	color: #000000;
}

.appdev-types {
	background-color: #F1F1F1;
	padding: 96px 0;
}

.appdev-types__grid {
	max-width: 1000px;
	margin: 0 auto;
	padding: 0 80px;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 24px;
}

.appdev-card,
.appdev-feature-card {
	min-width: 0;
	border-radius: 10px;
	background-color: #FFFFFF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
}

.appdev-card {
	padding: 32px;
}

.appdev-card__icon {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 46px;
	height: 46px;
	margin-bottom: 20px;
	border-radius: 12px;
	background-color: rgba(var(--brand-red-rgb), 0.08);
	font-size: 20px;
	color: var(--brand-red);
}

.appdev-card__title {
	margin: 0 0 12px;
	font-size: 20px;
	font-weight: 700;
	color: #000000;
}

.appdev-card__desc {
	margin: 0;
	font-size: 15px;
	line-height: 1.7;
	color: #3F3F3F;
}

.appdev-process {
	background-color: #F7F7F7;
	padding: 96px 0;
}

.appdev-process__grid {
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 80px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 24px;
}

.appdev-feature-card {
	padding: 32px 24px;
	text-align: center;
}

.appdev-feature-card__badge {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 56px;
	height: 56px;
	margin: 0 auto 16px;
	border-radius: 50%;
	color: #FFFFFF;
	font-size: 22px;
}

.appdev-feature-card__title {
	margin: 0 0 8px;
	font-size: 17px;
	font-weight: 700;
	color: #000000;
}

.appdev-feature-card__desc {
	margin: 0;
	font-size: 14px;
	line-height: 1.6;
	color: #3F3F3F;
}

.appdev-reasons {
	background-color: #F1F1F1;
	padding: 96px 0;
}

.appdev-reasons__grid {
	max-width: 1000px;
	margin: 0 auto;
	padding: 0 80px;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 24px;
}

.appdev-usecases {
	background-color: #F7F7F7;
	padding: 96px 0;
}

.appdev-usecases__grid {
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 80px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 24px;
}

/* Same fix as software_dev.jsp - stack earlier so text doesn't get squeezed. */
@media screen and (max-width: 1040px) {
	.appdev-definition {
		grid-template-columns: 1fr;
		padding: 56px 5%;
		gap: 32px;
	}
}

@media screen and (max-width: 870px) {
	.appdev-hero {
		height: auto;
		min-height: 0;
		padding: 80px 0;
		background-attachment: scroll;
	}
	.appdev-hero__content {
		padding: 0 5%;
	}
	.appdev-hero__title {
		font-size: 28px;
	}
	.appdev-definition__title {
		font-size: 26px;
	}
	.appdev-section-heading {
		padding: 0 5%;
	}
	.appdev-section-heading__title {
		font-size: 28px;
	}
	.appdev-types {
		padding: 56px 0;
	}
	.appdev-types__grid {
		grid-template-columns: 1fr;
		padding: 0 5%;
	}
	.appdev-process {
		padding: 56px 0;
	}
	.appdev-process__grid {
		grid-template-columns: 1fr;
		padding: 0 5%;
	}
	.appdev-reasons {
		padding: 56px 0;
	}
	.appdev-reasons__grid {
		grid-template-columns: 1fr;
		padding: 0 5%;
	}
	.appdev-usecases {
		padding: 56px 0;
	}
	.appdev-usecases__grid {
		grid-template-columns: 1fr;
		padding: 0 5%;
	}
	.appdev-cta {
		padding: 56px 5%;
	}
	.appdev-cta__card {
		padding: 32px 24px;
	}
}

.appdev-cta {
	padding: 96px 80px;
}

.appdev-cta__card {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	gap: 24px;
	padding: 56px;
	border-radius: 14px;
	text-align: center;
	background: linear-gradient(90deg, var(--brand-red-dark) 0%, var(--brand-red) 100%);
}

.appdev-cta__title {
	margin: 0 0 16px;
	font-size: 32px;
	font-weight: 700;
	line-height: 1.25;
	color: #FFFFFF;
}

.appdev-cta__body {
	max-width: 690px;
	margin: 0 auto 32px;
	font-size: 16px;
	line-height: 1.5;
	color: #FFFFFF;
}

.appdev-cta__button {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 16px 40px;
	border-radius: 10px;
	background-color: #FFFFFF;
	color: var(--brand-red) !important;
	font-size: 16px;
	font-weight: 600;
	text-decoration: none;
}

.appdev-cta__button:hover {
	color: var(--brand-red) !important;
	text-decoration: none;
	opacity: 0.9;
}
</style>

<div class="appdev-header">
	<comp:pageHeader label="Mobile App Development" parentLabel="Services" parentHref="/services" />
</div>

<section class="appdev-hero">
	<div class="appdev-hero__overlay"></div>
	<div class="appdev-hero__content">
		<h2 class="appdev-hero__title">บริการพัฒนาแอปพลิเคชันบนสมาร์ตโฟนสำหรับองค์กรโดยผู้เชี่ยวชาญมากประสบการณ์</h2>
		<p class="appdev-hero__body">เพิ่มขีดจำกัดในการแข่งขันทางธุรกิจ
			พร้อมก้าวสู่ความสำเร็จ ด้วยการพัฒนา Mobile App
			Development กับทีมพัฒนาซอฟต์แวร์มืออาชีพ
			ลดภาระงานในองค์กร เพิ่มประสิทธิภาพการทำงาน
			และมอบประสบการณ์ที่ดีให้กับลูกค้าของคุณ</p>
	</div>
</section>

<section class="appdev-definition">
	<div class="appdev-definition__text" data-aos="fade-up">
		<h2 class="appdev-definition__title">Mobile App
			Development คืออะไร ?</h2>
		<p class="appdev-definition__body">Mobile App Development
			คือกระบวนการออกแบบและสร้างแอปพลิเคชันที่ใช้กับสมาร์ตโฟนหรือแท็บเล็ตที่สามารถใช้ได้ทั้งสำหรับระบบปฏิบัติการ
			iOS และ Android
			มีกระบวนการตั้งแต่การวางแผน การออกแบบ
			พัฒนาและทดสอบก่อนใช้งานจริง
			ซึ่งการพัฒนาแอปพลิเคชันบนมือถือนั้นจะมีการคำนึงถึงปัจจัยต่าง
			ๆ ไม่ว่าจะเป็นการรองรับการใช้งาน การออกแบบ UX/UI
			และประสิทธิภาพของการใช้งาน
			รวมถึงความปลอดภัยของข้อมูลผู้ใช้งานอีกด้วย</p>
	</div>
	<img class="appdev-definition__image" data-aos="fade-up"
		data-aos-delay="150"
		src="/pages-front/img/redesign/services/app-dev-definition.jpg"
		alt="Mobile App Development illustration">
</section>

<section class="appdev-types">
	<div class="appdev-section-heading" data-aos="fade-up">
		<h2 class="appdev-section-heading__title">4
			รูปแบบการทำ Mobile App Development</h2>
		<p class="appdev-section-heading__body no-orphan">เรามีทีมงานมืออาชีพที่พร้อมให้คำแนะนำระบบซอฟต์แวร์ที่ตอบสนองต่อการทำงานสำหรับองค์กร
			ด้วยประสบการณ์กว่า 10 ปี</p>
	</div>
	<div class="appdev-types__grid">
		<div class="appdev-card" data-aos="fade-up">
			<span class="appdev-card__icon" aria-hidden="true"><i
				class="bi bi-globe2"></i></span>
			<h3 class="appdev-card__title">Progressive Web
				Applications</h3>
			<p class="appdev-card__desc">เว็บไซต์ที่ถูกพัฒนาขึ้นเพื่อให้สามารถทำงานเสมือนแอปพลิเคชันที่ต้องดาวน์โหลดลงเครื่องมากที่สุด
				สามารถทำงานแบบออฟไลน์ได้
				ดาวน์โหลด พร้อม
				ตอบสนองได้อย่างรวดเร็ว
				สามารถเพิ่มลิงก์บนหน้าจอหลักเพื่อใช้งานคล้ายแอปพลิเคชัน
				โดยที่ไม่จำเป็นต้องติดตั้งจาก App Store
				แถมยังสามารถใช้งาน Push Notification ได้อีกด้วย</p>
		</div>
		<div class="appdev-card" data-aos="fade-up" data-aos-delay="100">
			<span class="appdev-card__icon" aria-hidden="true"><i
				class="bi bi-phone"></i></span>
			<h3 class="appdev-card__title">Native Mobile
				Applications</h3>
			<p class="appdev-card__desc">Native Mobile Application
				หรือ Native App
				คือการพัฒนาแอปพลิเคชันบนสมาร์ตโฟนโดยใช้ภาษาเฉพาะตามที่ผู้พัฒนาอุปกรณ์ได้จัดทำขึ้น
				เช่น iOS สำหรับอุปกรณ์ Apple ใช้ Object C หรือ Swift
				บน XCode หรือ Android ที่จะใช้ Java บน Android
				Studio เป็นต้น</p>
		</div>
		<div class="appdev-card" data-aos="fade-up">
			<span class="appdev-card__icon" aria-hidden="true"><i
				class="bi bi-phone-flip"></i></span>
			<h3 class="appdev-card__title">Cross-Platform Native
				Mobile Applications</h3>
			<p class="appdev-card__desc">การพัฒนา Mobile Application
				ให้สามารถใช้งานได้แบบ Cross-Platform เช่น
				การทำให้ระบบปฏิบัติการ iOS และ Android
				สามารถใช้งานได้โดยที่ใช้ฐานโค้ดเดียวกัน
				รูปแบบนี้จะช่วยให้ประหยัดต้นทุนสำหรับการพัฒนาแอปพลิเคชันได้มากยิ่งขึ้น</p>
		</div>
		<div class="appdev-card" data-aos="fade-up" data-aos-delay="100">
			<span class="appdev-card__icon" aria-hidden="true"><i
				class="bi bi-shuffle"></i></span>
			<h3 class="appdev-card__title">Hybrid Applications</h3>
			<p class="appdev-card__desc">ทำทุกอย่างให้ง่ายขึ้นด้วยการพัฒนา
				Mobile Application แบบ Hybrid Application
				ลูกผสมระหว่าง Native และ Web Application
				ที่จะทำให้คุณสามารถใช้งานแอปพลิเคชันได้ทุกแพลตฟอร์มจากการเขียนโค้ดเพียงชุดเดียว
				มีข้อดีทั้งประหยัดเวลาในการพัฒนาแอปพลิเคชัน
				ประหยัดต้นทุน อัปเดตง่าย และใช้งานได้อย่างเต็มที่</p>
		</div>
	</div>
</section>

<section class="appdev-process">
	<div class="appdev-section-heading" data-aos="fade-up">
		<h2 class="appdev-section-heading__title">กระบวนการทำ
			Mobile App Development กับ CubeSoftTech</h2>
		<p class="appdev-section-heading__body">เราใช้กระบวนการพัฒนาที่เป็นมาตรฐานสากล
			เพื่อให้แน่ใจว่าแอปพลิเคชันของคุณจะมีคุณภาพสูงสุด</p>
	</div>
	<div class="appdev-process__grid">
		<div class="appdev-feature-card" data-aos="fade-up">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #2C74F2 0%, #1BC6FF 100%);"><i
				class="bi bi-clipboard-data"></i></span>
			<h3 class="appdev-feature-card__title">การวางแผนและวิเคราะห์ความต้องการ
				(Planning and Requirement Analysis)</h3>
			<p class="appdev-feature-card__desc">กำหนดเป้าหมายหลักของแอพพลิเคชัน
				เช่น ฟังก์ชันที่ต้องการ วัตถุประสงค์ทางธุรกิจ
				รวมรวมและวิเคราะห์ความต้องการของผู้ใช้และธุรกิจเพื่อให้แน่ใจว่าแอพพลิเคชันที่พัฒนาขึ้นจะตอบสนองความต้องการเหล่านั้นได้</p>
		</div>
		<div class="appdev-feature-card" data-aos="fade-up" data-aos-delay="100">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #963AF1 0%, #DA2D8F 100%);"><i
				class="bi bi-palette2"></i></span>
			<h3 class="appdev-feature-card__title">การออกแบบ
				(Design)</h3>
			<p class="appdev-feature-card__desc">ออกแบบ UI/UX
				สร้างต้นแบบ (wireframes) และ mockups
				เพื่อแสดงภาพลักษณ์และโครงสร้างของแอป
				กำหนดโครงสร้างของระบบ
				รวมถึงการออกแบบฐานข้อมูลและการเชื่อมต่อกับเซิร์ฟเวอร์</p>
		</div>
		<div class="appdev-feature-card" data-aos="fade-up" data-aos-delay="200">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #2BAE6A 0%, #D6FF6F 100%);"><i
				class="bi bi-code-slash"></i></span>
			<h3 class="appdev-feature-card__title">การพัฒนา
				(Development)</h3>
			<p class="appdev-feature-card__desc">เริ่มการเขียนโค้ดแอปพลิเคชันตามแบบที่ออกแบบไว้
				โดยพิจารณาถึงความยืดหยุ่นและประสิทธิภาพ
				การบูรณาการ
				ทำการบูรณาการส่วนต่างๆ ของแอป เช่น ฐานข้อมูล,
				API, และบริการอื่นๆ ที่จำเป็น</p>
		</div>
		<div class="appdev-feature-card" data-aos="fade-up">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #FE0A3F 0%, #F58C8C 100%);"><i
				class="bi bi-bug"></i></span>
			<h3 class="appdev-feature-card__title">การทดสอบ
				(Testing)</h3>
			<p class="appdev-feature-card__desc">ทดสอบฟังก์ชันต่างๆ
				ของแอปเพื่อให้แน่ใจว่าทำงานได้ถูกต้อง
				ตรวจสอบประสิทธิภาพของแอปในสถานการณ์ต่างๆ เช่น
				การโหลดหนักหรือการเชื่อมต่ออินเทอร์เน็ตที่ไม่เสถียร
				ตรวจสอบความปลอดภัยของแอป
				เพื่อป้องกันการเข้าถึงข้อมูลที่ไม่ได้รับอนุญาต</p>
		</div>
		<div class="appdev-feature-card" data-aos="fade-up" data-aos-delay="100">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #29AB9D 0%, #26F393 100%);"><i
				class="bi bi-rocket-takeoff"></i></span>
			<h3 class="appdev-feature-card__title">การปรับปรุงและปรับแต่ง
				(Deployment and Maintenance)</h3>
			<p class="appdev-feature-card__desc">ทำการเผยแพร่แอปพลิเคชันไปยังแพลตฟอร์มต่างๆ
				เช่น App Store หรือ Google Play Store
				ทำการอัปเดตและปรับปรุงแอปตามคำติชมของผู้ใช้
				และความต้องการใหม่ๆ</p>
		</div>
		<div class="appdev-feature-card" data-aos="fade-up" data-aos-delay="200">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #F15E0A 0%, #FFB07F 100%);"><i
				class="bi bi-headset"></i></span>
			<h3 class="appdev-feature-card__title">การสนับสนุนและอัปเดต
				(Support and Updates)</h3>
			<p class="appdev-feature-card__desc">จัดทีมสนับสนุนเพื่อช่วยแก้ไขปัญหาและตอบคำถามจากผู้ใช้
				ทำการอัปเดตแอปเป็นประจำ
				เพื่อปรับปรุงฟีเจอร์และแก้ไขบั๊ก</p>
		</div>
	</div>
</section>

<section class="appdev-reasons">
	<div class="appdev-section-heading" data-aos="fade-up">
		<h2 class="appdev-section-heading__title">เหตุผลที่ควรทำ
			Mobile App Development กับ CubeSoftTech</h2>
		<p class="appdev-section-heading__body">เราคือพาร์ทเนอร์ที่เหมาะสมสำหรับการพัฒนาแอปพลิเคชันมือถือของคุณ
			ด้วยประสบการณ์และความเชี่ยวชาญที่<span style="white-space: nowrap;">สั่งสมมา</span></p>
	</div>
	<div class="appdev-reasons__grid">
		<div class="appdev-card" data-aos="fade-up">
			<span class="appdev-card__icon" aria-hidden="true"><i
				class="bi bi-award"></i></span>
			<h3 class="appdev-card__title">ความเชี่ยวชาญในการพัฒนา</h3>
			<p class="appdev-card__desc">การพัฒนา Mobile
				Application กับผู้เชี่ยวชาญจะช่วยให้แอปที่ได้มีคุณภาพ
				สามารถทำงานได้อย่างมีประสิทธิภาพ</p>
		</div>
		<div class="appdev-card" data-aos="fade-up" data-aos-delay="100">
			<span class="appdev-card__icon" aria-hidden="true"><i
				class="bi bi-code-square"></i></span>
			<h3 class="appdev-card__title">รูปแบบการทำงานที่หลากหลาย</h3>
			<p class="appdev-card__desc">เราสามารถเขียนโปรแกรมได้หลายภาษา
				ไม่ว่าจะเป็น Java, J2EE, JSP, Servlet ASP.NET, VB,
				VC#, PHP, HTML, AJAX, jQuery, XML เพื่อสร้าง Mobile
				App ได้ทุกระบบปฏิบัติการ</p>
		</div>
		<div class="appdev-card" data-aos="fade-up">
			<span class="appdev-card__icon" aria-hidden="true"><i
				class="bi bi-gear-wide-connected"></i></span>
			<h3 class="appdev-card__title">มีบริการที่ครอบคลุม</h3>
			<p class="appdev-card__desc">ดูแลตั้งแต่ต้นจนจบ
				ตั้งแต่การให้คำปรึกษา การวางแผน ออกแบบ พัฒนา
				และการติดตามประสิทธิภาพการทำงานของแอปพลิเคชันให้สามารถทำงานได้เต็มประสิทธิภาพ</p>
		</div>
		<div class="appdev-card" data-aos="fade-up" data-aos-delay="100">
			<span class="appdev-card__icon" aria-hidden="true"><i
				class="bi bi-piggy-bank"></i></span>
			<h3 class="appdev-card__title">ช่วยประหยัดทรัพยากรได้มากกว่า</h3>
			<p class="appdev-card__desc">การเลือกใช้บริการทำ Mobile
				App Development
				กับองค์กรที่มีความเชี่ยวชาญจะช่วยลดต้นทุนและประหยัดเวลาในการพัฒนาแอปพลิเคชันได้มากกว่า
				อีกทั้งยังช่วยให้พนักงานในองค์กรของคุณสามารถโฟกัสกับหน้าที่หลักได้อย่างมีประสิทธิภาพ</p>
		</div>
	</div>
</section>

<section class="appdev-usecases">
	<div class="appdev-section-heading" data-aos="fade-up">
		<h2 class="appdev-section-heading__title">Mobile App
			Development เพื่อธุรกิจของคุณ</h2>
		<p class="appdev-section-heading__body">เราพัฒนาแอปพลิเคชันสำหรับทุกประเภทธุรกิจ
			ตอบสนองความต้องการเฉพาะของแต่ละอุตสาหกรรม</p>
	</div>
	<div class="appdev-usecases__grid">
		<div class="appdev-feature-card" data-aos="fade-up">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #2C74F2 0%, #1BC6FF 100%);"><i
				class="bi bi-cart"></i></span>
			<h3 class="appdev-feature-card__title">Retail
				(E-Commerce / Stock Management)</h3>
			<p class="appdev-feature-card__desc">การสร้างระบบหน้าร้านเพื่อการเพิ่มยอดการขายที่มากขึ้น
				สร้าง Brand Loyalty
				หรือส่วนหลังบ้านก็สามารถช่วยจัดการสต๊อกสินค้าได้อย่างเป็นระบบ</p>
		</div>
		<div class="appdev-feature-card" data-aos="fade-up" data-aos-delay="100">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #963AF1 0%, #DA2D8F 100%);"><i
				class="bi bi-mortarboard"></i></span>
			<h3 class="appdev-feature-card__title">Education
				(E-Learning / Teaching and Learning Management)</h3>
			<p class="appdev-feature-card__desc">การเรียนรู้จะไม่จบแค่ในห้องเรียนเท่านั้น
				เพราะสามารถใช้แอปพลิเคชันเป็นสื่อการเรียนรู้ที่มีประสิทธิภาพได้
				หรืออาจทำระบบวัดระดับความรู้และวัดประสิทธิภาพหลังการเรียนได้ด้วย</p>
		</div>
		<div class="appdev-feature-card" data-aos="fade-up" data-aos-delay="200">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #2BAE6A 0%, #D6FF6F 100%);"><i
				class="bi bi-film"></i></span>
			<h3 class="appdev-feature-card__title">Entertainment
				and Media</h3>
			<p class="appdev-feature-card__desc">สามารถเผยแพร่เนื้อหาบันเทิง
				ไม่ว่าจะเป็นหนัง ซีรีส์ เพลง หรืออื่น ๆ
				ได้ผ่านแอปพลิเคชัน
				ให้ผู้ใช้งานสามารถรับชมได้ทุกที่ทุกเวลา
				และสามารถปรับเนื้อหาแสดงตามความสนใจของผู้ใช้</p>
		</div>
		<div class="appdev-feature-card" data-aos="fade-up">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #FE0A3F 0%, #F58C8C 100%);"><i
				class="bi bi-airplane"></i></span>
			<h3 class="appdev-feature-card__title">Travel (Booking
				/ Traveling)</h3>
			<p class="appdev-feature-card__desc">ช่วยให้ผู้ใช้งานสามารถค้นหาและจองที่พัก
				ตั๋วเดินทาง หรือทัวร์ท่องเที่ยวได้สะดวกในที่เดียว
				พร้อมแจ้งเตือนตารางการเดินทาง
				และแนะนำสถานที่ท่องเที่ยวที่น่าสนใจแบบเรียลไทม์</p>
		</div>
		<div class="appdev-feature-card" data-aos="fade-up" data-aos-delay="100">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #29AB9D 0%, #26F393 100%);"><i
				class="bi bi-bank"></i></span>
			<h3 class="appdev-feature-card__title">Financial
				Services (Banking / Investment)</h3>
			<p class="appdev-feature-card__desc">สามารถทำธุรกรรมการเงินได้ง่ายเพียงแค่ปลายนิ้ว
				พร้อมระบบความปลอดภัยสูงสุด</p>
		</div>
		<div class="appdev-feature-card" data-aos="fade-up" data-aos-delay="200">
			<span class="appdev-feature-card__badge"
				style="background: linear-gradient(90deg, #F15E0A 0%, #FFB07F 100%);"><i
				class="bi bi-heart-pulse"></i></span>
			<h3 class="appdev-feature-card__title">Healthcare</h3>
			<p class="appdev-feature-card__desc">ช่วยให้เข้าถึงการให้บริการด้านสุขภาพง่ายยิ่งขึ้น
				ไม่ว่าจะเป็นการให้คำปรึกษาทางการแพทย์หรือติดตามอาการผู้ป่วยแบบเรียลไทม์</p>
		</div>
	</div>
</section>

<section class="appdev-cta">
	<div class="appdev-cta__card">
		<div>
			<h2 class="appdev-cta__title">Have a Mobile App Idea?</h2>
			<p class="appdev-cta__body">Let's talk about how we can turn it into a
				working product.</p>
			<a class="appdev-cta__button" href="/contacts">Contact Us</a>
		</div>
	</div>
</section>

<comp:scrollToTopButton />

<script>
	document.addEventListener('DOMContentLoaded', function() {
		AOS.init({
			once : true
		});
	});
</script>

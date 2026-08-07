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
      "name": "Software Development",
      "item": "${constant.webPath}/software-development"
    }
  ]
}
</script>

<style type="text/css">
.softdev-header {
	padding-top: calc(3% + var(--navbar-offset, 80px));
	padding-left: 10%;
	padding-right: 10%;
}

.softdev-hero {
	position: relative;
	height: 75vh;
	min-height: 420px;
	display: flex;
	align-items: center;
	background-image: url("/pages-front/img/redesign/services/software-dev-intro.png");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

.softdev-hero__overlay {
	position: absolute;
	inset: 0;
	background: linear-gradient(90deg, rgba(15, 14, 18, 0.88) 0%, rgba(15, 14, 18, 0.75) 52%, rgba(15, 14, 18, 0.4) 100%);
}

.softdev-hero__content {
	position: relative;
	z-index: 1;
	max-width: 860px;
	padding: 0 10%;
}

.softdev-hero__title {
	margin: 0 0 24px;
	font-size: 48px;
	font-weight: 700;
	line-height: 1.25;
	color: #FFFFFF;
}

.softdev-hero__body {
	margin: 0 0 16px;
	font-size: 16px;
	line-height: 1.6;
	color: rgba(255, 255, 255, 0.9);
}

/* Grid, not flex - fixed 480px image column + flexible text column is much
   more predictable than flex-basis auto-sizing, which let a long Thai
   paragraph's max-content width squeeze the image down on wider screens
   (Thai wraps less predictably than English at the same basis). */
.softdev-definition {
	max-width: 1360px;
	margin: 0 auto;
	padding: 96px 80px;
	display: grid;
	grid-template-columns: 1fr 480px;
	align-items: center;
	gap: 72px;
}

.softdev-definition__text {
	min-width: 0;
}

.softdev-definition__title {
	margin: 0 0 24px;
	font-size: 36px;
	font-weight: 800;
	line-height: 1.3;
	color: #000000;
}

.softdev-definition__body {
	margin: 0;
	font-size: 17px;
	line-height: 1.7;
	color: #3F3F3F;
}

.softdev-definition__image {
	width: 100%;
	height: 320px;
	border-radius: 16px;
	object-fit: cover;
}

.softdev-eyebrow {
	display: block;
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 80px;
	font-size: 12px;
	font-weight: 700;
	letter-spacing: 0.08em;
	text-transform: uppercase;
	color: #C41216;
}

.softdev-section-heading {
	max-width: 900px;
	margin: 0 auto 40px;
	padding: 0 80px;
	text-align: center;
}

.softdev-section-heading__title {
	margin: 0 0 16px;
	font-size: 48px;
	font-weight: 700;
	line-height: 1.25;
	color: #C41216;
}

.softdev-section-heading__body {
	margin: 0;
	font-size: 16px;
	line-height: 1.5;
	color: #000000;
}

.softdev-services {
	max-width: 1360px;
	margin: 0 auto;
	padding: 16px 80px 96px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 24px;
}

.softdev-card,
.softdev-step {
	min-width: 0;
	border-radius: 10px;
	background-color: #FFFFFF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
}

.softdev-card {
	padding: 32px;
}

.softdev-card__icon {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 46px;
	height: 46px;
	margin-bottom: 20px;
	border-radius: 12px;
	background-color: rgba(196, 18, 22, 0.08);
	font-size: 20px;
	color: #C41216;
}

.softdev-card__title {
	margin: 0 0 12px;
	font-size: 22px;
	font-weight: 700;
	color: #000000;
}

.softdev-card__desc {
	margin: 0 0 16px;
	font-size: 15px;
	line-height: 1.7;
	color: #3F3F3F;
}

.softdev-card__tags {
	margin: 0;
	padding: 0;
	list-style: none;
	font-size: 14px;
	line-height: 1.7;
	color: #3F3F3F;
}

.softdev-card__tags li {
	position: relative;
	padding-left: 22px;
}

.softdev-card__tags li::before {
	content: "\2713";
	position: absolute;
	left: 0;
	top: 0;
	color: #C41216;
	font-weight: 700;
}

.softdev-steps {
	background-color: #F7F7F7;
	padding: 96px 0;
}

.softdev-steps__grid {
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 80px;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 24px;
}

.softdev-step {
	padding: 32px 24px;
	text-align: center;
}

.softdev-step__badge {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 56px;
	height: 56px;
	margin: 0 auto 16px;
	border-radius: 50%;
	color: #FFFFFF;
	font-size: 20px;
	font-weight: 700;
}

.softdev-step__title {
	margin: 0 0 8px;
	font-size: 17px;
	font-weight: 700;
	color: #000000;
}

.softdev-step__desc {
	margin: 0;
	font-size: 14px;
	line-height: 1.6;
	color: #3F3F3F;
}

.softdev-checklist {
	background-color: #F1F1F1;
	padding: 96px 0;
}

.softdev-checklist__items {
	max-width: 1000px;
	margin: 0 auto;
	padding: 0 80px;
	display: flex;
	flex-direction: column;
	gap: 32px;
}

.softdev-checklist__item-title {
	display: flex;
	align-items: center;
	gap: 12px;
	margin: 0 0 8px;
	font-size: 18px;
	font-weight: 700;
	color: #000000;
}

.softdev-checklist__item-title i {
	color: #C41216;
	font-size: 20px;
}

.softdev-checklist__item-desc {
	margin: 0;
	font-size: 15px;
	line-height: 1.7;
	color: #3F3F3F;
}

/* Image column is a fixed 480px track that never shrinks, so the text
   column (1fr) absorbs the entire squeeze as the viewport narrows - stack
   to column at 1040px (where text would drop below ~320px, the minimum for
   comfortable reading) instead of waiting for the 870px breakpoint below,
   or text gets squeezed thin in the 871-1040px gap first. */
@media screen and (max-width: 1040px) {
	.softdev-definition {
		grid-template-columns: 1fr;
		padding: 56px 5%;
		gap: 32px;
	}
}

@media screen and (max-width: 870px) {
	.softdev-hero {
		height: auto;
		min-height: 0;
		padding: 80px 0;
		background-attachment: scroll;
	}
	.softdev-hero__content {
		padding: 0 5%;
	}
	.softdev-hero__title {
		font-size: 32px;
	}
	.softdev-definition__title {
		font-size: 28px;
	}
	.softdev-eyebrow {
		padding: 0 5%;
	}
	.softdev-section-heading {
		padding: 0 5%;
	}
	.softdev-section-heading__title {
		font-size: 32px;
	}
	.softdev-services {
		grid-template-columns: 1fr;
		padding: 12px 5% 56px;
	}
	.softdev-steps {
		padding: 56px 0;
	}
	.softdev-steps__grid {
		grid-template-columns: 1fr;
		padding: 0 5%;
	}
	.softdev-checklist {
		padding: 56px 0;
	}
	.softdev-checklist__items {
		padding: 0 5%;
	}
}
</style>

<div class="softdev-header">
	<comp:pageHeader label="Software Development" parentLabel="Services" parentHref="/services" />
</div>

<section class="softdev-hero">
	<div class="softdev-hero__overlay"></div>
	<div class="softdev-hero__content">
		<h2 class="softdev-hero__title">Cube SoftTech บริษัทพัฒนาซอฟต์แวร์ครบวงจร</h2>
		<p class="softdev-hero__body">Cube SoftTech
			เราคือผู้ให้บริการด้าน IT Solution
			เน้นการสรรหาผู้เชี่ยวชาญด้านไอที
			พร้อมให้บริการพัฒนาซอฟต์แวร์
			ครอบคลุมไปถึงการพัฒนาเว็บไซต์ และเว็บแอปพลิเคชัน
			และให้คำปรึกษาเกี่ยวกับระบบไอทีครบวงจร</p>
		<p class="softdev-hero__body">
			เรามุ่งมั่นที่จะพัฒนาระบบการทำงานผ่านการนำเสนอ
			Solution ที่ล้ำสมัย ด้วยบริการ Software Development
			ที่จะช่วยเพิ่มประสิทธิภาพในการทำงานให้กับทุกองค์กร
			เรามีทีมงานมืออาชีพที่พร้อมให้คำแนะนำระบบซอฟต์แวร์ที่ตอบสนองต่อการทำงานสำหรับองค์กร
			ด้วยประสบการณ์กว่า<span style="white-space: nowrap;">&nbsp;10 ปี</span>
			เราสามารถวิเคราะห์ความต้องการของลูกค้าได้อย่างตรงจุด
			และออกแบบหรือจัดหา IT Outsource
			ให้ตรงกับความต้องการสำหรับลูกค้าแต่ละรายโดยเฉพาะ
			หากคุณกำลังมองหาผู้พัฒนาซอฟต์แวร์ Cube SoftTech
			ยินดีให้บริการ
		</p>
	</div>
</section>

<section class="softdev-definition">
	<div class="softdev-definition__text" data-aos="fade-up">
		<h2 class="softdev-definition__title">Software Development
			คืออะไร ?</h2>
		<p class="softdev-definition__body">Software Development
			คือการพัฒนาซอฟต์แวร์เพื่อให้รองรับกับการทำงานให้ตอบโจทย์กับเทคโนโลยีที่มีอยู่หลากหลายรูปแบบ
			เช่น สมาร์ตโฟน, คอมพิวเตอร์, แท็บเล็ต
			และยังครอบคลุมไปถึงแอปพลิเคชันอีกด้วย ทั้งนี้
			ก็เพื่อเพิ่มศักยภาพประสิทธิภาพการใช้งานของซอฟต์แวร์ต่าง
			ๆ ให้ใช้งานได้ดีมากยิ่งขึ้น
			อีกทั้งยังออกแบบการทำงานภายในองค์กรให้ครอบคลุมได้ตามความต้องการ
			เพื่อยกระดับให้กับองค์กร และธุรกิจของคุณ</p>
	</div>
	<img class="softdev-definition__image" data-aos="fade-up"
		data-aos-delay="150"
		src="/pages-front/img/redesign/services/software-dev-definition.jpg"
		alt="Software Development illustration">
</section>

<div class="softdev-section-heading" data-aos="fade-up">
	<h2 class="softdev-section-heading__title">Software Development Services</h2>
	<p class="softdev-section-heading__body">พัฒนาซอฟต์แวร์ครบวงจร ตั้งแต่เว็บและแอปพลิเคชัน ไปจนถึงระบบ Cloud,
	AI/ML และ Data Analytics ที่ออกแบบมาเพื่อตอบโจทย์ธุรกิจองค์กรโดยเฉพาะ</p>
</div>
<section class="softdev-services">
	<div class="softdev-card" data-aos="fade-up">
		<span class="softdev-card__icon" aria-hidden="true"><i
			class="bi bi-phone"></i></span>
		<h3 class="softdev-card__title">Custom Web and Mobile
			Applications</h3>
		<p class="softdev-card__desc">บริการออกแบบเว็บไซต์และโมบายแอปพลิเคชัน
			Mobile application ยกระดับการดำเนินงาน
			ด้วยแอปพลิเคชันบนมือถือและเว็บไซต์ที่ออกแบบเฉพาะสำหรับองค์กรของคุณ
			เพิ่มประสิทธิภาพและสร้างความประทับใจให้ลูกค้า</p>
		<ul class="softdev-card__tags">
			<li>Responsive Design</li>
			<li>Cross-Platform</li>
			<li>User Experience</li>
			<li>Performance Optimized</li>
		</ul>
	</div>

	<div class="softdev-card" data-aos="fade-up" data-aos-delay="100">
		<span class="softdev-card__icon" aria-hidden="true"><i
			class="bi bi-cloud"></i></span>
		<h3 class="softdev-card__title">Cloud-Based Solutions</h3>
		<p class="softdev-card__desc">เพิ่มศักยภาพการทำธุรกิจด้วยโซลูชันคลาวด์
			ปรับขนาดให้เหมาะสมกับความต้องการของลูกค้า
			เพื่อสร้างพื้นที่จัดเก็บที่ครอบคลุมกับการทำงานร่วมกันภายในองค์กร
			และเพิ่มความรวดเร็วในการทำงาน
			ยกระดับความปลอดภัยของข้อมูลและลดต้นทุนสำหรับค่าใช้จ่ายด้านระบบ
			IT</p>
		<ul class="softdev-card__tags">
			<li>Scalable Infrastructure</li>
			<li>Data Security</li>
			<li>Cost Effective</li>
			<li>Global Access</li>
		</ul>
	</div>

	<div class="softdev-card" data-aos="fade-up" data-aos-delay="200">
		<span class="softdev-card__icon" aria-hidden="true"><i
			class="bi bi-bar-chart-line"></i></span>
		<h3 class="softdev-card__title">Data Analytics and Business
			Intelligence</h3>
		<p class="softdev-card__desc">พัฒนา Software Development
			ที่จะช่วยรวบรวมข้อมูลเพื่อใช้สำหรับการวิเคราะห์แนวทางในการพัฒนาโปรแกรมและระบบในการทำงานได้ตรงจุดประสงค์มากยิ่งขึ้น
			เพื่อต่อยอดไปสู่ความสำเร็จทางธุรกิจของลูกค้า</p>
		<ul class="softdev-card__tags">
			<li>Real-time Analytics</li>
			<li>Custom Dashboards</li>
			<li>Predictive Insights</li>
			<li>Data Visualization</li>
		</ul>
	</div>

	<div class="softdev-card" data-aos="fade-up">
		<span class="softdev-card__icon" aria-hidden="true"><i
			class="bi bi-cpu"></i></span>
		<h3 class="softdev-card__title">Artificial Intelligence (AI)
			and Machine Learning (ML) Applications</h3>
		<p class="softdev-card__desc">บริการที่นำเอาระบบปัญญาประดิษฐ์ช่วยวิเคราะห์และประมวลผลเพื่อหาผลลัพธ์ที่ดีที่สุดในธุรกิจของลูกค้า
			นอกจากนี้ยังควบคู่ไปกับการพัฒนาระบบ Machine Learning
			ที่จะช่วยพัฒนาแอปพลิเคชันที่ตอบสนองต่อการทำงานมากที่สุด</p>
		<ul class="softdev-card__tags">
			<li>Machine Learning Models</li>
			<li>Natural Language Processing</li>
			<li>Computer Vision</li>
			<li>Automation</li>
		</ul>
	</div>

	<div class="softdev-card" data-aos="fade-up" data-aos-delay="100">
		<span class="softdev-card__icon" aria-hidden="true"><i
			class="bi bi-diagram-3"></i></span>
		<h3 class="softdev-card__title">API Development and
			Integration</h3>
		<p class="softdev-card__desc">การวางระบบระหว่างแพลตฟอร์มต่าง
			ๆ ภายในองค์กรให้เชื่อมถึงกัน
			เพื่อให้เกิดการทำงานที่รวดเร็ว
			ลดความซับซ้อนในการทำงาน
			พร้อมเพิ่มประสิทธิภาพในการทำงานให้ทะลุขีดจำกัด</p>
		<ul class="softdev-card__tags">
			<li>RESTful APIs</li>
			<li>GraphQL</li>
			<li>Microservices</li>
			<li>Third-party Integration</li>
		</ul>
	</div>

	<div class="softdev-card" data-aos="fade-up" data-aos-delay="200">
		<span class="softdev-card__icon" aria-hidden="true"><i
			class="bi bi-kanban"></i></span>
		<h3 class="softdev-card__title">Agile Project Management</h3>
		<p class="softdev-card__desc">บริการที่ช่วยเพิ่มความรวดเร็วในการบริหารจัดการเครื่องมือต่าง
			ๆ ภายในองค์กร ผ่านการวางแผน
			วิเคราะห์เพื่อให้เกิดประสิทธิภาพ
			โดยใช้แพลตฟอร์มที่มีความยืดหยุ่น
			ที่นักพัฒนาระบบได้ออกแบบมาเป็นที่เรียบร้อยแล้ว</p>
		<ul class="softdev-card__tags">
			<li>Sprint Planning</li>
			<li>Continuous Integration</li>
			<li>Quality Assurance</li>
			<li>Iterative Development</li>
		</ul>
	</div>
</section>

<section class="softdev-steps">
	<div class="softdev-section-heading" data-aos="fade-up">
		<h2 class="softdev-section-heading__title">Software
			Optimization</h2>
		<p class="softdev-section-heading__body">ด้วยการทำงานอย่างมืออาชีพและกระบวนการที่เป็นระบบเราให้ความสำคัญกับทุกขั้นตอนเพื่อให้ได้ผลลัพธ์ที่ดีที่สุด</p>
	</div>
	<div class="softdev-steps__grid">
		<div class="softdev-step" data-aos="fade-up">
			<span class="softdev-step__badge"
				style="background: linear-gradient(90deg, #2C74F2 0%, #1BC6FF 100%);">01</span>
			<h3 class="softdev-step__title">การประชุมเริ่มต้น</h3>
			<p class="softdev-step__desc">พบกับลูกค้าเพื่อหารือเกี่ยวกับวิสัยทัศน์ผลิตภัณฑ์และรวบรวมความต้องการเบื้องต้น</p>
		</div>
		<div class="softdev-step" data-aos="fade-up" data-aos-delay="100">
			<span class="softdev-step__badge"
				style="background: linear-gradient(90deg, #963AF1 0%, #DA2D8F 100%);">02</span>
			<h3 class="softdev-step__title">การวิเคราะห์ความต้องการ</h3>
			<p class="softdev-step__desc">จัดทำเอกสารความต้องการทั้งหมดทั้งด้านฟังก์ชันและไม่ใช่ฟังก์ชัน</p>
		</div>
		<div class="softdev-step" data-aos="fade-up" data-aos-delay="200">
			<span class="softdev-step__badge"
				style="background: linear-gradient(90deg, #2BAE6A 0%, #D6FF6F 100%);">03</span>
			<h3 class="softdev-step__title">การวิจัยตลาด</h3>
			<p class="softdev-step__desc">ดำเนินการวิจัยเพื่อทำความเข้าใจสภาพการแข่งขันและความต้องการของตลาด</p>
		</div>
		<div class="softdev-step" data-aos="fade-up" data-aos-delay="300">
			<span class="softdev-step__badge"
				style="background: linear-gradient(90deg, #F15E0A 0%, #FFB07F 100%);">04</span>
			<h3 class="softdev-step__title">ขั้นตอนการออกแบบ</h3>
			<p class="softdev-step__desc">สร้างไวร์เฟรม ม็อคอัพ
				และต้นแบบเพื่อรับข้อเสนอแนะจากลูกค้า</p>
		</div>
		<div class="softdev-step" data-aos="fade-up">
			<span class="softdev-step__badge"
				style="background: linear-gradient(90deg, #FE0A3F 0%, #F58C8C 100%);">05</span>
			<h3 class="softdev-step__title">ขั้นตอนการพัฒนา</h3>
			<p class="softdev-step__desc">เริ่มการพัฒนาโดยใช้วิธีการแบบ
				Agile ด้วยสปรินท์และการทำซ้ำอย่างสม่ำเสมอ</p>
		</div>
		<div class="softdev-step" data-aos="fade-up" data-aos-delay="100">
			<span class="softdev-step__badge"
				style="background: linear-gradient(90deg, #0077FF 0%, #00E3D4 100%);">06</span>
			<h3 class="softdev-step__title">ขั้นตอนการทดสอบ</h3>
			<p class="softdev-step__desc">ดำเนินการทดสอบอย่างละเอียด
				รวมถึง UAT
				เพื่อให้แน่ใจว่าผลิตภัณฑ์ตรงตามความต้องการ</p>
		</div>
		<div class="softdev-step" data-aos="fade-up" data-aos-delay="200">
			<span class="softdev-step__badge"
				style="background: linear-gradient(90deg, #4953F2 0%, #E943FF 100%);">07</span>
			<h3 class="softdev-step__title">การติดตั้ง</h3>
			<p class="softdev-step__desc">ติดตั้งผลิตภัณฑ์ในสภาพแวดล้อมการใช้งานจริง</p>
		</div>
		<div class="softdev-step" data-aos="fade-up" data-aos-delay="300">
			<span class="softdev-step__badge"
				style="background: linear-gradient(90deg, #29AB9D 0%, #26F393 100%);">08</span>
			<h3 class="softdev-step__title">หลังการเปิดตัว</h3>
			<p class="softdev-step__desc">ให้การสนับสนุน
				การบำรุงรักษา
				และรวบรวมข้อเสนอแนะจากผู้ใช้เพื่อการปรับปรุงอย่างต่อเนื่อง</p>
		</div>
	</div>
</section>

<section class="softdev-checklist">
	<div class="softdev-section-heading" data-aos="fade-up">
		<h2 class="softdev-section-heading__title">ตอบโจทย์ทุกความต้องการด้านซอฟต์แวร์กับ
			Cube SoftTech</h2>
		<p class="softdev-section-heading__body">Cube SoftTech
			เราคือผู้ให้บริการรับพัฒนาระบบซอฟต์แวร์ที่เน้นผลลัพธ์ของลูกค้าเป็นเรื่องสำคัญ
			เรามุ่งมั่นที่จะพัฒนาโซลูชันซอฟต์แวร์ที่ตอบโจทย์กับความต้องการให้กับธุรกิจของคุณ
			เรามีทีมงานมืออาชีพที่มีประสบการณ์ด้าน Software
			Development
			ที่พร้อมให้คำแนะนำและออกแบบนวัตกรรมที่ช่วยขับเคลื่อนให้กับทุกความสำเร็จของคุณ</p>
	</div>
	<div class="softdev-checklist__items">
		<div class="softdev-checklist__item" data-aos="fade-up">
			<h3 class="softdev-checklist__item-title">
				<i class="bi bi-check-circle-fill" aria-hidden="true"></i>
				Customer-Focused Software Development Services
			</h3>
			<p class="softdev-checklist__item-desc">เรามุ่งมั่นในการพัฒนาโซลูชันซอฟต์แวร์ที่ตอบสนองความต้องการเฉพาะของธุรกิจคุณ
				ด้วยทีมผู้เชี่ยวชาญที่เข้าใจความท้าทายและเป้าหมายของคุณอย่างลึกซึ้ง
				พร้อมสร้างสรรค์นวัตกรรมเพื่อขับเคลื่อนความสำเร็จของคุณ</p>
		</div>
		<div class="softdev-checklist__item" data-aos="fade-up">
			<h3 class="softdev-checklist__item-title">
				<i class="bi bi-check-circle-fill" aria-hidden="true"></i>
				Custom Web and Mobile Applications
			</h3>
			<p class="softdev-checklist__item-desc">แอปพลิเคชันเว็บและมือถือแบบกำหนดเอง
				พัฒนาแอปพลิเคชันที่ออกแบบมาเฉพาะสำหรับธุรกิจของคุณ
				ทั้งบนเว็บและมือถือ
				ด้วยประสบการณ์ผู้ใช้ที่ยอดเยี่ยมและฟังก์ชันการทำงานที่ตรงตามความต้องการของคุณอย่างแท้จริง</p>
		</div>
		<div class="softdev-checklist__item" data-aos="fade-up">
			<h3 class="softdev-checklist__item-title">
				<i class="bi bi-check-circle-fill" aria-hidden="true"></i>
				Data Analytics and Business Intelligence
			</h3>
			<p class="softdev-checklist__item-desc">การวิเคราะห์ข้อมูลและธุรกิจอัจฉริยะ
				แปลงข้อมูลให้เป็นข้อมูลเชิงลึกที่มีคุณค่า
				เพื่อการตัดสินใจทางธุรกิจที่ชาญฉลาด</p>
		</div>
		<div class="softdev-checklist__item" data-aos="fade-up">
			<h3 class="softdev-checklist__item-title">
				<i class="bi bi-check-circle-fill" aria-hidden="true"></i>
				Artificial Intelligence (AI) and Machine Learning (ML)
				Applications
			</h3>
			<p class="softdev-checklist__item-desc">แอปพลิเคชัน AI
				และ Machine Learning นำเทคโนโลยี AI และ ML
				มาใช้เพื่อเพิ่มประสิทธิภาพและสร้างนวัตกรรมให้กับธุรกิจของคุณ</p>
		</div>
		<div class="softdev-checklist__item" data-aos="fade-up">
			<h3 class="softdev-checklist__item-title">
				<i class="bi bi-check-circle-fill" aria-hidden="true"></i>
				API Development and Integration
			</h3>
			<p class="softdev-checklist__item-desc">การพัฒนาและบูรณาการ
				API
				เชื่อมต่อระบบและบริการต่างๆเข้าด้วยกันอย่างราบรื่นด้วย
				API ที่ออกแบบมาอย่างดี</p>
		</div>
		<div class="softdev-checklist__item" data-aos="fade-up">
			<h3 class="softdev-checklist__item-title">
				<i class="bi bi-check-circle-fill" aria-hidden="true"></i>
				Agile Project Management
			</h3>
			<p class="softdev-checklist__item-desc">การบริหารโครงการแบบ
				Agile ใช้วิธีการ Agile เพื่อความยืดหยุ่น
				การส่งมอบที่รวดเร็ว
				และการปรับปรุงอย่างต่อเนื่อง</p>
		</div>
	</div>
</section>

<comp:scrollToTopButton />

<script>
	AOS.init({
		once : true
	});
</script>

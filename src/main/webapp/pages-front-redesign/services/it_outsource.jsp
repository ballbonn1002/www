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
      "name": "IT Outsource",
      "item": "${constant.webPath}/it-outsource"
    }
  ]
}
</script>

<style type="text/css">
.itout-header {
	padding-top: calc(3% + var(--navbar-offset, 80px));
	padding-left: 10%;
	padding-right: 10%;
}

.itout-hero {
	position: relative;
	height: 75vh;
	min-height: 420px;
	display: flex;
	align-items: center;
	background-image: url("/pages-front/img/redesign/services/it-outsource-intro.png");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

.itout-hero__overlay {
	position: absolute;
	inset: 0;
	background: linear-gradient(90deg, rgba(15, 14, 18, 0.88) 0%, rgba(15, 14, 18, 0.75) 52%, rgba(15, 14, 18, 0.4) 100%);
}

.itout-hero__content {
	position: relative;
	z-index: 1;
	max-width: 860px;
	padding: 0 10%;
}

.itout-hero__title {
	margin: 0 0 24px;
	font-size: 48px;
	font-weight: 700;
	line-height: 1.25;
	color: #FFFFFF;
}

.itout-hero__body {
	margin: 0 0 16px;
	font-size: 16px;
	line-height: 1.6;
	color: rgba(255, 255, 255, 0.9);
}

/* Grid, not flex - same fix as software_dev.jsp (flex let text squeeze the image). */
.itout-definition {
	max-width: 1360px;
	margin: 0 auto;
	padding: 96px 80px;
	display: grid;
	grid-template-columns: 1fr 480px;
	align-items: center;
	gap: 72px;
}

.itout-definition__text {
	min-width: 0;
}

.itout-definition__title {
	margin: 0 0 24px;
	font-size: 36px;
	font-weight: 800;
	line-height: 1.3;
	color: #000000;
}

.itout-definition__body {
	margin: 0;
	font-size: 17px;
	line-height: 1.7;
	color: #3F3F3F;
}

.itout-definition__image {
	width: 100%;
	height: 320px;
	border-radius: 16px;
	object-fit: cover;
}

.itout-section-heading {
	max-width: 900px;
	margin: 0 auto 40px;
	padding: 0 80px;
	text-align: center;
}

.itout-section-heading__title {
	margin: 0 0 16px;
	font-size: 48px;
	font-weight: 700;
	line-height: 1.25;
	color: var(--brand-red);
}

.itout-section-heading__body {
	margin: 0;
	font-size: 16px;
	line-height: 1.5;
	color: #000000;
}

.itout-services {
	background-color: #EFEFEF;
	padding: 96px 0;
}

.itout-services__grid {
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 80px;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 24px;
}

.itout-card,
.itout-feature-card {
	min-width: 0;
	flex: 0 1 calc((100% - 48px) / 3);
	border-radius: 10px;
	background-color: #FFFFFF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
}

.itout-card {
	padding: 32px;
}

.itout-card__icon {
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

.itout-card__title {
	margin: 0 0 12px;
	font-size: 20px;
	font-weight: 700;
	color: #000000;
}

.itout-card__desc {
	margin: 0;
	font-size: 15px;
	line-height: 1.7;
	color: #3F3F3F;
}

.itout-feature-card {
	padding: 32px 24px;
	text-align: center;
}

.itout-feature-card__badge {
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

.itout-feature-card__title {
	margin: 0 0 8px;
	font-size: 17px;
	font-weight: 700;
	color: #000000;
}

.itout-feature-card__desc {
	margin: 0;
	font-size: 14px;
	line-height: 1.6;
	color: #3F3F3F;
}

.itout-highlights {
	background-color: #F7F7F7;
	padding: 96px 0;
}

.itout-highlights__grid {
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 80px;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 24px;
}

.itout-benefits {
	background-color: #EFEFEF;
	padding: 96px 0;
}

.itout-benefits__grid {
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 80px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 24px;
}

.itout-cta {
	padding: 96px 80px;
}

.itout-cta__card {
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

.itout-cta__title {
	margin: 0 0 16px;
	font-size: 32px;
	font-weight: 700;
	line-height: 1.25;
	color: #FFFFFF;
}

.itout-cta__body {
	max-width: 690px;
	margin: 0 auto 32px;
	font-size: 16px;
	line-height: 1.5;
	color: #FFFFFF;
}

.itout-cta__button {
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

.itout-cta__button:hover {
	color: var(--brand-red) !important;
	text-decoration: none;
	opacity: 0.9;
}

/* Same fix as software_dev.jsp - stack earlier so text doesn't get squeezed. */
@media screen and (max-width: 1040px) {
	.itout-definition {
		grid-template-columns: 1fr;
		padding: 56px 5%;
		gap: 32px;
	}
}

@media screen and (max-width: 870px) {
	.itout-hero {
		height: auto;
		min-height: 0;
		padding: 80px 0;
		background-attachment: scroll;
	}
	.itout-hero__content {
		padding: 0 5%;
	}
	.itout-hero__title {
		font-size: 32px;
	}
	.itout-definition__title {
		font-size: 28px;
	}
	.itout-section-heading {
		padding: 0 5%;
	}
	.itout-section-heading__title {
		font-size: 32px;
	}
	.itout-services {
		padding: 56px 0;
	}
	.itout-services__grid {
		padding: 0 5%;
	}
	.itout-card {
		flex-basis: 100%;
	}
	.itout-highlights {
		padding: 56px 0;
	}
	.itout-highlights__grid {
		padding: 0 5%;
	}
	.itout-feature-card {
		flex-basis: 100%;
	}
	.itout-benefits {
		padding: 56px 0;
	}
	.itout-benefits__grid {
		grid-template-columns: 1fr;
		padding: 0 5%;
	}
	.itout-cta {
		padding: 56px 5%;
	}
	.itout-cta__card {
		padding: 32px 24px;
	}
}
</style>

<div class="itout-header">
	<comp:pageHeader label="IT Outsource" parentLabel="Services" parentHref="/services" />
</div>

<section class="itout-hero">
	<div class="itout-hero__overlay"></div>
	<div class="itout-hero__content">
		<h2 class="itout-hero__title">IT Outsource งานคุณภาพที่ Cube SoftTech</h2>
		<p class="itout-hero__body">Cube SoftTech นำเสนอบริการ
			IT Outsource
			ที่ตอบโจทย์ความต้องการขององค์กรยุคใหม่
			ด้วยความเชี่ยวชาญในการรับพัฒนาระบบซอฟต์แวร์และให้คำปรึกษาด้านไอที
			โดยเน้นการพัฒนาโซลูชันที่ครอบคลุมทุกด้านของการพัฒนาโปรแกรมและแอปพลิเคชัน
			ตั้งแต่เริ่มต้นจนจบโครงการ
			โดยสามารถเลือกรูปแบบการทำงานที่เหมาะกับความต้องการและงบประมาณได้
			ภายใต้ทีมงานผู้เชี่ยวชาญในการพัฒนาเว็บ
			แอปพลิเคชัน และการบูรณาการระบบ
			พร้อมนำเสนอนวัตกรรมระดับสูงให้กับองค์กรที่ต้องการยกระดับระบบไอที</p>
	</div>
</section>

<section class="itout-definition">
	<div class="itout-definition__text" data-aos="fade-up">
		<h2 class="itout-definition__title">IT Outsource
			คืออะไร ?</h2>
		<p class="itout-definition__body">IT Outsource
			คือการจ้างบุคคลหรือบริษัทภายนอกที่มีความเชี่ยวชาญด้านเทคโนโลยีสารสนเทศเข้ามาทำหน้าที่ดูแลจัดการระบบไอทีขององค์กร
			แทนที่จะพึ่งพาพนักงานไอทีภายในองค์กรเอง
			โดยการให้บริการในปัจจุบันนั้นมีรูปแบบที่หลากหลาย
			ขึ้นอยู่กับความต้องการขององค์กร บางองค์กรอาจเลือก
			Outsource เฉพาะงานบางส่วน เช่น
			การจ้างผู้พัฒนาซอฟต์แวร์ การดูแลเครือข่าย
			ไปจนถึงการให้คำปรึกษา และบางองค์กรอาจเลือกใช้ระบบ
			IT Outsource ทั้งหมด</p>
	</div>
	<img class="itout-definition__image" data-aos="fade-up"
		data-aos-delay="150"
		src="/pages-front/img/redesign/services/it-outsource-definition.jpg"
		alt="IT Outsource illustration">
</section>

<section class="itout-services">
	<div class="itout-section-heading" data-aos="fade-up">
		<h2 class="itout-section-heading__title">Roles We Provide</h2>
		<p class="itout-section-heading__body">เรามีทีมงานมืออาชีพพร้อมให้บริการ Outsource บุคลากรที่ตอบสนองต่อการทำงานสำหรับองค์กร</p>
	</div>
	<div class="itout-services__grid">
		<div class="itout-card" data-aos="fade-up">
			<span class="itout-card__icon" aria-hidden="true"><i
				class="bi bi-code-slash"></i></span>
			<h3 class="itout-card__title">Programmer (Java, C#.NET,
				VB)</h3>
			<p class="itout-card__desc">IT Outsource
				ด้านการพัฒนาโปรแกรมด้วยภาษา Java, C#.NET และ VB
				มีบทบาทสำคัญในการสร้างแอปพลิเคชันให้ตอบโจทย์ความต้องการทางธุรกิจ
				ซึ่งต้องใช้ทักษะการวิเคราะห์และแก้ไขปัญหาเพื่อให้สามารถค้นหาข้อผิดพลาดและปรับแต่งระบบให้ออกมาเป็นซอฟต์แวร์ที่มีเสถียรภาพและประสิทธิภาพสูงสุด</p>
		</div>
		<div class="itout-card" data-aos="fade-up" data-aos-delay="100">
			<span class="itout-card__icon" aria-hidden="true"><i
				class="bi bi-diagram-3"></i></span>
			<h3 class="itout-card__title">System Analyst</h3>
			<p class="itout-card__desc">System
				Analyst เป็นการนำผู้เชี่ยวชาญด้านระบบมาช่วยเชื่อมโยงความต้องการทางธุรกิจเข้ากับโซลูชันทางเทคโนโลยี
				เริ่มจากการวิเคราะห์ความต้องการขององค์กร
				แล้วแปลงให้เป็นแผนการพัฒนาระบบที่เป็นรูปธรรม
				เพื่อนำไปสู่การพัฒนาโครงการที่ตรงเป้าหมายและช่วยลดความเสี่ยงในการพัฒนาระบบที่ไม่ตอบโจทย์</p>
		</div>
		<div class="itout-card" data-aos="fade-up" data-aos-delay="200">
			<span class="itout-card__icon" aria-hidden="true"><i
				class="bi bi-clipboard-check"></i></span>
			<h3 class="itout-card__title">BA, Tester, Test Lead</h3>
			<p class="itout-card__desc">BA (Business Analyst),
				Tester และ Test Lead
				เป็นบริการที่ช่วยเพิ่มประสิทธิภาพการพัฒนาระบบไอที
				โดย BA
				ทำหน้าที่เป็นตัวกลางเชื่อมระหว่างความต้องการทางธุรกิจและโซลูชันไอที
				ขณะที่ Software Tester และ Test Lead
				จะดำเนินการทดสอบ
				ตั้งแต่การทดสอบระดับหน่วยย่อยไปจนถึงการทดสอบการยอมรับของผู้ใช้งาน</p>
		</div>
		<div class="itout-card" data-aos="fade-up">
			<span class="itout-card__icon" aria-hidden="true"><i
				class="bi bi-kanban"></i></span>
			<h3 class="itout-card__title">Project Lead, Project
				Managers</h3>
			<p class="itout-card__desc">Project Lead และ Project
				Manager เป็นตำแหน่งหลักในการกำกับดูแลโครงการ
				ตั้งแต่การกำหนดทิศทาง วิเคราะห์ภาพรวม
				และวางกรอบการทำงานที่ชัดเจนในทุกขั้นตอน
				ซึ่งต้องมีความเชี่ยวชาญในการจัดทำแผนงานที่ละเอียด
				ครอบคลุมทั้งเรื่องวิธีการ
				และการจัดสรรงบประมาณอย่างมีประสิทธิภาพ</p>
		</div>
		<div class="itout-card" data-aos="fade-up" data-aos-delay="100">
			<span class="itout-card__icon" aria-hidden="true"><i
				class="bi bi-hdd-network"></i></span>
			<h3 class="itout-card__title">BI, Network Engineers,
				DBA</h3>
			<p class="itout-card__desc">ตำแหน่ง BI (Business
				Intelligence), Network Engineer และ DBA (Database
				Administrator)
				จะช่วยเสริมความแข็งแกร่งให้กับโครงสร้างพื้นฐานด้านไอทีอย่างครบวงจร
				โดย BI ทำหน้าที่พัฒนาระบบคลังข้อมูล ส่วน Network
				Engineer เป็นผู้ดูแลโครงสร้างพื้นฐานเครือข่าย และ
				DBA ทำหน้าที่จัดการระบบฐานข้อมูล</p>
		</div>
	</div>
</section>

<section class="itout-highlights">
	<div class="itout-section-heading" data-aos="fade-up">
		<h2 class="itout-section-heading__title">จุดเด่นของทีม
			IT Outsource มากประสบการณ์ Cube SoftTech</h2>
	</div>
	<div class="itout-highlights__grid">
		<div class="itout-feature-card" data-aos="fade-up">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #2C74F2 0%, #1BC6FF 100%);">01</span>
			<h3 class="itout-feature-card__title">Skilled
				Professionals</h3>
			<p class="itout-feature-card__desc">ได้พนักงานมืออาชีพเเละเชี่ยวชาญไม่ต้องเสียเวลาฝึกพนักงานใหม่
				รวมถึงบางครั้งบุคคลภายนอกอาจมีทักษะที่คนภายในองค์กรไม่มีซึ่งเหมาะกับงานบางชนิดที่ต้องใช้ทักษะเฉพาะทาง</p>
		</div>
		<div class="itout-feature-card" data-aos="fade-up" data-aos-delay="100">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #963AF1 0%, #DA2D8F 100%);">02</span>
			<h3 class="itout-feature-card__title">Pre-Screened
				Candidates</h3>
			<p class="itout-feature-card__desc">เรานำเสนอผู้สมัครที่ผ่านการคัดกรองและมีคุณสมบัติเหมาะสม
				ทักษะสกิลที่ตรงกับงาน
				เพื่อให้มั่นใจว่าเฉพาะผู้สมัครที่ดีที่สุดเท่านั้นที่จะได้รับการสัมภาษณ์ขั้นสุดท้าย</p>
		</div>
		<div class="itout-feature-card" data-aos="fade-up" data-aos-delay="200">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #2BAE6A 0%, #D6FF6F 100%);">03</span>
			<h3 class="itout-feature-card__title">Reduced Labor
				Costs</h3>
			<p class="itout-feature-card__desc">การจ้างงานภายนอกด้านไอทีสามารถลดค่าใช้จ่ายที่เกี่ยวข้องกับการจ้างงาน
				การฝึกอบรม
				และการดูแลพนักงานประจำได้อย่างมาก
				บริษัทสามารถหลีกเลี่ยงค่าใช้จ่ายเช่น สวัสดิการ
				พื้นที่สำนักงาน และอุปกรณ์</p>
		</div>
		<div class="itout-feature-card" data-aos="fade-up">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #FE0A3F 0%, #F58C8C 100%);">04</span>
			<h3 class="itout-feature-card__title">Adjustable
				Workforce</h3>
			<p class="itout-feature-card__desc">บริษัทสามารถปรับขนาดทีมงานไอทีขึ้นหรือลงตามความต้องการของโครงการ
				โดยไม่ต้องผูกมัดระยะยาวเหมือนการจ้างพนักงานประจำ</p>
		</div>
		<div class="itout-feature-card" data-aos="fade-up" data-aos-delay="100">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #0077FF 0%, #00E3D4 100%);">05</span>
			<h3 class="itout-feature-card__title">Company
				Management</h3>
			<p class="itout-feature-card__desc">การจัดการองค์กรและพนักงานง่ายขึ้น
				เพียงแค่ติดตามและประเมินผลการทำงาน
				หากไม่เป็นไปตามเป้าหมาย
				คุณสามารถจ้างคนอื่นมาทำหน้าที่แทนได้</p>
		</div>
	</div>
</section>

<section class="itout-benefits">
	<div class="itout-section-heading" data-aos="fade-up">
		<h2 class="itout-section-heading__title">ข้อดีของการใช้บริการ
			IT Outsource</h2>
	</div>
	<div class="itout-benefits__grid">
		<div class="itout-feature-card" data-aos="fade-up">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #2C74F2 0%, #1BC6FF 100%);">01</span>
			<h3 class="itout-feature-card__title">กระบวนการสรรหาที่รวดเร็ว
				และมีประสิทธิภาพ</h3>
			<p class="itout-feature-card__desc">IT Outsource
				มีระบบการสรรหาบุคลากรที่เป็นมืออาชีพและรวดเร็ว
				ทำให้สามารถจัดหาเจ้าหน้าที่ไอทีที่มีคุณสมบัติตรงตามความต้องการของลูกค้าได้อย่างทันท่วงที
				ลดระยะเวลาและค่าใช้จ่ายในกระบวนการสรรหา
				ทำให้องค์กรสามารถเริ่มโครงการได้ตามที่กำหนด</p>
		</div>
		<div class="itout-feature-card" data-aos="fade-up" data-aos-delay="100">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #963AF1 0%, #DA2D8F 100%);">02</span>
			<h3 class="itout-feature-card__title">ทีมงานมีทักษะความเชี่ยวชาญและพร้อมปฏิบัติงาน</h3>
			<p class="itout-feature-card__desc">บุคลากรจาก IT
				Outsource
				ผ่านการฝึกอบรมและพัฒนาทักษะที่จำเป็นอย่างต่อเนื่องก่อนเข้าปฏิบัติงานจริง
				จึงเป็นทีมงานมีความรู้และประสบการณ์พร้อมรับมือกับความท้าทายทางเทคโนโลยีต่าง
				ๆ นอกจากนี้
				ยังมีการอัปเดตความรู้อยู่เสมอ
				ทำให้องค์กรได้รับประโยชน์จากแนวคิดและวิธีการทำงานใหม่ๆ</p>
		</div>
		<div class="itout-feature-card" data-aos="fade-up" data-aos-delay="200">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #2BAE6A 0%, #D6FF6F 100%);">03</span>
			<h3 class="itout-feature-card__title">การกำกับดูแลงานอย่างมืออาชีพ</h3>
			<p class="itout-feature-card__desc">บริษัท IT
				Outsource
				มีระบบการกำกับดูแลที่มีผู้เชี่ยวชาญคอยติดตามและควบคุมการทำงานให้เป็นไปตามขอบเขตงานที่กำหนด
				ซึ่งจะช่วยลดภาระของผู้บริหารองค์กรในการติดตามงานด้านไอที
				ทำให้สามารถมุ่งเน้นไปที่กลยุทธ์ทางธุรกิจได้มากขึ้น</p>
		</div>
		<div class="itout-feature-card" data-aos="fade-up">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #FE0A3F 0%, #F58C8C 100%);">04</span>
			<h3 class="itout-feature-card__title">ความต่อเนื่องในการให้บริการด้วยทีมสำรอง</h3>
			<p class="itout-feature-card__desc">หนึ่งในข้อกังวลของการพึ่งพาบุคลากรภายนอกคือความต่อเนื่องในการทำงาน
				โดย
				IT
				Outsource
				ก็ได้มีการจัดเตรียมพนักงานสำรองไว้ทดแทนในกรณีที่เจ้าหน้าที่หลักลาหยุด
				ทำให้การดำเนินงานต่อเนื่องไม่สะดุด
				เพราะมีผู้ดูแลระบบไอทีตลอดเวลา</p>
		</div>
		<div class="itout-feature-card" data-aos="fade-up" data-aos-delay="100">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #0077FF 0%, #00E3D4 100%);">05</span>
			<h3 class="itout-feature-card__title">การรายงานผลการปฏิบัติงานอย่างละเอียด</h3>
			<p class="itout-feature-card__desc">มีระบบการจัดทำรายงานการปฏิบัติงานที่ครอบคลุมและเป็นระบบ
				โดยมีผู้รับผิดชอบในการรวบรวมข้อมูล
				วิเคราะห์
				และนำเสนอรายงานให้กับลูกค้าอย่างสม่ำเสมอ</p>
		</div>
		<div class="itout-feature-card" data-aos="fade-up" data-aos-delay="200">
			<span class="itout-feature-card__badge"
				style="background: linear-gradient(90deg, #4953F2 0%, #E943FF 100%);">06</span>
			<h3 class="itout-feature-card__title">การควบคุมค่าใช้จ่ายอย่างมีประสิทธิภาพ</h3>
			<p class="itout-feature-card__desc">การใช้บริการ IT
				Outsource
				ช่วยให้องค์กรควบคุมและคาดการณ์ค่าใช้จ่ายด้านไอทีได้ดีขึ้น
				เนื่องจากผู้ให้บริการจะเป็นผู้ดูแลค่าจ้างและสวัสดิการของทีมงานทั้งหมด
				ทำให้องค์กรไม่ต้องกังวลเรื่องค่าใช้จ่ายแฝงหรือค่าใช้จ่ายที่ไม่คาดคิด</p>
		</div>
	</div>
</section>

<section class="itout-cta">
	<div class="itout-cta__card">
		<div>
			<h2 class="itout-cta__title">Need Reliable IT Staff?</h2>
			<p class="itout-cta__body">Let us help you find the right talent to
				strengthen your team.</p>
			<a class="itout-cta__button" href="/contacts">Contact Us</a>
		</div>
	</div>
</section>

<comp:scrollToTopButton />

<script>
	AOS.init({
		once : true
	});
</script>

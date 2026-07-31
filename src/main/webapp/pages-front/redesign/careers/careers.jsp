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
      "name": "Careers",
      "item": "${constant.webPath}/careers"
    }
  ]
}
</script>

<style type="text/css">
.careers-header {
	padding-top: calc(3% + var(--navbar-offset, 80px));
	padding-left: 10%;
	padding-right: 10%;
}

.page-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
}

.careers-section-heading {
	max-width: 900px;
	margin: 0 auto 40px;
	padding: 0 80px;
	text-align: center;
}

.careers-section-heading__title {
	margin: 0 0 16px;
	font-size: 40px;
	font-weight: 700;
	line-height: 1.25;
	color: #C41216;
}

.careers-section-heading__body {
	margin: 0;
	font-size: 16px;
	line-height: 1.5;
	color: #000000;
}

.careers-hero {
	position: relative;
	height: 60vh;
	min-height: 420px;
	display: flex;
	align-items: center;
	background-image: url("/pages-front/img/redesign/careers/careers-hero-team-event.jpg");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

.careers-hero__overlay {
	position: absolute;
	inset: 0;
	background: linear-gradient(90deg, rgba(15, 14, 18, 0.9) 0%, rgba(15, 14, 18, 0.8) 52%, rgba(15, 14, 18, 0.5) 100%);
}

.careers-hero__content {
	position: relative;
	z-index: 1;
	max-width: 860px;
	padding: 0 10%;
}

.careers-hero__title {
	margin: 0 0 24px;
	font-size: 40px;
	font-weight: 700;
	line-height: 1.25;
	color: #FFFFFF;
	overflow-wrap: normal;
}

.careers-hero__body {
	margin: 0 0 16px;
	font-size: 16px;
	line-height: 1.6;
	color: rgba(255, 255, 255, 0.9);
}

.careers-culture {
	max-width: 1360px;
	margin: 0 auto;
	padding: 96px 80px;
	display: flex;
	align-items: center;
	gap: 72px;
}

.careers-culture__image {
	flex: 1 1 400px;
	max-width: 100%;
	width: 100%;
	height: 320px;
	border-radius: 16px;
	object-fit: cover;
}

.careers-culture__body {
	flex: 1 1 480px;
	margin: 0;
	font-size: 17px;
	line-height: 1.7;
	color: #3F3F3F;
}

.careers-perks {
	background-color: #F1F1F1;
	padding: 96px 0;
}

.careers-perks__grid {
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 80px;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 24px;
}

.careers-card {
	padding: 32px;
	border-radius: 10px;
	background-color: #FFFFFF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
}

.careers-card__icon {
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

.careers-card__title {
	margin: 0 0 12px;
	font-size: 18px;
	font-weight: 700;
	color: #000000;
}

.careers-card__desc {
	margin: 0;
	font-size: 14px;
	line-height: 1.7;
	color: #3F3F3F;
}

.careers-testimonial {
	background-color: #F6F6F6;
	padding: 96px 0;
}

.careers-testimonial__card {
	max-width: 760px;
	margin: 0 auto;
	padding: 40px;
	border-radius: 24px;
	background-color: #FFFFFF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
	text-align: center;
}

.careers-testimonial__quote {
	margin: 0 0 24px;
	font-size: 16px;
	line-height: 1.7;
	color: #3F3F3F;
}

.careers-testimonial__person {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 8px;
}

.careers-testimonial__avatar {
	width: 64px;
	height: 64px;
	border-radius: 50%;
	object-fit: cover;
}

.careers-testimonial__name {
	font-size: 15px;
	font-weight: 700;
	color: #000000;
}

.careers-testimonial__school {
	font-size: 13px;
	color: #3F3F3F;
}

.careers-positions {
	background-color: #F1F1F1;
	padding: 96px 0;
}

.careers-positions__list {
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 80px;
	display: flex;
	flex-direction: column;
	gap: 24px;
}

.careers-position {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 24px;
	padding: 32px 40px;
	border-radius: 14px;
	background-color: #FFFFFF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
}

.careers-position__title {
	margin: 0 0 4px;
	font-size: 22px;
	font-weight: 700;
	color: #C41216;
}

.careers-position__location {
	margin: 0;
	font-size: 14px;
	color: #3F3F3F;
}

.careers-position__button {
	flex-shrink: 0;
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 12px 26px;
	border-radius: 10px;
	background-color: #C41216;
	color: #F4F0FF !important;
	font-size: 14px;
	font-weight: 500;
	text-decoration: none;
	white-space: nowrap;
}

.careers-position__button:hover {
	color: #F4F0FF !important;
	text-decoration: none;
	opacity: 0.9;
}

.careers-positions__empty {
	text-align: center;
	font-size: 16px;
	color: #3F3F3F;
}

@media screen and (max-width: 870px) {
	.careers-section-heading {
		padding: 0 5%;
	}
	.careers-section-heading__title {
		font-size: 28px;
	}
	.careers-hero {
		height: auto;
		min-height: 0;
		padding: 64px 0;
		background-attachment: scroll;
	}
	.careers-hero__content {
		padding: 0 5%;
	}
	.careers-hero__title {
		font-size: 28px;
	}
	.careers-culture {
		flex-direction: column;
		padding: 56px 5%;
		gap: 32px;
	}
	.careers-perks {
		padding: 56px 0;
	}
	.careers-perks__grid {
		grid-template-columns: 1fr;
		padding: 0 5%;
	}
	.careers-testimonial {
		padding: 56px 0;
	}
	.careers-testimonial__card {
		margin: 0 5%;
		padding: 24px;
	}
	.careers-positions {
		padding: 56px 0;
	}
	.careers-positions__list {
		padding: 0 5%;
	}
	.careers-position {
		flex-direction: column;
		align-items: flex-start;
	}
	.careers-position__button {
		align-self: stretch;
		justify-content: center;
	}
}
</style>

<div class="careers-header">
	<comp:pageHeader label="Careers" />
</div>

<section class="careers-hero">
	<div class="careers-hero__overlay"></div>
	<div class="careers-hero__content">
		<h2 class="careers-hero__title">Why Work With Us</h2>
		<p class="careers-hero__body">As a company that is
			experiencing rapid growth, Cube SoftTech is always open
			to adding bright and motivated individuals to our
			strong talent pool. We are committed to providing our
			employees with the tools and growth necessary for a
			challenging and rewarding career as an IT
			professional.</p>
	</div>
</section>

<section class="careers-culture">
	<img class="careers-culture__image"
		src="/pages-front/img/redesign/careers/careers-why-work-with-us.png"
		alt="Life at Cube SoftTech">
	<p class="careers-culture__body">Once you are a part of Cube
		SoftTech, you will be working with renowned clients and your
		individual performance will be appropriately rewarded with
		competitive compensation, benefits and bonuses. Currently,
		there are permanent as well as contract opportunities
		available in the following roles:</p>
</section>

<section class="careers-perks">
	<div class="careers-section-heading">
		<h2 class="careers-section-heading__title">Perks and
			Benefits</h2>
		<p class="careers-section-heading__body">We invest in our
			people with comprehensive benefits and perks designed
			to support your personal and professional growth.</p>
	</div>
	<div class="careers-perks__grid">
		<div class="careers-card">
			<span class="careers-card__icon" aria-hidden="true"><i
				class="bi bi-cash-coin"></i></span>
			<h3 class="careers-card__title">Performance Bonus</h3>
			<p class="careers-card__desc">Bonuses for performance,
				overtime pay, and rewards for recognition are
				important.</p>
		</div>
		<div class="careers-card">
			<span class="careers-card__icon" aria-hidden="true"><i
				class="bi bi-calendar-check"></i></span>
			<h3 class="careers-card__title">Flexible Time Off</h3>
			<p class="careers-card__desc">Annual leave, Maternity
				Leave, Sick leave, Take leave in order to enter
				priesthood</p>
		</div>
		<div class="careers-card">
			<span class="careers-card__icon" aria-hidden="true"><i
				class="bi bi-heart-pulse"></i></span>
			<h3 class="careers-card__title">Health Coverage</h3>
			<p class="careers-card__desc">OPD, IPD Insurance, Life
				and accident insurance, Health insurance for spouse
				and children</p>
		</div>
		<div class="careers-card">
			<span class="careers-card__icon" aria-hidden="true"><i
				class="bi bi-piggy-bank"></i></span>
			<h3 class="careers-card__title">Provident Fund</h3>
			<p class="careers-card__desc">Joining our company offers
				a Provident Fund, ensuring your financial security
				and future.</p>
		</div>
		<div class="careers-card">
			<span class="careers-card__icon" aria-hidden="true"><i
				class="bi bi-mortarboard"></i></span>
			<h3 class="careers-card__title">Learning Support</h3>
			<p class="careers-card__desc">Support through online
				courses, certifications, and practical hands-on
				training opportunities.</p>
		</div>
		<div class="careers-card">
			<span class="careers-card__icon" aria-hidden="true"><i
				class="bi bi-airplane"></i></span>
			<h3 class="careers-card__title">Company Outings</h3>
			<p class="careers-card__desc">Celebrate the New Year
				with us on a fun team-building trip for everyone!</p>
		</div>
		<div class="careers-card">
			<span class="careers-card__icon" aria-hidden="true"><i
				class="bi bi-laptop"></i></span>
			<h3 class="careers-card__title">Notebook</h3>
			<p class="careers-card__desc">We offer complimentary
				notebooks to our team for jotting down ideas and
				keeping things organized.</p>
		</div>
		<div class="careers-card">
			<span class="careers-card__icon" aria-hidden="true"><i
				class="bi bi-gift"></i></span>
			<h3 class="careers-card__title">Birthday Gifts</h3>
			<p class="careers-card__desc">A delightful surprise
				awaits you on your special birthday every year!</p>
		</div>
	</div>
</section>

<section class="careers-testimonial">
	<div class="careers-section-heading">
		<h2 class="careers-section-heading__title">What Our
			Interns Say</h2>
		<p class="careers-section-heading__body">Hear from our
			talented interns about their experience growing with
			our team.</p>
	</div>
	<div class="careers-testimonial__card">
		<p class="careers-testimonial__quote">"ฝึกงานที่ Cube
			SoftTech สนุกและท้าทายมากครับ เวลามีปัญหาพี่ ๆ
			ก็ช่วยดูแลให้ตลอดได้ลองทำงานจริงเลยทำให้ได้มีโอกาสสัมภาษณ์และได้ทำงานเลย
			และยังช่วยให้ปรับตัวกับที่ทำงานหลังฝึกจบได้เร็ว
			เหมาะกับน้องๆ ที่กำลังเริ่มต้นแน่นอนครับ"</p>
		<div class="careers-testimonial__person">
			<img class="careers-testimonial__avatar"
				src="/pages-front/img/redesign/careers/careers-intern-avatar.png"
				alt="ULTRA - Ux/Ui Designer">
			<span class="careers-testimonial__name">ULTRA - Ux/Ui
				Designer</span> <span class="careers-testimonial__school">EGCO,
				MU</span>
		</div>
	</div>
</section>

<section class="careers-positions">
	<div class="careers-section-heading">
		<h2 class="careers-section-heading__title">Open
			Positions</h2>
		<p class="careers-section-heading__body">Ready to make an
			impact? Explore our current openings and find your
			perfect role.</p>
	</div>
	<div class="careers-positions__list">
		<c:forEach var="job" items="${jobList}">
			<div class="careers-position">
				<div>
					<h3 class="careers-position__title">${job.position}</h3>
					<p class="careers-position__location">BTS Chong
						Nonsi</p>
				</div>
				<a class="careers-position__button"
					href="${job.page_uri_id}">Description <span
					aria-hidden="true">&rarr;</span></a>
			</div>
		</c:forEach>
		<c:if test="${empty jobList}">
			<p class="careers-positions__empty">There are no open
				positions right now - please check back soon.</p>
		</c:if>
	</div>
</section>

<comp:scrollToTopButton />

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
    }
  ]
}
</script>

<style type="text/css">
.services-intro {
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 80px 24px;
	text-align: center;
}

.services-intro__title,
.services-cta__title {
	margin: 0 0 24px;
	font-size: 48px;
	font-weight: 700;
	line-height: 1.25;
	color: var(--brand-red);
}

.services-intro__body,
.services-cta__body {
	font-size: 16px;
	line-height: 1.5;
	color: #000000;
}

.services-intro__body {
	max-width: 900px;
	margin: 0 auto;
}

.services-grid {
	max-width: 1360px;
	margin: 0 auto;
	padding: 32px 80px 96px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 24px;
}

.services-card,
.services-capability {
	border-radius: 10px;
	background-color: #FFFFFF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
}

/* No hover-lift (unlike blog's cards): this card has its own "Read More" link, so it isn't itself clickable. */
.services-card {
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.services-card__image {
	display: block;
	width: 100%;
	height: 220px;
	object-fit: cover;
}

.services-card__body {
	display: flex;
	flex-direction: column;
	flex: 1;
	padding: 32px;
}

.services-card__title {
	margin: 0 0 12px;
	font-size: 24px;
	font-weight: 700;
	color: #000000;
}

.services-card__desc {
	margin: 0 0 16px;
	font-size: 15px;
	line-height: 1.7;
	color: #3F3F3F;
}

.services-card__list {
	margin: 0 0 16px;
	padding: 0;
	list-style: none;
	font-size: 15px;
	line-height: 1.7;
	color: #3F3F3F;
}

.services-card__list li {
	position: relative;
	padding-left: 22px;
}

.services-card__list li::before {
	content: "\2713";
	position: absolute;
	left: 0;
	top: 0;
	color: var(--brand-red);
	font-weight: 700;
}

.services-card__link {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	align-self: flex-start;
	margin-top: auto;
	gap: 6px;
	padding: 12px 26px;
	border: 1.5px solid var(--brand-red);
	border-radius: 999px;
	color: var(--brand-red) !important;
	font-size: 14px;
	font-weight: 600;
	text-decoration: none;
	transition: background-color 0.2s ease;
}

.services-card__link:hover, .services-card__link:focus {
	background-color: var(--brand-red);
	color: #FFFFFF !important;
	text-decoration: none;
}

.services-header {
	padding-top: calc(3% + var(--navbar-offset, 80px));
	padding-left: 10%;
	padding-right: 10%;
}

.services-eyebrow {
	display: block;
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 80px;
	font-size: 12px;
	font-weight: 700;
	letter-spacing: 0.08em;
	text-transform: uppercase;
	color: var(--brand-red);
}

.services-capabilities {
	max-width: 1360px;
	margin: 0 auto;
	padding: 16px 80px 96px;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 24px;
}

.services-capability {
	display: flex;
	align-items: flex-start;
	gap: 20px;
	padding: 24px 28px;
}

.services-capability__icon {
	flex-shrink: 0;
	width: 46px;
	height: 46px;
	border-radius: 12px;
	background-color: rgba(var(--brand-red-rgb), 0.08);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	color: var(--brand-red);
}

.services-capability__title {
	margin: 0 0 6px;
	font-size: 17px;
	font-weight: 700;
	color: #000000;
}

.services-capability__list {
	margin: 0;
	font-size: 14px;
}

.services-cta {
	padding: 0 80px 96px;
}

.services-cta__card {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	gap: 24px;
	padding: 56px;
	border-radius: 14px;
	text-align: center;
	background-color: #F5F5F5;
}

.services-cta__title {
	margin: 0 0 16px;
	font-size: 32px;
	font-weight: 700;
	line-height: 1.25;
	color: #000000;
}

.services-cta__body {
	max-width: 690px;
	margin: 0 auto 32px;
	font-size: 16px;
	line-height: 1.5;
	color: #3F3F3F;
}

.services-cta__button {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 16px 40px;
	border-radius: 10px;
	background-color: var(--brand-red);
	color: #FFFFFF !important;
	font-size: 16px;
	font-weight: 600;
	text-decoration: none;
}

.services-cta__button:hover {
	color: #FFFFFF !important;
	text-decoration: none;
	opacity: 0.9;
}

@media screen and (max-width: 870px) {
	.services-intro {
		padding: 0 5% 20px;
	}
	.services-intro__title,
	.services-cta__title {
		font-size: 32px;
	}
	.services-cta {
		padding: 0 5% 56px;
	}
	.services-cta__card {
		padding: 32px 24px;
	}
	.services-grid {
		grid-template-columns: 1fr;
		padding: 24px 5% 56px;
	}
	.services-eyebrow {
		padding: 0 5%;
	}
	.services-capabilities {
		grid-template-columns: 1fr;
		padding: 12px 5% 56px;
	}
}
</style>

<div class="services-header">
	<comp:pageHeader label="Services" />
</div>

<section class="services-intro">
	<h2 class="services-intro__title" data-aos="fade-up">Our Services</h2>
	<p class="services-intro__body" data-aos="fade-up" data-aos-delay="100">Cube SoftTech provides IT staff
		outsourcing service and a complete end-to-end service from the
		business process analysis through to the design, development,
		implementation and support of the resulting system. We firmly
		believe that methodology and process is critical for a successful
		project, delivered on time and on budget.</p>
</section>

<h2 class="services-eyebrow">Core Services</h2>
<section class="services-grid">
	<div class="services-card" data-aos="fade-up">
		<img class="services-card__image"
			src="/pages-front/img/redesign/services/service-card-software-dev.png"
			alt="Software Development">
		<div class="services-card__body">
			<h3 class="services-card__title">Software Development</h3>
			<p class="services-card__desc">Customer-Focused Software
				Development Services with cutting-edge technologies and
				methodologies.</p>
			<ul class="services-card__list">
				<li>Custom Web and Mobile Applications</li>
				<li>Cloud-Based Solutions</li>
				<li>Data Analytics and Business Intelligence</li>
				<li>AI and Machine Learning Applications</li>
				<li>API Development and Integration</li>
			</ul>
			<a class="services-card__link" href="/software-development">Read
				More <span aria-hidden="true">&rarr;</span></a>
		</div>
	</div>

	<div class="services-card" data-aos="fade-up" data-aos-delay="100">
		<img class="services-card__image"
			src="/pages-front/img/redesign/services/service-card-it-outsource.png"
			alt="Outsource IT Staff Service">
		<div class="services-card__body">
			<h3 class="services-card__title">Outsource IT Staff Service</h3>
			<p class="services-card__desc">Professional IT staffing
				solutions to augment your development team with skilled
				professionals.</p>
			<ul class="services-card__list">
				<li>Programmer (Java, C#.NET, VB)</li>
				<li>System Analyst</li>
				<li>BA, Tester, Test Lead</li>
				<li>Project Lead, Project Managers</li>
				<li>BI, Network Engineers, DBA</li>
			</ul>
			<a class="services-card__link" href="/it-outsource">Read More
				<span aria-hidden="true">&rarr;</span></a>
		</div>
	</div>

	<div class="services-card" data-aos="fade-up" data-aos-delay="200">
		<img class="services-card__image"
			src="/pages-front/img/redesign/services/service-card-mobile-app.png"
			alt="Mobile App Development">
		<div class="services-card__body">
			<h3 class="services-card__title">Mobile App Development</h3>
			<p class="services-card__desc">Native and cross-platform mobile
				applications designed for optimal user experience and
				performance.</p>
			<ul class="services-card__list">
				<li>iOS and Android Development</li>
				<li>Cross-Platform Solutions</li>
				<li>UI/UX Design</li>
				<li>App Store Optimization</li>
				<li>Mobile Analytics Integration</li>
			</ul>
			<a class="services-card__link" href="/mobile-app-development">Read
				More <span aria-hidden="true">&rarr;</span></a>
		</div>
	</div>

</section>

<h2 class="services-eyebrow">Additional Capabilities</h2>
<section class="services-capabilities">
	<div class="services-capability" data-aos="fade-up">
		<span class="services-capability__icon" aria-hidden="true"><i
			class="bi bi-palette2"></i></span>
		<div>
			<h3 class="services-capability__title">Graphic Design</h3>
			<ul class="services-card__list services-capability__list">
				<li>Logo Design</li>
				<li>Brochure Design</li>
				<li>Web Design</li>
				<li>Corporate Identity</li>
			</ul>
		</div>
	</div>

	<div class="services-capability" data-aos="fade-up" data-aos-delay="100">
		<span class="services-capability__icon" aria-hidden="true"><i
			class="bi bi-window"></i></span>
		<div>
			<h3 class="services-capability__title">Website Development</h3>
			<ul class="services-card__list services-capability__list">
				<li>Corporate Website</li>
				<li>E-Commerce (B2B &amp; B2C)</li>
				<li>Maintenance Service</li>
				<li>GIS Website</li>
			</ul>
		</div>
	</div>
</section>

<section class="services-cta">
	<div class="services-cta__card">
		<div>
			<h2 class="services-cta__title">Let's Build Something Great Together</h2>
			<p class="services-cta__body">Tell us about your project and we'll help you
				find the right service for your business.</p>
			<a class="services-cta__button" href="/contacts">Contact Us</a>
		</div>
	</div>
</section>

<comp:scrollToTopButton />

<script>
	AOS.init({
		once : true
	});
</script>

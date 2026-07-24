<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
      "name": "Services",
      "item": "${constant.webPath}/services"
    }
  ]
}
</script>

<style type="text/css">
.services-hero {
	min-height: 40vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	padding: 40px 5%;
}

.services-hero__title {
	color: #BD2125;
	font-weight: bold;
}

.services-hero__intro {
	max-width: 640px;
	margin: 12px 0 0;
	font-size: 16px;
	line-height: 1.8;
	color: #3F3F3F;
}

.services-detail {
	max-width: 1280px;
	margin: 0 auto;
	padding: 48px 80px;
	border-top: 1px solid rgba(0, 0, 0, 0.08);
	scroll-margin-top: var(--navbar-offset, 80px);
}

.services-detail:first-of-type {
	border-top: none;
}

.services-detail__inner {
	display: flex;
	gap: 40px;
	align-items: flex-start;
}

.services-detail__icon-wrap {
	flex-shrink: 0;
	width: 88px;
	height: 88px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: rgba(196, 18, 22, 0.07);
}

.services-detail__icon {
	width: 56px;
	height: 56px;
}

.services-detail__title {
	margin: 0 0 20px;
	font-size: 28px;
	font-weight: 700;
	color: #000000;
}

.services-detail__group-heading {
	margin: 20px 0 10px;
	font-size: 13px;
	font-weight: 700;
	letter-spacing: 0.06em;
	text-transform: uppercase;
	color: #C41216;
}

.services-detail__group-heading:first-of-type {
	margin-top: 0;
}

.services-detail__list {
	margin: 0;
	padding: 0;
	list-style: none;
	font-size: 16px;
	line-height: 1.9;
	color: #3F3F3F;
}

.services-detail__list li {
	position: relative;
	padding-left: 22px;
}

.services-detail__list li::before {
	content: "\2713";
	position: absolute;
	left: 0;
	top: 0;
	color: #C41216;
	font-weight: 700;
}

@media screen and (max-width: 870px) {
	.services-detail {
		padding: 32px 5%;
	}
	.services-detail__inner {
		flex-direction: column;
		gap: 20px;
	}
	.services-detail__title {
		font-size: 22px;
	}
}
</style>

<main class="services-redesign">
	<section class="services-hero">
		<h1 class="services-hero__title">Our Services</h1>
		<p class="services-hero__intro">Professional IT people, innovative IT
			solutions - staff outsourcing, custom software, advisory &amp;
			digital transformation.</p>
	</section>

	<section class="services-detail" id="it-outsourcing">
		<div class="services-detail__inner">
			<div class="services-detail__icon-wrap">
				<img class="services-detail__icon"
					src="/pages-front/img/redesign/home/service-icon-outsourcing.png"
					alt="">
			</div>
			<div>
				<h2 class="services-detail__title">IT Staff Outsourcing Services</h2>

				<h3 class="services-detail__group-heading">Development</h3>
				<ul class="services-detail__list">
					<li>Java, J2EE, ASP.NET, C#.NET, VB</li>
					<li>COBOL, AS400, SAP, Oracle</li>
				</ul>

				<h3 class="services-detail__group-heading">QA &amp; PM</h3>
				<ul class="services-detail__list">
					<li>System Analyst (OOA/UML)</li>
					<li>BA, Tester, Test Lead/Manager</li>
					<li>Project Lead/Manager</li>
				</ul>

				<h3 class="services-detail__group-heading">Infrastructure</h3>
				<ul class="services-detail__list">
					<li>BI, Network Engineers, DBA</li>
					<li>System Engineer, IT Support, Help Desk</li>
				</ul>
			</div>
		</div>
	</section>

	<section class="services-detail" id="software-specialist">
		<div class="services-detail__inner">
			<div class="services-detail__icon-wrap">
				<img class="services-detail__icon"
					src="/pages-front/img/redesign/home/service-icon-software.png"
					alt="">
			</div>
			<div>
				<h2 class="services-detail__title">Our Software Specialist</h2>
				<ul class="services-detail__list">
					<li>Stock &amp; Warehouse Management</li>
					<li>Sale Order Workflow</li>
					<li>Purchase Order Management System</li>
					<li>Online E-Commerce Web Application</li>
					<li>Corporate Web Design &amp; Enterprise Content Management
						(CMS)</li>
					<li>Banking System</li>
					<li>Customer Relationship Management (CRM)</li>
					<li>Enterprise Resource Planning (ERP)</li>
				</ul>
			</div>
		</div>
	</section>

	<section class="services-detail" id="it-advisory">
		<div class="services-detail__inner">
			<div class="services-detail__icon-wrap">
				<img class="services-detail__icon"
					src="/pages-front/img/redesign/home/service-icon-specialize.png"
					alt="">
			</div>
			<div>
				<h2 class="services-detail__title">IT Advisory Services</h2>
				<ul class="services-detail__list">
					<li>Professional IT Staff Outsourcing Services</li>
					<li>IT consultants for medium &amp; small businesses</li>
					<li>Custom Software Solutions - design, development,
						management &amp; e-business consultation</li>
					<li>Cloud deployment, monitoring &amp; scaling (AWS, Azure,
						GCP)</li>
					<li>Vulnerability assessments, firewalls &amp; security
						compliance consulting</li>
				</ul>
			</div>
		</div>
	</section>

	<section class="services-detail" id="digital-transformation">
		<div class="services-detail__inner">
			<div class="services-detail__icon-wrap">
				<img class="services-detail__icon"
					src="/pages-front/img/redesign/home/service-icon-digital.png"
					alt="">
			</div>
			<div>
				<h2 class="services-detail__title">Digital Transformation
					Services</h2>
				<ul class="services-detail__list">
					<li>Legacy System Modernization &amp; Integration</li>
					<li>Workflow Optimization with RPA</li>
					<li>Purchase Order Management System</li>
					<li>Data-Driven Decision Making through Process Analytics</li>
					<li>Paperless Office Solutions &amp; Document Digitization</li>
					<li>AI-Powered Chatbots &amp; Customer Support Tools</li>
					<li>Strategy Consulting for Enterprise Digital Adoption</li>
					<li>Business Process Automation (low-code/no-code)</li>
				</ul>
			</div>
		</div>
	</section>
</main>

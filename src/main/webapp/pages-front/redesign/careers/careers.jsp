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
	color: var(--brand-red);
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
	background-image:
		url("/pages-front/img/redesign/careers/careers-hero-team-event.jpg");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

.careers-hero__overlay {
	position: absolute;
	inset: 0;
	background: linear-gradient(90deg, rgba(15, 14, 18, 0.9) 0%,
		rgba(15, 14, 18, 0.8) 52%, rgba(15, 14, 18, 0.5) 100%);
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

.careers-hero__cta {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	margin-top: 8px;
	padding: 14px 28px;
	border-radius: 10px;
	background-color: var(--brand-red);
	color: #FFFFFF !important;
	font-size: 15px;
	font-weight: 600;
	text-decoration: none;
	transition: background-color 0.2s ease;
}

.careers-hero__cta:hover {
	background-color: var(--brand-red-dark);
	color: #FFFFFF !important;
	text-decoration: none;
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
	grid-template-columns: repeat(4, minmax(0, 1fr));
	gap: 24px;
}

.careers-testimonial {
	background-color: #F6F6F6;
	padding: 96px 0;
}

/* Same card-carousel pattern as blog_detail.jsp's "related/latest articles"
   (manual prev/next + native scroll, no auto-play) - same theme, own red. */
.card-carousel {
	position: relative;
	max-width: 1360px;
	margin: 0 auto;
	padding: 0 80px;
}

.card-carousel__track {
	display: flex;
	gap: 24px;
	overflow-x: auto;
	scroll-behavior: smooth;
	padding: 4px 4px 12px;
	scrollbar-width: none;
}

.card-carousel__track::-webkit-scrollbar {
	display: none;
}

.card-carousel__track .testimonial-card {
	flex: 0 0 480px;
	max-width: 480px;
	margin: 0;
}

.card-carousel__nav {
	position: absolute;
	top: 40%;
	transform: translateY(-50%);
	width: 40px;
	height: 40px;
	border-radius: 50%;
	border: 1px solid #E8E8E8;
	background-color: #FFFFFF;
	box-shadow: 0 4px 14px rgba(0, 0, 0, 0.12);
	display: flex;
	align-items: center;
	justify-content: center;
	color: var(--brand-red);
	font-size: 18px;
	cursor: pointer;
	z-index: 2;
	transition: background-color 0.2s ease, color 0.2s ease;
}

.card-carousel__nav:hover {
	background-color: var(--brand-red);
	color: #FFFFFF;
}

.card-carousel__nav[disabled] {
	opacity: 0;
	pointer-events: none;
}

.card-carousel__nav--prev {
	left: -18px;
}

.card-carousel__nav--next {
	right: -18px;
}

.careers-positions {
	background-color: #F1F1F1;
	padding: 96px 0;
	scroll-margin-top: var(--navbar-offset, 80px);
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
	color: var(--brand-red);
}

.careers-position__location {
	margin: 0;
	font-size: 14px;
	color: #3F3F3F;
}

.careers-position__location .bi-geo-alt-fill {
	margin-right: 4px;
	color: var(--brand-red);
}

.careers-position__button {
	flex-shrink: 0;
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 12px 26px;
	border-radius: 10px;
	background-color: var(--brand-red);
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

/* .careers-culture__body has no flex-basis of its own, so the text column
   gets squeezed unreadable well before the 870px stack breakpoint used
   elsewhere - stack to column earlier here instead. */
@media screen and (max-width: 1100px) {
	.careers-culture {
		flex-direction: column;
		padding: 56px 5%;
		gap: 32px;
	}
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
	.card-carousel {
		padding: 0 5%;
	}
	.card-carousel__nav {
		display: none;
	}
	.card-carousel__track .testimonial-card {
		flex-basis: 340px;
		max-width: 340px;
	}
	.careers-positions {
		padding: 56px 0;
	}
	.careers-positions__list {
		padding: 0 5%;
	}
	.careers-position {
		padding: 20px 24px;
	}
}

/* Only phone width drops the "Description" label to just the arrow
   (matches blog.css's .page-link__text/__icon pattern) - stays a row
   the whole way down instead of stacking. */
@media screen and (max-width: 575px) {
	.careers-position__button-text {
		display: none;
	}
	.careers-position__button {
		padding: 12px 16px;
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
		<p class="careers-hero__body">As a company that is experiencing
			rapid growth, Cube SoftTech is always open to adding bright and
			motivated individuals to our strong talent pool. We are committed to
			providing our employees with the tools and growth necessary for a
			challenging and rewarding career as an IT professional.</p>
		<a class="careers-hero__cta" id="jumpToPositions"
			href="#open-positions">View Open Positions <i
				class="bi bi-arrow-down" aria-hidden="true"></i></a>
	</div>
</section>

<section class="careers-culture">
	<img class="careers-culture__image" data-aos="fade-up"
		src="/pages-front/img/redesign/careers/careers-why-work-with-us.png"
		alt="Life at Cube SoftTech">
	<p class="careers-culture__body" data-aos="fade-up"
		data-aos-delay="150">Once you are a part of Cube SoftTech, you
		will be working with renowned clients and your individual performance
		will be appropriately rewarded with competitive compensation, benefits
		and bonuses. Currently, there are permanent as well as contract
		opportunities available in the following roles:</p>
</section>

<section class="careers-perks">
	<div class="careers-section-heading" data-aos="fade-up">
		<h2 class="careers-section-heading__title">Perks and Benefits</h2>
		<p class="careers-section-heading__body">We invest in our people
			with comprehensive benefits and perks designed to support your
			personal and professional growth.</p>
	</div>
	<div class="careers-perks__grid">
		<comp:benefitCard title="Performance Bonus"
			desc="Bonuses for performance, overtime pay, and rewards for recognition are important.">
			<svg width="100%" height="100%" viewBox="0 0 24 24" fill="none">
				<rect x="2" y="6" width="20" height="13" rx="2"
					stroke="currentColor" stroke-width="1.8" />
				<circle cx="12" cy="12.5" r="3" stroke="currentColor"
					stroke-width="1.8" />
				<path d="M6 6V5a2 2 0 012-2h8a2 2 0 012 2v1" stroke="currentColor"
					stroke-width="1.8" />
			</svg>
		</comp:benefitCard>
		<comp:benefitCard title="Flexible Time Off" delay="100"
			desc="Annual leave, Maternity Leave, Sick leave, Take leave in order to enter priesthood">
			<svg width="100%" height="100%" viewBox="0 0 24 24" fill="none">
				<rect x="3" y="4" width="18" height="17" rx="2"
					stroke="currentColor" stroke-width="1.8" />
				<path d="M3 9h18M8 2v4M16 2v4" stroke="currentColor"
					stroke-width="1.8" stroke-linecap="round" />
				<path d="M8.5 14l2 2 4-4" stroke="currentColor" stroke-width="1.8"
					stroke-linecap="round" stroke-linejoin="round" />
			</svg>
		</comp:benefitCard>
		<comp:benefitCard title="Health Coverage" delay="200"
			desc="OPD, IPD Insurance, Life and accident insurance, Health insurance for spouse and children">
			<svg width="100%" height="100%" viewBox="0 0 24 24" fill="none">
				<path
					d="M12 20s-7-4.4-9.5-9C.7 7.4 2.6 4 6 4c2 0 3.4 1 4 2 0.6-1 2-2 4-2 3.4 0 5.3 3.4 3.5 7-2.5 4.6-9.5 9-9.5 9z"
					stroke="currentColor" stroke-width="1.8" />
				<path d="M6 11h2.5l1.5-2.5 2 5 1.5-2.5H16" stroke="currentColor"
					stroke-width="1.6" stroke-linejoin="round" />
			</svg>
		</comp:benefitCard>
		<comp:benefitCard title="Provident Fund" delay="300"
			desc="Joining our company offers a Provident Fund, ensuring your financial security and future.">
			<svg width="100%" height="100%" viewBox="0 0 24 24" fill="none">
				<path
					d="M4 12c0-3.3 3.1-6 7-6 3 0 5.5 1.5 6.5 3.7l2.5.3-1 2-1.5.2c-.2 2.4-1.7 4.4-3.5 5.3V20h-2v-1.2a8.6 8.6 0 01-1 .05c-.7 0-1.4-.07-2-.2V20H7v-2.3c-1.8-1-3-2.9-3-5.1z"
					stroke="currentColor" stroke-width="1.6" stroke-linejoin="round" />
				<circle cx="15" cy="11" r="0.9" fill="currentColor" />
				<path d="M7 12L5 10.5" stroke="currentColor" stroke-width="1.6" />
			</svg>
		</comp:benefitCard>
		<comp:benefitCard title="Learning Support"
			desc="Support through online courses, certifications, and practical hands-on training opportunities.">
			<svg width="100%" height="100%" viewBox="0 0 24 24" fill="none">
				<path d="M2 8l10-4 10 4-10 4-10-4z" stroke="currentColor"
					stroke-width="1.8" stroke-linejoin="round" />
				<path d="M6 10.5V16c0 1.4 2.7 2.5 6 2.5s6-1.1 6-2.5v-5.5"
					stroke="currentColor" stroke-width="1.8" />
				<path d="M22 8v6" stroke="currentColor" stroke-width="1.8"
					stroke-linecap="round" />
			</svg>
		</comp:benefitCard>
		<comp:benefitCard title="Company Outings" delay="100"
			desc="Celebrate the New Year with us on a fun team-building trip for everyone!">
			<svg width="100%" height="100%" viewBox="0 0 24 24" fill="none">
				<path
					d="M21 16v-2l-8-5V3.5a1.5 1.5 0 00-3 0V9l-8 5v2l8-2.5V19l-2.5 1.5V22l4-1 4 1v-1.5L13 19v-5.5l8 2.5z"
					stroke="currentColor" stroke-width="1.4" stroke-linejoin="round"
					stroke-linecap="round" />
			</svg>
		</comp:benefitCard>
		<comp:benefitCard title="Notebook" delay="200"
			desc="We offer complimentary notebooks to our team for jotting down ideas and keeping things organized.">
			<svg width="100%" height="100%" viewBox="0 0 24 24" fill="none">
				<rect x="4" y="4" width="16" height="11" rx="1.5"
					stroke="currentColor" stroke-width="1.8" />
				<path d="M2 19h20" stroke="currentColor" stroke-width="1.8"
					stroke-linecap="round" />
			</svg>
		</comp:benefitCard>
		<comp:benefitCard title="Birthday Gifts" delay="300"
			desc="A delightful surprise awaits you on your special birthday every year!">
			<svg width="100%" height="100%" viewBox="0 0 24 24" fill="none">
				<rect x="3" y="9" width="18" height="12" rx="1.5"
					stroke="currentColor" stroke-width="1.8" />
				<path d="M3 9h18M12 9v12" stroke="currentColor" stroke-width="1.8" />
				<path d="M12 9c-1.5 0-4-1-4-3s2-3.2 4 0c2-3.2 4-2 4 0s-2.5 3-4 3z"
					stroke="currentColor" stroke-width="1.6" stroke-linejoin="round" />
			</svg>
		</comp:benefitCard>
	</div>
</section>

<section class="careers-testimonial">
	<div class="careers-section-heading" data-aos="fade-up">
		<h2 class="careers-section-heading__title">What Our Interns Say</h2>
		<p class="careers-section-heading__body">Hear from our talented
			interns about their experience growing with our team.</p>
	</div>
	<div class="card-carousel">
		<button type="button"
			class="card-carousel__nav card-carousel__nav--prev"
			aria-label="เลื่อนดูก่อนหน้า">
			<i class="bi bi-chevron-left"></i>
		</button>
		<div class="card-carousel__track">
			<c:forEach var="t" items="${testimonials}" varStatus="tStatus">
				<comp:testimonialCard delay="${tStatus.index * 60}"
					quote="${t.quote}" name="${t.name}" position="${t.position}"
					avatarSrc="${t.avatarSrc}" avatarAlt="${t.name} - ${t.position}" />
			</c:forEach>
		</div>
		<button type="button"
			class="card-carousel__nav card-carousel__nav--next"
			aria-label="เลื่อนดูถัดไป">
			<i class="bi bi-chevron-right"></i>
		</button>
	</div>
</section>

<section class="careers-positions" id="open-positions">
	<div class="careers-section-heading" data-aos="fade-up">
		<h2 class="careers-section-heading__title">Open Positions</h2>
		<p class="careers-section-heading__body">Ready to make an impact?
			Explore our current openings and find your perfect role.</p>
	</div>
	<div class="careers-positions__list">
		<c:forEach var="job" items="${jobList}">
			<div class="careers-position" data-aos="fade-up">
				<div>
					<h3 class="careers-position__title">${job.position}</h3>
					<p class="careers-position__location">
						<i class="bi bi-geo-alt-fill"></i> BTS Chong Nonsi
					</p>
				</div>
				<a class="careers-position__button" href="${job.page_uri_id}"><span
						class="careers-position__button-text">Description</span>
					<span aria-hidden="true">&rarr;</span>
				</a>
			</div>
		</c:forEach>
		<c:if test="${empty jobList}">
			<p class="careers-positions__empty">There are no open positions
				right now - please check back soon.</p>
		</c:if>
	</div>
</section>

<comp:scrollToTopButton />

<script>
	AOS.init({
		once : true
	});

	(function() {
		var link = document.getElementById('jumpToPositions');
		var target = document.getElementById('open-positions');
		if (!link || !target) {
			return;
		}
		var prefersReducedMotion = window.matchMedia
				&& window.matchMedia('(prefers-reduced-motion: reduce)').matches;

		function easeInOutCubic(t) {
			return t < 0.5 ? 4 * t * t * t : 1 - Math.pow(-2 * t + 2, 3) / 2;
		}

		function targetScrollY() {
			var navbarOffset = parseFloat(getComputedStyle(document.documentElement)
					.getPropertyValue('--navbar-offset')) || 80;
			return target.getBoundingClientRect().top + window.scrollY - navbarOffset;
		}

		link.addEventListener('click', function(e) {
			e.preventDefault();

			if (prefersReducedMotion) {
				window.scrollTo({ top : targetScrollY(), left : 0, behavior : 'auto' });
				return;
			}

			var startY = window.scrollY;
			var targetY = targetScrollY();
			var distance = targetY - startY;
			var duration = Math.min(2500, Math.max(1200, Math.abs(distance) * 0.5));
			var startTime = null;
			var cancelled = false;

			function cancel() {
				cancelled = true;
				window.removeEventListener('wheel', cancel);
				window.removeEventListener('touchstart', cancel);
			}
			window.addEventListener('wheel', cancel, { passive : true });
			window.addEventListener('touchstart', cancel, { passive : true });

			function step(timestamp) {
				if (cancelled) {
					return;
				}
				if (startTime === null) {
					startTime = timestamp;
				}
				var progress = Math.min((timestamp - startTime) / duration, 1);
				window.scrollTo({
					top : startY + distance * easeInOutCubic(progress),
					left : 0,
					behavior : 'auto'
				});
				if (progress < 1) {
					requestAnimationFrame(step);
				} else {
					cancel();
				}
			}
			requestAnimationFrame(step);
		});
	})();

	// Same manual prev/next scroll pattern as blog_detail.jsp's card-carousel.
	function animateScrollLeft(el, toLeft, duration) {
		var fromLeft = el.scrollLeft;
		var distance = toLeft - fromLeft;
		var startTime = null;
		function easeOutCubic(t) {
			return 1 - Math.pow(1 - t, 3);
		}
		function step(timestamp) {
			if (startTime === null) {
				startTime = timestamp;
			}
			var progress = Math.min((timestamp - startTime) / duration, 1);
			el.scrollLeft = fromLeft + distance * easeOutCubic(progress);
			if (progress < 1) {
				requestAnimationFrame(step);
			}
		}
		requestAnimationFrame(step);
	}

	document.querySelectorAll('.card-carousel').forEach(
			function(carousel) {
				var track = carousel.querySelector('.card-carousel__track');
				var prevBtn = carousel
						.querySelector('.card-carousel__nav--prev');
				var nextBtn = carousel
						.querySelector('.card-carousel__nav--next');
				if (!track) {
					return;
				}
				function scrollByOneCard(direction) {
					// Not firstElementChild: comp:testimonialCard emits its own <style>
					// block right before each card, so the track's first *element*
					// child is a <style> tag (zero width), not the card itself.
					var firstCard = track.querySelector('.testimonial-card');
					var cardWidth = firstCard ? firstCard
							.getBoundingClientRect().width : 300;
					var gap = 24;
					var maxScrollLeft = track.scrollWidth - track.clientWidth;
					var target = track.scrollLeft + (cardWidth + gap)
							* direction;
					target = Math.max(0, Math.min(target, maxScrollLeft));
					animateScrollLeft(track, target, 420);
				}

				function updateNavState() {
					var maxScrollLeft = track.scrollWidth - track.clientWidth;
					var canScroll = maxScrollLeft > 1;
					if (prevBtn) {
						prevBtn.disabled = !canScroll || track.scrollLeft <= 1;
					}
					if (nextBtn) {
						nextBtn.disabled = !canScroll
								|| track.scrollLeft >= maxScrollLeft - 1;
					}
				}
				if (prevBtn) {
					prevBtn.addEventListener('click', function() {
						scrollByOneCard(-1);
					});
				}
				if (nextBtn) {
					nextBtn.addEventListener('click', function() {
						scrollByOneCard(1);
					});
				}
				track.addEventListener('scroll', updateNavState, {
					passive : true
				});
				window.addEventListener('resize', updateNavState);
				updateNavState();

				// Auto-advance one card every 5s, looping back to the first card at
				// the end. Paused on hover/focus so it doesn't scroll away while
				// someone's reading. Deliberately ignores prefers-reduced-motion
				// (per explicit request) - manual prev/next still always works.
				var autoAdvanceId = null;

				function autoAdvance() {
					var maxScrollLeft = track.scrollWidth - track.clientWidth;
					if (maxScrollLeft <= 1) {
						return;
					}
					if (track.scrollLeft >= maxScrollLeft - 1) {
						animateScrollLeft(track, 0, 420);
					} else {
						scrollByOneCard(1);
					}
				}

				function startAutoAdvance() {
					if (autoAdvanceId) {
						return;
					}
					autoAdvanceId = setInterval(autoAdvance, 5000);
				}

				function stopAutoAdvance() {
					if (autoAdvanceId) {
						clearInterval(autoAdvanceId);
						autoAdvanceId = null;
					}
				}

				carousel.addEventListener('mouseenter', stopAutoAdvance);
				carousel.addEventListener('mouseleave', startAutoAdvance);
				carousel.addEventListener('focusin', stopAutoAdvance);
				carousel.addEventListener('focusout', startAutoAdvance);
				startAutoAdvance();
			});
</script>

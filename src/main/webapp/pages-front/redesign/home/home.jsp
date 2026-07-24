<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Cube SoftTech.Co., Ltd.",
  "url": "${constant.webPath}",
  "logo": "${constant.webPath}/pages-front/img/logo/cubesofttech.png",
  "contactPoint": {
    "@type": "ContactPoint",
    "telephone": "026798855",
    "contactType": "",
    "availableLanguage": "Thai"
  },
  "sameAs": "https://www.facebook.com/CubeSoftTech/"
}
</script>

<style type="text/css">
.home-hero {
	position: relative;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	overflow: hidden;
	padding: 80px 5% 60px;
	background: radial-gradient(circle at 50% 50%, rgba(255, 74, 77, 0.2) 0%,
		rgba(123, 143, 221, 0) 60%) center/cover no-repeat,
		radial-gradient(circle at 50% 50%, rgba(255, 32, 36, 0.12) 0%,
		rgba(221, 123, 125, 0) 60%) center/cover no-repeat,
		radial-gradient(circle, rgba(0, 0, 0, 0.06) 1px, transparent 1.6px) 0
		0/24px 24px repeat, #F7F7F7;
}

.home-hero__wordmark {
	width: 100%;
	max-width: 280px;
	margin-bottom: 24px;
}

.home-hero__title {
	position: relative;
	z-index: 1;
	max-width: 720px;
	margin: 0 0 20px;
	font-size: 64px;
	font-weight: 400;
	line-height: 1.25;
	color: #000000;
}

.home-hero__title-accent {
	font-weight: 700;
	background: linear-gradient(60deg, #A94DFF 0%, #FF83E2 0%, #FF5154 100%, #FFF759
		100%);
	-webkit-background-clip: text;
	background-clip: text;
	-webkit-text-fill-color: transparent;
}

.home-hero__body {
	position: relative;
	z-index: 1;
	max-width: 560px;
	margin: 0 0 32px;
	font-size: 24px;
	line-height: 1.875;
	color: #3F3F3F;
}

.home-hero__typewriter {
	font-weight: 600;
	color: #BD2125;
}

.home-hero__cursor {
	display: inline-block;
	color: #BD2125;
	animation: home-hero-blink 1s step-end infinite;
}

@
keyframes home-hero-blink { 50% {
	opacity: 0;
}

}
.home-hero__cta {
	position: relative;
	z-index: 1;
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 9px 18px;
	border-radius: 10px;
	background: linear-gradient(90deg, #E11412 0%, #7F1610 78%);
	color: #FFFCFC !important;
	font-size: 14px;
	font-weight: 500;
	text-decoration: none;
}

.home-hero__cta:hover, .home-hero__cta:focus {
	color: #FFFCFC !important;
	text-decoration: none;
	opacity: 0.9;
}

.home-hero__sphere {
	position: absolute;
	z-index: 0;
	pointer-events: none;
	opacity: 0.75;
	animation: home-hero-float 6s ease-in-out infinite;
}

.home-hero__sphere--1 {
	bottom: 21%;
	left: 9%;
	width: clamp(140px, 18vw, 260px);
}

.home-hero__sphere--2 {
	top: 18%;
	right: 16%;
	width: clamp(110px, 14vw, 200px);
	animation-delay: -3s;
}

@
keyframes home-hero-float { 0%, 100% {
	transform: translateY(0);
}

50
%
{
transform
:
translateY(
-16px
);
}
}
@media screen and (max-width: 870px) {
	.home-hero__sphere {
		display: none;
	}
	.home-hero__title {
		font-size: 32px;
	}
}

.home-about {
	max-width: 1280px;
	margin: 0 auto;
	padding: 60px 80px;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.home-about__badge {
	display: inline-block;
	margin-bottom: 20px;
	padding: 8px 20px;
	border-radius: 9999px;
	background-color: rgba(255, 0, 0, 0.05);
	color: #C41216 !important;
	font-size: 14px;
	letter-spacing: 0.214em;
	text-transform: uppercase;
}

.home-about__title {
	margin: 0 0 20px;
	font-size: 48px;
	font-weight: 400;
	line-height: 1.25;
	color: #000000;
}

.home-about__body {
	max-width: 680px;
	margin: 0 0 32px;
	font-size: 16px;
	line-height: 1.875;
	color: #3F3F3F;
}

@media screen and (max-width: 870px) {
	.home-about {
		padding: 48px 5%;
	}
	.home-about__title {
		font-size: 32px;
	}
}

.home-services {
	position: relative;
	max-width: 1280px;
	margin: 0 auto;
	padding: 0px 80px;
}

.home-services::before, .home-services::after {
	content: "";
	position: absolute;
	border-radius: 50%;
	pointer-events: none;
	z-index: 0;
}

.home-services::before {
	width: 420px;
	height: 420px;
	top: -120px;
	right: -140px;
	background: radial-gradient(circle, rgba(196, 18, 22, 0.08) 0%,
		rgba(196, 18, 22, 0) 70%);
}

.home-services::after {
	width: 340px;
	height: 340px;
	bottom: -100px;
	left: -120px;
	background: radial-gradient(circle, rgba(196, 18, 22, 0.06) 0%,
		rgba(196, 18, 22, 0) 70%);
}

.home-services__inner {
	position: relative;
	z-index: 1;
	display: flex;
	align-items: flex-start;
	gap: 48px;
}

/* Full-bleed photo band behind the top of the section (TOC + first
   card) - capped to one viewport tall instead of matching the full
   stacked-cards height (which grows past 2x viewport once all 4 cards
   are in normal flow), so it reads as a band, not a stretched-out
   backdrop for the whole section. */
.home-services__bg-band {
	position: absolute;
	top: -44px;
	left: 50%;
	width: 100vw;
	height: 100vh;
	transform: translateX(-50%);
	z-index: 0;
	overflow: hidden;
	pointer-events: none;
	background-image: url(/pages-front/img/redesign/home/service-banner.jpg);
	background-size: cover;
	background-position: center;
	opacity: 0.8;
}

.home-services__toc {
	position: sticky;
	top: 110px;
	z-index: 1;
	flex: 0 0 340px;
	display: flex;
	flex-direction: column;
	gap: 6px;
	padding: 20px;
	border-radius: 24px;
	background-color: rgba(255, 255, 255, 0.7);
	border: 1px solid rgba(255, 255, 255, 0.6);
	box-shadow: 0 12px 40px rgba(0, 0, 0, 0.18);
	backdrop-filter: blur(16px);
	-webkit-backdrop-filter: blur(16px);
}

.home-services__toc-title {
	margin: 0 0 8px;
	padding: 0 8px;
	font-size: 13px;
	font-weight: 700;
	letter-spacing: 0.08em;
	text-transform: uppercase;
	color: #C41216;
}

.home-services__toc-cta {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 6px;
	margin: auto 8px 0;
	padding: 10px 20px;
	border: 1px solid #C41216;
	border-radius: 999px;
	color: #C41216 !important;
	font-size: 14px;
	font-weight: 600;
	text-decoration: none;
}

.home-services__toc-cta:hover, .home-services__toc-cta:focus {
	background-color: #C41216;
	color: #FFFFFF !important;
	text-decoration: none;
}

.home-services__toc-item {
	display: flex;
	align-items: center;
	gap: 14px;
	padding: 12px 8px;
	border: none;
	border-radius: 8px;
	background-color: transparent;
	color: #3F3F3F;
	font-size: 15px;
	font-weight: 600;
	text-align: left;
	cursor: pointer;
	outline: none;
	transition: color 0.2s ease, background-color 0.2s ease;
}

.home-services__toc-item:focus-visible {
	background-color: #C41216;
	color: #FFFFFF;
}

.home-services__toc-item:focus-visible .home-services__toc-num {
	background-color: #FFFFFF;
	color: #C41216;
}

.home-services__toc-num {
	flex: none;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 32px;
	height: 32px;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.06);
	color: #3F3F3F;
	font-size: 13px;
	font-weight: 700;
	transition: background-color 0.25s ease, color 0.25s ease;
}

.home-services__toc-item[aria-current="true"] {
	color: #000000;
}

.home-services__toc-item[aria-current="true"] .home-services__toc-num {
	background-color: #C41216;
	color: #FFFFFF;
}

.home-services__cards {
	position: relative;
	z-index: 1;
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 24px;
}

.home-services__card {
	position: relative;
	overflow: hidden;
	padding: 30px;
	border-radius: 28px;
	background-color: rgba(255, 255, 255, 0.7);
	border: 1px solid rgba(255, 255, 255, 0.6);
	box-shadow: 0 16px 44px rgba(196, 18, 22, 0.16), 0 4px 16px
		rgba(0, 0, 0, 0.12);
	backdrop-filter: blur(16px);
	-webkit-backdrop-filter: blur(16px);
}

/* Brand-red accent bar along the top edge of the card. */
.home-services__card::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 4px;
}

/* Slow diagonal sheen sweeping across the card - mirrors the
   home-techspec-sheen animation elsewhere on this page for a
   consistent "glass catching light" language, kept subtle/slow so it
   reads as ambient rather than a loading indicator. The diagonal
   angle comes from the gradient itself (100deg), not an element
   transform - no rotate() anywhere here, so there's nothing that
   could visually tilt if overflow clipping ever hiccups. */
.home-services__card::after {
	content: "";
	position: absolute;
	top: -10%;
	left: -60%;
	width: 40%;
	height: 120%;
	pointer-events: none;
	background: linear-gradient(100deg, transparent 0%, rgba(255, 255, 255, 0.5)
		50%, transparent 100%);
	animation: home-services-sheen 7s ease-in-out infinite;
}

@keyframes home-services-sheen {
	0%, 100% {
		left: -60%;
	}
	50% {
		left: 130%;
	}
}

@media (prefers-reduced-motion: reduce) {
	.home-services__card::after {
		animation: none;
	}
}

.home-services__icon-wrap {
	width: 88px;
	height: 88px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: rgba(196, 18, 22, 0.12);
	margin-bottom: 20px;
}

.home-services__icon {
	width: 56px;
	height: 56px;
}

.home-services__title {
	margin: 0 0 12px;
	font-size: 26px;
	font-weight: 700;
	line-height: 1.3;
	color: #000000;
}

.home-services__lead {
	margin: 0 0 14px;
	font-size: 18px;
	font-weight: 600;
	line-height: 1.4;
	color: #C41216;
}

.home-services__list {
	margin: 0 0 20px;
	padding: 0;
	list-style: none;
	font-size: 16px;
	line-height: 1.9;
	color: #3F3F3F;
}

.home-services__list li {
	position: relative;
	padding-left: 22px;
}

.home-services__list li::before {
	content: "\2713";
	position: absolute;
	left: 0;
	top: 0;
	color: #C41216;
	font-weight: 700;
	font-size: 14px;
}

/* TOC becomes a plain top block on mobile instead of a sticky side
   rail, and its numbered item list is dropped since there's no jump
   target for it - the photo band is dropped too since it doesn't read
   well full-bleed at this width. */
@media screen and (max-width: 870px) {
	.home-services {
		padding: 48px 5%;
	}
	.home-services__inner {
		flex-direction: column;
		align-items: stretch;
		gap: 24px;
	}
	.home-services__bg-band {
		display: none;
	}
	.home-services__toc {
		position: static;
		flex: none;
	}
	.home-services__toc-item {
		display: none;
	}
}

.home-techspec {
	position: relative;
	max-width: 1280px;
	margin: 0 auto;
	padding: 60px 80px;
	text-align: center;
	overflow: hidden;
	border-radius: 40px;
}

/* Faint circuit-board grid - two overlaid repeating-linear-gradients for
   the trace lines, plus a repeating radial-gradient for the via/node dots
   at their intersections. Pure CSS, no image asset. */
.home-techspec::before {
	content: "";
	position: absolute;
	inset: 0;
	z-index: 0;
	pointer-events: none;
	background-image: repeating-linear-gradient(90deg, rgba(196, 18, 22, 0.06)
		0px, rgba(196, 18, 22, 0.06) 1px, transparent 1px, transparent 56px),
		repeating-linear-gradient(0deg, rgba(196, 18, 22, 0.06) 0px,
		rgba(196, 18, 22, 0.06) 1px, transparent 1px, transparent 56px),
		radial-gradient(circle, rgba(196, 18, 22, 0.14) 1.5px, transparent
		1.5px);
	background-size: 56px 56px, 56px 56px, 56px 56px;
}

/* Slow, faint diagonal sheen drifting across the circuit pattern - kept
   subtle (low opacity, ~14s) so it reads as ambient tech glow, not a
   loading shimmer. */
.home-techspec::after {
	content: "";
	position: absolute;
	top: -50%;
	left: -60%;
	width: 60%;
	height: 200%;
	z-index: 0;
	pointer-events: none;
	background: linear-gradient(100deg, transparent 0%, rgba(255, 255, 255, 0.35)
		50%, transparent 100%);
	transform: rotate(8deg);
	animation: home-techspec-sheen 14s linear infinite;
}

@
keyframes home-techspec-sheen { 0% {
	left: -60%;
}

100
%
{
left
:
130%;
}
}
.home-techspec__title {
	margin: 0 0 6px;
	font-size: 32px;
	font-weight: 700;
	line-height: 1.25;
	color: #000000;
}

.home-techspec__intro {
	max-width: 320px;
	margin: 0 auto;
	font-size: 14px;
	line-height: 1.6;
	color: #3F3F3F;
}

.home-techspec__hub {
	position: relative;
	z-index: 1;
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-template-areas: "center center" "top-left top-right"
		"bottom-left bottom-right";
	gap: 32px;
	align-items: stretch;
	text-align: left;
}

.home-techspec__center {
	grid-area: center;
	text-align: center;
	padding: 12px 20px;
}

.home-techspec__card--top-left {
	grid-area: top-left;
}

.home-techspec__card--top-right {
	grid-area: top-right;
}

.home-techspec__card--bottom-left {
	grid-area: bottom-left;
}

.home-techspec__card--bottom-right {
	grid-area: bottom-right;
}

.home-techspec__card {
	display: flex;
	align-items: flex-start;
	gap: 20px;
	padding: 32px;
	min-height: 150px;
	border-radius: 32px;
	background-color: #F7F7F7;
	border: 1px solid rgba(255, 255, 255, 0.4);
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
	will-change: transform, opacity;
	transition: transform 0.7s cubic-bezier(0.16, 1, 0.3, 1), opacity 0.5s
		ease;
}

/* Cards start pulled in toward the center title, then release outward to
   their resting spot while the section is in view - folds back in if
   scrolled past either edge (home-techspec-reveal IIFE toggles
   .is-revealed on every enter/exit, not once). */
.home-techspec__hub:not(.is-revealed) .home-techspec__card--top-left {
	transform: translate(24px, 24px) scale(0.9);
	opacity: 0.7;
}

.home-techspec__hub:not(.is-revealed) .home-techspec__card--top-right {
	transform: translate(-24px, 24px) scale(0.9);
	opacity: 0.7;
}

.home-techspec__hub:not(.is-revealed) .home-techspec__card--bottom-left
	{
	transform: translate(24px, -24px) scale(0.9);
	opacity: 0.7;
}

.home-techspec__hub:not(.is-revealed) .home-techspec__card--bottom-right
	{
	transform: translate(-24px, -24px) scale(0.9);
	opacity: 0.7;
}

.home-techspec__hub.is-revealed .home-techspec__card--top-left {
	transition-delay: 0.05s;
}

.home-techspec__hub.is-revealed .home-techspec__card--top-right {
	transition-delay: 0.12s;
}

.home-techspec__hub.is-revealed .home-techspec__card--bottom-left {
	transition-delay: 0.19s;
}

.home-techspec__hub.is-revealed .home-techspec__card--bottom-right {
	transition-delay: 0.26s;
}

.home-techspec__icon-wrap {
	width: 88px;
	height: 88px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: rgba(196, 18, 22, 0.07);
	flex-shrink: 0;
}

.home-techspec__icon {
	width: 56px;
	height: 56px;
}

.home-techspec__card-title {
	margin: 0 0 14px;
	font-size: 22px;
	font-weight: 700;
	line-height: 1.3;
	color: #000000;
}

.home-techspec__tags {
	display: flex;
	flex-wrap: wrap;
	gap: 8px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.home-techspec__tags li {
	font-size: 13px;
	font-weight: 600;
	color: #3F3F3F;
	background-color: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0.08);
	border-radius: 999px;
	padding: 6px 14px;
}

@media screen and (max-width: 870px) {
	.home-techspec {
		padding: 40px 5%;
		border-radius: 24px;
	}
	.home-techspec__hub {
		grid-template-columns: 1fr;
		grid-template-areas: "center" "top-left" "top-right" "bottom-left"
			"bottom-right";
	}
}

.home-partners {
	max-width: 1280px;
	margin: 0 auto;
	padding: 80px;
	text-align: center;
}

.home-partners__title {
	margin: 0 0 20px;
	font-size: 48px;
	font-weight: 400;
	line-height: 1.25;
	color: #000000;
}

.home-partners__intro {
	max-width: 680px;
	margin: 0 auto 24px;
	font-size: 16px;
	line-height: 1.875;
	color: #3F3F3F;
}

.home-partners__stat {
	margin: 0 0 32px;
}

.home-partners__stat-num, .home-partners__stat-suffix {
	font-size: 40px;
	font-weight: 700;
	color: #C41216;
}

.home-partners__stat-label {
	margin: 4px 0 0;
	font-size: 13px;
	font-weight: 600;
	letter-spacing: 0.06em;
	text-transform: uppercase;
	color: #3F3F3F;
}

.home-partners__panel {
	position: relative;
	padding: 48px 0;
	border-radius: 40px;
	background-color: #F7F7F7;
	border: 1px solid rgba(255, 255, 255, 0.4);
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
	overflow: hidden;
}

.home-partners__marquee {
	display: flex;
	flex-direction: column;
	gap: 24px;
	-webkit-mask-image: linear-gradient(90deg, transparent 0%, #000 6%, #000 94%, transparent
		100%);
	mask-image: linear-gradient(90deg, transparent 0%, #000 6%, #000 94%, transparent
		100%);
}

.home-partners__marquee-row {
	overflow-x: auto;
	scrollbar-width: none;
	-ms-overflow-style: none;
}

.home-partners__marquee-row::-webkit-scrollbar {
	display: none;
}

.home-partners__logos {
	display: flex;
	align-items: center;
	gap: 32px;
	width: max-content;
	padding: 0 45px;
	cursor: grab;
}

.home-partners__logos:active {
	cursor: grabbing;
}

.home-partners__logo {
	height: 64px;
	width: auto;
	max-width: 220px;
	object-fit: contain;
	flex-shrink: 0;
}

@media screen and (max-width: 870px) {
	.home-partners {
		padding: 60px 5%;
	}
	.home-partners__title {
		font-size: 32px;
	}
	.home-partners__panel {
		padding: 32px 0;
	}
	.home-partners__logos {
		padding: 0 20px;
	}
}

.home-jobs {
	max-width: 1280px;
	margin: 0 auto;
	padding: 80px;
	text-align: center;
}

.home-jobs__title {
	margin: 0 0 20px;
	font-size: 48px;
	font-weight: 400;
	line-height: 1.25;
	color: #000000;
}

.home-jobs__intro {
	max-width: 680px;
	margin: 0 auto 40px;
	font-size: 16px;
	line-height: 1.875;
	color: #3F3F3F;
}

.home-jobs__panel {
	padding: 16px 45px;
	border-radius: 40px;
	background-color: #F7F7F7;
	border: 1px solid rgba(255, 255, 255, 0.4);
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
	text-align: left;
}

.home-jobs__list {
	margin: 0;
	padding: 0;
	list-style: none;
}

.home-jobs__row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 20px;
	padding: 22px 8px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.08);
}

.home-jobs__list li:last-child .home-jobs__row {
	border-bottom: none;
}

.home-jobs__position {
	font-size: 18px;
	font-weight: 700;
	color: #000000 !important;
	text-decoration: none;
}

.home-jobs__position:hover, .home-jobs__position:focus {
	color: #C41216 !important;
	text-decoration: none;
}

.home-jobs__view {
	flex-shrink: 0;
	padding: 8px 20px;
	border-radius: 999px;
	border: 1px solid #C41216;
	color: #C41216 !important;
	font-size: 13px;
	font-weight: 600;
	text-decoration: none;
	white-space: nowrap;
}

.home-jobs__view:hover, .home-jobs__view:focus {
	background-color: #C41216;
	color: #FFFFFF !important;
	text-decoration: none;
}

.home-jobs__empty {
	padding: 24px 8px;
	margin: 0;
	color: #3F3F3F;
}

.home-jobs__all {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	margin-top: 32px;
	padding: 9px 18px;
	border-radius: 10px;
	background: linear-gradient(90deg, #E11412 0%, #7F1610 78%);
	color: #FFFCFC !important;
	font-size: 14px;
	font-weight: 500;
	text-decoration: none;
}

.home-jobs__all:hover, .home-jobs__all:focus {
	color: #FFFCFC !important;
	text-decoration: none;
	opacity: 0.9;
}

@media screen and (max-width: 870px) {
	.home-jobs {
		padding: 60px 5%;
	}
	.home-jobs__title {
		font-size: 32px;
	}
	.home-jobs__panel {
		padding: 8px 20px;
	}
	.home-jobs__row {
		flex-direction: column;
		align-items: flex-start;
		gap: 10px;
	}
}

.home-faq {
	position: relative;
	width: 100%;
	margin: 0;
	padding: 56px 5%;
	overflow: hidden;
	background: linear-gradient(135deg, #262626 0%, #0A0A0A 100%);
}

.home-faq::before {
	content: "";
	position: absolute;
	inset: 0;
	z-index: 0;
	pointer-events: none;
	background: linear-gradient(180deg, rgba(255, 255, 255, 0.16) 0%,
		rgba(255, 255, 255, 0.04) 45%, transparent 80%);
}

.home-faq__inner {
	position: relative;
	z-index: 1;
	max-width: 1280px;
	margin: 0 auto;
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 40px;
	text-align: left;
}

.home-faq__title {
	margin: 0 0 8px;
	font-size: 32px;
	font-weight: 700;
	line-height: 1.25;
	color: #FFFFFF;
	text-wrap: balance;
}

.home-faq__body {
	max-width: 640px;
	margin: 0;
	font-size: 16px;
	line-height: 1.75;
	color: rgba(255, 255, 255, 0.85);
}

.home-faq__cta {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 12px 28px;
	border-radius: 10px;
	background-color: #FFFFFF;
	color: #C41216 !important;
	font-size: 15px;
	font-weight: 600;
	text-decoration: none;
	white-space: nowrap;
	flex-shrink: 0;
}

.home-faq__cta:hover, .home-faq__cta:focus {
	color: #C41216 !important;
	text-decoration: none;
	opacity: 0.9;
}

@media screen and (max-width: 870px) {
	.home-faq {
		padding: 40px 6%;
	}
	.home-faq__inner {
		flex-direction: column;
		text-align: center;
		gap: 24px;
	}
	.home-faq__title {
		font-size: 28px;
	}
}
</style>

<main class="home-redesign">
	<section class="home-hero">
		<img class="home-hero__sphere home-hero__sphere--1"
			src="/pages-front/img/redesign/home/hero-sphere-1.png" alt=""
			aria-hidden="true"> <img
			class="home-hero__sphere home-hero__sphere--2"
			src="/pages-front/img/redesign/home/hero-sphere-2.png" alt=""
			aria-hidden="true"> <img class="home-hero__wordmark"
			src="/pages-front/img/redesign/home/hero-wordmark.png"
			alt="CubeSoftTech">

		<h1 class="home-hero__title">
			<span class="home-hero__title-accent">Professional</span> IT People<br>Innovative
			IT Solution
		</h1>

		<p class="home-hero__body">
			We deliver <span class="home-hero__typewriter"
				id="homeHeroTypewriter"></span><span class="home-hero__cursor"
				aria-hidden="true">|</span>
		</p>

		<a class="home-hero__cta" href="/contacts">Contact us <span
			aria-hidden="true">&rarr;</span></a>
	</section>

	<section class="home-about">
		<span class="home-about__badge">Full-Service IT Partner</span>

		<h2 class="home-about__title">Welcome to CubeSoftTech</h2>

		<p class="home-about__body">A software development company
			covering every aspect of IT, from one-off projects to a fully
			outsourced team.</p>
	</section>

	<section class="home-services">
		<div class="home-services__inner">
			<div class="home-services__bg-band" aria-hidden="true"></div>

			<nav class="home-services__toc" id="homeServicesToc"
				aria-label="Service categories">
				<span class="home-services__toc-title">Our Services</span>
				<button type="button" class="home-services__toc-item"
					aria-current="true">
					<span class="home-services__toc-num">01</span> IT Staff
					Outsourcing Services
				</button>
				<button type="button" class="home-services__toc-item">
					<span class="home-services__toc-num">02</span> Our Software
					Specialist
				</button>
				<button type="button" class="home-services__toc-item">
					<span class="home-services__toc-num">03</span> IT Advisory
					Services
				</button>
				<button type="button" class="home-services__toc-item">
					<span class="home-services__toc-num">04</span> Digital
					Transformation Services
				</button>
				<a class="home-services__toc-cta" href="/services">Learn more
					<span aria-hidden="true">&rarr;</span>
				</a>
			</nav>

			<div class="home-services__cards" id="homeServicesCards">
				<div class="home-services__card">
					<div class="home-services__icon-wrap">
						<img class="home-services__icon"
							src="/pages-front/img/redesign/home/service-icon-outsourcing.png"
							alt="">
					</div>
					<h3 class="home-services__title">IT Staff Outsourcing Services</h3>
					<p class="home-services__lead">Java, J2EE, ASP.NET, C#.NET
						&amp; VB programmers, ready to deploy</p>

					<ul class="home-services__list">
						<li>Java, J2EE, ASP.NET, C#.NET, VB</li>
						<li>COBOL, AS400, SAP, Oracle</li>
						<li>System Analyst, BA, Tester, Project Manager</li>
						<li>Network Engineers, DBA, IT Support</li>
					</ul>
				</div>

				<div class="home-services__card">
					<div class="home-services__icon-wrap">
						<img class="home-services__icon"
							src="/pages-front/img/redesign/home/service-icon-software.png"
							alt="">
					</div>
					<h3 class="home-services__title">Our Software Specialist</h3>
					<p class="home-services__lead">ERP, CRM &amp; e-commerce
						platforms, built end-to-end</p>
					<ul class="home-services__list">
						<li>Enterprise Resource Planning (ERP) &amp; CRM</li>
						<li>E-Commerce &amp; Corporate Web Platforms</li>
						<li>Stock, Warehouse &amp; Purchase Order Systems</li>
						<li>Banking &amp; Financial Systems</li>
					</ul>
				</div>

				<div class="home-services__card">
					<div class="home-services__icon-wrap">
						<img class="home-services__icon"
							src="/pages-front/img/redesign/home/service-icon-specialize.png"
							alt="">
					</div>
					<h3 class="home-services__title">IT Advisory Services</h3>
					<p class="home-services__lead">Strategic IT consulting for
						small &amp; medium businesses</p>
					<ul class="home-services__list">
						<li>IT Staff Outsourcing &amp; Consulting</li>
						<li>Custom Software Development &amp; Digital Solutions</li>
						<li>Cloud Deployment (AWS, Azure, GCP)</li>
						<li>Security &amp; Compliance Consulting</li>
					</ul>
				</div>

				<div class="home-services__card">
					<div class="home-services__icon-wrap">
						<img class="home-services__icon"
							src="/pages-front/img/redesign/home/service-icon-digital.png"
							alt="">
					</div>
					<h3 class="home-services__title">Digital Transformation
						Services</h3>
					<p class="home-services__lead">Modernizing legacy systems &amp;
						workflows</p>
					<ul class="home-services__list">
						<li>Legacy System Modernization &amp; Integration</li>
						<li>Workflow Automation with RPA &amp; Low-code Platforms</li>
						<li>AI-Powered Chatbots &amp; Process Analytics</li>
						<li>Business Process Automation</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<section class="home-techspec">
		<div class="home-techspec__hub" id="homeTechspecGrid">
			<div class="home-techspec__center">
				<h2 class="home-techspec__title">Technology Specialist</h2>
				<p class="home-techspec__intro">Core expertise across web,
					enterprise, database &amp; mobile</p>
			</div>

			<div class="home-techspec__card home-techspec__card--top-left">
				<div class="home-techspec__icon-wrap">
					<img class="home-techspec__icon"
						src="/pages-front/img/redesign/home/techspec-icon-website.png"
						alt="">
				</div>
				<div>
					<h3 class="home-techspec__card-title">Website Development</h3>
					<ul class="home-techspec__tags">
						<li>Java</li>
						<li>J2EE</li>
						<li>JSP</li>
						<li>Servlet</li>
						<li>ASP.NET</li>
						<li>VB / VC#</li>
						<li>PHP</li>
						<li>HTML</li>
						<li>AJAX</li>
						<li>jQuery</li>
						<li>XML</li>
					</ul>
				</div>
			</div>

			<div class="home-techspec__card home-techspec__card--top-right">
				<div class="home-techspec__icon-wrap">
					<img class="home-techspec__icon"
						src="/pages-front/img/redesign/home/techspec-icon-enterprise.png"
						alt="">
				</div>
				<div>
					<h3 class="home-techspec__card-title">Enterprise Technology</h3>
					<ul class="home-techspec__tags">
						<li>UML</li>
						<li>RUP</li>
						<li>SOA</li>
						<li>Web 2.0</li>
						<li>SOAP</li>
						<li>Web Service</li>
					</ul>
				</div>
			</div>

			<div class="home-techspec__card home-techspec__card--bottom-left">
				<div class="home-techspec__icon-wrap">
					<img class="home-techspec__icon"
						src="/pages-front/img/redesign/home/techspec-icon-database.png"
						alt="">
				</div>
				<div>
					<h3 class="home-techspec__card-title">Database Technology</h3>
					<ul class="home-techspec__tags">
						<li>Oracle</li>
						<li>MySQL</li>
						<li>SQL Server</li>
						<li>DB2</li>
						<li>Sybase</li>
						<li>PostgreSQL</li>
					</ul>
				</div>
			</div>

			<div class="home-techspec__card home-techspec__card--bottom-right">
				<div class="home-techspec__icon-wrap">
					<img class="home-techspec__icon"
						src="/pages-front/img/redesign/home/techspec-icon-mobile.png"
						alt="">
				</div>
				<div>
					<h3 class="home-techspec__card-title">Smartphone / Tablet</h3>
					<ul class="home-techspec__tags">
						<li>iPhone</li>
						<li>iPad</li>
						<li>Android</li>
						<li>J2ME</li>
						<li>BB</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<section class="home-partners">
		<h2 class="home-partners__title">Our Partners</h2>
		<p class="home-partners__intro">CubeSoftTech partners with leading
			Thai enterprises, including major banks, telecommunications
			providers, automotive companies, and government agencies.</p>

		<div class="home-partners__stat" id="homePartnersStat">
			<span class="home-partners__stat-num" id="homePartnersStatNum">0</span><span
				class="home-partners__stat-suffix">+</span>
			<p class="home-partners__stat-label">Trusted Partners</p>
		</div>

		<div class="">
			<div class="home-partners__marquee" id="homePartnersMarquee">
				<%-- 21 logos split across 2 rows (alternating, so both come
					 out close in width) - both rows drift the same direction
					 at the same speed (see home-partners-marquee IIFE below),
					 each looping on its own duplicated set. --%>
				<div class="home-partners__marquee-row"
					id="homePartnersMarqueeRow1">
					<div class="home-partners__logos">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/1.png" alt=""> <img
							class="home-partners__logo" src="/pages-front/img/customer/3.png"
							alt=""> <img class="home-partners__logo"
							src="/pages-front/img/customer/5.png" alt=""> <img
							class="home-partners__logo" src="/pages-front/img/customer/7.jpg"
							alt=""> <img class="home-partners__logo"
							src="/pages-front/img/customer/19.jpg" alt=""> <img
							class="home-partners__logo" src="/pages-front/img/customer/10.jpg"
							alt=""> <img class="home-partners__logo"
							src="/pages-front/img/customer/12.jpg" alt=""> <img
							class="home-partners__logo" src="/pages-front/img/customer/14.jpg"
							alt=""> <img class="home-partners__logo"
							src="/pages-front/img/customer/16.gif" alt=""> <img
							class="home-partners__logo" src="/pages-front/img/customer/8.jpg"
							alt=""> <img class="home-partners__logo"
							src="/pages-front/img/customer/21.jpg" alt="">

						<%-- duplicated so the auto-scroll loop wraps seamlessly --%>
						<img class="home-partners__logo"
							src="/pages-front/img/customer/1.png" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/3.png" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/5.png" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/7.jpg" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/19.jpg" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/10.jpg" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/12.jpg" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/14.jpg" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/16.gif" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/8.jpg" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/21.jpg" alt="" aria-hidden="true">
					</div>
				</div>

				<div class="home-partners__marquee-row"
					id="homePartnersMarqueeRow2">
					<div class="home-partners__logos">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/2.jpg" alt=""> <img
							class="home-partners__logo" src="/pages-front/img/customer/4.png"
							alt=""> <img class="home-partners__logo"
							src="/pages-front/img/customer/6.png" alt=""> <img
							class="home-partners__logo" src="/pages-front/img/customer/18.png"
							alt=""> <img class="home-partners__logo"
							src="/pages-front/img/customer/9.png" alt=""> <img
							class="home-partners__logo" src="/pages-front/img/customer/11.png"
							alt=""> <img class="home-partners__logo"
							src="/pages-front/img/customer/13.jpg" alt=""> <img
							class="home-partners__logo" src="/pages-front/img/customer/15.jpg"
							alt=""> <img class="home-partners__logo"
							src="/pages-front/img/customer/17.png" alt=""> <img
							class="home-partners__logo" src="/pages-front/img/customer/20.png"
							alt="">

						<%-- duplicated so the auto-scroll loop wraps seamlessly --%>
						<img class="home-partners__logo"
							src="/pages-front/img/customer/2.jpg" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/4.png" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/6.png" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/18.png" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/9.png" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/11.png" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/13.jpg" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/15.jpg" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/17.png" alt="" aria-hidden="true">
						<img class="home-partners__logo"
							src="/pages-front/img/customer/20.png" alt="" aria-hidden="true">
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="home-jobs">
		<h2 class="home-jobs__title">Open Positions</h2>
		<p class="home-jobs__intro">Join our team - explore current
			openings at CubeSoftTech.</p>

		<div class="home-jobs__panel">
			<c:if test="${empty jobList}">
				<p class="home-jobs__empty">No open positions right now - check
					back soon.</p>
			</c:if>
			<c:if test="${not empty jobList}">
				<ul class="home-jobs__list">
					<c:forEach var="job" items="${jobList}">
						<li>
							<div class="home-jobs__row">
								<a class="home-jobs__position" href="${job.page_uri_id}">${job.position}</a>
								<a class="home-jobs__view" href="${job.page_uri_id}">View
									Details</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>

		<a class="home-jobs__all" href="/careers#jobt">All Positions <span
			aria-hidden="true">&rarr;</span></a>
	</section>

	<section class="home-faq">
		<div class="home-faq__inner">
			<div>
				<h2 class="home-faq__title">Let's Discuss Your Requirements</h2>
				<p class="home-faq__body">Our team is ready to advise on the
					right IT staffing or software solution for your business.</p>
			</div>
			<a class="home-faq__cta" href="/contacts">Contact Us <span
				aria-hidden="true">&rarr;</span></a>
		</div>
	</section>
</main>

<script type="text/javascript">
	(function() {
		var grid = document.getElementById('homeTechspecGrid');
		if (!grid) {
			return;
		}

		var observer = new IntersectionObserver(function(entries) {
			entries.forEach(function(entry) {
				grid.classList.toggle('is-revealed', entry.isIntersecting);
			});
		}, {
			threshold : 0.3
		});
		observer.observe(grid);
	})();

	(function() {
		// Both rows run this same drift/pause/drag behavior independently -
		// each keeps its own scroll position and loops on its own content
		// width, but they share the same speed and direction so they read
		// as one calm, unified stream of logos rather than two competing
		// for attention.
		function initMarqueeRow(marquee) {
			var paused = false;
			var inView = false;
			var speed = 1; // px per frame (~120px/s at 60fps)

			function tick() {
				if (!paused && inView) {
					marquee.scrollLeft += speed;
					var halfWidth = marquee.scrollWidth / 2;
					if (marquee.scrollLeft >= halfWidth) {
						marquee.scrollLeft -= halfWidth;
					}
				}
				requestAnimationFrame(tick);
			}
			requestAnimationFrame(tick);

			var observer = new IntersectionObserver(function(entries) {
				entries.forEach(function(entry) {
					inView = entry.isIntersecting;
				});
			}, {
				threshold : 0.1
			});
			observer.observe(marquee);

			// Pause the auto-drift while the visitor is actively hovering/touching/
			// dragging it themselves. Mouse resumes the instant the pointer leaves;
			// touch waits a moment since a swipe still has momentum scrolling to
			// finish, and resuming auto-drift mid-momentum would fight it.
			var resumeTimer = null;
			function pause() {
				paused = true;
				clearTimeout(resumeTimer);
			}
			function resumeNow() {
				clearTimeout(resumeTimer);
				paused = false;
			}
			function resumeSoon() {
				clearTimeout(resumeTimer);
				resumeTimer = setTimeout(resumeNow, 1200);
			}
			marquee.addEventListener('mouseenter', pause);
			marquee.addEventListener('mouseleave', resumeNow);
			marquee.addEventListener('touchstart', pause, {
				passive : true
			});
			marquee.addEventListener('touchend', resumeSoon);

			// Native drag-to-scroll with the mouse (touch/trackpad already scroll
			// this natively since it's a real overflow-x container).
			var isDragging = false;
			var dragStartX = 0;
			var dragStartScroll = 0;
			marquee.addEventListener('mousedown', function(e) {
				isDragging = true;
				dragStartX = e.pageX;
				dragStartScroll = marquee.scrollLeft;
			});
			window.addEventListener('mouseup', function() {
				isDragging = false;
			});
			window.addEventListener('mousemove', function(e) {
				if (!isDragging) {
					return;
				}
				marquee.scrollLeft = dragStartScroll - (e.pageX - dragStartX);
			});
		}

		['homePartnersMarqueeRow1', 'homePartnersMarqueeRow2'].forEach(function(id) {
			var row = document.getElementById(id);
			if (row) {
				initMarqueeRow(row);
			}
		});
	})();

	(function() {
		var numEl = document.getElementById('homePartnersStatNum');
		// Watches the logo marquee, not the stat number itself - the
		// number sits above the marquee, so triggering off the number
		// alone meant the count-up finished before the visitor had even
		// scrolled far enough to see the logos it's counting.
		var marqueeEl = document.getElementById('homePartnersMarquee');
		if (!numEl || !marqueeEl) {
			return;
		}

		// Counts the real logos, not the duplicated set used for the marquee
		// loop (see home-partners-marquee IIFE above), so this can't drift out
		// of sync if a logo is ever added or removed.
		var target = document
				.querySelectorAll('#homePartnersMarquee .home-partners__logo:not([aria-hidden])').length;

		var counted = false;
		var observer = new IntersectionObserver(function(entries) {
			entries.forEach(function(entry) {
				if (entry.isIntersecting && !counted) {
					counted = true;
					var current = 0;
					var step = Math.max(1, Math.round(target / 50));
					var interval = setInterval(function() {
						current += step;
						if (current >= target) {
							current = target;
							clearInterval(interval);
						}
						numEl.textContent = current;
					}, 25);
					observer.unobserve(entry.target);
				}
			});
		}, {
			threshold : 0.3
		});
		observer.observe(marqueeEl);
	})();

	(function() {
		var phrases = [ 'IT Staff Outsourcing Services', 'IT Consultants',
				'Custom Software Solutions' ];
		var el = document.getElementById('homeHeroTypewriter');
		if (!el) {
			return;
		}
		var phraseIndex = 0, charIndex = 0, deleting = false;

		function tick() {
			var phrase = phrases[phraseIndex];
			if (!deleting) {
				charIndex++;
				el.textContent = phrase.slice(0, charIndex);
				if (charIndex === phrase.length) {
					deleting = true;
					setTimeout(tick, 1600);
					return;
				}
			} else {
				charIndex--;
				el.textContent = phrase.slice(0, charIndex);
				if (charIndex === 0) {
					deleting = false;
					phraseIndex = (phraseIndex + 1) % phrases.length;
				}
			}
			setTimeout(tick, deleting ? 35 : 60);
		}
		tick();
	})();
</script>

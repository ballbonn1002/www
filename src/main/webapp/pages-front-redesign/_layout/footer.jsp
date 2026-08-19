<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- Same data sources as the legacy footer (session-scoped, set by
	 FooterAction.list()) - only the markup/styling changes here. --%>
<footer class="rfooter">

	<div class="rfooter-top">
		<img src="/pages-front/img/logo/logo2-w.png" width="200" height="74"
			alt="Cube SoftTech Co., Ltd." class="rfooter-brand__logo"
			draggable="false">
		<p class="rfooter-tagline">Professional IT People, Innovative IT
			Solution</p>
		<div class="rfooter-social">
			<a href="https://www.facebook.com/CubeSoftTech"
				class="rfooter-social__link" target="_blank"
				aria-label="Facebook"><i class="bi bi-facebook"
				aria-hidden="true"></i></a>
			<a href="https://lin.ee/2zYeCXX" class="rfooter-social__link"
				target="_blank" aria-label="Line"><i class="bi bi-line"
				aria-hidden="true"></i></a>
			<a href="https://www.tiktok.com/@cubesofttech"
				class="rfooter-social__link" target="_blank"
				aria-label="TikTok"><i class="bi bi-tiktok" aria-hidden="true"></i></a>
			<a href="https://www.linkedin.com/company/cubesofttech"
				class="rfooter-social__link" target="_blank"
				aria-label="LinkedIn"><i class="bi bi-linkedin"
				aria-hidden="true"></i></a>
			<a href="https://www.youtube.com/channel/UCSYGv-HblWhASgyvD6TJthw"
				class="rfooter-social__link" target="_blank"
				aria-label="YouTube"><i class="bi bi-youtube"
				aria-hidden="true"></i></a>
		</div>
	</div>

	<div class="rfooter-grid">

		<div class="rfooter-col">
			<div class="rfooter-section__heading">
				<span class="rfooter-section__title">Contact</span>
			</div>
			<div class="rfooter-address">
				<div class="rfooter-address__name">Cube SoftTech Co., Ltd.</div>
				<div class="rfooter-address__line">160/170-2, 12A Fl., ITF Silom
					Palace Building, Silom Rd., Suriyawong, Bangrak, Bangkok
					10500</div>
				<a href="https://maps.app.goo.gl/a1N8Xi2qvhbVKFsW8"
					class="rfooter-address__map rfooter-link" target="_blank"><span
						class="rfooter-link__text">View on map</span><svg
						class="rfooter-link__arrow" width="13" height="13"
						viewBox="0 0 16 16" fill="none" aria-hidden="true">
						<path d="M4.5 11.5L11.5 4.5" stroke="currentColor"
							stroke-width="2.6" stroke-linecap="round" />
						<path d="M5.6 4.5H11.5V10.4" stroke="currentColor"
							stroke-width="2.6" stroke-linecap="round"
							stroke-linejoin="round" />
					</svg>
				</a>
			</div>
			<div class="rfooter-contact">
				<div class="rfooter-contact__row"><span
					class="rfooter-contact__label">Phone</span>
					<span class="rfooter-contact__value rfooter-contact__value--stacked">
						<a href="tel:026798855" class="rfooter-link"><span class="rfooter-link__text">02 679 8855</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
						<a href="tel:026344449" class="rfooter-link"><span class="rfooter-link__text">02 634 4449</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
						<a href="tel:0880229400" class="rfooter-link"><span class="rfooter-link__text">088 022 9400</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
					</span>
				</div>
				<div class="rfooter-contact__row"><span
					class="rfooter-contact__label">Sales</span> <a
					href="mailto:info@cubesofttech.com"
					class="rfooter-contact__value rfooter-link">info@cubesofttech.com<svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a></div>
				<div class="rfooter-contact__row"><span
					class="rfooter-contact__label">Jobs</span> <a
					href="mailto:hr@cubesofttech.com"
					class="rfooter-contact__value rfooter-link">hr@cubesofttech.com<svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a></div>
			</div>
		</div>

		<div class="rfooter-col">
			<c:forEach var="ft" items="${Footer}">
				<c:if test="${ft.footer_name == 'Services'}">
					<div class="rfooter-section">
						<div class="rfooter-section__heading">
							<a href="${fn:replace(fn:replace(ft.footer_url, 'https://www.cubesofttech.com', ''), 'http://www.cubesofttech.com', '')}" class="rfooter-section__title">${ft.footer_name}</a>
						</div>
						<c:forEach var="cft" items="${ChildFooter}">
							<c:if test="${cft.parent_footer_id == ft.footer_id}">
								<a href="${fn:replace(fn:replace(cft.footer_url, 'https://www.cubesofttech.com', ''), 'http://www.cubesofttech.com', '')}" class="rfooter-link"><span class="rfooter-link__text">${cft.footer_name}</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
							</c:if>
						</c:forEach>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div class="rfooter-col">
			<c:forEach var="ft" items="${Footer}">
				<c:if test="${ft.footer_name == 'Careers'}">
					<div class="rfooter-section">
						<div class="rfooter-section__heading">
							<a href="${fn:replace(fn:replace(ft.footer_url, 'https://www.cubesofttech.com', ''), 'http://www.cubesofttech.com', '')}" class="rfooter-section__title">${ft.footer_name}</a>
						</div>
						<c:forEach var="cft" items="${ChildFooter}">
							<c:if test="${cft.parent_footer_id == ft.footer_id}">
								<a href="${fn:replace(fn:replace(cft.footer_url, 'https://www.cubesofttech.com', ''), 'http://www.cubesofttech.com', '')}" class="rfooter-link"><span class="rfooter-link__text">${cft.footer_name}</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
							</c:if>
						</c:forEach>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div class="rfooter-col">
			<c:set var="blogHeadingShown" value="0" />
			<c:forEach var="article" items="${Article}">
				<c:if test="${article.article_type_id == 2 and blogHeadingShown < 1}">
					<div class="rfooter-section__heading">
						<a href="/${article.header_name}"
							class="rfooter-section__title">${article.header_name}</a>
					</div>
					<c:set var="blogHeadingShown" value="1" />
				</c:if>
			</c:forEach>
			<c:set var="blogCount" value="0" />
			<c:forEach var="a" items="${Article}">
				<c:if test="${a.article_type_id == 2 and blogCount < 10}">
					<a href="${a.page_uri_id}" class="rfooter-link rfooter-link--clamp"><span class="rfooter-link__text">${a.topic}</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
					<c:set var="blogCount" value="${blogCount + 1}" />
				</c:if>
			</c:forEach>
		</div>

		<div class="rfooter-col">
			<c:set var="newsHeadingShown" value="0" />
			<c:forEach var="article" items="${Article}">
				<c:if test="${article.article_type_id == 1 and newsHeadingShown < 1}">
					<div class="rfooter-section__heading">
						<a href="/${article.header_name}"
							class="rfooter-section__title">${article.header_name}</a>
					</div>
					<c:set var="newsHeadingShown" value="1" />
				</c:if>
			</c:forEach>
			<c:set var="newsCount" value="0" />
			<c:forEach var="a" items="${Article}">
				<c:if test="${a.article_type_id == 1 and newsCount < 10}">
					<a href="${a.page_uri_id}" class="rfooter-link rfooter-link--clamp"><span class="rfooter-link__text">${a.topic}</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
					<c:set var="newsCount" value="${newsCount + 1}" />
				</c:if>
			</c:forEach>
		</div>

	</div>

	<%-- Mobile: same accordion pattern as the legacy footer (one section
		 open at a time, plain classList.toggle - no Bootstrap collapse JS
		 dependency), just restyled for the dark theme. --%>
	<div class="rfooter-accordion">
		<button type="button" class="rfooter-accordion__toggle"
			data-target="#rfooterAccContact">
			<span>Contact Us</span> <i class="bi bi-chevron-right"
				aria-hidden="true"></i>
		</button>
		<div class="rfooter-accordion__panel" id="rfooterAccContact">
			<div class="rfooter-contact">
				<div class="rfooter-contact__row"><span
					class="rfooter-contact__label">Phone</span>
					<span class="rfooter-contact__value rfooter-contact__value--stacked">
						<a href="tel:026798855" class="rfooter-link"><span class="rfooter-link__text">02 679 8855</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
						<a href="tel:026344449" class="rfooter-link"><span class="rfooter-link__text">02 634 4449</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
						<a href="tel:0880229400" class="rfooter-link"><span class="rfooter-link__text">088 022 9400</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
					</span>
				</div>
				<div class="rfooter-contact__row"><span
					class="rfooter-contact__label">Sales</span> <a
					href="mailto:info@cubesofttech.com"
					class="rfooter-contact__value rfooter-link">info@cubesofttech.com<svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a></div>
				<div class="rfooter-contact__row"><span
					class="rfooter-contact__label">Jobs</span> <a
					href="mailto:hr@cubesofttech.com"
					class="rfooter-contact__value rfooter-link">hr@cubesofttech.com<svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a></div>
			</div>
		</div>

		<c:forEach var="ft" items="${Footer}">
			<button type="button" class="rfooter-accordion__toggle"
				data-target="#rfooterAccFooter${ft.footer_id}">
				<span>${ft.footer_name}</span> <i class="bi bi-chevron-right"
					aria-hidden="true"></i>
			</button>
			<div class="rfooter-accordion__panel"
				id="rfooterAccFooter${ft.footer_id}">
				<c:forEach var="cft" items="${ChildFooter}">
					<c:if test="${cft.parent_footer_id == ft.footer_id}">
						<a href="${fn:replace(fn:replace(cft.footer_url, 'https://www.cubesofttech.com', ''), 'http://www.cubesofttech.com', '')}" class="rfooter-link"><span class="rfooter-link__text">${cft.footer_name}</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>

		<button type="button" class="rfooter-accordion__toggle"
			data-target="#rfooterAccBlog">
			<span>Blog</span> <i class="bi bi-chevron-right" aria-hidden="true"></i>
		</button>
		<div class="rfooter-accordion__panel" id="rfooterAccBlog">
			<c:set var="blogCountM" value="0" />
			<c:forEach var="a" items="${Article}">
				<c:if test="${a.article_type_id == 2 and blogCountM < 10}">
					<a href="${a.page_uri_id}" class="rfooter-link rfooter-link--clamp"><span class="rfooter-link__text">${a.topic}</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
					<c:set var="blogCountM" value="${blogCountM + 1}" />
				</c:if>
			</c:forEach>
		</div>

		<button type="button" class="rfooter-accordion__toggle"
			data-target="#rfooterAccNews">
			<span>News</span> <i class="bi bi-chevron-right" aria-hidden="true"></i>
		</button>
		<div class="rfooter-accordion__panel" id="rfooterAccNews">
			<c:set var="newsCountM" value="0" />
			<c:forEach var="a" items="${Article}">
				<c:if test="${a.article_type_id == 1 and newsCountM < 10}">
					<a href="${a.page_uri_id}" class="rfooter-link rfooter-link--clamp"><span class="rfooter-link__text">${a.topic}</span><svg class="rfooter-link__arrow" width="13" height="13" viewBox="0 0 16 16" fill="none" aria-hidden="true"><path d="M4.5 11.5L11.5 4.5" stroke="currentColor" stroke-width="2.6" stroke-linecap="round"/><path d="M5.6 4.5H11.5V10.4" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
					<c:set var="newsCountM" value="${newsCountM + 1}" />
				</c:if>
			</c:forEach>
		</div>
	</div>

	<div class="rfooter-bottom">
		<div class="rfooter-bottom__inner">
			<div class="rfooter-copyright">&copy; <%= java.time.Year.now() %>
				Cube SoftTech Co., Ltd. All rights reserved.</div>
		</div>
	</div>

</footer>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var accordion = document.querySelector('.rfooter-accordion');
		if (!accordion) {
			return;
		}
		accordion.addEventListener('click', function(event) {
			var toggle = event.target.closest('.rfooter-accordion__toggle');
			if (!toggle) {
				return;
			}
			var panel = document.querySelector(toggle.getAttribute('data-target'));
			var wasOpen = toggle.classList.contains('is-open');

			accordion.querySelectorAll('.rfooter-accordion__toggle').forEach(function(btn) {
				btn.classList.remove('is-open');
			});
			accordion.querySelectorAll('.rfooter-accordion__panel').forEach(function(p) {
				p.classList.remove('is-open');
			});

			if (!wasOpen) {
				toggle.classList.add('is-open');
				if (panel) {
					panel.classList.add('is-open');
				}
			}
		});
	});
</script>

<style>
/* Not the mockup's Archivo/IBM Plex Mono - sitewide Sarabun stack covers Thai titles. */
.rfooter {
	background: #18181B;
}

.rfooter-grid {
	max-width: 1240px;
	margin: 0 auto;
	padding: 32px 40px 40px;
	display: grid;
	grid-template-columns: 1.1fr 0.95fr 0.85fr 1fr 1fr;
	align-items: start;
	gap: 40px;
}

.rfooter-col {
	display: flex;
	flex-direction: column;
	gap: 14px;
	min-width: 0;
}

.rfooter-top {
	max-width: 1240px;
	margin: 0 auto;
	padding: 40px 40px 32px;
	border-bottom: 1px solid #27272A;
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 24px;
	flex-wrap: wrap;
}

.rfooter-tagline {
	flex: 1;
	min-width: 200px;
	margin: 0;
	text-align: center;
	font-size: 15px;
	color: #C4C2BA;
}

.rfooter-brand__logo {
	width: 200px;
	height: 74px;
	object-fit: contain;
}

.rfooter-address {
	display: flex;
	flex-direction: column;
	gap: 5px;
}

.rfooter-address__name {
	font-size: 14px;
	font-weight: 600;
	color: #E4E4E7;
}

.rfooter-address__line {
	font-size: 14px;
	line-height: 1.65;
	color: #C4C2BA;
	max-width: 290px;
}

.rfooter-address__map {
	font-size: 13px;
	color: #C4C2BA !important;
	margin-top: 4px;
}

.rfooter-address__map.rfooter-link {
	text-decoration: underline !important;
	text-decoration-color: rgba(196, 194, 186, 0.4);
	text-underline-offset: 2px;
}

.rfooter-address__map:hover {
	color: #FFFFFF !important;
	text-decoration: none;
}

.rfooter-contact {
	display: flex;
	flex-direction: column;
	gap: 10px;
	margin-top: 10px;
}

.rfooter-contact__row {
	display: flex;
	gap: 10px;
	font-size: 14px;
}

.rfooter-contact__label {
	color: #8A8880;
	width: 44px;
	flex-shrink: 0;
}

.rfooter-contact__value--stacked {
	display: flex;
	flex-direction: column;
	gap: 2px;
}

.rfooter-section {
	display: flex;
	flex-direction: column;
	gap: 14px;
}

.rfooter-section__heading {
	display: flex;
	align-items: center;
}


.rfooter-section__title {
	font-size: 16px;
	font-weight: 700;
	letter-spacing: 0.02em;
	text-transform: uppercase;
	color: #FFFFFF !important;
	text-decoration: none !important;
}

.rfooter-col .rfooter-section__title {
	margin-bottom: 2px;
}

.rfooter-link {
	display: inline;
	line-height: 1.5;
	font-size: 14px;
	color: #C4C2BA !important;
	text-decoration: none !important;
}

.rfooter-link:hover {
	color: #FFFFFF !important;
	text-decoration: none !important;
}

.rfooter-link__arrow {
	display: inline-block;
	width: 11px;
	height: 11px;
	margin-left: 3px;
	vertical-align: middle;
	color: currentColor;
	opacity: 0;
	transform: translate(-3px, 3px);
	transition: opacity 0.35s ease, transform 0.35s ease;
}

.rfooter-link:hover .rfooter-link__arrow {
	opacity: 1;
	transform: translate(0, 0);
}

.rfooter-link--clamp {
	display: flex;
	align-items: flex-start;
	align-self: stretch;
	width: 100%;
	font-size: 13.5px;
	line-height: 1.45;
}

.rfooter-link--clamp .rfooter-link__text {
	flex: 1;
	min-width: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.rfooter-link--clamp .rfooter-link__arrow {
	flex-shrink: 0;
	margin-left: 4px;
	margin-top: 2px;
}

.rfooter-accordion {
	display: none;
}

.rfooter-accordion__toggle {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 14px 0;
	border: none;
	border-top: 1px solid #27272A;
	background: none;
	color: #FFFFFF;
	font-size: 14px;
	font-weight: 700;
	text-align: left;
}

.rfooter-accordion__toggle .bi {
	transition: transform 0.2s ease;
	color: #71717A;
}

.rfooter-accordion__toggle.is-open .bi {
	transform: rotate(90deg);
}

.rfooter-accordion__panel {
	display: none;
	flex-direction: column;
	gap: 10px;
	padding: 4px 0 16px;
}

.rfooter-accordion__panel.is-open {
	display: flex;
}

.rfooter-bottom {
	border-top: 0.5px solid #3A3A37;
}

.rfooter-bottom__inner {
	max-width: 1240px;
	margin: 0 auto;
	padding: 22px 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.rfooter-copyright {
	font-size: 13px;
	color: #71717A;
}

.rfooter-social {
	display: flex;
	align-items: center;
	gap: 14px;
	flex-wrap: wrap;
}

.rfooter-social__link {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 42px;
	height: 42px;
	border-radius: 50%;
	background-color: #FFFFFF;
	color: var(--brand-red) !important;
	font-size: 20px;
	transition: background-color 0.2s ease, color 0.2s ease, transform 0.2s ease;
}

.rfooter-social__link:hover {
	background-color: var(--brand-red);
	color: #FFFFFF !important;
	transform: translateY(-2px);
}

@media screen and (max-width: 991px) {
	.rfooter-grid {
		grid-template-columns: 1fr 1fr;
	}
}

@media screen and (max-width: 767px) {
	.rfooter-top {
		padding: 32px 5% 0;
		flex-direction: column;
		text-align: center;
	}
	.rfooter-tagline {
		min-width: 0;
		order: 1;
	}
	.rfooter-social {
		order: 2;
	}
	.rfooter-grid {
		display: none;
	}
	.rfooter-accordion {
		display: block;
		max-width: 1240px;
		margin: 0 auto;
		padding: 8px 5% 0;
	}
	.rfooter-bottom__inner {
		padding: 20px 5%;
		justify-content: center;
		text-align: center;
	}
}
</style>

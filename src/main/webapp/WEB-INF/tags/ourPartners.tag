<%@ tag pageEncoding="UTF-8"%>

<%-- Shared "Our Partners" block - appears on multiple pages, so it lives here once instead of copy-pasted. --%>

<style>
.our-partners {
	max-width: 1280px;
	margin: 0 auto;
	padding: 0 80px 96px;
	text-align: center;
}

.our-partners__title {
	margin: 0 0 24px;
	font-size: 48px;
	font-weight: 400;
	line-height: 1.25;
	color: #000000;
}

.our-partners__body {
	max-width: 800px;
	margin: 0 auto 40px;
	font-size: 16px;
	line-height: 1.875;
	color: #3F3F3F;
}

.our-partners__strip {
	padding: 48px 45px;
	border-radius: 40px;
	background-color: #F7F7F7;
	border: 1px solid rgba(255, 255, 255, 0.4);
	box-shadow: 4px 4px 10px rgba(166, 171, 189, 0.35), -5px -5px 10px rgba(255, 255, 255, 0.6);
}

.our-partners__logos {
	display: block;
	width: 100%;
	height: auto;
}

@media screen and (max-width: 870px) {
	.our-partners {
		padding: 0 5% 56px;
	}
	.our-partners__title {
		font-size: 32px;
	}
	.our-partners__strip {
		padding: 32px 20px;
		border-radius: 24px;
	}
}
</style>

<section class="our-partners">
	<h2 class="our-partners__title">Our Partners</h2>
	<p class="our-partners__body">CubeSoftTech partners with leading Thai
		enterprises, including major banks, telecommunications providers,
		automotive companies, and government agencies.</p>
	<div class="our-partners__strip">
		<img class="our-partners__logos"
			src="/pages-front/img/redesign/services/services-partner-logos.png"
			alt="Our partners: KTB, TTB, PTT, Marubeni, JFE Holdings and other leading enterprises">
	</div>
</section>

<%@ tag pageEncoding="UTF-8" body-content="scriptless"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ attribute name="quote" required="true" type="java.lang.String"%>
<%@ attribute name="name" required="true" type="java.lang.String"%>
<%@ attribute name="position" required="true" type="java.lang.String"%>
<%@ attribute name="avatarSrc" required="false" type="java.lang.String"%>
<%@ attribute name="avatarAlt" required="false" type="java.lang.String"%>
<%@ attribute name="delay" required="false" type="java.lang.String"%>

<style>
.testimonial-card {
	position: relative;
	box-sizing: border-box;
	max-width: 680px;
	margin: 0 auto;
	padding: 40px;
	border: 1px solid #E8E8E8;
	border-radius: 20px;
	background-color: #FFFFFF;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.testimonial-card__quote-mark {
	width: 32px;
	height: 24px;
	flex-shrink: 0;
}

.testimonial-card__quote {
	margin: 0;
	font-size: 16px;
	line-height: 1.75;
	color: #5A5A5A;
	text-align: left;
	height: 140px;
	display: -webkit-box;
	-webkit-line-clamp: 5;
	line-clamp: 5;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.testimonial-card__divider {
	height: 1px;
	background-color: #EDEDED;
}

.testimonial-card__person {
	display: flex;
	align-items: center;
	gap: 14px;
}

.testimonial-card__avatar-ring {
	flex-shrink: 0;
	width: 56px;
	height: 56px;
	padding: 2px;
	border-radius: 50%;
	background: linear-gradient(135deg, #C41216, #FF7A59);
}

.testimonial-card__avatar {
	display: block;
	width: 100%;
	height: 100%;
	border-radius: 50%;
	border: 2px solid #FFFFFF;
	object-fit: cover;
}

.testimonial-card__avatar--initial {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #C41216;
	color: #FFFFFF;
	font-size: 20px;
	font-weight: 700;
}

.testimonial-card__meta {
	display: flex;
	flex-direction: column;
	gap: 2px;
	min-width: 0;
}

.testimonial-card__name {
	font-size: 16px;
	font-weight: 700;
	color: #1A1A1A;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.testimonial-card__position {
	font-size: 12.5px;
	font-weight: 600;
	color: #C41216;
	letter-spacing: 0.4px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

@media screen and (max-width: 870px) {
	.testimonial-card {
		margin: 0 5%;
		padding: 24px;
	}
}
</style>

<div class="testimonial-card" data-aos="fade-up" data-aos-delay="${empty delay ? 0 : delay}">
	<svg class="testimonial-card__quote-mark" viewBox="0 0 30 22" fill="none" aria-hidden="true">
		<path d="M0 22V11.6C0 4.7 4.1.7 10.4 0v3.8C6.7 4.7 4.9 6.9 4.7 10h5.7v12H0zm16 0V11.6C16 4.7 20.1.7 26.4 0v3.8c-3.7.9-5.5 3.1-5.7 6.2h5.7v12H16z" fill="#C41216" opacity="0.16" />
	</svg>
	<p class="testimonial-card__quote" title="${quote}">${quote}</p>
	<div class="testimonial-card__divider"></div>
	<div class="testimonial-card__person">
		<div class="testimonial-card__avatar-ring">
			<c:choose>
				<c:when test="${not empty avatarSrc}">
					<img class="testimonial-card__avatar" src="${avatarSrc}" alt="${avatarAlt}">
				</c:when>
				<c:otherwise>
					<div class="testimonial-card__avatar testimonial-card__avatar--initial" aria-hidden="true">${fn:toUpperCase(fn:substring(name, 0, 1))}</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="testimonial-card__meta">
			<span class="testimonial-card__name">${name}</span>
			<span class="testimonial-card__position">${position}</span>
		</div>
	</div>
</div>

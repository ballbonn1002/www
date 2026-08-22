<%@ tag pageEncoding="UTF-8" body-content="scriptless"%>

<%@ attribute name="title" required="true" type="java.lang.String"%>
<%@ attribute name="desc" required="true" type="java.lang.String"%>
<%@ attribute name="delay" required="false" type="java.lang.String"%>

<style>
.careers-card {
	position: relative;
	overflow: hidden;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	gap: 16px;
	padding: 32px;
	border-radius: 10px;
	background-color: #FFFFFF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
	transition: box-shadow 0.35s ease;
}

.careers-card:hover {
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
}

.careers-card__icon-zone {
	position: relative;
	width: 100%;
	height: 70px;
	flex-shrink: 0;
}

.careers-card__icon-chip {
	position: relative;
	overflow: hidden;
	width: 56px;
	height: 56px;
	border-radius: 14px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: rgba(196, 18, 22, 0.08);
	color: #C41216;
	box-shadow: none;
	transition: background-color 0.35s ease, box-shadow 0.35s ease, color 0.35s ease;
}

.careers-card:hover .careers-card__icon-chip {
	background-color: #C41216;
	color: #FFFFFF;
	box-shadow: 0 6px 16px rgba(196, 18, 22, 0.35);
}

.careers-card__icon-bg {
	position: relative;
	z-index: 1;
	width: 30px;
	height: 30px;
}

/* Diagonal shine bar, clipped inside the chip, swept across on hover. */
.careers-card__shine {
	position: absolute;
	top: -20px;
	left: -70px;
	width: 36px;
	height: 110px;
	background: linear-gradient(120deg, transparent 20%, rgba(255, 255, 255, 0.85) 50%, transparent 80%);
	transform: rotate(20deg);
	transition: left 0s;
	pointer-events: none;
	z-index: 0;
}

.careers-card:hover .careers-card__shine {
	left: 90px;
	transition: left 0.6s ease;
}

.careers-card__title {
	position: relative;
	z-index: 1;
	margin: 0;
	font-size: 18px;
	font-weight: 700;
	color: #000000;
}

.careers-card__desc {
	position: relative;
	z-index: 1;
	margin: 0;
	font-size: 14px;
	line-height: 1.7;
	color: #3F3F3F;
}
</style>

<div class="careers-card" data-aos="fade-up" data-aos-delay="${empty delay ? 0 : delay}">
	<div class="careers-card__icon-zone">
		<div class="careers-card__icon-chip">
			<span class="careers-card__shine" aria-hidden="true"></span>
			<span class="careers-card__icon-bg" aria-hidden="true"><jsp:doBody/></span>
		</div>
	</div>
	<h3 class="careers-card__title">${title}</h3>
	<p class="careers-card__desc">${desc}</p>
</div>

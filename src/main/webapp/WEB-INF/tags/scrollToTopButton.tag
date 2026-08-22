<%@ tag pageEncoding="UTF-8"%>

<%-- Self-contained back-to-top control: markup + style + behavior in one <comp:scrollToTopButton /> include. --%>

<button type="button" class="scroll-to-top-cube" id="scrollToTopCube" aria-label="Back to top">
	<svg class="scroll-to-top-cube__svg" viewBox="0 0 24 24" aria-hidden="true">
		<polygon class="scroll-to-top-cube__face scroll-to-top-cube__face--top" points="12,2 21,7.5 12,13 3,7.5" />
		<polygon class="scroll-to-top-cube__face scroll-to-top-cube__face--left" points="3,7.5 12,13 12,22 3,16.5" />
		<polygon class="scroll-to-top-cube__face scroll-to-top-cube__face--right" points="12,13 21,7.5 21,16.5 12,22" />
		<path class="scroll-to-top-cube__arrow" d="M12 16.5 L12 8.5 M8.3 11.7 L12 8 L15.7 11.7" />
	</svg>
</button>

<style>
.scroll-to-top-cube {
	position: fixed;
	right: 30px;
	bottom: 30px;
	z-index: 999;
	width: 66px;
	height: 66px;
	padding: 0;
	border: none;
	outline: none;
	background: none;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 0;
	pointer-events: none;
	transition: opacity 0.15s linear;
}

.scroll-to-top-cube.is-visible {
	opacity: 1;
	pointer-events: auto;
}

.scroll-to-top-cube:focus {
	outline: none;
	box-shadow: none;
}

.scroll-to-top-cube__svg {
	width: 100%;
	height: 100%;
	overflow: visible;
	filter: drop-shadow(0 8px 14px rgba(189, 33, 37, 0.35));
}

.scroll-to-top-cube__face--top {
	fill: #FF6B6E;
}

.scroll-to-top-cube__face--left {
	fill: #7A1519;
}

.scroll-to-top-cube__face--right {
	fill: #BD2125;
}

.scroll-to-top-cube__arrow {
	fill: none;
	stroke: #fff;
	stroke-width: 1.6;
	stroke-linecap: round;
	stroke-linejoin: round;
}

@media (max-width: 767px) {
	.scroll-to-top-cube {
		right: 18px;
		bottom: 18px;
		width: 52px;
		height: 52px;
	}
}
</style>

<script>
(function() {
	var btn = document.getElementById('scrollToTopCube');
	if (!btn) {
		return;
	}
	function updateVisibility() {
		if (!btn.classList.contains('is-scrolling')) {
			btn.classList.toggle('is-visible', window.scrollY > 400);
		}
	}
	window.addEventListener('scroll', updateVisibility, { passive: true });
	updateVisibility();

	var pausedTriggers = [];
	var scrollEndTimer = null;

	function onScrollForEnd() {
		if (!btn.classList.contains('is-scrolling')) {
			return;
		}
		clearTimeout(scrollEndTimer);
		scrollEndTimer = setTimeout(function() {
			btn.classList.remove('is-scrolling');
			if (pausedTriggers.length) {
				pausedTriggers.forEach(function(st) {
					st.enable();
				});
				ScrollTrigger.refresh();
				pausedTriggers = [];
			}
			updateVisibility();
		}, 120);
	}
	window.addEventListener('scroll', onScrollForEnd, { passive: true });

	btn.addEventListener('click', function() {
		btn.classList.add('is-scrolling');
		pausedTriggers = (typeof ScrollTrigger !== 'undefined') ? ScrollTrigger.getAll() : [];
		pausedTriggers.forEach(function(st) {
			st.disable(true);
		});
		window.scrollTo({ top : 0, left : 0, behavior : 'smooth' });
	});
})();
</script>

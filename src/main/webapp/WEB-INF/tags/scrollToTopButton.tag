<%@ tag pageEncoding="UTF-8"%>

<%-- Self-contained back-to-top control: markup + style + behavior in one
     include, so any redesign page can add it with <comp:scrollToTopButton />
     instead of re-wiring its own scrollFunction()/topFunction() (the pattern
     duplicated in contacts.jsp/blog.jsp/blog_detail.jsp today). --%>

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
	transform: translateY(14px) rotate(-8deg) scale(0.85);
	pointer-events: none;
	transition: opacity 0.3s ease, transform 0.3s ease;
}

.scroll-to-top-cube.is-visible {
	opacity: 1;
	transform: translateY(0) rotate(0deg) scale(1);
	pointer-events: auto;
}

.scroll-to-top-cube__svg {
	width: 100%;
	height: 100%;
	overflow: visible;
	filter: drop-shadow(0 8px 14px rgba(189, 33, 37, 0.35));
	transition: transform 0.25s ease, filter 0.25s ease;
}

.scroll-to-top-cube:hover .scroll-to-top-cube__svg {
	transform: translateY(-4px) rotate(8deg);
	filter: drop-shadow(0 12px 18px rgba(189, 33, 37, 0.45));
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
	transition: opacity 0.25s ease, transform 0.25s ease;
}

@keyframes scrollToTopArrowClimb {
	0% {
		transform: translateY(2.5px);
		opacity: 0.55;
	}
	50% {
		transform: translateY(-2.5px);
		opacity: 1;
	}
	100% {
		transform: translateY(2.5px);
		opacity: 0.55;
	}
}

.scroll-to-top-cube.is-scrolling .scroll-to-top-cube__arrow {
	animation: scrollToTopArrowClimb 0.55s ease-in-out infinite;
}

@media (max-width: 767px) {
	.scroll-to-top-cube {
		right: 18px;
		bottom: 18px;
		width: 52px;
		height: 52px;
	}
}

@media (prefers-reduced-motion: reduce) {
	.scroll-to-top-cube {
		transition: opacity 0.15s linear;
		transform: none;
	}
	.scroll-to-top-cube.is-visible {
		transform: none;
	}
	.scroll-to-top-cube:hover .scroll-to-top-cube__svg,
	.scroll-to-top-cube:focus-visible .scroll-to-top-cube__svg {
		transform: none;
	}
	.scroll-to-top-cube.is-scrolling .scroll-to-top-cube__arrow {
		animation: none;
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

	var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

	function easeInOutCubic(t) {
		return t < 0.5 ? 4 * t * t * t : 1 - Math.pow(-2 * t + 2, 3) / 2;
	}

	// A fixed duration looks fine from a short scroll depth but reads as
	// an instant warp from a tall one (e.g. 900ms across 6000px is ~6700
	// px/s - too fast to perceive as a climb) - scale with distance
	// instead, clamped so it's never so short it snaps nor so long it drags.
	function climbDuration(distance) {
		return Math.min(1600, Math.max(600, distance * 0.4));
	}

	// baseLayout.jsp sets `scroll-behavior: smooth` on html/body sitewide,
	// which governs scrollTo()/scrollBy()/scrollIntoView() - even with an
	// explicit behavior override, stacking dozens of those calls a second
	// was fighting that native smooth-scroll machinery instead of
	// following this eased curve. Direct scrollTop assignment is a
	// different code path the CSS property was never meant to touch (the
	// same one this codebase's old topFunction() already relied on for
	// its own instant jump) - moving each frame that way instead.
	function animateScrollToTop() {
		var start = window.scrollY;
		var duration = climbDuration(start);
		var startTime = null;

		function step(timestamp) {
			if (startTime === null) {
				startTime = timestamp;
			}
			var progress = Math.min((timestamp - startTime) / duration, 1);
			var y = start * (1 - easeInOutCubic(progress));
			document.documentElement.scrollTop = y;
			document.body.scrollTop = y;
			if (progress < 1) {
				requestAnimationFrame(step);
			} else {
				btn.classList.remove('is-scrolling');
				updateVisibility();
			}
		}
		requestAnimationFrame(step);
	}

	btn.addEventListener('click', function() {
		if (reduceMotion) {
			document.documentElement.scrollTop = 0;
			document.body.scrollTop = 0;
			return;
		}
		btn.classList.add('is-scrolling');

		// Pages with their own ScrollTrigger pin/snap sections (home.jsp's
		// services scrubber) fight a plain scrollTo loop for control of
		// window.scrollY while it climbs back through the pinned range -
		// GSAP's own ScrollToPlugin is snap-aware and coordinates with
		// ScrollTrigger instead of fighting it, so prefer it when the page
		// has already loaded GSAP; otherwise fall back to the manual loop.
		if (typeof gsap !== 'undefined' && typeof ScrollToPlugin !== 'undefined') {
			gsap.registerPlugin(ScrollToPlugin);
			gsap.to(window, {
				scrollTo : { y : 0, autoKill : false },
				duration : climbDuration(window.scrollY) / 1000,
				ease : 'power2.inOut',
				onComplete : function() {
					btn.classList.remove('is-scrolling');
					updateVisibility();
				}
			});
		} else {
			animateScrollToTop();
		}
	});
})();
</script>

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
	transform: translateY(14px) rotate(-8deg) scale(0.85);
	pointer-events: none;
	transition: opacity 0.3s ease, transform 0.3s ease;
}

.scroll-to-top-cube.is-visible {
	opacity: 1;
	transform: translateY(0) rotate(0deg) scale(1);
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

	// Floored so a short scroll still reads as a climb, capped so a long page doesn't drag on.
	function climbDuration(distance) {
		return Math.min(3, Math.max(1.5, distance * 0.0007));
	}

	var GSAP_SRC = 'https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js';
	var SCROLLTO_SRC = 'https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollToPlugin.min.js';
	var gsapReady = null;

	function loadScript(src) {
		return new Promise(function(resolve, reject) {
			var s = document.createElement('script');
			s.src = src;
			s.onload = resolve;
			s.onerror = reject;
			document.head.appendChild(s);
		});
	}

	// Only fetches what isn't already on the page, so this works standalone on pages that never load GSAP.
	function ensureGsap() {
		if (gsapReady) {
			return gsapReady;
		}
		gsapReady = Promise.resolve()
				.then(function() {
					return typeof gsap === 'undefined' ? loadScript(GSAP_SRC) : null;
				})
				.then(function() {
					return typeof ScrollToPlugin === 'undefined' ? loadScript(SCROLLTO_SRC) : null;
				})
				.then(function() {
					gsap.registerPlugin(ScrollToPlugin);
				});
		return gsapReady;
	}

	btn.addEventListener('click', function() {
		btn.classList.add('is-scrolling');
		ensureGsap().then(function() {
			// home.jsp's pinned section fights external scroll through its trigger range - revert
			// the pin (not just disable) before the climb, or its frozen fixed-position state
			// leaves a dark overlay floating over unrelated sections while the page scrolls under it.
			var triggers = (typeof ScrollTrigger !== 'undefined') ? ScrollTrigger.getAll() : [];
			triggers.forEach(function(st) {
				st.disable(true);
			});
			gsap.to(window, {
				scrollTo : { y : 0, autoKill : false },
				duration : climbDuration(window.scrollY),
				ease : 'power2.inOut',
				onComplete : function() {
					triggers.forEach(function(st) {
						st.enable();
					});
					if (typeof ScrollTrigger !== 'undefined') {
						ScrollTrigger.refresh();
					}
					btn.classList.remove('is-scrolling');
					updateVisibility();
				}
			});
		});
	});
})();
</script>

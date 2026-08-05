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
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "${job.position}",
      "item": ""
    }
  ]
}
</script>

<style type="text/css">
.jobdetail-header {
	padding-top: calc(3% + var(--navbar-offset, 80px));
	padding-left: 10%;
	padding-right: 10%;
}

.page-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
}

.jobdetail-main {
	max-width: 900px;
	margin: 0 auto;
	padding: 32px 80px 96px;
}

.jobdetail-header-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 24px;
	margin-bottom: 32px;
}

.jobdetail-header-row__info {
	min-width: 0;
}

.jobdetail-title {
	margin: 0 0 16px;
	font-size: 40px;
	font-weight: 700;
	line-height: 1.25;
	background: linear-gradient(135deg, #BD2125 0%, #55090b 100%);
	-webkit-background-clip: text;
	background-clip: text;
	-webkit-text-fill-color: transparent;
	color: #BD2125;
}

.jobdetail-meta {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	gap: 12px;
	margin: 0;
	font-size: 14px;
	color: #3F3F3F;
}

.jobdetail-meta__item {
	display: inline-flex;
	align-items: center;
	gap: 6px;
}

.jobdetail-meta__item i {
	color: #BD2125;
}

.jobdetail-meta__sep {
	color: #D0D0D0;
}

/* Solid, not outline - this page's primary CTA needs to stand out. Plain
   color fade on hover reads better at this size than a directional sweep. */
.jobdetail-apply-button {
	display: inline-flex;
	align-items: center;
	flex-shrink: 0;
	gap: 8px;
	padding: 0.6rem 1.75rem;
	padding-right: max(4px, calc(1.75rem - 8px - 18px));
	border: 3px solid #BD2125;
	border-radius: 10px;
	background-color: #BD2125;
	color: #FFFFFF !important;
	font-size: 15px;
	font-weight: 600;
	text-decoration: none;
	cursor: pointer;
	transition: background-color 0.3s ease, border-color 0.3s ease;
}

.jobdetail-apply-button:hover {
	background-color: #8F191C;
	border-color: #8F191C;
	color: #FFFFFF !important;
	text-decoration: none;
}

.jobdetail-apply-button-icon {
	color: currentColor;
	width: 18px;
	opacity: 0;
	transform: translateX(-8px);
	transition: opacity 0.3s ease, transform 0.3s ease;
	font-size: 18px;
}

.jobdetail-apply-button:hover .jobdetail-apply-button-icon {
	opacity: 1;
	transform: translateX(0);
}

.jobdetail-card {
	margin-bottom: 40px;
	padding: 40px;
	border-radius: 14px;
	background-color: #FFFFFF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
	font-size: 15px;
	line-height: 1.8;
	color: #3F3F3F;
}

/* Black, not red - .jobdetail-title above already carries the red/gradient
   brand accent, so section headings here stay neutral instead of competing. */
.jobdetail-card h1, .jobdetail-card h2, .jobdetail-card h3,
	.jobdetail-card h4 {
	margin: 32px 0 12px;
	color: #000000;
	font-size: 20px;
	font-weight: 700;
}

.jobdetail-card h1:first-child, .jobdetail-card h2:first-child,
	.jobdetail-card h3:first-child, .jobdetail-card h4:first-child {
	margin-top: 0;
}

.jobdetail-card ul {
	margin: 0 0 8px;
	padding: 0;
	list-style: none;
}

.jobdetail-card ol {
	padding-left: 20px;
}

.jobdetail-card ul li {
	position: relative;
	padding-left: 22px;
}

.jobdetail-card ul li::before {
	content: "\2713";
	position: absolute;
	left: 0;
	top: 0;
	color: #BD2125;
	font-weight: 700;
}

/* Nested <ul> ("Knowledge of Web Based Application with: <ul>...") renders
   as pill-badge tags instead of a stacked checkmark list. */
.jobdetail-card ul>li:has(>ul) {
	padding-left: 0;
}

.jobdetail-card ul>li:has(>ul)::before {
	content: none;
}

.jobdetail-card ul ul {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	list-style: none;
	padding: 10px 0 0;
	margin: 0;
}

.jobdetail-card ul ul li {
	position: static;
	padding: 8px 18px;
	border-radius: 999px;
	background-color: rgba(189, 33, 37, 0.08);
	color: #BD2125;
	font-size: 13px;
	font-weight: 600;
	margin-bottom: 0;
	height: fit-content;
}

.jobdetail-card ul ul li::before {
	content: none;
}

/* Typography for jobDescriptionHtml (ArticleHtmlSanitizer-cleaned job.description) -
   same idea as blog_detail.jsp's .article-body, scoped to this card instead. */
.jobdetail-card p {
	margin: 0 0 16px;
}

.jobdetail-card p:last-child {
	margin-bottom: 0;
}

.jobdetail-card strong {
	font-weight: 700;
	color: #000000;
}

.jobdetail-card a {
	color: #BD2125;
	text-decoration: underline;
}

.jobdetail-card a:hover {
	color: #8F191C;
}

.jobdetail-card li {
	margin-bottom: 8px;
}

.jobdetail-card img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	display: block;
	margin: 16px 0;
}

.jobdetail-card blockquote {
	margin: 24px 0;
	padding: 16px 20px;
	border-left: 4px solid #BD2125;
	background: rgba(189, 33, 37, 0.05);
	border-radius: 0 10px 10px 0;
}

.jobdetail-card table {
	display: block;
	overflow-x: auto;
	width: 100%;
	border-collapse: collapse;
	margin: 16px 0;
	font-size: 14px;
}

.jobdetail-card th, .jobdetail-card td {
	padding: 10px 14px;
	border-bottom: 1px solid #E5E5E5;
	text-align: left;
	vertical-align: top;
}

.jobdetail-card th {
	background: rgba(189, 33, 37, 0.05);
	color: #000000;
	font-weight: 700;
}

.jobdetail-cta {
	margin: 40px 0 0;
	padding: 48px 40px;
	border-radius: 14px;
	text-align: center;
	background: linear-gradient(135deg, #7A0D10 0%, #BD2125 100%);
}

.jobdetail-cta__title {
	margin: 0 0 12px;
	font-size: 32px;
	font-weight: 700;
	color: #FFFFFF;
}

.jobdetail-cta__body {
	margin: 0 0 24px;
	font-size: 16px;
	color: #FFFFFF;
}

/* Inverted from the header button - white/red here since this sits on the
   dark red gradient banner, not a white background. Fades to transparent/
   outline on hover instead of a darker shade, since white has nowhere
   lighter to go. */
.jobdetail-cta .jobdetail-apply-button {
	border-color: #FFFFFF;
	background-color: #FFFFFF;
	color: #BD2125 !important;
}

.jobdetail-cta .jobdetail-apply-button:hover {
	background-color: transparent;
	border-color: #FFFFFF;
	color: #FFFFFF !important;
}

.jobdetail-success {
	padding: 64px 40px;
	border-radius: 14px;
	background-color: #FFFFFF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.06);
	text-align: center;
	font-size: 18px;
	color: #000000;
}

/* Mirrors the redesigned Contacts page's glass/floating-label theme. */
.jobapply-modal .modal-dialog {
	max-width: 560px;
}

.jobapply-modal .modal-content {
	border: 0;
	border-radius: 20px;
	overflow: hidden;
	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.25);
}

.jobapply-modal .modal-header {
	align-items: flex-start;
	padding: 24px 32px 20px;
	border-bottom: 2px solid #BD2125;
	background-color: #FFFFFF;
}

.jobapply-modal .modal-title {
	color: #000000;
	font-size: 20px;
	font-weight: 700;
}

.jobapply-modal__subtitle {
	margin: 6px 0 0;
	font-size: 13px;
	color: #8A8F98;
}

.jobapply-modal .modal-header .close {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 32px;
	height: 32px;
	margin: 0;
	border-radius: 50%;
	color: #3F3F3F;
	opacity: 1;
	text-shadow: none;
	transition: background-color 0.15s ease, color 0.15s ease;
}

.jobapply-modal .modal-header .close:hover {
	background-color: rgba(189, 33, 37, 0.08);
	color: #BD2125;
}

.jobapply-modal .modal-body {
	padding: 32px;
	background: linear-gradient(180deg, #FFFFFF 0%, #FAFAFA 100%);
}

.jobapply-modal .input-group-text {
	background-color: rgba(0, 0, 0, 0.04);
	border: 1px solid #E5E5E5;
	border-right: 0;
	color: #3F3F3F;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.jobapply-modal .form-control {
	border: 1px solid #E5E5E5;
	border-radius: 10px;
	background-color: #FAFAFA;
}

.jobapply-modal .form-control:focus {
	border-color: #BD2125;
	background-color: #FFFFFF;
	box-shadow: 0 0 0 3px rgba(189, 33, 37, 0.1);
}

.jobapply-modal .input-group .form-control {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

.jobapply-modal .form-control[readonly] {
	background-color: #F1F1F1;
	color: #3F3F3F;
}

/* Sits below the whole .input-group, not inside .field-floating, so the icon wrapper doesn't stretch to fit error text. */
.jobapply-modal .jobapply-feedback {
	display: none;
	margin-top: 6px;
	font-size: 12px;
	color: #BD2125;
}

.jobapply-modal .jobapply-feedback.is-shown {
	display: block;
}

/* Recreates BS5's form-floating - BS4 has no built-in equivalent. */
.jobapply-modal .field-floating {
	position: relative;
	flex: 1 1 auto;
}

.jobapply-modal .field-floating>.form-control {
	height: calc(3.1rem + 2px);
	padding: 1.4rem 0.9rem 0.4rem;
}

.jobapply-modal .field-floating>textarea.form-control {
	height: auto;
	padding-top: 1.5rem;
}

.jobapply-modal .field-floating>label {
	position: absolute;
	top: 0;
	left: 0.9rem;
	margin: 0;
	padding: 0.85rem 0 0;
	color: #8a8f98;
	pointer-events: none;
	transform-origin: 0 0;
	transition: transform 0.15s ease-in-out, color 0.15s ease-in-out;
}

.jobapply-modal .field-floating>.form-control::placeholder {
	color: transparent;
}

.jobapply-modal .field-floating>.form-control:focus ~label,
	.jobapply-modal .field-floating>.form-control:not(:placeholder-shown) ~label
	{
	transform: scale(0.82) translateY(-0.7rem);
	color: #BD2125;
}

.jobapply-modal .optional-mark {
	font-size: 12px;
	font-weight: 400;
	color: #8a8f98;
}

.jobapply-modal .required-mark {
	color: #BD2125;
}

.jobapply-modal .jobapply-static-label {
	display: block;
	margin-bottom: 8px;
	font-size: 13px;
	color: #8A8F98;
}

.jobapply-modal .jobapply-position-chip {
	display: flex;
	align-items: center;
	gap: 8px;
	padding: 12px 16px;
	border-radius: 10px;
	background-color: #F1F1F1;
	color: #3F3F3F;
	font-size: 14px;
	font-weight: 600;
}

.jobapply-modal .jobapply-position-chip i {
	color: #8A8F98;
	font-size: 13px;
}

.jobapply-modal .jobapply-dropzone {
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 96px;
	padding: 20px;
	border: 2px dashed #D0D0D0;
	border-radius: 12px;
	background-color: #FAFAFA;
	cursor: pointer;
	transition: border-color 0.15s ease, background-color 0.15s ease;
}

.jobapply-modal .jobapply-dropzone:hover, .jobapply-modal .jobapply-dropzone:focus-visible
	{
	border-color: #BD2125;
	background-color: rgba(189, 33, 37, 0.04);
}

.jobapply-modal .jobapply-dropzone.is-dragover {
	border-color: #BD2125;
	background-color: rgba(189, 33, 37, 0.08);
}

.jobapply-modal .jobapply-dropzone.is-invalid {
	border-color: #BD2125;
	background-color: rgba(189, 33, 37, 0.04);
}

.jobapply-modal .jobapply-dropzone__error {
	margin: 6px 0 0;
	font-size: 12px;
	color: #BD2125;
}

.jobapply-modal .jobapply-dropzone__error.is-hidden {
	display: none;
}

.jobapply-modal .jobapply-dropzone__prompt {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 2px;
	text-align: center;
	color: #8A8F98;
}

.jobapply-modal .jobapply-dropzone__prompt i {
	margin-bottom: 4px;
	color: #BD2125;
	font-size: 22px;
}

.jobapply-modal .jobapply-dropzone__text {
	margin: 0;
	font-size: 13px;
}

.jobapply-modal .jobapply-dropzone__browse {
	margin-left: 4px;
	color: #BD2125;
	font-weight: 600;
	text-decoration: underline;
}

.jobapply-modal .jobapply-dropzone__file {
	display: flex;
	align-items: center;
	gap: 10px;
	width: 100%;
	font-size: 14px;
	color: #3F3F3F;
}

.jobapply-modal .jobapply-dropzone__prompt.is-hidden, .jobapply-modal .jobapply-dropzone__file.is-hidden
	{
	display: none;
}

.jobapply-modal .jobapply-dropzone__file i:first-child {
	color: #BD2125;
	font-size: 20px;
}

.jobapply-modal .jobapply-dropzone__filename {
	flex: 1;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	font-weight: 600;
}

.jobapply-modal .jobapply-dropzone__remove {
	padding: 0;
	border: 0;
	background: none;
	color: #8A8F98;
	font-size: 18px;
	line-height: 1;
	cursor: pointer;
}

.jobapply-modal .jobapply-dropzone__remove:hover {
	color: #BD2125;
}

.jobapply-modal .jobapply-dropzone__input {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	white-space: nowrap;
	border: 0;
}

.jobapply-modal .jobapply-dropzone__helper {
	margin: 8px 0 0;
	font-size: 12px;
	color: #8A8F98;
}

.jobapply-modal .modal-footer {
	padding: 20px 32px 32px;
	border-top: 0;
	gap: 12px;
}

.jobapply-modal .modal-footer .btn-secondary {
	flex: 1;
	border-radius: 10px;
	background-color: transparent;
	border: 1px solid #D0D0D0;
	color: #3F3F3F;
}

.jobapply-modal .modal-footer .btn-danger {
	flex: 1;
	border: 0;
	border-radius: 10px;
	padding: 12px 20px;
	background-color: #BD2125;
	font-weight: 600;
}

.jobapply-modal .modal-footer .btn-danger:hover {
	background-color: #8F0B0E;
}

@media screen and (max-width: 870px) {
	.jobdetail-main {
		padding: 24px 5% 56px;
	}
	.jobdetail-title {
		font-size: 28px;
	}
	.jobdetail-card {
		padding: 24px;
	}
	.jobdetail-cta {
		padding: 32px 24px;
	}
	.jobdetail-cta__title {
		font-size: 24px;
	}
}

/* Tablet width (above) keeps the title and Apply Now button side by side -
   only phone width stacks them, same breakpoint as careers.jsp's Open
   Positions list/home.jsp's Open Positions row. */
@media screen and (max-width: 575px) {
	.jobdetail-header-row {
		flex-direction: column;
		align-items: stretch;
		gap: 16px;
	}
	.jobdetail-apply-button {
		justify-content: center;
	}
}
</style>

<div class="jobdetail-header">
	<comp:pageHeader label="${job.position}" />
</div>

<div class="jobdetail-main" id="jobDetailContent">
	<c:if test="${response == '1'}">
		<div class="jobdetail-success">Sending email complete.</div>
	</c:if>
	<c:if test="${response != '1'}">
		<div class="jobdetail-header-row">
			<div class="jobdetail-header-row__info">
				<h1 class="jobdetail-title">${job.position}</h1>
				<div class="jobdetail-meta">
					<span class="jobdetail-meta__item" aria-hidden="true"><i
						class="bi bi-building"></i> CubeSoftTech</span> <span
						class="jobdetail-meta__sep">|</span> <span
						class="jobdetail-meta__item" aria-hidden="true"><i
						class="bi bi-geo-alt"></i> Chong Nonsi, Bangkok</span>
				</div>
			</div>
			<button type="button" class="jobdetail-apply-button"
				data-toggle="modal" data-target="#jobApplyModal">
				<span class="jobdetail-apply-button-text">Apply Now</span>
				<i class="bi bi-arrow-right jobdetail-apply-button-icon"></i>
			</button>
		</div>

		<div class="jobdetail-card">${jobDescriptionHtml}</div>

		<div class="jobdetail-cta">
			<h2 class="jobdetail-cta__title">Interested in ${job.position}?</h2>
			<p class="jobdetail-cta__body">Send us your resume and we'll get
				back to you soon.</p>
			<button type="button" class="jobdetail-apply-button"
				data-toggle="modal" data-target="#jobApplyModal">
				<span class="jobdetail-apply-button-text">Apply Now</span>
				<i class="bi bi-arrow-right jobdetail-apply-button-icon"></i>
			</button>
		</div>

	</c:if>
</div>

<div class="modal fade jobapply-modal" id="jobApplyModal" tabindex="-1"
	role="dialog" aria-labelledby="jobApplyModalLabel" aria-hidden="true"
	data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<div>
					<h5 class="modal-title" id="jobApplyModalLabel">Send Email and
						Resume</h5>
				</div>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="frmJobApply" action="/sendEmailJob"
				enctype="multipart/form-data" name="frmJobApply" autocomplete="off"
				method="POST">
				<input type="hidden" name="jobId" value="${jobId}"> <input
					type="hidden" name="contactPosition" value="${job.position}">
				<div class="modal-body">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="bi bi-person"></i></span>
							</div>
							<div class="field-floating">
								<input type="text"
									class="form-control ${not empty nameError ? 'is-invalid' : ''}"
									placeholder=" " name="contactName" id="jobApplyName"
									value="${contactName}"> <label for="jobApplyName">Full
									Name <span class="required-mark">*</span>
								</label>
							</div>
						</div>
						<div
							class="invalid-feedback jobapply-feedback ${not empty nameError ? 'is-shown' : ''}"
							id="jobApplyNameFeedback">${nameError}</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="bi bi-envelope"></i></span>
							</div>
							<div class="field-floating">
								<input type="email"
									class="form-control ${not empty emailError ? 'is-invalid' : ''}"
									placeholder=" " name="contactEmail" id="jobApplyEmail"
									value="${contactEmail}"> <label for="jobApplyEmail">E-mail
									<span class="required-mark">*</span>
								</label>
							</div>
						</div>
						<div
							class="invalid-feedback jobapply-feedback ${not empty emailError ? 'is-shown' : ''}"
							id="jobApplyEmailFeedback">${emailError}</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="bi bi-telephone"></i></span>
							</div>
							<div class="field-floating">
								<input type="text"
									class="form-control ${not empty telError ? 'is-invalid' : ''}"
									placeholder=" " name="contactTel" id="jobApplyTel"
									value="${contactTel}"> <label for="jobApplyTel">Telephone
									<span class="optional-mark">(optional)</span>
								</label>
							</div>
						</div>
						<div
							class="invalid-feedback jobapply-feedback ${not empty telError ? 'is-shown' : ''}"
							id="jobApplyTelFeedback">${telError}</div>
					</div>
					<div class="form-group">
						<label class="jobapply-static-label">Position</label>
						<div class="jobapply-position-chip">
							<i class="bi bi-lock-fill"></i> <span>${job.position}</span>
						</div>
					</div>
					<div class="form-group">
						<label class="jobapply-static-label">Attach Resume <span
							class="optional-mark">(optional)</span></label>
						<div
							class="jobapply-dropzone ${empty fileError ? '' : 'is-invalid'}"
							id="jobApplyDropzone" tabindex="0" role="button"
							aria-label="Attach your resume - drag and drop or click to browse">
							<div class="jobapply-dropzone__prompt"
								id="jobApplyDropzonePrompt">
								<i class="bi bi-paperclip"></i>
								<p class="jobapply-dropzone__text">
									Drag and drop a file, or <span
										class="jobapply-dropzone__browse">click to browse</span>
								</p>
							</div>
							<div class="jobapply-dropzone__file is-hidden"
								id="jobApplyDropzoneFile">
								<i class="bi bi-file-earmark-text"></i> <span
									class="jobapply-dropzone__filename"
									id="jobApplyFileNameDisplay"></span>
								<button type="button" class="jobapply-dropzone__remove"
									id="jobApplyFileRemove" aria-label="Remove file">
									<i class="bi bi-x-circle-fill"></i>
								</button>
							</div>
							<input type="file" name="contactFile" id="jobApplyFile"
								class="jobapply-dropzone__input">
						</div>
						<p class="jobapply-dropzone__helper">Supports files up to 30MB</p>
						<p
							class="jobapply-dropzone__error ${empty fileError ? 'is-hidden' : ''}"
							id="jobApplyFileError">${fileError}</p>
						<input type="text" id="jobApplyFileName" name="contactFileName"
							hidden>
					</div>
					<div class="form-group field-floating">
						<textarea class="form-control" rows="3" placeholder=" "
							name="contactMessage" id="jobApplyMessage">${contactMessage}</textarea>
						<label for="jobApplyMessage">Message <span
							class="optional-mark">(optional)</span></label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-danger">
						Send <span aria-hidden="true">&rarr;</span>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	(function() {
		// Matches struts.multipart.maxSize in actionfront.xml; no file-type restriction, matching the legacy form.
		var MAX_FILE_SIZE = 30000000;

		var dropzone = document.getElementById('jobApplyDropzone');
		var fileInput = document.getElementById('jobApplyFile');
		var prompt = document.getElementById('jobApplyDropzonePrompt');
		var fileRow = document.getElementById('jobApplyDropzoneFile');
		var filenameDisplay = document
				.getElementById('jobApplyFileNameDisplay');
		var fileNameHidden = document.getElementById('jobApplyFileName');
		var removeBtn = document.getElementById('jobApplyFileRemove');
		var errorEl = document.getElementById('jobApplyFileError');

		function validateFile(file) {
			if (file.size > MAX_FILE_SIZE) {
				return 'File is too large - please upload a file under 30MB';
			}
			return null;
		}

		function setFileError(message) {
			if (message) {
				dropzone.classList.add('is-invalid');
				errorEl.textContent = message;
				errorEl.classList.remove('is-hidden');
			} else {
				dropzone.classList.remove('is-invalid');
				errorEl.textContent = '';
				errorEl.classList.add('is-hidden');
			}
		}

		function showFile(name) {
			filenameDisplay.textContent = name;
			fileNameHidden.value = name;
			prompt.classList.add('is-hidden');
			fileRow.classList.remove('is-hidden');
		}

		function clearFile() {
			fileInput.value = '';
			fileNameHidden.value = '';
			prompt.classList.remove('is-hidden');
			fileRow.classList.add('is-hidden');
			setFileError(null);
		}

		function handleSelectedFile(file) {
			var error = validateFile(file);
			setFileError(error);
			if (error) {
				fileInput.value = '';
				return;
			}
			showFile(file.name);
		}

		dropzone.addEventListener('click', function(e) {
			if (e.target !== removeBtn && !removeBtn.contains(e.target)) {
				fileInput.click();
			}
		});
		dropzone.addEventListener('keydown', function(e) {
			if (e.key === 'Enter' || e.key === ' ') {
				e.preventDefault();
				fileInput.click();
			}
		});
		fileInput.addEventListener('change', function() {
			if (fileInput.files && fileInput.files[0]) {
				handleSelectedFile(fileInput.files[0]);
			}
		});
		[ 'dragenter', 'dragover' ].forEach(function(evt) {
			dropzone.addEventListener(evt, function(e) {
				e.preventDefault();
				e.stopPropagation();
				dropzone.classList.add('is-dragover');
			});
		});
		[ 'dragleave', 'drop' ].forEach(function(evt) {
			dropzone.addEventListener(evt, function(e) {
				e.preventDefault();
				e.stopPropagation();
				dropzone.classList.remove('is-dragover');
			});
		});
		dropzone.addEventListener('drop', function(e) {
			var files = e.dataTransfer.files;
			if (files && files[0]) {
				fileInput.files = files;
				handleSelectedFile(files[0]);
			}
		});
		removeBtn.addEventListener('click', function(e) {
			e.stopPropagation();
			clearFile();
		});
	})();

	(function() {
		var NAME_PATTERN = /^[ก-๏a-zA-Z\s-]+$/;
		var NAME_MAX_LENGTH = 50;
		var EMAIL_PATTERN = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
		var EMAIL_MAX_LENGTH = 254;
		var PHONE_ALLOWED_CHARS = /^\+?[0-9\s-]+$/;
		var PHONE_NUMBER = /^\+?[0-9]{7,15}$/;

		function validateName(value) {
			var trimmed = (value || '').trim();
			if (!trimmed) {
				return 'Please enter your full name';
			}
			if (trimmed.length > NAME_MAX_LENGTH || !NAME_PATTERN.test(trimmed)) {
				return 'Please enter letters only, not numbers or symbols';
			}
			return null;
		}

		function validateEmail(value) {
			var trimmed = (value || '').trim();
			if (!trimmed) {
				return 'Please enter your email';
			}
			if (trimmed.length > EMAIL_MAX_LENGTH
					|| !EMAIL_PATTERN.test(trimmed)) {
				return 'Invalid email - please check and try again (e.g. name@example.com)';
			}
			return null;
		}

		function validateTel(value) {
			var trimmed = (value || '').trim();
			if (!trimmed) {
				return null;
			}
			if (!PHONE_ALLOWED_CHARS.test(trimmed)) {
				return 'Invalid phone number - please enter digits only';
			}
			var stripped = trimmed.replace(/[\s-]/g, '');
			if (!PHONE_NUMBER.test(stripped)) {
				return 'Invalid phone number - please enter digits only';
			}
			return null;
		}

		function setFieldError(inputId, feedbackId, message) {
			var input = document.getElementById(inputId);
			var feedback = document.getElementById(feedbackId);
			if (message) {
				input.classList.add('is-invalid');
			} else {
				input.classList.remove('is-invalid');
			}
			if (feedback) {
				feedback.textContent = message || '';
				feedback.classList.toggle('is-shown', !!message);
			}
		}

		var nameInput = document.getElementById('jobApplyName');
		var emailInput = document.getElementById('jobApplyEmail');
		var telInput = document.getElementById('jobApplyTel');

		nameInput.addEventListener('blur', function() {
			setFieldError('jobApplyName', 'jobApplyNameFeedback',
					validateName(this.value));
		});
		emailInput.addEventListener('blur', function() {
			setFieldError('jobApplyEmail', 'jobApplyEmailFeedback',
					validateEmail(this.value));
		});
		telInput.addEventListener('blur', function() {
			setFieldError('jobApplyTel', 'jobApplyTelFeedback',
					validateTel(this.value));
		});

		document
				.getElementById('frmJobApply')
				.addEventListener(
						'submit',
						function(e) {
							var nameErr = validateName(nameInput.value);
							var emailErr = validateEmail(emailInput.value);
							var telErr = validateTel(telInput.value);
							var fileHasError = document
									.getElementById('jobApplyDropzone').classList
									.contains('is-invalid');
							setFieldError('jobApplyName',
									'jobApplyNameFeedback', nameErr);
							setFieldError('jobApplyEmail',
									'jobApplyEmailFeedback', emailErr);
							setFieldError('jobApplyTel', 'jobApplyTelFeedback',
									telErr);
							if (nameErr || emailErr || telErr || fileHasError) {
								e.preventDefault();
							}
						});

		<c:if
			test="${not empty nameError or not empty emailError or not empty telError or not empty fileError}">
		$('#jobApplyModal').modal('show');
		</c:if>
	})();
</script>

<comp:scrollToTopButton />

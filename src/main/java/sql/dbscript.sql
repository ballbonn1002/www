
// PROD / UAT 18 Jul 2025

// PROD / UAT 4 Aug 2026 - article.view_count (sql/2026-07-21_add_article_view_count.sql)
// PROD / UAT 4 Aug 2026 - job.requirements_json (sql/2026-07-27_add_job_requirements_json.sql)

-- 4 Aug 2026 - new table for careers.jsp's testimonial carousel
-- (CareersAction.buildMockTestimonials is a hardcoded stand-in until this
-- exists - see Testimonial.java for the field shape). Not applied anywhere
-- yet, not even dev - run once a real testimonialDAO replaces the mock method.
CREATE TABLE `testimonial` (
	`testimonial_id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL,
	`position` VARCHAR(100) NOT NULL,
	`quote` TEXT NOT NULL,
	`avatar_src` VARCHAR(255) NULL,
	PRIMARY KEY (`testimonial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


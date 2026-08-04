
// PROD / UAT 18 Jul 2025

-- 21 Jul 2026 - per-article view counter (BlogDAOImpl.incrementViewCount /
-- BlogAction.blogDetail), shown on blogCard.tag's card meta row.
-- Already applied to the local dev DB (ca_202312) - run against UAT/prod.
ALTER TABLE `article` ADD COLUMN `view_count` INT NOT NULL DEFAULT 0 AFTER `time_post`;

-- 27 Jul 2026 - additive; `description` stays the fallback when this is NULL.
-- Already applied to dev DB (ca_202312) - run on UAT/prod when deploying.
ALTER TABLE `job` ADD COLUMN `requirements_json` JSON NULL AFTER `description`;

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


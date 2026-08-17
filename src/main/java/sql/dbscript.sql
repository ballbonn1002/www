
// PROD / UAT 18 Jul 2025

-- 21 Jul 2026 - per-article view counter (BlogDAOImpl.incrementViewCount /
-- BlogAction.blogDetail), shown on blogCard.tag's card meta row.
-- Already applied to the local dev DB (ca_202312) - run against UAT/prod.
ALTER TABLE `article` ADD COLUMN `view_count` INT NOT NULL DEFAULT 0 AFTER `time_post`;

-- 17 Aug 2026 - fix footer's "Software Development" link (footer_id 28,
-- parent_footer_id 27 "Services"): footer_url was pointing at a blog post
-- (/blog/what-is-software-development) instead of the actual service page.
-- Bad data, not code - found while smoke-testing the redesign footer.
-- Not applied anywhere yet - run against dev/UAT/prod.
UPDATE `footer` SET `footer_url` = 'https://www.cubesofttech.com/software-development'
WHERE `footer_id` = 28 AND `footer_name` = 'Software Development';


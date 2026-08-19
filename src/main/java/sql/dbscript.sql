
// PROD / UAT 18 Jul 2025

-- Phone, 19 Aug 2026
-- Per-article view counter. Applied on dev - run against UAT/prod.
ALTER TABLE `article` ADD COLUMN `view_count` INT NOT NULL DEFAULT 0 AFTER `time_post`;

-- Phone, 19 Aug 2026
-- Footer "Software Development" link (footer_id 28) points at a blog post
-- instead of the real service page. Can't fix via admin panel - run this.
UPDATE `footer` SET `footer_url` = 'https://www.cubesofttech.com/software-development'
WHERE `footer_id` = 28 AND `footer_name` = 'Software Development';


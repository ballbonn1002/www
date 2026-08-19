
// PROD / UAT 18 Jul 2025

-- Phone, 19 Aug 2026
-- Per-article view counter. Applied on dev - run against UAT/prod.
ALTER TABLE `article` ADD COLUMN `view_count` INT NOT NULL DEFAULT 0 AFTER `time_post`;


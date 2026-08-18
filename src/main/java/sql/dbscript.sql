
// PROD / UAT 18 Jul 2025

-- 21 Jul 2026 - per-article view counter (BlogDAOImpl.incrementViewCount /
-- BlogAction.blogDetail), shown on blogCard.tag's card meta row.
-- Already applied to the local dev DB (ca_202312) - run against UAT/prod.
ALTER TABLE `article` ADD COLUMN `view_count` INT NOT NULL DEFAULT 0 AFTER `time_post`;


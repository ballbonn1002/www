-- Adds a per-article view counter (BlogDAOImpl.incrementViewCount /
-- BlogAction.blogDetail), shown on blogCard.tag's card meta row.
-- Already applied to the local dev DB (ca_202312) - run this against
-- UAT/prod when deploying.
ALTER TABLE `article` ADD COLUMN `view_count` INT NOT NULL DEFAULT 0 AFTER `time_post`;

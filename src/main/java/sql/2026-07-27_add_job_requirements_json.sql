-- Additive; `description` stays the fallback when this is NULL. Already applied to dev DB (ca_202312) - run on UAT/prod when deploying.
ALTER TABLE `job` ADD COLUMN `requirements_json` JSON NULL AFTER `description`;

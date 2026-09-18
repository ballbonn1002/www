
// PROD / UAT 18 Jul 2025

-- Phone, 19 Aug 2026
-- Per-article view counter. Applied on dev - run against UAT/prod.
ALTER TABLE `article` ADD COLUMN `view_count` INT NOT NULL DEFAULT 0 AFTER `time_post`;

-- Phone, 19 Aug 2026
-- Footer "Software Development" link (footer_id 28) points at a blog post
-- instead of the real service page. Can't fix via admin panel - run this.
UPDATE `footer` SET `footer_url` = 'https://www.cubesofttech.com/software-development'
WHERE `footer_id` = 28 AND `footer_name` = 'Software Development';


-- PROD 4 SEP 2026


-- Phone, 10 Sep 2026
-- Log every contact-form submission (SUCCESS or FAILED).
CREATE TABLE `contact_message` (
    `contact_message_id` BIGINT       NOT NULL AUTO_INCREMENT,
    `first_name`         VARCHAR(128) NOT NULL,
    `last_name`          VARCHAR(128) NOT NULL,
    `email`              VARCHAR(256) NOT NULL,
    `tel`                VARCHAR(64),
    `message`            TEXT         NOT NULL,
    `email_from`         VARCHAR(256),
    `email_to`           VARCHAR(512),
    `email_status`       VARCHAR(16)  NOT NULL,
    `email_error`        VARCHAR(512),
    `time_create`        TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`contact_message_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- Phone, 10 Sep 2026
-- Careers-form submission log. Resume file -> <webappRoot>/upload/email/, name/path/size kept here.
CREATE TABLE `job_application` (
    `job_application_id` BIGINT       NOT NULL AUTO_INCREMENT,
    `position`           VARCHAR(255) NOT NULL,
    `name`               VARCHAR(256) NOT NULL,
    `email`              VARCHAR(256) NOT NULL,
    `tel`                VARCHAR(64),
    `message`            TEXT         NOT NULL,
    `resume_filename`    VARCHAR(255),
    `resume_path`        VARCHAR(1024),
    `resume_size_bytes`  BIGINT,
    `email_from`         VARCHAR(256),
    `email_to`           VARCHAR(512),
    `email_status`       VARCHAR(16)  NOT NULL,
    `email_error`        VARCHAR(512),
    `time_create`        TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`job_application_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- PROD 12 SEP 2026



USE odbo;

CREATE TABLE posts (
    post_id      INT             NOT NULL AUTO_INCREMENT,
    title        VARCHAR(200)    NOT NULL,
    content      TEXT            NOT NULL,
    image_name   VARCHAR(255)    DEFAULT NULL,
    views        INT             NOT NULL DEFAULT 0,
    rec_count    INT             NOT NULL DEFAULT 0,
    created_at   DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (post_id)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Users` (
  `user_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) not NULL UNIQUE,
  `email` varchar(255) not NULL UNIQUE,
    `password` varchar(255) NOT NULL,
    `created_at`DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Boards`(
`board_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
 `name` varchar(255) not null,
 `description` TEXT DEFAULT NULL);

 CREATE TABLE `Posts`(
 `post_id` bigint PRIMARY KEY AUTO_INCREMENT,
 `title` VARCHAR(255) NOT NULL,
 `content` TEXT NOT  NULL,
 `user_id` BIGINT,
 `board_id` bigint,
`created_at`DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
    FOREIGN KEY (`board_id`) REFERENCES `Boards` (`board_id`)
 );

 CREATE TABLE `Comments`(
 `comment_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
 `content` TEXT NOT NULL,
 `user_id` BIGINT,
 `post_id` BIGINT,
 `created_at`DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
   FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
     FOREIGN KEY (`post_id`) REFERENCES `Posts` (`post_id`)
 );

 CREATE TABLE `Tags` (
 `tag_id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `name` VARCHAR(255) NOT NULL UNIQUE
  );
 CREATE TABLE `Post_Tags`(
 `post_id` BIGINT NOT NULL,
 `tag_id` BIGINT NOT NULL,
      FOREIGN KEY (`post_id`) REFERENCES `Posts` (`post_id`),
        FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`tag_id`)
 );
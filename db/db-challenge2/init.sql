CREATE TABLE `users`(
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `self_introduction` VARCHAR(1000) DEFAULT NULL,
  `work_phone_number` varchar(13) DEFAULT NULL,
  `mobile_phone_number` varchar(13) DEFAULT NULL,
  `is_deleted` boolean NOT NULL DEFAULT false,
  `create_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_datetime`datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `chatrooms`(
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `overview` VARCHAR(1000) DEFAULT NULL,
  `is_file_sendable` boolean NOT NULL DEFAULT false,
  `is_direct_chat` boolean NOT NULL DEFAULT false,
  `is_deleted` boolean NOT NULL DEFAULT false,
  `create_datetime`datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` int(11) NOT NULL,
  `update_datetime`datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`create_user_id`) REFERENCES `users`(`id`),
  FOREIGN KEY (`update_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `users_chatrooms`(
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `create_datetime`datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `room_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`room_id`) REFERENCES `chatrooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `posts`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `is_deleted` boolean NOT NULL DEFAULT false,
  `create_datetime`datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` int(11) NOT NULL,
  `update_datetime`datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`room_id`) REFERENCES `chatrooms` (`id`),
  FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`update_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `assign_member` int(11) NOT NULL,
  `deadline`datetime DEFAULT NULL,
  `is_completed` boolean NOT NULL DEFAULT false,
  `is_deleted` boolean NOT NULL DEFAULT false,
  `create_datetime`datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` int(11) NOT NULL,
  `update_datetime`datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`room_id`) REFERENCES `chatrooms` (`id`),
  FOREIGN KEY (`assign_member`) REFERENCES `users` (`id`), 
  FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`update_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

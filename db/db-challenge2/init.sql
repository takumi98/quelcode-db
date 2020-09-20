CREATE TABLE `users`(
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `self_introduction` VARCHAR(1000) NOT NULL,
  `work_phone_number` varchar(13),
  `mobile_phone_number` varchar(13),
  `is_deleted` tinyint(1) NOT NULL DEFAULT false,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `chatrooms`(
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `overview` VARCHAR(1000),
  `is_file_sendable` tinyint(1) NOT NULL DEFAULT false,
  `is_direct_chat` tinyint(1) NOT NULL DEFAULT false,
  `is_deleted` tinyint(1) NOT NULL DEFAULT false,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` int(11) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`create_user_id`) REFERENCES `users`(`id`),
  FOREIGN KEY (`update_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `rooms`(
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `room_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`room_id`) REFERENCES `chatrooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `posts`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `file` varchar(100),
  `is_deleted` tinyint(1) NOT NULL DEFAULT false,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` int(11) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `task_representative` int(11) NOT NULL,
  `deadline` timestamp NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT false,
  `is_deleted` tinyint(1) NOT NULL DEFAULT false,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` int(11) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`room_id`) REFERENCES `chatrooms` (`id`),
  FOREIGN KEY (`task_user`) REFERENCES `users` (`id`), 
  FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`update_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


#######Table user_sys #######
CREATE TABLE `user_sys` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `user_pass` varchar(45) DEFAULT NULL,
  `user_role` tinyint(4) DEFAULT NULL COMMENT '用户角色：教师或用户',
  `user_validate` bit(1) DEFAULT b'0' COMMENT '是否已认证，学生不需要认证',
  `user_regtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



#######Table user_info#######
#为后期集成微信、QQ登录预留，视开发情况作变动
CREATE TABLE IF NOT EXISTS `jtthink_exam`.`user_info` (
  `info_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `info_uchannel` TINYINT NULL COMMENT '用户来源：0为网站注册用户，1为微信...',
  `info_email` VARCHAR(45) NULL,
  `info_phone` VARCHAR(45) NULL,
  `info_nickname` VARCHAR(45) NULL,
  `info_authnum` VARCHAR(45) NULL COMMENT '微信号或QQ号或其他',
  `info_remark` VARCHAR(255) NULL,
  PRIMARY KEY (`info_id`),
  UNIQUE INDEX `uinfo_email` USING BTREE (`info_email` ASC),
  UNIQUE INDEX `uinfo_phone` (`info_phone` ASC),
  UNIQUE INDEX `uinfo_numb` (`info_authnum` ASC))
ENGINE = InnoDB
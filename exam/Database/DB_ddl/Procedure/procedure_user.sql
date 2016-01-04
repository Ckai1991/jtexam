-- ----------------------------
-- Procedure structure for sp_user_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_user_login`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_login`(IN _user_name varchar(45), IN _user_pass varchar(45))
BEGIN
	
	DECLARE _user_id INT DEFAULT 0;
	DECLARE _user_role TINYINT DEFAULT 0;
	DECLARE _user_validate bit DEFAULT FALSE;

	SELECT user_id, user_role, user_validate INTO _user_id, _user_role, _user_validate FROM user_sys
			WHERE user_name = _user_name AND user_pass = _user_pass;
	
	IF _user_id = 0 THEN #返回结果为空
		SELECT 'USERNAME OR PASSWD ERR' AS result;
	ELSE
		IF _user_validate = TRUE THEN
			SELECT 'SUCCESS' AS result, _user_id AS user_id, _user_role AS user_role, _user_validate AS user_validate;
		ELSE
			SELECT 'NOT VALIDATED' AS result, _user_id AS user_id, _user_role AS user_role, _user_validate AS user_validate;
		END IF;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_user_reg
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_user_reg`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_reg`(IN _user_name varchar(45), IN _user_pass varchar(45), IN _user_role tinyint)
BEGIN

	DECLARE _user_validate BIT DEFAULT FALSE;
	#user_role: 1.学生 2.教师
	IF _user_role = 1 THEN
		SET _user_validate=TRUE;
	END IF;
	
	INSERT INTO jtthink_exam.user_sys(user_name, user_pass, user_role, user_validate)
			VALUES (_user_name, _user_pass, _user_role, _user_validate);
	SELECT LAST_INSERT_ID();

END
;;
DELIMITER ;



-- -----------------------------------------------------
-- Schema baemin
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `baemin` ;

-- -----------------------------------------------------
-- Schema baemin
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `baemin` DEFAULT CHARACTER SET utf8 ;
USE `baemin` ;

-- -----------------------------------------------------
-- Table `baemin`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`user` ;

CREATE TABLE IF NOT EXISTS `baemin`.`user` (
  `user_id` VARCHAR(45) NOT NULL,
  `user_pass` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `user_email` VARCHAR(100) NOT NULL,
  `user_nick` VARCHAR(45) NOT NULL,
  `user_grade` INT NOT NULL DEFAULT 0 COMMENT '0 : 일반\n1 : 귀한분 (VIP) - 월 5회 이상 주문\n2 : 더귀한분 (VIP) - 월 10회 이상 주문\n3 : 천생연분 (VIP) - 월 20회 이상 주문',
  `user_isadult` INT NOT NULL DEFAULT 0 COMMENT '0 : 비동의\n1 : 동의',
  `user_isclause` INT NOT NULL DEFAULT 0 COMMENT '0 : 비동의\n1 : 동의',
  `user_phone` VARCHAR(45) NOT NULL,
  `user_point` INT NOT NULL DEFAULT 0,
  `user_reg_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `u_email_UNIQUE` (`user_email` ASC) ,
  UNIQUE INDEX `u_nickname_UNIQUE` (`user_nick` ASC) ,
  UNIQUE INDEX `u_phone_UNIQUE` (`user_phone` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `baemin`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`company` ;

CREATE TABLE IF NOT EXISTS `baemin`.`company` (
  `com_id` VARCHAR(45) NOT NULL,
  `com_pass` VARCHAR(45) NOT NULL,
  `com_ceo_name` VARCHAR(45) NOT NULL,
  `com_name` VARCHAR(45) NOT NULL,
  `com_phone` VARCHAR(45) NOT NULL,
  `com_addr1` VARCHAR(45) NOT NULL,
  `com_addr2` VARCHAR(45) NOT NULL,
  `com_addr3` VARCHAR(45) NULL,
  `com_license` VARCHAR(45) NOT NULL,
  `com_email` VARCHAR(45) NOT NULL,
  `com_reg_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`com_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baemin`.`store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`store` ;

CREATE TABLE IF NOT EXISTS `baemin`.`store` (
  `store_no` INT NOT NULL AUTO_INCREMENT,
  `com_id` VARCHAR(45) NOT NULL,
  `store_name` VARCHAR(45) NOT NULL,
  `main_cat` INT NOT NULL,
  `store_addr1` VARCHAR(45) NULL,
  `store_addr2` VARCHAR(45) NULL,
  `store_addr3` VARCHAR(45) NULL,
  `store_phone` VARCHAR(45) NULL,
  `store_reg_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '1 : 돈가스 회 일식\n2 : 중식\n3 : 치킨\n4 : 백반 죽 국수\n5 : 카페 디저트\n6 : 분식\n7 : 찜 탕 찌개\n8 : 피자\n9 : 양식\n10 : 고기 구이\n11 : 족발 보쌈\n12 : 아시안\n13 : 패스트푸드\n14 : 야식\n15 : 도시락',
  `store_img` VARCHAR(200) NULL,
  `store_open_time` TIMESTAMP NULL,
  `store_close_time` TIMESTAMP NULL,
  `store_deli_time_min` VARCHAR(45) NULL,
  `store_deli_time_max` VARCHAR(45) NULL,
  `store_scope` DECIMAL(4,3) NULL,
  PRIMARY KEY (`store_no`),
  INDEX `fk_store_company1_idx` (`com_id` ASC),
  CONSTRAINT `fk_store_company1`
    FOREIGN KEY (`com_id`)
    REFERENCES `baemin`.`company` (`com_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baemin`.`coupon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`coupon` ;

CREATE TABLE IF NOT EXISTS `baemin`.`coupon` (
  `cp_code` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(45) NOT NULL,
  `store_no` INT NOT NULL,
  `cp_discnt` INT NOT NULL,
  `cp_min_odr_price` INT NULL,
  `cp_term_min` TIMESTAMP NULL,
  `cp_term_max` TIMESTAMP NULL,
  PRIMARY KEY (`cp_code`),
  INDEX `fk_coupon_user_idx` (`user_id` ASC) ,
  INDEX `fk_coupon_store1_idx` (`store_no` ASC) ,
  CONSTRAINT `fk_coupon_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `baemin`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_coupon_store1`
    FOREIGN KEY (`store_no`)
    REFERENCES `baemin`.`store` (`store_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baemin`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`address` ;

CREATE TABLE IF NOT EXISTS `baemin`.`address` (
  `addr_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(45) NOT NULL,
  `addr1` VARCHAR(45) NOT NULL,
  `addr2` VARCHAR(45) NOT NULL,
  `addr3` VARCHAR(45) NULL,
  `addr_check` INT NULL DEFAULT 0,
  PRIMARY KEY (`addr_no`) COMMENT '1 : 현재 주소 설정\n0 : 현재 주소  취소',
  INDEX `fk_address_user1_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_address_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `baemin`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baemin`.`search`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`search` ;

CREATE TABLE IF NOT EXISTS `baemin`.`search` (
  `search_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(45) NOT NULL,
  `search_keyword` VARCHAR(45) NOT NULL,
  `search_reg_date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`search_no`),
  INDEX `fk_user_search_user1_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_user_search_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `baemin`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baemin`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`product` ;

CREATE TABLE IF NOT EXISTS `baemin`.`product` (
  `product_no` INT NOT NULL AUTO_INCREMENT,
  `store_no` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  `product_price` INT NOT NULL DEFAULT 0,
  `product_img` VARCHAR(200) NULL,
  `product_content` VARCHAR(1000) NULL,
  `product_isPopular` INT NULL DEFAULT 0 COMMENT '0: 일반메뉴\n1: 대표메뉴',
  `product_sal_num` INT NULL DEFAULT 0 COMMENT '판매량',
  `product_reg_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_no`),
  INDEX `fk_product_store1_idx` (`store_no` ASC) ,
  CONSTRAINT `fk_product_store1`
    FOREIGN KEY (`store_no`)
    REFERENCES `baemin`.`store` (`store_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `baemin`.`order0`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`order0` ;

CREATE TABLE IF NOT EXISTS `baemin`.`order0` (
  `odr_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(45) NOT NULL,
  `odr_addr1` VARCHAR(45) NOT NULL,
  `odr_addr2` VARCHAR(45) NOT NULL,
  `odr_addr3` VARCHAR(45) NOT NULL,
  `odr_phone` VARCHAR(45) NOT NULL,
  `odr_isDisposable` INT NOT NULL DEFAULT 0 COMMENT '0 : 일회용품 미사용\n1 : 일회용품 사용',
  `odr_ceo_msg` VARCHAR(45) NULL,
  `odr_rider_msg` VARCHAR(45) NULL,
  `odr_pay` INT NOT NULL DEFAULT 0 COMMENT '0 : 신용/체크카드\n1 : 휴대폰결제\n2 : 네이버페이\n3 : 카카오페이\n4 : 토스\n5 : 만나서 카드결제\n6 : 만나서 현금결제',
  `odr_cp` VARCHAR(45) NULL,
  `odr_reg_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `odr_status` INT NOT NULL DEFAULT 0 COMMENT '0 : 조리 중\n1 : 픽업 완료\n2 : 배달 완료',
  `odr_total_amt` INT NULL,
  PRIMARY KEY (`odr_no`),
  INDEX `fk_order0_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_order0_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `baemin`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baemin`.`cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`cart` ;

CREATE TABLE IF NOT EXISTS `baemin`.`cart` (
  `cart_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(45) NOT NULL,
  `product_no` INT NOT NULL,
  `cart_cnt` INT NOT NULL DEFAULT 0,
  `cart_amt` INT NOT NULL DEFAULT 0,
  `cart_is_pay_check` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`cart_no`),
  INDEX `fk_cart_user1_idx` (`user_id` ASC),
  INDEX `fk_cart_product1_idx` (`product_no` ASC),
  CONSTRAINT `fk_cart_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `baemin`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_product1`
    FOREIGN KEY (`product_no`)
    REFERENCES `baemin`.`product` (`product_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baemin`.`wish`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`wish` ;

CREATE TABLE IF NOT EXISTS `baemin`.`wish` (
  `wish_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(45) NOT NULL,
  `store_no` INT NOT NULL,
  PRIMARY KEY (`wish_no`),
  INDEX `fk_wish_user1_idx` (`user_id` ASC) ,
  INDEX `fk_wish_store1_idx` (`store_no` ASC) ,
  CONSTRAINT `fk_wish_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `baemin`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wish_store1`
    FOREIGN KEY (`store_no`)
    REFERENCES `baemin`.`store` (`store_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baemin`.`review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`review` ;

CREATE TABLE IF NOT EXISTS `baemin`.`review` (
  `r_no` INT NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `product_no` INT NOT NULL,
  `r_scope` DECIMAL(4,3) NULL,
  `r_reg_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `r_img` VARCHAR(200) NULL,
  `r_content` VARCHAR(200) NULL,
  PRIMARY KEY (`r_no`),
  INDEX `fk_review_user1_idx` (`user_id` ASC) ,
  INDEX `fk_review_product1_idx` (`product_no` ASC) ,
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `baemin`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_product1`
    FOREIGN KEY (`product_no`)
    REFERENCES `baemin`.`product` (`product_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baemin`.`store_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`store_category` ;

CREATE TABLE IF NOT EXISTS `baemin`.`store_category` (
  `store_cat_no` INT NOT NULL,
  `store_no` INT NOT NULL,
  `store_cat_content` VARCHAR(45) NULL,
  PRIMARY KEY (`store_cat_no`),
  INDEX `fk_store_category_store1_idx` (`store_no` ASC) ,
  CONSTRAINT `fk_store_category_store1`
    FOREIGN KEY (`store_no`)
    REFERENCES `baemin`.`store` (`store_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baemin`.`delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`delivery` ;

CREATE TABLE IF NOT EXISTS `baemin`.`delivery` (
  `deli_no` INT NOT NULL AUTO_INCREMENT,
  `store_no` INT NOT NULL,
  `deli_price` INT NOT NULL,
  `deli_area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`deli_no`),
  CONSTRAINT `fk_delivery_store1`
    FOREIGN KEY (`store_no`)
    REFERENCES `baemin`.`store` (`store_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `baemin`.`o_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baemin`.`o_detail` ;

CREATE TABLE IF NOT EXISTS `baemin`.`o_detail` (
  `o_dtl_no` INT NOT NULL AUTO_INCREMENT,
  `odr_no` INT NOT NULL,
  `cart_no` INT NOT NULL,
  PRIMARY KEY (`o_dtl_no`),
  INDEX `fk_o_Detail_order01_idx` (`odr_no` ASC),
  INDEX `fk_o_detail_cart1_idx` (`cart_no` ASC),
  CONSTRAINT `fk_o_Detail_order01`
    FOREIGN KEY (`odr_no`)
    REFERENCES `baemin`.`order0` (`odr_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_o_detail_cart1`
    FOREIGN KEY (`cart_no`)
    REFERENCES `baemin`.`cart` (`cart_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `baemin`.`review0`;

CREATE TABLE IF NOT EXISTS `baemin`.`review0` (
  `r_no` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_id` VARCHAR(45) NOT NULL,
  `product_no` INT NOT NULL,
  `r_scope` DECIMAL(4,3) NULL,
  `r_reg_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `r_img` VARCHAR(200) NULL,
  `r_content` VARCHAR(200) NULL
)ENGINE = InnoDB CHARACTER SET utf8;

COMMIT;



ALTER TABLE baemin.address CONVERT TO character SET utf8;
ALTER TABLE baemin.cart CONVERT TO character SET utf8;
ALTER TABLE baemin.company CONVERT TO character SET utf8;
ALTER TABLE baemin.coupon CONVERT TO character SET utf8;
ALTER TABLE baemin.delivery CONVERT TO character SET utf8;
ALTER TABLE baemin.order0 CONVERT TO character SET utf8;
ALTER TABLE baemin.product CONVERT TO character SET utf8;
ALTER TABLE baemin.review CONVERT TO character SET utf8;
ALTER TABLE baemin.store CONVERT TO character SET utf8;
ALTER TABLE baemin.store_category CONVERT TO character SET utf8;
ALTER TABLE baemin.user CONVERT TO character SET utf8;
ALTER TABLE baemin.search CONVERT TO character SET utf8;
ALTER TABLE baemin.wish CONVERT TO character SET utf8;
ALTER TABLE baemin.o_detail CONVERT TO character SET utf8;


-- -----------------------------------------------------
-- Data for table `baemin`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `baemin`;
INSERT INTO `baemin`.`user` (`user_id`, `user_pass`, `user_name`, `user_email`, `user_nick`, `user_grade`, `user_isadult`, `user_isclause`, `user_phone`, `user_point`, `user_reg_date`) VALUES ('admin', '1234', '김종범', 'admin@naver.com', '피카츄', DEFAULT, 1, DEFAULT, '010-1111-1111', 1728370000, NULL);
INSERT INTO `baemin`.`user` (`user_id`, `user_pass`, `user_name`, `user_email`, `user_nick`, `user_grade`, `user_isadult`, `user_isclause`, `user_phone`, `user_point`, `user_reg_date`) VALUES ('user1', '1234', '이정균', 'user1@naver.com', '라이츄', DEFAULT, 1, DEFAULT, '010-2222-2222', 111131221, NULL);
INSERT INTO `baemin`.`user` (`user_id`, `user_pass`, `user_name`, `user_email`, `user_nick`, `user_grade`, `user_isadult`, `user_isclause`, `user_phone`, `user_point`, `user_reg_date`) VALUES ('user2', '1234', '조상동', 'user2@naver.com', '파이리', DEFAULT, 1, DEFAULT, '010-3333-3333', 1111, NULL);
INSERT INTO `baemin`.`user` (`user_id`, `user_pass`, `user_name`, `user_email`, `user_nick`, `user_grade`, `user_isadult`, `user_isclause`, `user_phone`, `user_point`, `user_reg_date`) VALUES ('user3', '1234', '윤병우', 'user3@naver.com', '꼬북이', DEFAULT, 1, DEFAULT, '010-4444-4444', 0, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `baemin`.`company`
-- -----------------------------------------------------
START TRANSACTION;
USE `baemin`;
INSERT INTO `baemin`.`company` (`com_id`, `com_pass`, `com_ceo_name`, `com_name`, `com_phone`, `com_addr1`, `com_addr2`, `com_addr3`, `com_license`, `com_email`, `com_reg_date`) VALUES ('com1', '1234', '임꺽정', '마니팔자', '010-1111-1111', '57648', '서울시 어쩌구', '13412', '12-3312-43214', 'company1@naver.com', '130312');
INSERT INTO `baemin`.`company` (`com_id`, `com_pass`, `com_ceo_name`, `com_name`, `com_phone`, `com_addr1`, `com_addr2`, `com_addr3`, `com_license`, `com_email`, `com_reg_date`) VALUES ('com2', '1234', '홍길동', '맨날 늦어', '010-2222-2222', '18934', '인천 어쩌구', '123412', '412312-4213-123', 'company2@naver.com', '041124');
INSERT INTO `baemin`.`company` (`com_id`, `com_pass`, `com_ceo_name`, `com_name`, `com_phone`, `com_addr1`, `com_addr2`, `com_addr3`, `com_license`, `com_email`, `com_reg_date`) VALUES ('com3', '1234', '유관순', '동명 산업', '010-3333-3333', '14443', '부산 어쩌구', '123412', '12-32123-4321', 'company3@naver.com', '090411');
INSERT INTO `baemin`.`company` (`com_id`, `com_pass`, `com_ceo_name`, `com_name`, `com_phone`, `com_addr1`, `com_addr2`, `com_addr3`, `com_license`, `com_email`, `com_reg_date`) VALUES ('com4', '1234', '이순신', '우라늄식자재', '010-4444-4444', '15753', '광주 어쩌구', '1234123', '14-432134-213', 'company4@naver.com', '210214');
INSERT INTO `baemin`.`company` (`com_id`, `com_pass`, `com_ceo_name`, `com_name`, `com_phone`, `com_addr1`, `com_addr2`, `com_addr3`, `com_license`, `com_email`, `com_reg_date`) VALUES ('com5', '1234', '장영실', '동부산업', '010-5555-5555', '54231', '인천', '514321', '13-42314-12341', 'company5@naver.com', NULL);
INSERT INTO `baemin`.`company` (`com_id`, `com_pass`, `com_ceo_name`, `com_name`, `com_phone`, `com_addr1`, `com_addr2`, `com_addr3`, `com_license`, `com_email`, `com_reg_date`) VALUES ('com6', '1234', '강감찬', '소닉컬취', '010-6666-6666', '54131', '광주', '13412', '12-54325-132', 'company6@naver.com', NULL);
INSERT INTO `baemin`.`company` (`com_id`, `com_pass`, `com_ceo_name`, `com_name`, `com_phone`, `com_addr1`, `com_addr2`, `com_addr3`, `com_license`, `com_email`, `com_reg_date`) VALUES ('com7', '1234', '김유신', '이모션랩 (주)', '010-7777-7777', '12347', '대구', '154143', '56-234523-532', 'company7@naver.com', NULL);
INSERT INTO `baemin`.`company` (`com_id`, `com_pass`, `com_ceo_name`, `com_name`, `com_phone`, `com_addr1`, `com_addr2`, `com_addr3`, `com_license`, `com_email`, `com_reg_date`) VALUES ('com8', '1234', '장보고', '뉴욕스토리', '010-8888-8888', '12341', '대전', '11451343', '23-5432-5342', 'company8@naver.com', NULL);
INSERT INTO `baemin`.`company` (`com_id`, `com_pass`, `com_ceo_name`, `com_name`, `com_phone`, `com_addr1`, `com_addr2`, `com_addr3`, `com_license`, `com_email`, `com_reg_date`) VALUES ('com9', '1234', '대조영', '노블레스 코리아', '010-9999-9999', '64225', '전주', '12134', '25-65435-3421', 'company9@naver.com', NULL);
INSERT INTO `baemin`.`company` (`com_id`, `com_pass`, `com_ceo_name`, `com_name`, `com_phone`, `com_addr1`, `com_addr2`, `com_addr3`, `com_license`, `com_email`, `com_reg_date`) VALUES ('com10', '1234', '박문수', '짜장면 매직', '010-0000-0000', '12346', '포항', '12341', '23-45322-54325', 'company10@naver.com', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `baemin`.`store`
-- -----------------------------------------------------
START TRANSACTION;
USE `baemin`;
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com1', '진스시', 1, '53143', '서울시 어쩌구 저쩌구', '1111', '010-1111-1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com1', '전가복', 2, '12343', '인천 어쩌구 저쩌구', '2222', '010-2222-2222', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com2', '보드람치킨', 3, '41324', '강원도 어쩌구 저쩌구', '33333', '010-3333-3333', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com5', '본죽 구로디지털점', 4, '42134', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com1', '배스킨라빈스 구로디지털점', 5, '12344', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com6', '동대문엽기떡볶이', 6, '14344', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com9', '원조한우곱도리탕전문점', 7, '12134', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com4', '피자플렉스', 8, '23452', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com1', '아웃백 구로디지털점', 9, '54325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com6', '레전드 고기한상', 10, '234523', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com5', '원할머니 보쌈족발', 11, '3245235', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com6', '루이튀김꼬치', 12, '34523', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com9', '봉구스밥버거', 13, '523452', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com10', '경남포차&닭발', 14, '53245', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com10', '덮밥90도씨', 15, '32455', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com4', '돈가스짱', 1, '4123', '서울시 어쩌구', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com4', '신가향', 2, '41234', '서울시 어쩌구', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com6', '멕시카나 구로점', 3, '43214', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com1', '만포순대국 돼지국밥', 4, '14234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com6', '이디야커피', 5, '123134', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com7', '우리할매떡볶이', 6, '43144', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com5', '테트리스찜닭', 7, '43412', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com1', '원플러스피자', 8, '23452', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com6', '꽃보다 파스타', 9, '54325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com5', '제육대가', 10, '2345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com8', '재용이네만족 본점', 11, '23452', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com1', '마라영웅 마라탕&마라샹궈 전문점', 12, '3245234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com8', '롯데리아', 13, '52345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com5', '야한곱창', 14, '3245234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com3', '만족 도시락', 15, '3425234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com7', '88수산', 1, '423141', '서울시 어쩌구', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com9', '마라영웅 마라당&마라샹궈 전문점', 2, '41234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com1', 'BHC 구로점', 3, '12314', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com3', '열정국밥', 4, '12341', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com6', '백다방', 5, '12314', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com8', '튀김왕', 6, '43214', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com2', '513낙곱새 본점', 7, '54325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com5', '도미노피자', 8, '23452', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com4', '요녀석 파스타', 9, '32425', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com4', '1인불황쭈꾸미&낙지 본점', 10, '2345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com7', '기대만족 구디점', 11, '52345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com4', '베트남노상식당', 12, '345234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com2', '맘스터치 구로디지털점', 13, '532452', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com6', '웅이네오돌뼈닭발도', 14, '32424', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `baemin`.`store` (`store_no`, `com_id`, `store_name`, `main_cat`, `store_addr1`, `store_addr2`, `store_addr3`, `store_phone`, `store_reg_date`, `store_img`, `store_open_time`, `store_close_time`, `store_deli_time_min`, `store_deli_time_max`, `store_scope`) VALUES (DEFAULT, 'com7', '레전드 고기한상', 15, '345234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `baemin`.`product`
-- -----------------------------------------------------
USE `baemin`;
INSERT INTO `baemin`.`product` (`product_no`, `store_no`, `product_name`, `product_price`, `product_img`, `product_content`, `product_isPopular`, `product_sal_num`, `product_reg_date`) VALUES (DEFAULT, 2, '지지고볶고', 30000, NULL, '한번 잡숴봐~', 1, NULL, NULL);
INSERT INTO `baemin`.`product` (`product_no`, `store_no`, `product_name`, `product_price`, `product_img`, `product_content`, `product_isPopular`, `product_sal_num`, `product_reg_date`) VALUES (DEFAULT, 1, '1234', 1234, NULL, '1234', 0, NULL, NULL);
INSERT INTO `baemin`.`product` (`product_no`, `store_no`, `product_name`, `product_price`, `product_img`, `product_content`, `product_isPopular`, `product_sal_num`, `product_reg_date`) VALUES (DEFAULT, 1, '4321', 4321, NULL, '4321', 0, NULL, NULL);
INSERT INTO `baemin`.`product` (`product_no`, `store_no`, `product_name`, `product_price`, `product_img`, `product_content`, `product_isPopular`, `product_sal_num`, `product_reg_date`) VALUES (DEFAULT, 1, '2222', 2222, NULL, '2222', 1, NULL, NULL);
INSERT INTO `baemin`.`product` (`product_no`, `store_no`, `product_name`, `product_price`, `product_img`, `product_content`, `product_isPopular`, `product_sal_num`, `product_reg_date`) VALUES (DEFAULT, 1, '3333', 3333, NULL, '3333', 1, NULL, NULL);
INSERT INTO `baemin`.`product` (`product_no`, `store_no`, `product_name`, `product_price`, `product_img`, `product_content`, `product_isPopular`, `product_sal_num`, `product_reg_date`) VALUES (DEFAULT, 2, '1212', 1212, NULL, '1212', 0, NULL, NULL);
INSERT INTO `baemin`.`product` (`product_no`, `store_no`, `product_name`, `product_price`, `product_img`, `product_content`, `product_isPopular`, `product_sal_num`, `product_reg_date`) VALUES (DEFAULT, 2, '2121', 2121, NULL, '2121', 1, NULL, NULL);
INSERT INTO `baemin`.`product` (`product_no`, `store_no`, `product_name`, `product_price`, `product_img`, `product_content`, `product_isPopular`, `product_sal_num`, `product_reg_date`) VALUES (DEFAULT, 2, '5151', 5151, NULL, '5151', 0, NULL, NULL);

COMMIT;

DROP TABLE IF EXISTS `baemin`.`review0`;

CREATE TABLE IF NOT EXISTS `baemin`.`review0` (
  `r_no` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_id` VARCHAR(45) NOT NULL,
  `product_no` INT NOT NULL,
  `r_scope` DECIMAL(4,3) NULL,
  `r_reg_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `r_img` VARCHAR(200) NULL,
  `r_content` VARCHAR(200) NULL
)ENGINE = InnoDB CHARACTER SET utf8;

COMMIT;

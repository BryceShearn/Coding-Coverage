-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema codingcoveragedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `codingcoveragedb` ;

-- -----------------------------------------------------
-- Schema codingcoveragedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `codingcoveragedb` DEFAULT CHARACTER SET utf8 ;
USE `codingcoveragedb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(60) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `enabled` TINYINT(1) NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `bio` TEXT NULL,
  `image` VARCHAR(3000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `language` ;

CREATE TABLE IF NOT EXISTS `language` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `image_url` VARCHAR(3000) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(500) NOT NULL,
  `content` TEXT NOT NULL,
  `date_created` DATETIME NULL,
  `last_update` DATETIME NULL,
  `user_id` INT NOT NULL,
  `is_blog` TINYINT(1) NULL,
  `is_forum_visable` TINYINT NULL,
  `is_expert` TINYINT NULL,
  `language_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  INDEX `fk_post_language1_idx` (`language_id` ASC),
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resource` ;

CREATE TABLE IF NOT EXISTS `resource` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `link` VARCHAR(3000) NOT NULL,
  `description` TEXT NOT NULL,
  `date_added` DATETIME NULL,
  `difficulty` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `date_created` DATETIME NULL,
  `date_updated` DATETIME NULL,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_post1_idx` (`post_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roadmap`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roadmap` ;

CREATE TABLE IF NOT EXISTS `roadmap` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `language_id` INT NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_roadmap_language1_idx` (`language_id` ASC),
  CONSTRAINT `fk_roadmap_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `code_concept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `code_concept` ;

CREATE TABLE IF NOT EXISTS `code_concept` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `roadmap_id` INT NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_code_concept_roadmap1_idx` (`roadmap_id` ASC),
  CONSTRAINT `fk_code_concept_roadmap1`
    FOREIGN KEY (`roadmap_id`)
    REFERENCES `roadmap` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `task` ;

CREATE TABLE IF NOT EXISTS `task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `code_concept_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_task_code_concept1_idx` (`code_concept_id` ASC),
  CONSTRAINT `fk_task_code_concept1`
    FOREIGN KEY (`code_concept_id`)
    REFERENCES `code_concept` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_roadmap`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_roadmap` ;

CREATE TABLE IF NOT EXISTS `user_has_roadmap` (
  `user_id` INT NOT NULL,
  `roadmap_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `roadmap_id`),
  INDEX `fk_user_has_roadmap_roadmap1_idx` (`roadmap_id` ASC),
  INDEX `fk_user_has_roadmap_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_roadmap_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_roadmap_roadmap1`
    FOREIGN KEY (`roadmap_id`)
    REFERENCES `roadmap` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_roadmap_task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_roadmap_task` ;

CREATE TABLE IF NOT EXISTS `user_roadmap_task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `task_id` INT NOT NULL,
  `completed` TINYINT(1) NOT NULL DEFAULT 0,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_roadmap_tasklist_user1_idx` (`user_id` ASC),
  INDEX `fk_user_roadmap_tasklist_task1_idx` (`task_id` ASC),
  CONSTRAINT `fk_user_roadmap_tasklist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_roadmap_tasklist_task1`
    FOREIGN KEY (`task_id`)
    REFERENCES `task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_vote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_vote` ;

CREATE TABLE IF NOT EXISTS `post_vote` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_voted` DATETIME NULL,
  `vote` TINYINT NULL,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_vote_post1_idx` (`post_id` ASC),
  INDEX `fk_post_vote_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_post_vote_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_vote_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment_vote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment_vote` ;

CREATE TABLE IF NOT EXISTS `comment_vote` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_voted` DATETIME NULL,
  `vote` TINYINT NULL,
  `comment_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_vote_comment1_idx` (`comment_id` ASC),
  INDEX `fk_comment_vote_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_vote_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_vote_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `task_has_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `task_has_resource` ;

CREATE TABLE IF NOT EXISTS `task_has_resource` (
  `task_id` INT NOT NULL,
  `resource_id` INT NOT NULL,
  PRIMARY KEY (`task_id`, `resource_id`),
  INDEX `fk_task_has_resource_resource1_idx` (`resource_id` ASC),
  INDEX `fk_task_has_resource_task1_idx` (`task_id` ASC),
  CONSTRAINT `fk_task_has_resource_task1`
    FOREIGN KEY (`task_id`)
    REFERENCES `task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_has_resource_resource1`
    FOREIGN KEY (`resource_id`)
    REFERENCES `resource` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resource_has_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resource_has_language` ;

CREATE TABLE IF NOT EXISTS `resource_has_language` (
  `resource_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  PRIMARY KEY (`resource_id`, `language_id`),
  INDEX `fk_resource_has_language_language1_idx` (`language_id` ASC),
  INDEX `fk_resource_has_language_resource1_idx` (`resource_id` ASC),
  CONSTRAINT `fk_resource_has_language_resource1`
    FOREIGN KEY (`resource_id`)
    REFERENCES `resource` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_has_language_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS codeuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'codeuser'@'localhost' IDENTIFIED BY 'codeuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'codeuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `enabled`, `role`, `bio`, `image`) VALUES (1, 'admin', 'admin', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `enabled`, `role`, `bio`, `image`) VALUES (2, 'thwebel', 'password', 'Thomas', 'Webel', 1, 'admin', 'Good Coder', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `language`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `language` (`id`, `name`, `image_url`, `description`) VALUES (1, 'Java', NULL, 'Best lang ever');
INSERT INTO `language` (`id`, `name`, `image_url`, `description`) VALUES (2, 'HTML', NULL, 'layouts ');
INSERT INTO `language` (`id`, `name`, `image_url`, `description`) VALUES (3, 'CSS', NULL, 'makes layouts pretty');
INSERT INTO `language` (`id`, `name`, `image_url`, `description`) VALUES (4, 'SQL', NULL, 'Hey DB give me ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `post` (`id`, `subject`, `content`, `date_created`, `last_update`, `user_id`, `is_blog`, `is_forum_visable`, `is_expert`, `language_id`) VALUES (1, 'DB design', 'DB design is an essential aspect of full stack applications', NULL, NULL, 2, 1, 0, 0, 1);
INSERT INTO `post` (`id`, `subject`, `content`, `date_created`, `last_update`, `user_id`, `is_blog`, `is_forum_visable`, `is_expert`, `language_id`) VALUES (2, 'Java Variables', 'It is extremely important to know java variables', NULL, NULL, 2, 0, 1, 0, 1);
INSERT INTO `post` (`id`, `subject`, `content`, `date_created`, `last_update`, `user_id`, `is_blog`, `is_forum_visable`, `is_expert`, `language_id`) VALUES (3, 'Expert test', 'experts know enought to know they know how to google what they don\'t know, no?', NULL, NULL, 2, 0, 0, 1, 1);
INSERT INTO `post` (`id`, `subject`, `content`, `date_created`, `last_update`, `user_id`, `is_blog`, `is_forum_visable`, `is_expert`, `language_id`) VALUES (4, 'Personal / Forum Test', 'This should display once per page', NULL, NULL, 2, 1, 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (1, 'https://www.tutorialspoint.com/java/java_environment_setup.htm', 'basic tutorial', NULL, 'easy');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (2, 'https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html', 'Download Java 8 here!', NULL, 'easy');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (3, 'https://www.geeksforgeeks.org/differences-jdk-jre-jvm/', 'Desc: JDK, JRE, and JVM described', NULL, 'easy');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (4, 'https://www.freecodecamp.org/news/best-java-8-tutorial/', 'Detailed JDK download guide, along with terminal commands', NULL, 'intermediate');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (5, 'https://atom.io/', 'Download Atom here!', NULL, 'easy');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (6, 'https://www.codecademy.com/articles/what-is-an-ide', 'What an IDE brings to the table', NULL, 'easy');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (7, 'https://www.infoworld.com/article/3114167/choosing-your-java-ide.html', 'Compares and contrasts three advanced Java IDEs', NULL, 'Advanced');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (8, 'https://www.vogella.com/tutorials/Eclipse/article.html', 'In-depth Eclipse (an advanced IDE)  download and setup guide', NULL, 'Intermediate');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (9, 'https://medium.com/@grace.m.nolan/terminal-for-beginners-e492ba10902a', 'Quick guide to the common commands', NULL, 'easy');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (10, 'https://ubuntu.com/tutorials/command-line-for-beginners#4-creating-folders-and-files', 'In depth introduction to the Linux command line interface', NULL, 'Intermediate');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (11, 'https://www.codecademy.com/articles/command-line-commands#:~:text=The%20command%20line%20is%20a,or%20Finder%20on%20Mac%20OS', 'List of useful Commands', NULL, 'easy');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (12, 'https://www.geeksforgeeks.org/beginning-java-programming-with-hello-world-example/', 'Basic description of HelloWorld and the terminal commands to compile and run a java program.', NULL, 'easy');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (13, 'https://en.wikiversity.org/wiki/Java_Tutorial/Hello_World', 'Clear guide for writing, compiling, and running HelloWorld', NULL, 'easy');
INSERT INTO `resource` (`id`, `link`, `description`, `date_added`, `difficulty`) VALUES (14, 'https://docs.oracle.com/javase/tutorial/getStarted/cupojava/unix.html', 'Step-by-step guide for making a new directory and running your HelloWorld program!', NULL, 'easy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `comment` (`id`, `content`, `date_created`, `date_updated`, `post_id`, `user_id`) VALUES (1, 'That is a ridiculous statement!', NULL, NULL, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `roadmap`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `roadmap` (`id`, `name`, `language_id`, `description`) VALUES (1, 'Java Fundementals', 1, 'Learn the fundemental aspect of Java! This roadmap will guide you through your first Java program while establishing key concepts along the way.');
INSERT INTO `roadmap` (`id`, `name`, `language_id`, `description`) VALUES (2, 'HTML Fundementals', 2, 'Interested in web design? Start here with the fundementals of HTML. Our HTML road map will have you creating webpages in no time!');
INSERT INTO `roadmap` (`id`, `name`, `language_id`, `description`) VALUES (3, 'CSS Fundementals', 3, 'Got an eye for design and have the basics of HTML down? Let\'s spruce up those dreary webpages with some CSS! Follow this roadmap for easy CSS setup and essentail CSS concepts.');
INSERT INTO `roadmap` (`id`, `name`, `language_id`, `description`) VALUES (4, 'SQL Fundementals', 4, 'Storing massive amounts of information and retrieving pinpoint accurate results is easy with SQL. This roadmap will make setup a breeze and have you querying for data in no time!');

COMMIT;


-- -----------------------------------------------------
-- Data for table `code_concept`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `code_concept` (`id`, `name`, `roadmap_id`, `description`) VALUES (1, 'Java Setup and First Steps', 1, 'Description: Setup your coding environment and download necessary dependencies, i.e. make sure your tire has wheels before trying to drive.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `task`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `task` (`id`, `name`, `description`, `code_concept_id`) VALUES (1, 'Download Java 8 and research the JDK.', 'Download Java 8. Then describe the JRE, Java, Javac, Jar, and Javadoc.', 1);
INSERT INTO `task` (`id`, `name`, `description`, `code_concept_id`) VALUES (2, 'Download an IDE', 'Download an IDE (we recommend Atom or Eclipse). Be able to describe what IDEs are and the benefits they bring.', 1);
INSERT INTO `task` (`id`, `name`, `description`, `code_concept_id`) VALUES (3, 'Demystify The Terminal', 'Navigate, examine, and manipulate your file system with simple terminal commands. Describe what a directory is, make one, make a new terminal window and navigate to that directory.', 1);
INSERT INTO `task` (`id`, `name`, `description`, `code_concept_id`) VALUES (4, 'Write HelloWorld', 'Create, compile, and run your first java program! So IDEs will allow you to run your programs within them, but we suggest you compile and run your first programs through the command line.', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_roadmap`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `user_has_roadmap` (`user_id`, `roadmap_id`) VALUES (2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_roadmap_task`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `user_roadmap_task` (`id`, `user_id`, `task_id`, `completed`, `start_date`, `end_date`) VALUES (1, 2, 1, 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post_vote`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `post_vote` (`id`, `date_voted`, `vote`, `post_id`, `user_id`) VALUES (1, NULL, 1, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment_vote`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `comment_vote` (`id`, `date_voted`, `vote`, `comment_id`, `user_id`) VALUES (1, NULL, 1, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `task_has_resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (1, 1);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (1, 2);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (1, 3);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (1, 4);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (2, 5);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (2, 6);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (2, 7);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (2, 8);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (3, 9);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (3, 10);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (3, 11);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (4, 12);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (4, 13);
INSERT INTO `task_has_resource` (`task_id`, `resource_id`) VALUES (4, 14);

COMMIT;


-- -----------------------------------------------------
-- Data for table `resource_has_language`
-- -----------------------------------------------------
START TRANSACTION;
USE `codingcoveragedb`;
INSERT INTO `resource_has_language` (`resource_id`, `language_id`) VALUES (1, 1);
INSERT INTO `resource_has_language` (`resource_id`, `language_id`) VALUES (1, 2);

COMMIT;


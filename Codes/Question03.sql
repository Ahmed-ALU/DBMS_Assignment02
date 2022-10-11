CREATE TABLE emails(
    email_id TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(30)
    );

CREATE TABLE authores(
    email_id TINYINT(3) NOT NULL AUTO_INCREMENT,
    UNIQUE(email_id),
    FOREIGN KEY (`email_id`) REFERENCES `emails`(`email_id`) ON DELETE
    RESTRICT ON UPDATE RESTRICT,
    f_name VARCHAR(10),
    l_name VARCHAR(10)
    );

CREATE TABLE reviewers(
    email_address VARCHAR(30) PRIMARY KEY,
    f_name VARCHAR(10),
    l_name VARCHAR(10),
    affiliation VARCHAR(15),
    topics_of_interests VARCHAR(30)
    );

CREATE TABLE papers(
    paper_id TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(15),
    abstract VARCHAR(100),
    electronic_f VARCHAR(15)
    );

CREATE TABLE paper_reviews(
    review_id TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
    reviewer_email VARCHAR(30) NOT NULL,
    FOREIGN KEY (`reviewer_email`) REFERENCES
    `reviewers`(`email_address`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    paper_id TINYINT(3) NOT NULL,
    FOREIGN KEY (`paper_id`) REFERENCES `papers`(`paper_id`) ON DELETE
    RESTRICT ON UPDATE RESTRICT,
    rate_technical ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10'),
    rate_merit ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10'),
    rate_readability ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10'),
    rate_origanility ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10'),
    rate_relevance ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10'),
    comment_committe VARCHAR(100),
    feedback VARCHAR(100)
    );

CREATE TABLE paper_has_reviewer(
    paper_id TINYINT(3),
    FOREIGN KEY (`paper_id`) REFERENCES `papers`(`paper_id`) ON DELETE
    RESTRICT ON UPDATE RESTRICT,
    reviewer_id VARCHAR(30),
    FOREIGN KEY (`reviewer_id`) REFERENCES `reviewers`(`email_address`)
    ON DELETE RESTRICT ON UPDATE RESTRICT
    );

CREATE TABLE paper_has_author(
    paper_id TINYINT(3),
    FOREIGN KEY (`paper_id`) REFERENCES `papers`(`paper_id`) ON DELETE
    RESTRICT ON UPDATE RESTRICT,
    author_id TINYINT(3),
    FOREIGN KEY (`author_id`) REFERENCES `authores`(`email_id`) ON
    DELETE RESTRICT ON UPDATE RESTRICT,
    contact_author ENUM ('yes', 'no') NOT NULL
    );
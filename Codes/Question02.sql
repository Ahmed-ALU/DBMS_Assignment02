CREATE TABLE
    actors(
    actor_id TINYINT(3) NOT NULL UNIQUE AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL ,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY (name, date_of_birth),
    UNIQUE (name, date_of_birth)
    );

CREATE TABLE
    directors(
    director_id TINYINT(3) NOT NULL UNIQUE AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY (name, date_of_birth),
    UNIQUE (name, date_of_birth)
    );

CREATE TABLE
    production_company(
    comp_id TINYINT(3) NOT NULL UNIQUE AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    address DATE NOT NULL,
    PRIMARY KEY (name, address),
    UNIQUE (name, address)
    );

CREATE TABLE
    categories(
    category_id TINYINT(3) NOT NULL UNIQUE AUTO_INCREMENT,
    category VARCHAR(15),
    CHECK (category IN ('horror', 'action', 'drama'))
    );

CREATE TABLE
    movies(
    movie_id TINYINT(3) NOT NULL UNIQUE AUTO_INCREMENT,
    title VARCHAR(20) NOT NULL,
    year_release YEAR NOT NULL,
    PRIMARY KEY (title, year_release),
    plot VARCHAR(100),
    comp_id TINYINT(3),
    FOREIGN KEY (comp_id) references production_company (comp_id )
    );

CREATE TABLE
    quotes(
    quote_id TINYINT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    actor_id TINYINT(3),
    movie_id TINYINT(3),
    quote_text VARCHAR(100) NOT NULL,
    FOREIGN KEY (actor_id) references actors (actor_id),
    FOREIGN KEY (movie_id) references movies (movie_id)
    );

CREATE TABLE
    roles(
    role_id TINYINT(3) NOT NULL AUTO_INCREMENT PRIMARY
    KEY,
    role_name VARCHAR(20) NOT NULL,
    actor_id TINYINT(3),
    FOREIGN KEY (actor_id) references actors (actor_id),
    actor_if_director TINYINT(3) DEFAULT NULL,
    FOREIGN KEY (actor_if_director) references directors (director_id),
    movie_id TINYINT(3),
    FOREIGN KEY (movie_id) references movies (movie_id)
    );

CREATE TABLE
    movie_has_category(
    category_id TINYINT(3),
    FOREIGN KEY (category_id) REFERENCES categories (category_id),
    movie_id TINYINT(3),
    FOREIGN KEY (movie_id) REFERENCES movies (movie_id)
    );

CREATE TABLE
    movie_has_directors(
    director_id TINYINT(3),
    movie_id TINYINT(3),
    name VARCHAR(15),
    FOREIGN KEY (director_id) REFERENCES directors (director_id),
    FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
    FOREIGN KEY (name) REFERENCES directors (name)
    );

CREATE TABLE
    movie_has_actors(
    actor_id TINYINT(3),
    movie_id TINYINT(3),
    name VARCHAR(15),
    FOREIGN KEY (actor_id) REFERENCES actors (actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
    FOREIGN KEY (name) REFERENCES actors (name)
    );
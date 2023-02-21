-- Active: 1676296567947@@127.0.0.1@3306
CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT(DATETIME())
);

INSERT INTO users (id, name, email, password, role)
VALUES
        ("u001", "Aline", "aline@labenu.com", "aline1234", "author"),
        ("u002", "Binho", "binho@gmail.com", "binho1234", "author"),
        ("u003", "Evandro", "evandro@gmail.com", "evandro1234", "author"),
        ("u004", "Paula", "paula@labenu.com", "paula1234", "admin");

SELECT * FROM users;

CREATE TABLE posts(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT(0),
    dislikes INTEGER DEFAULT(0),
    created_at TEXT DEFAULT(DATETIME()),
    updated_at TEXT DEFAULT(DATETIME()),
    FOREIGN KEY (creator_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO posts(id, creator_id, content)
VALUES  ("p001", "u002", "Bom dia mundo!"),
        ("p002", "u003", "E aí pessoal?"),
        ("p003", "u004", "Sextoou!!!"),
        ("p004", "u001", "Bora trabalhar?");

CREATE TABLE likes_dislikes(
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (user_id, post_id)
);

INSERT INTO likes_dislikes (user_id, post_id, like)
VALUES  ("u002", "p002", 1),
        ("u003", "p001", 1),
        ("u004", "p004", 1),
        ("u002", "p003", 1),
        ("u003", "p003", 1);        

SELECT * FROM likes_dislikes;

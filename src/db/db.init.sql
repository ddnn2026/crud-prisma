CREATE TABLE Article(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    title   VARCHAR(255)    NOT NULL,
    description    VARCHAR(255)    NOT NULL,
    body    VARCHAR(255) NOT NULL,
    published   BOOLEAN NOT NULL DEFAULT false,
    createAt    DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3),
    updatedAt   DATETIME(3) 
);

INSERT INTO Article(title, description, body, published) VALUES 
('Beautiful day', 'We have a longer river', 'Loremsum', true)
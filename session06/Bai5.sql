USE session06;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,  
    username VARCHAR(50) NOT NULL,          
    email VARCHAR(100) UNIQUE NOT NULL,    
    created_at DATETIME NOT NULL           
);

CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY, 
    user_id INT NOT NULL,                   
    content TEXT NOT NULL,                  
    created_at DATETIME NOT NULL,           
    likes_count INT DEFAULT 0,              
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users (username, email, created_at)
VALUES
    ('john_doe', 'john.doe@example.com', '2025-01-01 10:00:00'),
    ('jane_smith', 'jane.smith@example.com', '2025-01-02 11:00:00'),
    ('alice_wonder', 'alice.wonder@example.com', '2025-01-03 12:00:00'),
    ('bob_marley', 'bob.marley@example.com', '2025-01-04 13:00:00'),
    ('charlie_brown', 'charlie.brown@example.com', '2025-01-05 14:00:00');

INSERT INTO posts (user_id, content, created_at, likes_count)
VALUES
    (1, 'Hello world!', '2025-01-10 10:00:00', 10),
    (2, 'Love this platform!', '2025-01-11 11:00:00', 20),
    (1, 'Had a great day today.', '2025-01-12 12:00:00', 15),
    (3, 'Exploring new ideas!', '2025-01-13 13:00:00', 25),
    (4, 'Check out my new blog.', '2025-01-14 14:00:00', 30);

SELECT p.user_id, u.username, COUNT(p.user_id) AS total_posts, SUM(p.likes_count) AS total_likes 
FROM posts p
JOIN users u ON p.user_id = u.user_id
GROUP BY p.user_id, u.username
HAVING SUM(p.likes_count) > 20;	

SELECT p.user_id, u.username, p.post_id, p.content, MAX(p.likes_count) AS max_likes 
FROM posts p
JOIN users u ON p.user_id = u.user_id
GROUP BY p.user_id, u.username, p.post_id
HAVING MAX(p.likes_count) >= 20;

SELECT p.user_id, u.username, COUNT(p.user_id) AS total_posts, SUM(p.likes_count) AS total_likes 
FROM posts p
JOIN users u ON p.user_id = u.user_id
GROUP BY p.user_id, u.username
HAVING COUNT(p.user_id) > 1;

SELECT p.user_id, u.username, p.post_id, p.content, MIN(p.likes_count) AS min_likes 
FROM posts p
JOIN users u ON p.user_id = u.user_id
GROUP BY p.user_id, u.username, p.post_id
HAVING MIN(p.likes_count) < 15;

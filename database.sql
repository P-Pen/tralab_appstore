-- 创建用户表
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 插入默认管理员账户
INSERT INTO users (username, password) 
VALUES ('admin', '$2y$10$eImiTXuWVxfM37uY4JANjQe5Jx1g8aG/2y5F8k1J8Q9J3X9B5eG6K'); -- 密码为 admin123

-- 创建应用信息表
CREATE TABLE apps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    developer VARCHAR(255),
    download_num INT DEFAULT 0,
    like_num INT DEFAULT 0,
    pkg_name VARCHAR(255),
    version_code VARCHAR(50),
    download_url TEXT,
    screen_shot_urls TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 创建页面访问记录表
CREATE TABLE pv_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    page_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 创建版本更新信息表
CREATE TABLE updates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    app_id INT NOT NULL,
    version_code VARCHAR(50) NOT NULL,
    update_log TEXT,
    download_size VARCHAR(50),
    update_time TIMESTAMP,
    download_url TEXT,
    FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE
);

-- 创建分类信息表
CREATE TABLE classifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 创建通知信息表
CREATE TABLE notices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    banner_img_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
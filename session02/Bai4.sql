use ks23b_database; 
CREATE TABLE staff (
    sta_id INT PRIMARY KEY,             
    sta_name VARCHAR(100) NOT NULL,      
    sta_date DATE,                 
    sta_wage DECIMAL(10, 2) DEFAULT 5000    
);

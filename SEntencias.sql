CREATE TABLE product (
    id INT NOt NULL,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
) PARTITION BY RANGE (price);

CREATE TABLE client (
    id_client INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    adreess VARCHAR(100),
    country VARCHAR(100),
    email VARCHAR(100),
    cellphone VARCHAR(28),
    telephone VARCHAR(28),
    job_title VARCHAR(100),
    gender VARCHAR(100),
    college VARCHAR(100)
)
PARTITION BY LIST (gender);


CREATE TABLE product_partition_1 PARTITION OF
product
FOR VALUES FROM ('1.00') TO ('3000.00');

CREATE TABLE product_partition_2 PARTITION OF
product
FOR VALUES FROM ('3001.00') TO ('6000.00');

CREATE TABLE product_partition_3 PARTITION OF
product
FOR VALUES FROM ('6001.00') TO ('10000.00');

ALTER TABLE product_partition_1
ADD CONSTRAINT partition_1_check
CHECK (price >= '1.00' AND price <= '3000.00');

ALTER TABLE product_partition_2
ADD CONSTRAINT partition_2_check
CHECK (price >= '3001.00' AND price <= '6000.00');

ALTER TABLE product_partition_3
ADD CONSTRAINT partition_3_check
CHECK (price >= '6001.00' AND price <= '10000.00');



CREATE TABLE male PARTITION OF 
client
FOR VALUES IN ('Male', 'male');

ALTER TABLE male
ADD CONSTRAINT partition_male_check
CHECK (gender IN ('Male', 'male'));


CREATE TABLE female
PARTITION OF client
FOR VALUES IN ('Female', 'female');


ALTER TABLE female
ADD CONSTRAINT partition_female_check
CHECK (gender IN ('Female', 'female'));


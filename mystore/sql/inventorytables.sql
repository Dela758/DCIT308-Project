CREATE TABLE beverages (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE bread_bakery (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE canned_jarred_goods (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE dairy_products (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE dry_baking_goods (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE frozen_products (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE meat (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE farm_produce (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE home_cleaners (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE paper_goods (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE home_care (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Relationships between tables
ALTER TABLE beverages
ADD COLUMN bread_bakery_id INT,
ADD COLUMN dairy_products_id INT,
ADD COLUMN home_cleaners_id INT,
ADD COLUMN home_care_id INT;

ALTER TABLE bread_bakery
ADD COLUMN canned_jarred_goods_id INT,
ADD COLUMN dry_baking_goods_id INT;

ALTER TABLE canned_jarred_goods
ADD COLUMN frozen_products_id INT;

ALTER TABLE dairy_products
ADD COLUMN frozen_products_id INT;

ALTER TABLE frozen_products
ADD COLUMN meat_id INT,
ADD COLUMN farm_produce_id INT;

ALTER TABLE home_cleaners
ADD COLUMN paper_goods_id INT;

ALTER TABLE home_care
ADD COLUMN paper_goods_id INT;

-- Add foreign key constraints
ALTER TABLE beverages
ADD CONSTRAINT fk_beverages_bread_bakery
FOREIGN KEY (bread_bakery_id) REFERENCES bread_bakery(id),
ADD CONSTRAINT fk_beverages_dairy_products
FOREIGN KEY (dairy_products_id) REFERENCES dairy_products(id),
ADD CONSTRAINT fk_beverages_home_cleaners
FOREIGN KEY (home_cleaners_id) REFERENCES home_cleaners(id),
ADD CONSTRAINT fk_beverages_home_care
FOREIGN KEY (home_care_id) REFERENCES home_care(id);

ALTER TABLE bread_bakery
ADD CONSTRAINT fk_bread_bakery_canned_jarred_goods
FOREIGN KEY (canned_jarred_goods_id) REFERENCES canned_jarred_goods(id),
ADD CONSTRAINT fk_bread_bakery_dry_baking_goods
FOREIGN KEY (dry_baking_goods_id) REFERENCES dry_baking_goods(id);

ALTER TABLE canned_jarred_goods
ADD CONSTRAINT fk_canned_jarred_goods_frozen_products
FOREIGN KEY (frozen_products_id) REFERENCES frozen_products(id);

ALTER TABLE dairy_products
ADD CONSTRAINT fk_dairy_products_frozen_products
FOREIGN KEY (frozen_products_id) REFERENCES frozen_products(id);

ALTER TABLE frozen_products
ADD CONSTRAINT fk_frozen_products_meat
FOREIGN KEY (meat_id) REFERENCES meat(id),
ADD CONSTRAINT fk_frozen_products_farm_produce
FOREIGN KEY (farm_produce_id) REFERENCES farm_produce(id);

ALTER TABLE home_cleaners
ADD CONSTRAINT fk_home_cleaners_paper_goods
FOREIGN KEY (paper_goods_id) REFERENCES paper_goods(id);

ALTER TABLE home_care
ADD CONSTRAINT fk_home_care_paper_goods
FOREIGN KEY (paper_goods_id) REFERENCES paper_goods(id);

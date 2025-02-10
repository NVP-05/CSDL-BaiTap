create database shop;
use shop;

create table categories (
    catalog_id int auto_increment primary key,
    catalog_name varchar(100) not null unique,
    catalog_priority int,
    catalog_description text,
    catalog_status bit default(1)
);

create table product (
    product_id char(5) primary key,
    catalog_id int not null,
    product_name varchar(100) not null unique,
    product_price float not null check(product_price > 0),
    product_title varchar(200) not null,
    product_description text not null,
    product_image text,
    product_status bit default(1),
    foreign key (catalog_id) references categories(catalog_id)
);

create table user_status (
    status_id int auto_increment primary key,
    status_name varchar(100),
    status_description text
);

create table web_user (
    user_id int auto_increment primary key,
    user_name varchar(100) not null unique,
    user_password varchar(100) not null,
    user_avatar text,
    user_email varchar(100) not null unique,
    user_phone varchar(15) not null unique,
    user_address text,
    user_status int not null,
    foreign key (user_status) references user_status(status_id)
);

create table `order` (
    order_id int auto_increment primary key,
    user_id int not null,
    user_email varchar(100) not null unique,
    user_phone varchar(15) not null unique,
    user_address text,
    user_created date,
    order_status int not null unique,
    foreign key (user_id) references web_user(user_id),
    foreign key (order_status) references user_status(status_id)
);

create table order_detail (
    product_id char(5) not null,
    order_id int not null,
    order_price float not null,
    primary key (product_id, order_id),
    foreign key (product_id) references product(product_id),
    foreign key (order_id) references `order`(order_id)
);
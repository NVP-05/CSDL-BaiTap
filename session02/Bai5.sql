use ks23b_database; 

create table customer (
	cus_id int primary key auto_increment,
    cus_name varchar(100),
    cus_number varchar(100) not null
); 

create table bill(
	bil_id int primary key auto_increment,
    bil_created date,
    cus_id int ,
    foreign key (cus_id) references customer(cus_id)
); 
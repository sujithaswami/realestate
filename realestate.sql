use practice;
create table practice.propertytype(
id int primary key auto_increment,
name varchar(30) null,
description varchar(200) null
);
alter table  practice.propertytype
rename column name to type;

create table practice.property(
id int primary key auto_increment,
name varchar(30) null,
dimensions varchar(30),
property_id int not null
);


create table practice.propertyaddress(
id int primary key auto_increment,
street varchar(20) not null,
landmark varchar(20),
state varchar(20) not null,
country varchar(20) not null,
pincode int 
);

create table practice.properyaddressmapping(
id int primary key auto_increment,
property_id int not null,
address_id int not null
);

alter table properyaddressmapping
add constraint fk_property_id foreign key (property_id) references practice.property(id);

alter table properyaddressmapping
add constraint fk_address_id foreign key (address_id) references practice.propertyaddress(id);

insert into practice.propertytype(type, description) values('apartment',  'serviced apartment is any size space for residential living which includes regular maid and cleaning services provided by the rental agent.');
insert into practice.propertytype(type, description) values('villa', 'A Luxury Villa is a unique type of home that offers an upscale lifestyle and luxurious amenities.'); 

select * from propertytype;

insert into practice.property(name, dimensions, property_id) values('msr', '103 near spcy', 1),('gayatri', '203 inches', 1),('sringnivasa', '400 inches', 2);
insert into practice.property(name, dimensions, property_id) values('mrss', '103 near spcy', 1);

select * from property;

insert into propertyaddress(street, landmark, state, country, pincode) values('6 phase', 'near spicy express', 'ts', 'india', 5200012), ('2 phase', 'cross road', 'ts', 'india', 520213), ('6 phase', 'desitination cafe', 'ts', 'india', 520000);

 select * from propertyaddress;
 
insert into properyaddressmapping(property_id, address_id ) values(1, 1 ), (1, 2), (4,9);
 
select * from properyaddressmapping;
 
select * from propertytype as pt
join property as p on pt.id= p.property_id;

select * from propertytype as pt
join properyaddressmapping as pam  on pt.id = pam.address_id;

select * from propertytype as pt
join properyaddressmapping as pam  on pt.id = pam.property_id;

select p.name, pam.property_id from property as p
join properyaddressmapping as pam  on p.id = pam.property_id;

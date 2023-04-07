
CREATE TABLE tblProduct (
	no                  int(5)                      auto_increment  ,
	name            varchar(20)           NULL      ,
	price             int                           NULL      ,
	detail            text                          NULL      ,
	date              varchar(20)           NULL      ,
	stock            int                            NULL      ,
	image           varchar(20)           NULL      ,
	PRIMARY KEY ( no )
);

CREATE TABLE tblOrder (
	no                    int                          auto_increment  ,
	productNo      int                            NULL  ,
	quantity          int                           NULL      ,
	date                varchar(20)           NULL      ,
	state               varchar(10)           NULL      ,
	id                     varchar(10)           NULL      ,
	PRIMARY KEY ( no )
);

CREATE TABLE tblAdmin (
	admin_id                 varchar(20)          NOT NULL  ,
	admin_pwd     varchar(20)          NOT NULL      ,
	PRIMARY KEY       ( admin_id )
);

CREATE TABLE tblMember (
  id char(20) NOT NULL,
  pwd char(20) NOT NULL,
  name char(20) NOT NULL,
  gender char(1) NOT NULL,
  birthday char(6) NOT NULL,
  email char(30) NOT NULL,
  zipcode char(5) NOT NULL,
  address char(50) NOT NULL,
  hobby char(5) NOT NULL,
  job char(20) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tblZipcode (
 zipcode             char(7)              NOT NULL  ,
 area1               char(10)             NULL      ,
 area2               char(20)             NULL      ,
 area3               char(40)             NULL      ,
 area4               char(20)             NULL      
);

insert tblProduct(name,price,detail,date,stock,image)
values ('갤럭시 플립3',1200000,'갤럭시 플립3 상세설명',
now(), 100, 'data1.jpg');

insert tblProduct(name,price,detail,date,stock,image)
values ('갤럭시 Z 폴드3',1500000,'갤럭시 Z 폴드3 상세설명',
now(), 100, 'data2.jpg');

insert tblProduct(name,price,detail,date,stock,image)
values ('iPhone 13',1300000,'iPhone 13 상세설명',
now(), 100, 'data3.jpg');
CREATE TABLE tblJoin(
	id char(20) PRIMARY KEY,	
	pwd char(20) not NULL,
	NAME char(20) not NULL,	
	email char(30),
	hp char(40),
	grade char(2) DEFAULT '0'	 
);

CREATE  TABLE  tblGuestBook(
	num int PRIMARY  KEY  AUTO_INCREMENT ,
	id CHAR (20) not NULL ,
	contents TEXT ,
	ip CHAR (15) NOT  NULL ,
	regdate DATE ,
	regtime DATETIME ,
	secret CHAR (2) DEFAULT  '0'
);

create table tblComment(
 	cnum int primary key auto_increment,
 	num int not NULL,
 	cid char(20) not null,
 	comment text,
 	cip char(15) not NULL,
 	cregDate date
);

SHOW TABLES;





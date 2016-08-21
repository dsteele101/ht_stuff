CREATE database ht;

USE ht;

CREATE TABLE bookings ( bookid char(10) not null, metro char(3) not null, checkin char(10) not null, nightsstayed char(10) not null, hotelid char(10) not null, primary key(bookid) );

load data infile '/home/admin/ht.csv' replace into table bookings fields terminated by ',' lines terminated by '\n';

DELETE FROM bookings
ORDER BY checkin DESC LIMIT 1;

ALTER TABLE bookings ADD iso_checkin VARCHAR(10) AFTER checkin;

UPDATE bookings
SET iso_checkin=IFNULL(iso_checkin,STR_TO_DATE(left(checkin,10),'%m/%d/%Y'));

ALTER TABLE bookings ADD iso_checkout VARCHAR(10) AFTER iso_checkin;

UPDATE bookings
SET iso_checkout=IFNULL(iso_checkout,DATE_ADD(STR_TO_DATE(left(checkin,10),'%m/%d/%Y'), INTERVAL nightsstayed DAY));

SELECT b.iso_checkin, b.iso_checkout, t.total
FROM bookings as b
JOIN (SELECT count(*) as total, iso_checkin
	FROM bookings WHERE '2015-02-21' between iso_checkin and iso_checkout and iso_checkout not like '2015-02-21') as t
ON b.iso_checkin = t.iso_checkin;

SELECT b.iso_checkin, b.iso_checkout, t.total
FROM bookings as b
JOIN (SELECT count(*) as total, iso_checkin
	FROM bookings WHERE iso_checkout > '2015-02-21' and iso_checkin < '2015-02-23') as t
ON b.iso_checkin = t.iso_checkin;

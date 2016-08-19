CREATE TABLE hotels ( hotelid char(10) not null, hotelname char(30) not null, primary key(hotelid) );

load data infile '/home/admin/hotels.csv' replace into table hotels fields terminated by ',' lines terminated by '\n';

DELETE FROM hotels
ORDER BY hotelid DESC LIMIT 1;

SELECT COUNT(bookings.hotelid) as total_num_bookings, hotels.hotelname
FROM bookings
LEFT JOIN hotels
ON bookings.hotelid=hotels.hotelid
WHERE bookings.iso_checkin between '2015-02-03' and '2015-12-24'
GROUP BY bookings.hotelid
ORDER BY total_num_bookings DESC;

SELECT MONTHNAME(bookings.iso_checkin) as month, DAYOFWEEK(bookings.iso_checkin) as dow, COUNT(bookings.iso_checkin) as num_checkin
FROM bookings
GROUP BY month
ORDER BY month(bookings.iso_checkin) ASC;

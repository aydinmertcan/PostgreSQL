--------------------------------------- Homework 1 --------------------------------------- 
-- film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
select f.title,f.description from film f;
-- film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.
select * from film f where f.length > 60 and f.length < 75;
-- film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.
select * from film f where f.rental_rate = 0.99 and (f.replacement_cost = 12.99 or f.replacement_cost = 28.99);
-- customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir?
select cu.last_name from customer cu where cu.first_name = 'Mary';
-- film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.
select * from film f where not f.length > 50 and not (f.rental_rate = 2.99 or f.rental_rate = 4.99)

--------------------------------------- Homework 2 --------------------------------------- 
-- 1)film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit ve 16.99 küçük olma koşuluyla sıralayınız 
--( BETWEEN - AND yapısını kullanınız.)
select * from film f where f.replacement_cost between 12.99 and 16.98;
-- 2).actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya 'Nick' veya 'Ed' değerleri olması koşuluyla sıralayınız.
-- ( IN operatörünü kullanınız.)
select ac.first_name, ac.last_name from actor ac where ac.first_name in ('Penelope','Nick','Ed');

-- 3)film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99, 2.99, 4.99 VE replacement_cost 12.99, 15.99, 28.99 olma koşullarıyla sıralayınız. 
-- ( IN operatörünü kullanınız.)
select * from film f where f.rental_rate in(0.99, 2.99, 4.99) and f.replacement_cost in (12.99, 15.99, 28.99);

--------------------------------------- Homework 3 --------------------------------------- 
-- 1)country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.
select * from country co where co.country like 'A%a';
-- 2)country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları sıralayınız.
select * from country co where co.country  like '_____%n';
-- 3)film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sıralayınız.
select f.title from film f where f.title ilike '%t%t%t%t%';
-- 4)film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sıralayınız.
select * from film f where f.title like 'C%' and f.length > 90 and f.rental_rate > 2.99;

--------------------------------------- Homework 4 --------------------------------------- 
-- 1) film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
select distinct f.replacement_cost from film f order by f.replacement_cost asc;
-- 2) film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
select count(distinct f.replacement_cost) from film f;
-- 3) film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye eşittir?
select count(f.title) from film f where f.title like 'T%' and f.rating = 'G';
-- 4) country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
select count (co.country) from country co where co.country like '_____';
-- 5) city tablosundaki şehir isimlerinin kaç tanesi 'R' veya r karakteri ile biter?
select count(ci.city) from city ci where ci.city ilike 'R%';

--------------------------------------- Homework 5 --------------------------------------- 
-- 1) film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.
select * from film f where f.title like '%n' order by f.length desc limit 5;
-- 2)film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci(6,7,8,9,10) 5 filmi(6,7,8,9,10) sıralayınız.
select * from film f where f.title like '%n' order by f.length desc offset 5 limit 5;
-- 3)customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi sıralayınız.
select * from customer c where c.store_id = 1 order by c.last_name desc limit 4;

--------------------------------------- Homework 6 --------------------------------------- 
-- 1) film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?
select round(avg(f.rental_rate),3) from film f;
-- 2) film tablosunda bulunan filmlerden kaç tanesi 'C' karakteri ile başlar?
select count(*) from film f where f.title like 'C%';
-- 3) film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
select f.length from film f where f.rental_rate = 0.99 order by f.length desc limit 1;
-- 4) film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?
select count (distinct f.replacement_cost) from film f where f.length > 150;

--------------------------------------- Homework 7 --------------------------------------- 
-- 1) film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
select f.rating, f.title from film f group by f.rating, f.title;
-- 2) film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı 50 den fazla olan replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.
select f.replacement_cost as "Replacement Cost", count(f.title) as "Film sayısı" from film f group by f.replacement_cost having count(f.title) > 50;
-- 3) customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir?
select cu.store_id, count(customer_id) as "Müşteri Sayısı" from customer cu group by cu.store_id;
-- 4) city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra en fazla şehir sayısı barındıran country_id bilgisini ve şehir sayısını paylaşınız.
select ci.country_id as "Ülke nosu", count(ci.city) as "Şehir sayısı" from city ci group by ci.country_id order by count(ci.city) desc limit 1;

--------------------------------------- Homework 8 --------------------------------------- 
-- 1) test veritabanınızda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo oluşturalım.
create table employee(
	id serial primary key,
	name varchar(50),
	birthday date,
	email varchar(100)
);
-- 2) Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
insert into employee (id, name, birthday, email) values (1, 'Brittaney', '1992-06-06', 'bfligg0@redcross.org');
insert into employee (id, name, birthday, email) values (2, 'Garwood', '1988-08-23', 'gridde1@t-online.de');
insert into employee (id, name, birthday, email) values (3, 'Evey', '1984-02-22', 'ekarpman2@walmart.com');
insert into employee (id, name, birthday, email) values (4, 'Mitchael', '1986-11-26', 'msodor3@admin.ch');
insert into employee (id, name, birthday, email) values (5, 'Davin', '1991-07-29', 'dwearne4@weibo.com');
insert into employee (id, name, birthday, email) values (6, 'Timotheus', '1994-04-30', 'tsweedland5@purevolume.com');
insert into employee (id, name, birthday, email) values (7, 'Franz', '1996-04-30', 'fbarks6@yellowpages.com');
insert into employee (id, name, birthday, email) values (8, 'Renaldo', '1978-04-04', 'rcomini7@who.int');
insert into employee (id, name, birthday, email) values (9, 'Derrick', '1998-12-27', 'djost8@cornell.edu');
insert into employee (id, name, birthday, email) values (10, 'Celestyna', '1985-10-05', 'cmallia9@abc.net.au');
insert into employee (id, name, birthday, email) values (11, 'Loni', '1982-10-22', 'ldelacotea@usgs.gov');
insert into employee (id, name, birthday, email) values (12, 'Lemuel', '1972-05-16', 'lritchmanb@taobao.com');
insert into employee (id, name, birthday, email) values (13, 'Jeremias', '1980-09-16', 'jdrewellc@alexa.com');
insert into employee (id, name, birthday, email) values (14, 'Rafael', '1981-03-01', 'rgilcristd@cbc.ca');
insert into employee (id, name, birthday, email) values (15, 'Sanderson', '1970-12-22', 'sbreffitte@umich.edu');
insert into employee (id, name, birthday, email) values (16, 'Sandie', '1975-11-06', 'sbarthelmef@smugmug.com');
insert into employee (id, name, birthday, email) values (17, 'Nettle', '1991-05-19', 'naudrittg@house.gov');
insert into employee (id, name, birthday, email) values (18, 'Freeman', '1988-09-06', 'fmurrh@ow.ly');
insert into employee (id, name, birthday, email) values (19, 'Halie', '1971-10-17', 'hdameiselei@cnn.com');
insert into employee (id, name, birthday, email) values (20, 'Becka', '1994-11-26', 'bbeaumanj@360.cn');
insert into employee (id, name, birthday, email) values (21, 'Fee', '1984-11-07', 'fbushek@google.ca');
insert into employee (id, name, birthday, email) values (22, 'Benjy', '1984-03-02', 'bdundonl@boston.com');
insert into employee (id, name, birthday, email) values (23, 'Ethelyn', '1997-10-26', 'echelsomm@aol.com');
insert into employee (id, name, birthday, email) values (24, 'Ludvig', '2000-05-22', 'lfishn@tripadvisor.com');
insert into employee (id, name, birthday, email) values (25, 'Eudora', '1973-05-07', 'ewadhamo@zdnet.com');
insert into employee (id, name, birthday, email) values (26, 'Abby', '1986-10-28', 'adenerleyp@scientificamerican.com');
insert into employee (id, name, birthday, email) values (27, 'Linette', '1992-03-30', 'lmcfaydenq@altervista.org');
insert into employee (id, name, birthday, email) values (28, 'Barrett', '1977-10-10', 'bbellerbyr@vinaora.com');
insert into employee (id, name, birthday, email) values (29, 'Talia', '1976-01-25', 'tmenchentons@webmd.com');
insert into employee (id, name, birthday, email) values (30, 'Tuck', '1986-06-09', 'tkenefordet@furl.net');
insert into employee (id, name, birthday, email) values (31, 'Federica', '1975-07-11', 'fmappu@nymag.com');
insert into employee (id, name, birthday, email) values (32, 'Lia', '1973-07-04', 'lraggattv@discuz.net');
insert into employee (id, name, birthday, email) values (33, 'Karleen', '1987-03-11', 'kfenichw@bloglovin.com');
insert into employee (id, name, birthday, email) values (34, 'Ado', '1971-04-29', 'ascanterburyx@netlog.com');
insert into employee (id, name, birthday, email) values (35, 'Royal', '1992-05-20', 'rzouchy@pen.io');
insert into employee (id, name, birthday, email) values (36, 'Gnni', '1971-06-12', 'gblacklawez@shop-pro.jp');
insert into employee (id, name, birthday, email) values (37, 'Jesus', '2000-10-05', 'jganter10@yelp.com');
insert into employee (id, name, birthday, email) values (38, 'Sansone', '1987-12-22', 'scristofari11@technorati.com');
insert into employee (id, name, birthday, email) values (39, 'Freddie', '1995-11-04', 'fpatzelt12@go.com');
insert into employee (id, name, birthday, email) values (40, 'Owen', '1980-11-20', 'ocreffield13@opensource.org');
insert into employee (id, name, birthday, email) values (41, 'Mireielle', '1981-04-03', 'mblinder14@rambler.ru');
insert into employee (id, name, birthday, email) values (42, 'Reeba', '1983-10-09', 'rmaudlin15@shop-pro.jp');
insert into employee (id, name, birthday, email) values (43, 'Wolfie', '1990-05-01', 'wmatz16@mashable.com');
insert into employee (id, name, birthday, email) values (44, 'Georges', '1978-07-25', 'gtwitchett17@merriam-webster.com');
insert into employee (id, name, birthday, email) values (45, 'Calvin', '1971-12-14', 'cdubbin18@theatlantic.com');
insert into employee (id, name, birthday, email) values (46, 'Earl', '1989-09-02', 'eleeburne19@cornell.edu');
insert into employee (id, name, birthday, email) values (47, 'Angelo', '1976-06-01', 'acordelet1a@simplemachines.org');
insert into employee (id, name, birthday, email) values (48, 'Robyn', '1977-08-03', 'rwoodrup1b@posterous.com');
insert into employee (id, name, birthday, email) values (49, 'Sebastian', '1974-07-18', 'sfuxman1c@a8.net');
insert into employee (id, name, birthday, email) values (50, 'Gav', '1988-03-10', 'grathmell1d@loc.gov');
-- 3) Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.
update employee set name = 'Hasan' where id = 1;
update employee set birthday = '1980-01-01' where id = 2;
update employee set email = 'example@example.com' where id = 3;
update employee set name = 'Veli' where name = 'Davin';
update employee set birthday = '1956-01-01' where email = 'acordelet1a@simplemachines.org'
-- 4) Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.
delete from employee where id = 3;
delete from employee where email = 'example@example.com';
delete from employee where name = 'Evey';
delete from employee where birthday = '1984-02-22';
delete from employee where name like 'Ev%';

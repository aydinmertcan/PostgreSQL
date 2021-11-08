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

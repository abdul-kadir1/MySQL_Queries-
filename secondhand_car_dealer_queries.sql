create schema cars;
use cars;

-- Q1: Read car data;
select * from car_dekho;


-- 2 : To get Total count of records of cars
SELECT count(*) FROM car_dekho;


-- 3: How many car available in 2023
select count(*) from car_dekho 
where year = 2023;


-- 4 :How many car available in  2020,21 and 22
 # we can extract data one by one year same as 3rd question
 # another way
 
 
 -- We will use GOROUP BY
SELECT count(*) FROM car_dekho where year in(2020,2021,2022) group by year;


-- 5 : Total count of all cars by year.
select year , count(*) from car_dekho group by year;


-- 6 : How many diesel cars will there be in 2020;
# same as we can extract fuel type cars for another years;
select count(*) from car_dekho where year = 2020 and fuel = "Diesel";


-- 7 : print all the fuel cars (petrol,diesel and CNG) come by all year ;
select year ,count(*)  as petrol_cars from car_dekho where  fuel = "Petrol"  
group by year;
select year ,count(*)  as Diesel_cars from car_dekho where  fuel = "Diesel"  
group by year;
select year ,count(*)  as CNG_cars from car_dekho where  fuel = "CNG"  
group by year;


-- 8 : Which year ha more than 100 cars;
select year , count(*) as total_cars_Per_year from car_dekho group by year having count(*)>100;
# WE can also use less than query.


-- 9 : Get all cars count details b/w 2015 to 2023 ;
select count(*) from car_dekho where year between 2015 and 2023; 


 -- 10 : get all cars details between 2015 to 2023;
 select * from car_dekho where year between 2015 and 2023;


























































































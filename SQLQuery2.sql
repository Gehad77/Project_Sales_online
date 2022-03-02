select * from Social_Network

select Gender , Age from Social_Network

select  UserID , Age from Social_Network

select top 5 * from Social_Network

select distinct(gender)
from Social_Network

select distinct(purchased)
from Social_Network

--How many people purchased
select count (purchased)  as count_pur from Social_Network
where purchased=1
 --Max Salary
select max (EstimatedSalary)
from Social_Network

-- How many female Purchased

select * from Social_Network
where EstimatedSalary > 10000
and Gender='female'
and Purchased=1
and age > 40

--How many Female there age 50 or 40 not Purchased
select count(Gender) as Count_Female from Social_Network
where age in (50 , 40)
and Gender='female'

-- How many Female there age 50 or 40 is Purchased
select count(Gender) as Count_Female from Social_Network
where age in (50 , 40)
and Gender='female'
and Purchased = 1

--How many people in every age 

select gender , age ,count(gender) as CountOfAge
from Social_Network
group by gender , age 

-- How many people  Purchased by age 

select gender , age , count(gender) as CountOFAge
from Social_Network
where Purchased = 1
group by gender , age

-- How many people Purchased by age ang Female
select gender , age , count(gender) as CountOFAge
from Social_Network
where Purchased = 1
and gender='female'
group by gender , age

-- How many people Purchased by age ang Male
select gender , age , count(gender) as CountOFAge
from Social_Network
where Purchased = 1
and gender='Male'
group by gender , age
order by CountOFAge

-- How many Male&Female Purchased
 select gender , count (gender) as CountOfMale
 from Social_Network
 where Purchased = 1
-- and gender='Female'
 group by gender
 order by CountOfMale

 -- How many Male&Female not  Purchased

  select gender , count (gender) as CountOfMale
 from Social_Network
 where Purchased = 0
 group by gender

 -- Send A Gift to people how Purchased
select UserID, Purchased,

CASE

	when Purchased=1 then 'Send a gift' 
	else 'Send a massage to help him buy more'
end as Gift
from Social_Network 
order by Purchased

--If the female buy more then 10000 so will gift here a 10$
select gender , EstimatedSalary , purchased,
case 
	when EstimatedSalary > 10000 
	then EstimatedSalary + (EstimatedSalary+10)
end as Salary_10
from Social_Network
where Gender ='female'
and purchased = 1

-- How  many people i send to them gift
with CTE_Rmployee as 
(select UserID,Purchased,count (Purchased)as d ,
CASE
	when Purchased=1 then '10$' 
	else 'Buy more to get 10$'
end as Gift
from Social_Network
where Purchased = 1
group by UserID,Purchased
)
select count(Gift) as HOWGit$ from CTE_Rmployee





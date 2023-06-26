create database insurance;
use  insurance;
select * from insurance_db;

# 1. Count for each categories of ‘region 
select region,count(*) as no_of_regions from insurance_db group by region;

# 2. Find 50 records of highest ‘age’ and export data/table to desktop
 select * from insurance_db order by age desc limit 50;

# 3. Add index name ‘quick’ on ‘id’ 
create index quick_id on insurance_db(id);

# 4. Describe the schema of table 
describe insurance_db;

# 5.Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view] 
select * from insurance_db;
create view gender as(select id,age,bmi,children,smoker,region,charges from insurance_db);
select * from gender;

# 6. Rename the view as ‘type’ 
  rename table gender to type;
  
# 7. Count how many are ‘northwest’ insurance holders 
select region,count(*) as no_of_insurance_holders_in_northwest from insurance_db where region='northwest';

# 8. Count how many insurance holders were ‘female’
select gender,count(gender) from insurance_db where gender='female';
 
# 9. Create Primary key on a suitable column 
select distinct count(id) from insurance_db;
select id from insurance_db where id is null;

# 10.Create a new column ‘ratio’ which is age multiply by bmi 
alter table insurance_db add column ratio float;
select * from insurance_db;
update insurance_db set ratio=(age*bmi);

# 11.Arrange the table from high to low according to charges 
select * from insurance_db order by charges desc;

# 12. Find MAX of ‘charges’ 
select max(charges) as max_of_charges from insurance_db;

# 13. Find MIN of ‘charges’ 
select min(charges) as min_of_charges from insurance_db;

# 14. Find average of ‘charges’ of male and female 
select gender, avg(charges) from insurance_db group by gender;

# 15. Write a Query to rename column name sex to Gender
alter table insurance_db change gender sex varchar(19);
 
# 16. Add new column as HL_Charges where more than average charges should be,
# categorized as HIGH and less than average charges should be categorized as LOW 
select * from insurance_db;
select round(avg(charges),0) from insurance_db;
alter table insurance_db add column HL_charges varchar(20);
update insurance_db set HL_charges= case when charges>13270 then 'High' else 'Low' end;

# 17. Change location/position of ‘smoker’ and bring before ‘children’ 
alter table insurance_db modify smoker varchar(20) after bmi;

# 18. Show top 20 records 
select * from insurance_db limit 20;

# 19. Show bottom 20 records 
select * from insurance_db order by id desc limit 20;

# 20. Randomly select 20% of records and export to desktop
select round(0.2*count(*),0) from insurance_db;
select * from insurance_db order by rand() limit 268;

# 21. Remove column ‘ratio’ 
select * from insurance_db;
alter table insurance_db drop ratio;

# 23. Create a view called Female_HL_Charges that shows only,
# those data where HL_Charges is High, Female, Smokers and with 0 children 
create view Female_hl_charges as(select* from insurance_db where sex='female' and children='0' and charges='high' and smoker='yes');

# 24. Update children column if there is 0 children then make it as Zero Children, 
# if 1 then one_children, if 2 then two_children, if 3 then three_children, if 4 then four_children,
# if 5 then five_children else print it as More_than_five_children.

alter table insurance_db modify column children varchar(20);
update insurance_db set children=case when children=0 then 'zero children' when children=1 then 'one children' when children=2 
then 'two children' when children=3 then 'three children' when children=4 then 'four children' when children=5 
then 'five children' else 'more than five children' end;





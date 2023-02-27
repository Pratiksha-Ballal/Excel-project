use new_hr;

select count(distinct(EMPLOYEE_ID)) as Count_of_Employees from employees_data
join department_data on department_data.DEPARTMENT_ID=employees_data.DEPARTMENT_ID
where DEPARTMENT_NAME=(select DEPARTMENT_NAME from department_data where DEPARTMENT_NAME="Sales");


select COUNTRY_ID, count(distinct(EMPLOYEE_ID)), avg(SALARY) from locations_data_u
join department_data on department_data.LOCATION_ID=locations_data_u.LOCATION_ID
join employees_data on department_data.DEPARTMENT_ID=employees_data.DEPARTMENT_ID
group by COUNTRY_ID;

select COUNTRY_ID, count(distinct(EMPLOYEE_ID)) from locations_data_u
join department_data on department_data.LOCATION_ID=locations_data_u.LOCATION_ID
join employees_data on department_data.DEPARTMENT_ID=employees_data.DEPARTMENT_ID
group by COUNTRY_ID order by count(distinct(EMPLOYEE_ID)) desc limit 1; 

select COUNTRY_ID, avg(SALARY) from locations_data_u
join department_data on department_data.LOCATION_ID=locations_data_u.LOCATION_ID
join employees_data on department_data.DEPARTMENT_ID=employees_data.DEPARTMENT_ID
group by COUNTRY_ID order by avg(SALARY) desc limit 1; 

select MANAGER_ID,FIRST_NAME,LAST_NAME,SALARY from employees_data where MANAGER_ID <> 0
group by MANAGER_ID
order by SALARY desc limit 5;

select count(EMPLOYEE_ID) from employees_data;
select DEPARTMENT_NAME, (count(distinct(EMPLOYEE_ID))/107)*100 as PERCENTAGE_OF_EMP  from department_data
join employees_data on employees_data.DEPARTMENT_ID=department_data.DEPARTMENT_ID
group by DEPARTMENT_NAME
order by PERCENTAGE_OF_EMP desc;

select DEPARTMENT_NAME, (count(distinct(EMPLOYEE_ID))/107)*100 as PERCENTAGE_OF_EMP  from department_data
join employees_data on employees_data.DEPARTMENT_ID=department_data.DEPARTMENT_ID
group by DEPARTMENT_NAME
order by PERCENTAGE_OF_EMP desc limit 1;

/* BANK_LOAN_PROJECT BY GROUP 1

> FUAAD SANEEN , JEEVANA , KARTHIKEYA , SAIPRIYA 

*/



create database bank_loan_analysis;
use bank_loan_analysis;
select * from finance_1 ;
select * from finance_2;
select count(*) from finance_1;
select count(*) from finance_2;


/* 

> Year wise loan amount Stats

> Grade and sub grade wise revol_bal

> Total Payment for Verified Status Vs Total Payment for Non Verified Status

> State wise and month wise loan status

> Home ownership Vs last payment date stats

*/


#KPI 1 Year Wise Loan Amt 
select year(issue_d) as issue_years ,sum(loan_amnt) as total_amount
from finance_1
group by 
issue_years
order by 
total_amount desc;

# KPI 2 Grade and sub grade wise revol_bal
select grade, sub_grade, sum(revol_bal) as total_revol_bal
from finance_1
 inner join finance_2 
on (finance_1.id)=(finance_2.id)
group by 
grade,sub_grade
order by 
grade, sub_grade;

#KPI 3 Total Payment for verified status vs total payment for non verified status

select verification_status, round(sum(total_pymnt),2) as total_payment
from finance_1 
inner join finance_2 
on (finance_1.id)=(finance_2.id)
group by
 verification_status;

#KPI 4 State wise and month wise loan status 
select addr_state, last_Credit_pull_D as month_wise ,loan_status
from 
finance_1 
inner join finance_2 
on (finance_1.id)=(finance_2.id)
group by 
addr_state, month_wise ,loan_status
order by 
month_wise ;

#KPI 5 Home ownership vs last payment date stats
select home_ownership, last_pymnt_d
from finance_1 
inner join finance_2 
on (finance_1.id)=(finance_2.id)
group by 
home_ownership , last_pymnt_d
order by 
home_ownership , last_pymnt_d;
 
 


create table Hospitals_data(
Hospital_Name varchar(100) not null,
Place varchar(50),
Department varchar(50),
Doctors_Count int,
Patients_Count int,
Admission_Date date,
Discharge_Date date,
Medical_Expenses numeric
);

select * from Hospitals_data;

copy 
Hospitals_data (Hospital_Name, Place, Department, Doctors_Count, Patients_Count, Admission_Date, Discharge_Date, Medical_Expenses)
from 'C:/Users/Mohit Ojha/Downloads/Hospital_Data.csv'
delimiter ','
csv header;

/**Total Number of Patients**/

select sum(patients_count) as Total_numbers_of_hospitals from Hospitals_data;

/**Average Number of Doctors per Hospital**/

select round(avg(Doctors_Count),0) as Average_Doctors_per_Hospital from Hospitals_data;

/**Top 3 Departments with the Highest Number of Patients**/

select Department,Patients_Count as Number_of_Patients from Hospitals_data
order by Patients_Count desc limit 3;

/**Hospital with the Maximum Medical Expenses**/

select Hospital_Name, Medical_Expenses from Hospitals_data
order by Medical_Expenses desc limit 1;

/**Daily Average Medical Expenses**/

select round(avg(Medical_Expenses),2) as Avg_Medical_Expenses from Hospitals_data;

/**Longest Hospital Stay**/

select Hospital_Name,Discharge_Date - Admission_Date as patient_stay from Hospitals_data
order by patient_stay desc limit 1 ;

/**Total Patients Treated Per City **/

 select Place,sum(Patients_Count)
from Hospitals_data
group by place;

 /**Average Length of Stay Per Department**/

select Department,round(Avg(Discharge_Date - Admission_Date),0) as patient_stay from Hospitals_data
 group by Department;

/**Identify the Department with the Lowest Number of Patients **/

select Department, Patients_Count
as no_of_patient from Hospitals_data
order by Patients_Count
limit 1;

/**Avg Medical Expenses Report**/

select Round(avg(Medical_Expenses),0) as avg_expenses
from Hospitals_data;




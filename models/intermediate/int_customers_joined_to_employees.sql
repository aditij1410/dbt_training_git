-- This model joins customer table with employee table and gets all the information
-- about the representative employee for each customer.

select
    customers.customer_id,
    customers.customer_first_name,
    customers.customer_last_name,
    customers.customer_work_company,
    customers.customer_mailing_address,
    customers.customer_mailing_city,
    customers.customer_mailing_state,
    customers.customer_mailing_country,
    customers.customer_phone_number,
    customers.customer_fax_number,
    customers.customer_email_address,
    employees.employee_id,
    employees.employee_first_name,
    employees.employee_last_name,
    concat(employees.employee_first_name, ' ', employees.employee_last_name) as employee_name,
    employees.employee_title,
    employees.employee_birth_date,
    employees.employee_hired_date,
    employees.employee_address,
    employees.employee_city,
    employees.employee_state,
    employees.employee_country,
    employees.employee_zipcode,
    employees.employee_phone_number,
    employees.employee_fax_number,
    employees.employee_email_address,
    employees.supervisor_employee_id
from {{ ref('stg_music__customers') }} as customers
inner join {{ ref('stg_music__employees') }} as employees 
    on customers.representative_employee_id = employees.employee_id
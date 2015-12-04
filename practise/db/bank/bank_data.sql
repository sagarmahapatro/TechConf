-- begin data population

-- product_type begin data population

-- product_type end data population

-- department begin data population

insert into department(name) values('Operations');
insert into department(name) values('Loans');
insert into department(name) values('Administration');

-- department end data population

-- branch begin data population
select * from branch;
insert into branch(name,address,city,state,zipcode) values('Headquarters', '3882 Main St.', 'Waltham', 'MA', '02451');
insert into branch(name,address,city,state,zipcode) values('Woburn Branch', '422 Maple St.', 'Woburn', 'MA', '01801');
insert into branch(name,address,city,state,zipcode) values('Quincy Branch', '125 Presidential Way', 'Quincy', 'MA', '02169');
insert into branch(name,address,city,state,zipcode) values('So. NH Branch', '378 Maynard Ln.', 'Salem', 'NH', '03079');
-- branch end data population

-- employee begin data population
insert into employee(
	department_id,
    branch_id,
    superior_id,
    first_name,
    last_name,
    start_date,
    end_date,title)
 values(  select department_id from department where  );   
-- employee end data population

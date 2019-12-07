-- write your queries to insert data here

INSERT INTO client (first_name, last_name, dob) values ('Sara', 'Smith','1970-01-02'),
('Miguel', 'Cabrera','1988-02-02'),('Bo', 'Chang','1985-03-02');

INSERT INTO employee (first_name, last_name, dob, date_joined) values ('Ananya', 'Jaiswal','1975-01-02', '2009-01-01'),
('Michael', 'Fern', '1980-10-18', '2013-06-05'),('Abdul', 'Rehman','1984-03-21', '2013-11-10');

INSERT INTO project (cid, name, notes) values ((SELECT id FROM client WHERE client.first_name = 'Sara' AND client.last_name = 'Smith'),
'Diamond', 'Should be done by Jan 2019'),((SELECT id FROM client WHERE client.first_name = 'Bo' AND client.last_name = 'Chang'),
"Chan'g", 'Ongoing maintenance'),((SELECT id FROM client WHERE client.first_name = 'Miguel' AND client.last_name = 'Cabrera'),
'The Robinson Project', NULL);

INSERT INTO works_on (eid, pid, start_date) values ((SELECT id FROM employee WHERE employee.first_name = 'Ananya' AND employee.last_name = 'Jaiswal'),
(SELECT id FROM project WHERE name = "Chan'g"), '2012-01-01'),((SELECT id FROM employee WHERE employee.first_name = 'Michael' AND employee.last_name = 'Fern'),
(SELECT id FROM project WHERE name = "The Robinson Project"), '2013-08-08'), ((SELECT id FROM employee WHERE employee.first_name = 'Abdul' AND employee.last_name = 'Rehman'),
(SELECT id FROM project WHERE name = "Diamond"), '2014-09-11');
-- Leave the queries below untouched. These are to test your submission correctly.
select * from project;
select * from client;
select * from employee;
select * from works_on;

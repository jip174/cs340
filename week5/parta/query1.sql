-- Write the query to create the 4 tables below.
CREATE TABLE client(
    id int(11) NOT NULL AUTO_INCREMENT,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    dob DATE NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT full_name UNIQUE (first_name, last_name)
) ENGINE=InnoDB;

CREATE TABLE employee(
    id int(11) NOT NULL AUTO_INCREMENT,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    dob DATE NOT NULL,
    date_joined DATE NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT full_name UNIQUE (first_name, last_name)
)ENGINE=InnoDB;

CREATE TABLE project(
    id int(11) NOT NULL AUTO_INCREMENT,
    cid int,
    name varchar(255) NOT NULL,
    notes text ,
    PRIMARY KEY (id),
    UNIQUE(name),
    FOREIGN KEY(cid) REFERENCES client (id)

)ENGINE=InnoDB;

CREATE TABLE works_on(
    eid int(11) NOT NULL,
    pid int(11) NOT NULL,
    start_date DATE NOT NULL,
    PRIMARY KEY (eid, pid),
    FOREIGN KEY (eid) REFERENCES employee(id),
    FOREIGN KEY (pid) REFERENCES project(id)

)ENGINE=InnoDB;

INSERT INTO client (first_name, last_name, dob) values ('Sara', 'Smith', 01/02/1970),
('Miguel', 'Cabrera', 02/02/1988),('Bo', 'Chang', 03/02/1985);

INSERT INTO employee (first_name, last_name, dob, date_joined) values ('Ananya', 'Jaiswal', 1/2/1975, 1/1/2009),
('Michael', 'Fern', 10/18/1980, 06/05/2013),('Abdul', 'Rehman', 03/21/1984, 11/10/2014);

INSERT INTO project (cid, name, notes) values ((SELECT id FROM client WHERE client.first_name = 'Sara' AND client.last_name = 'Smith'),
'Diamond', 'Should be done by Jan 19'),((SELECT id FROM client WHERE client.first_name = 'Bo' AND client.last_name = 'Chang'),
"Chan'g", 'Ongoing maintenance'),((SELECT id FROM client WHERE client.first_name = 'Miguel' AND client.last_name = 'Cabrera'),
'The Robinson Project', NULL);

INSERT INTO works_on (eid, pid, start_date) values ((SELECT id FROM employee WHERE employee.first_name = 'Ananya' AND employee.last_name = 'Jaiswal'),
(SELECT id FROM project WHERE name = "Chan'g"), 01/01/2012),((SELECT id FROM employee WHERE employee.first_name = 'Michael' AND employee.last_name = 'Fern'),
(SELECT id FROM project WHERE name = "The Robinson Project"), 08/08/2013), ((SELECT id FROM employee WHERE employee.first_name = 'Abdul' AND employee.last_name = 'Rehman'),
(SELECT id FROM project WHERE name = "Diamond"), 09/11/2014);

-- Leave the queries below untouched. These are to test your submission correctly.
-- Test that the tables were created
DESCRIBE client;
DESCRIBE employee;
DESCRIBE project;
DESCRIBE works_on;

-- Test that the correct foreign keys were created 
SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME,REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE REFERENCED_TABLE_SCHEMA = 'grade';


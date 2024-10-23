 create database bank_174;
use bank_174;

create table branch(
branch_name varchar(30),
branch_city varchar(25),
assets int,
primary key (branch_name));

create table bankaccount(
accno int,
branch_name varchar(30),
balance int,
primary key(accno),
foreign key(branch_name) references branch(branch_name));

create table bankcustomer(
customername varchar(20),
customer_street varchar(30),
customer_city varchar(35),
primary key(customername));

create table depositer(
customername varchar(20),
accno int,
PRIMARY KEY(customername,accno),
foreign key(accno) references bankaccount(accno),
foreign key(customername) references bankcustomer(customername));
create table loan(
loan_number int,
branch_name varchar(30),
amount int,
primary key(loan_number),
foreign key(branch_name) references branch(branch_name));

insert into branch values("SBI_Chamrajpet","Bangalore",50000);
insert into branch values("SBI_ResidencyRoad","Bangalore",10000);
insert into branch values("SBI_ShivajiRoad","Bombay",20000);
insert into branch values("SBI_Parliamentroad","Delhi",10000);
insert into branch values("SBI_Jantarmantar","Delhi",20000);

insert into bankaccount values(1,"SBI_Chamrajpet",2000);
insert into bankaccount values(2,"SBI_ResidencyRoad",5000);
insert into bankaccount values(3,"SBI_ShivajiRoad",6000);
insert into bankaccount values(4,"SBI_Parliamentroad",9000);
insert into bankaccount values(5,"SBI_Jantarmantar",8000);
insert into bankaccount values(6,"SBI_ShivajiRoad",4000);
insert into bankaccount values(8,"SBI_ResidencyRoad",4000);
insert into bankaccount values(9,"SBI_Parliamentroad",3000);
insert into bankaccount values(10,"SBI_ResidencyRoad",5000);
insert into bankaccount values(11,"SBI_Jantarmantar",2000);

insert into bankcustomer values("Avinash","BUll_temple_Road","Bangalore");
insert into bankcustomer values("Dinesh","Bannergatta_Road","Bangalore");
insert into bankcustomer values("Mohan","NationaCollege_Road","Bangalore");
insert into bankcustomer values("Nikil","Akbar_Road","Delhi");
insert into bankcustomer values("Ravi","Prithviraj_Road","Delhi");

insert into depositer values("Avinash",1);
insert into depositer values("Dinesh",2);
insert into depositer values("Nikil",4);
insert into depositer values("Ravi",5);
insert into depositer values("Avinash",8);
insert into depositer values("Nikil",9);
insert into depositer values("Dinesh",10);
insert into depositer values("Nikil",11);

insert into loan values(1,"SBI_Chamrajpet",1000);
insert into loan values(2,"SBI_ResidencyRoad",2000);
insert into loan values(3,"SBI_ShivajiRoad",3000);
insert into loan values(4,"SBI_Parliamentroad",4000);
insert into loan values(5,"SBI_Jantarmantar",5000);

select * from branch;

select * from bankaccount;

select * from bankcustomer;

select * from depositer;

select * from loan;

select branch_name,(assets/100000) as assets_in_lakhs from branch;

select d.customername from depositer d,bankaccount b
where b.branch_name="SBI_ResidencyRoad" and
d.accno=b.accno
group by d.customername having count(d.accno)>=2;

select d.customername from depositer d,bankaccount b
where d.accno=b.accno
group by d.customername having count(d.accno)>=2;

create table Borrower(
Customername varchar(30),
loan_number int,
foreign key (Customername) references Bankcustomer(Customername),
foreign key(Loan_number) references Loan(Loan_number));

insert into Borrower values("Avinash",1);
insert into Borrower values("Dinesh",2);
insert into Borrower values("Mohan",3);
insert into Borrower values("Nikil",4);
insert into Borrower values("Ravi",5);

select * from borrower;

select d.Customername from branch b, Depositer d, BankAccount ba
where b.branch_city='Delhi'
and d.Accno=ba.Accno and b.branch_name=ba.branch_name
Group by d.Customername having count(Distinct b.Branch_name)=(select count(distinct b.branch_name)
from branch b where b.branch_city='Delhi');

Select distinct b.Customername from borrower b, Depositer d
where b.customername NOT IN(
select d.Customername from loan L, Depositer d, Borrower b
where L.loan_number=b.loan_number and d.customername=b.customername);

select distinct d.Customername from Depositer d
where d.Customername IN(
select d.Customername from branch br,Depositer d, BankAccount ba
where br.Branch_city='Bangalore' and br.Branch_name=ba.Branch_name and ba.accno=d.accno and Customername IN(
select Customername from Borrower));

delete ba.* from BankAccount ba, branch b where branch_city='Bombay' and ba.Branch_name=b.Branch_name;
select * from BankAccount;

create table Borrower(
Customername varchar(30),
loan_number int,
foreign key (Customername) references Bankcustomer(Customername),
foreign key(Loan_number) references Loan(Loan_number));

insert into Borrower values("Avinash",1);
insert into Borrower values("Dinesh",2);
insert into Borrower values("Mohan",3);
insert into Borrower values("Nikil",4);
insert into Borrower values("Ravi",5);

select * from borrower;

select d.Customername from branch b, Depositer d, BankAccount ba
where b.branch_city='Delhi'
and d.Accno=ba.Accno and b.branch_name=ba.branch_name
Group by d.Customername having count(Distinct b.Branch_name)=(select count(distinct b.branch_name)
from branch b where b.branch_city='Delhi');

Select distinct b.Customername from borrower b, Depositer d
where b.customername NOT IN(
select d.Customername from loan L, Depositer d, Borrower b
where L.loan_number=b.loan_number and d.customername=b.customername);

select distinct d.Customername from Depositer d
where d.Customername IN(
select d.Customername from branch br,Depositer d, BankAccount ba
where br.Branch_city='Bangalore' and br.Branch_name=ba.Branch_name and ba.accno=d.accno and Customername IN(
select Customername from Borrower));

UPDATE BankAccount set Balance=(Balance + (Balance*0.05));
select * from Bankaccount;

select branch_name from branch
where assets > all(select assets from branch
where branch_city="Bangalore");

delete ba.* from BankAccount ba, branch b where branch_city='Bombay' and ba.Branch_name=b.Branch_name;
select * from BankAccount;
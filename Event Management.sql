show databases;
create database EventManagement;
use EventManagement;
show tables;

Create table Address(
Address_id Int Primary key Auto_increment,
Street_name varchar(50),
City varchar(50) Not null,
Contact_number int);

create table Staff(	
Staff_Id Int Primary Key Auto_increment, 
Staff_Name Varchar(50) NOT NULL,
Department Varchar(50),
Designation Varchar(50)Not null,
Address_id int not null,
foreign key (Address_id) references Address(Address_Id),
CHECK (Department IN ("Finance","Event Management","Support Staff")));
                    
create table Venue (
Venue_Id Integer Primary Key,
Venue_Name Varchar(50) not null,
Capacity Int,
Budget Int not null,
Address_id int not null,
foreign key (Address_id) references Address(Address_Id),
CHECK (Capacity>0 AND Budget>0));
                    
create table Catering(	
Caterer_id INT PRIMARY KEY,
Caterer_name VARCHAR(50) not null,
Cuisine VARCHAR(50),
Budget INT not null,
Address_id int not null,
foreign key (Address_id) references Address(Address_Id),
CHECK (Budget>0));
                        
CREATE TABLE Decor (	
Decor_id INT PRIMARY KEY,
Decor_name VARCHAR(50) not null,
Theme VARCHAR(50),
Budget INT not null,
Address_id int not null,
foreign key (Address_id) references Address(Address_Id),
CHECK (Budget>0));
                        
CREATE TABLE Customer(	
Customer_id Int primary key,
Customer_Name varchar(50) not null,
Address_id int not null,
foreign key (Address_id) references Address(Address_Id));
                        
create table Sponsor (	
Sponsor_id INT PRIMARY KEY,
Sponsor_Name VARCHAR(50) not null);
                        
                        
CREATE TABLE Evnt(	
Event_Id INT Primary Key , 
Event_Name Varchar(50) not null,
Event_Date Date, 
Event_Description Varchar(150),
No_of_attendees INT,
Staff_Incharge INT not null,
Customer_Id INT not null, 
Venue_Id INT not null, 
Caterer_Id INT , 
Decor_Id INT , 
foreign key (Staff_Incharge) references Staff(Staff_Id),
foreign key (Customer_Id) references Customer(Customer_Id),
foreign key (Venue_Id) references Venue(Venue_Id),
foreign key (Caterer_Id) references Catering(Caterer_Id),
foreign key (Decor_Id) references Decor(Decor_Id)
);

                    
CREATE TABLE Feedback(	
Feedback_id INT ,
Feedback_Given VARCHAR(150),
Event_Id INT not null, 
primary key(Feedback_id),
foreign key (Event_Id) references Evnt(Event_Id));
	


create table sponsor_by(	
S_Id INT ,
Event_Id INT ,
Amount_Sponsored INT default 0,
foreign key (Event_Id) references Evnt(Event_Id),
foreign key (S_Id) references Sponsor(Sponsor_id),
primary key(S_Id , Event_Id));
               
Create table Budget(
Event_id int Primary Key, 
CateringPerPerson int,
No_of_Attendees int,
TotalCatering int, 
Venue int, 
Decor int, 
Total int,
foreign key (Event_id) references Evnt(Event_id)
);
               
show tables ;
				
INSERT INTO Address values(101,'Sheikh Zayed Road','Dubai',0555551874);
INSERT INTO Address values(102,'Tudor Road','Abu Dhabi',0525558685);
INSERT INTO Address values(103,'Al Najdah Road','Ajman',0505551316);
INSERT INTO Address values(104,'New Corniche Rd','Fujairah',0585550518);
INSERT INTO Address values(105,'Nahda Street','Dubai',0585556247);
INSERT INTO Address values(106,'Al Barsha Road','Dubai',0505556571);
INSERT INTO Address values(107,'Al Quoz Street','Dubai',0505556727);
INSERT INTO Address values(108,'Arabian Gulf Road','Ajman',0525554878);
INSERT INTO Address values(109,'Hamdan St','Fujairah',0505555405);
INSERT INTO Address values(110,'Mawgab St','Umm al Quwain',0585553623);
INSERT INTO Address values(111,'Lower Street','Sharjah',0525555207);
INSERT INTO Address values(112,'Umm Hurair Road','Abu Dhabi',0505554093);
INSERT INTO Address values(113,'Al Falah St','Sharjah',0555557186);
INSERT INTO Address values(114,'Mussafah Rd','Abu Dhabi',0525559217);
INSERT INTO Address values(115,'Crown Street','Abu Dhabi',0505556674);
INSERT INTO Address values(116,'Bani Yas Square','Ajman',0505556674);
INSERT INTO Address values(117,'Al Sharqi St','Dubai',0585552189);
INSERT INTO Address values(118,'Al Sufouh Road','Fujairah',0525559189);
INSERT INTO Address values(119,'Al Mamzar Street','Dubai',0505558101);
INSERT INTO Address values(120,'Beech Road','Abu Dhabi',0565553054);
INSERT INTO Address values(121,'Lansdowne Road','Sharjah',0585551833);
INSERT INTO Address values(122,'Brook Road','Dubai',0565555109);
INSERT INTO Address values(123,'Al Qudra Road','Dubai',0585551486);
INSERT INTO Address values(124,'Emirates Road','Dubai',0545552943);
INSERT INTO Address values(125,'Dhafeer Road','Sharjah',0565550237);
INSERT INTO Address values(126,'Zayed Road','Abu Dhabi',0555550575);
INSERT INTO Address values(127,'Acacia Road','Ajman',0505558293);
INSERT INTO Address values(128,'Thornton Road','Umm al Quwain',0505554763);
INSERT INTO Address values(129,'Madinat Jumeirah','Dubai',0585551234);
INSERT INTO Address values(130,'Dubai Marina','Dubai',0505558897);
INSERT INTO Address values(131,'King Salman Rd','Abu Dhabi',0565555459);
INSERT INTO Address values(132,'Al Hudaiba St','Sharjah',0505556239);
INSERT INTO Address values(133,'Meydan Rd','Dubai',0585555856);
INSERT INTO Address values(134,'Jumeira Rd','Dubai',0555559380);
INSERT INTO Address values(135,'Khalid Bin Al Waleed Rd','Dubai',0525554368);
INSERT INTO Address values(136,'Al Ittihad Rd','Abu Dhabi',0505559654);
INSERT INTO Address values(137,'Al Ain Rd','Dubai',0525555831);
INSERT INTO Address values(138,'Al Nasr Square','Fujairah',0525553042);
INSERT INTO Address values(139,'2nd December St','Dubai',0525556541);
INSERT INTO Address values(140,'Al Diyafa St','Sharjah',0505554263);



INSERT INTO Sponsor values(801,'Emirates Group');
INSERT INTO Sponsor values(802,'Etisalat');
INSERT INTO Sponsor values(803,'Abu Dhabi National Oil Company (ADNOC)');
INSERT INTO Sponsor values(804,'Etihad Airways');
INSERT INTO Sponsor values(805,'Dubai Electricity and Water Authority (DEWA)');
INSERT INTO Sponsor values(806,'Rotana');
INSERT INTO Sponsor values(807,'Dubai Airports');
INSERT INTO Sponsor values(808,'Dubai Islamic Bank (DIB)');
INSERT INTO Sponsor values(809,'DAMAC Properties');
INSERT INTO Sponsor values(810,'Cleveland Clinic Abu Dhabi');



INSERT INTO Staff values (201,'Jack Miller' ,'Finance', 'Accountant', 101);
INSERT INTO Staff values (202,'Tom Hank ','Finance', 'Financial Manager', 102);
INSERT INTO Staff values (203,'Fin Ray',  'Finance', 'Internal Auditor ', 103);
INSERT INTO Staff values (204,'Mary Ross', 'Event Management', 'Event Manager', 104);
INSERT INTO Staff values (205,'Nick Mark' ,'Event Management', 'Event coordinator', 105);
INSERT INTO Staff values (206,'Juliet Daniel', 'Event Management', 'PR Manager', 106);
INSERT INTO Staff values (207,'Emily Smith', 'Support Staff' , 'Administrator', 107);
INSERT INTO Staff values (208,'Danny Wilson','Support Staff' , 'Technician', 108);

 INSERT INTO Customer values (521, 'Abigail Moore' , 109);
 INSERT INTO Customer values (531,'Tyler White' , 110);
 INSERT INTO Customer values (541, 'Sara Khan',111); 
 INSERT INTO Customer values (551, 'Neil Matthew' , 112);
 INSERT INTO Customer values (561, 'Raj Malhotra' , 113);
 INSERT INTO Customer values (571, 'Harry William' , 114);
 INSERT INTO Customer values (581, 'Jasmin Bhatia' , 115);
 INSERT INTO Customer values (591, 'Arsalan Jamshed Ali', 116);

insert into Venue values(301, "Mohammed Bin Rashid Hall",500,2500,117);
insert into Venue values(302, "Hilton Event Hall",150,1000,118);
insert into Venue values(303, "The Venue",100,750,119); 
insert into Venue values(304, "The Venue",400,1500,119);
insert into Venue values(305, "Aurora Events",300,1200,120);
insert into Venue values(306, "Mushrif Wedding Hall",700,4500,121);
insert into Venue values(307, "The Domes",100, 550,122);
insert into Venue values(308,"The Domes",200,1000,122);
insert into Venue values(309,"The Domes",500,3500,122);
insert into Venue values(310, "Holiday Inn Events",50,300,123);
insert into Venue values(311, "Grand Ballroom", 800,5000,124);

insert into Catering values(401,"Keita Catering","Continental",50,125);
insert into Catering values(402,"Keita Catering","Italian",60,125);
insert into Catering values(403,"Keita Catering","American",55,125);
insert into Catering values(404,"Keita Catering","South Asian",65,125);
insert into Catering values(405,"Royal Catering","Mediterranean",50,126);
insert into Catering values(406,"Royal Catering","Emarati",55,126);
insert into Catering values(407, "Prestige Gourmet","Continental",70,127);
insert into Catering values(408, "Prestige Gourmet","Indian",65,127);
insert into Catering values(409, "Imperial Gourmet","Spanish",60,128);
insert into Catering values(415, "Imperial Gourmet","French",70,128);
insert into Catering values(410, "Lana's Pantiperfect","American",80,129);
insert into Catering values(411, "Abu Hamdan Catering Services","Emarati",70,130);
insert into Catering values(412, "Gazebo Restaurant", "Indian", 60,131);
insert into Catering values(413, "Arlequin Restaurant", "Chinese", 70,132);
insert into Catering values(414, "Arlequin Restaurant", "Japanese", 70,132);

insert into Decor values(501,"Melanie's Decor Services", "Birthday", 500, 133); 
insert into Decor values(502,"Melanie's Decor Services", "Anniversary", 700, 133);
insert into Decor values(503,"Tudor Decor Services", "Wedding", 2500, 134);
insert into Decor values(504,"Mohsin Events","Baby Shower", 300,135);
insert into Decor values(505,"Styro Decoration", "Birthday", 500, 136); 
insert into Decor values(506, "Styro Decoration", "Engagement", 750, 136); 
insert into Decor values(507, "Funky Monkey", "Baby Shower", 600, 137);
insert into Decor values(508, "Malla Events Decor", "Wedding", 2000, 138); 
insert into Decor values(509, "Areeka", "Exhibition", 1500, 139); 
insert into Decor values(510, "Carla's Decor", "Housewarming", 250, 140); 

insert into Evnt values(601,"Wedding", "2020-02-20", "Brahmin Style Indian Wedding", 500, 201, 561, 310, 402, 503);
insert into Evnt values(602,'Baby Shower','2020-04-18','Baby Shower for Baby Boy',100,202 ,531 ,305 ,404 ,504 );
insert into Evnt values(603,'Proposal','2020-02-14','Proposal in front of Burj Khalifa',40,203 ,551 ,303 ,406 ,503 );
insert into Evnt values(604,'Engagement','2020-03-28','Ring Ceremony ',200,204 ,521 ,307 ,408 ,506 );
insert into Evnt values(605,'Conference','2020-05-20','Conference for Global Leaders',300,205 ,541 ,309 ,410 ,509 );
insert into Evnt values(606,'HouseWarming','2020-02-02','Inauguration  of new house and housewarming party',50,206 ,521 ,302 ,412 ,510 );                        
insert into Evnt values(607,'Wedding','2020-06-17','Minimalistic Wedding Ceremony',300,201 ,581 ,311 ,414 ,508 );
insert into Evnt values(608,'Wedding','2020-06-05','Muslim Wedding , separate areas for men and women',400,201 ,591 ,306 ,403 ,508 );
insert into Evnt values(609,'Birthday','2020-02-20','Birthday Party for a 2 year old Boy',100,207 ,571 ,305 ,401 ,501 );
insert into Evnt values(610,'Anniversary','2020-05-25','Silver Wedding Jubilee',200,207 ,521 ,311 ,407 ,502 );
insert into Evnt values(611,'Inauguration ','2020-05-13','Inauguration  of new office',60,208 ,541 ,308 ,405 ,509 );
insert into Evnt values(612,'Birthday','2020-07-05','Birthday of a 75 year old man',100,207 ,571 ,311 ,409 ,505 );
insert into Evnt values(613,'Proposal','2020-04-17','Proposal on a yacht',20,203 ,581 ,304 ,411 ,508 );
insert into Evnt values(614,'Exhibition','2020-07-05','Art Exhibition for local artists',100,208 ,541 ,309 ,413 ,509 );
insert into Evnt values(615,'Wedding','2020-06-05','Christian Wedding Ceremony',400,201,551 ,311 ,402 ,503 );
insert into Evnt values(616,'Birthday','2020-06-18','Birthday of a 5 year old girl',100,207,531 ,305 ,401 ,501 );

INSERT INTO Feedback values (701,'The wedding was perfect & well executed', 601);
INSERT INTO Feedback values (702,'It was beautiful and everything I wanted it to be like',602);
INSERT INTO Feedback values (703,'She said yes, Thanks for all your help',603);
INSERT INTO Feedback values (704,'It was PERFECT',604);
INSERT INTO Feedback values (705,'Need some improvement in the catering service, otherwise everything was as planned', 606);
INSERT INTO Feedback values (706,'Thanks for all the help, will definitely work again in future',607);                    	
INSERT INTO Feedback values (707,'It was executed just fine, Thank you', 608);
INSERT INTO Feedback values (708,'The Nikah, Decor, Food, Service was really good', 608);
INSERT INTO Feedback values (709,'My son loved everything, Thank you for your service', 609);
INSERT INTO Feedback values (710,'Everything went as planned, wouldn’t have been possible without your help',610);
INSERT INTO Feedback values (711,'Thank You',611);
INSERT INTO Feedback values (712,'The staff was not cooperative, fast & punctual',612);
INSERT INTO Feedback values (713,'There were many technical glitches',613);
INSERT INTO Feedback values (714,'The execution was PERFECT, everybody loved the whole set up and service, Thank You',614);
INSERT INTO Feedback values (715,'There were many missing elements which we had asked for, hope you improve the service', 615);
INSERT INTO Feedback values (716,'My daughter loved the whole party, Credits to you all', 616);

INSERT INTO sponsor_by values (801,605,11000);
INSERT INTO sponsor_by values (802,606,900);
INSERT INTO sponsor_by values (803,607,3000);
INSERT INTO sponsor_by values (804,608,1000);
INSERT INTO sponsor_by values (805,611,8000);
INSERT INTO sponsor_by values (806,615,5000);
INSERT INTO sponsor_by values (807,613,500);
INSERT INTO sponsor_by values (809,614,20000);
INSERT INTO sponsor_by values (810,612,7000);

Select e.Event_Id, e.Event_Name, e.Event_Description
From Evnt e, budget b
Where e.Event_Id= b.Event_id and b.total = (select max(b1.total)
											from budget b1); 

with Event_total(Event_id, value) as (Select Event_id, total from Budget)
Select e.Event_Id, e.Event_Name, e.Event_Description
From Evnt e, Event_total t
Where e.Event_Id= t.Event_id and t.value > (select avg(total) from Budget); 

SELECT MAX(Budget), MIN(Budget), AVG(Capacity), Venue_Name 
FROM Venue 
GROUP BY Venue_Name;

select Event_id, Event_name
from evnt e 
where e.Staff_Incharge In	(select staff_id 
				from staff 
			 	where staff.address_id In(select address_Id 
							     from address 
                                  where address.city="Dubai"));

select Sponsor_id, Sponsor_name 
from Sponsor s, sponsor_by s2
where s.Sponsor_id = s2.S_Id and s2.event_Id in (select event_id
							from Evnt e
								where e.event_name="Birthday");

SELECT MAX(Amount_Sponsored) 
FROM sponsor_by s, Evnt e
WHERE s.Event_Id=e.Event_Id;

delimiter $$

CREATE TRIGGER Set_Event_Budget
    after INSERT ON Evnt 
    FOR EACH ROW
BEGIN
Declare caterer_budget integer; 
Declare decor_budget integer; 
Declare venue_budget integer;   
Declare new_budget integer; 

Select Catering.Budget into caterer_budget from Catering where NEW.Caterer_Id=Catering.Caterer_id; 
Select Decor.Budget into decor_budget from Decor where NEW.Decor_Id=Decor.Decor_id;
Select Venue.Budget into venue_budget from Venue where NEW.Venue_Id=Venue.Venue_id;
Select ((caterer_budget*NEW.No_of_attendees) + decor_budget + venue_budget ) into new_budget;

insert into Budget values(NEW.Event_id, caterer_budget, NEW.No_of_attendees, caterer_budget*NEW.No_of_attendees, venue_budget, decor_budget, new_budget);

END$$    

delimiter ;

delimiter $$

drop procedure if exists giveCatererDetails $$

CREATE PROCEDURE  giveCatererDetails(
	IN Cname varchar(50)
)
BEGIN
    SELECT 
       Caterer_name,
       Caterer_id,
       Cuisine
    FROM EventManagement.Catering 
    WHERE
        Caterer_name = Cname;
END$$
delimiter ; 
call giveCatererDetails("Keita Catering");

delimiter $$
CREATE PROCEDURE changeTheme(
	IN id_no int, 
    IN theme_new varchar(50)
)
BEGIN
	Update Decor
    Set Theme=theme_new
    where Decor_Id=id_no;
END$$

delimiter ;

call changeTheme(507, "Baby Shower");
select * from Decor where Decor_id = 507 ;  

DELIMITER $$ 

DROP procedure IF EXISTS ChangeCustomer $$

CREATE PROCEDURE ChangeCustomer(
	IN new_cust int,
    IN evnt_id int
)
BEGIN 
declare old_cust int; 
	select Customer_id into old_cust from eventrecords where Event_id = evnt_id; 
if old_cust<>new_cust then
	UPDATE EventRecords
	SET Customer_Id = new_cust
	WHERE Event_id=evnt_id;
end if;
END$$

DELIMITER ; 


call ChangeCustomer(561,601);
select * from eventrecords where Event_Id = 601;

DELIMITER $$

create function dept_count (
	dept_name varchar(20)
)
returns integer
READS SQL DATA
DETERMINISTIC
begin
	declare d_count integer;
    
	select count(*) into d_count
		from Staff
		where Staff.department = dept_name; 
        
return d_count;
End$$

DELIMITER ;

select dept_count("Finance"); 


# Project Description 
 Create an event management database designed for easier event bookings. The database holds information of event managers and creative specialists who organize weddings, exhibitions, conferences. 
 Design a comprehensive plan to ensure that events are delivered on time and on budget. The event management database has the following requirements:
 
 ● Details for every event needs to be stored; each event has an Event ID (unique identifier), name, budget, date of event, number of attendees and a description of the
 event.
 
 ● Each event is managed by one staff member of the event management company. Each staff member has an ID (unique identifier), name, contact number, address, designation and a department they belong to.
 
 ● The company only has 3 departments: Finance, Event Management and Support Staff
 
 ● Every event may have only one of each: venue, catering service and decor.
 ○ The capacity and the address of the venue should be recorded.
 ○ The type of cuisine should be recorded by caterers.
 ○ The decor should record the themes of events they provide for.
 
 ● Each event can be booked by only one customer. Each customer has an ID (unique identifier), name and address
 
 ● Detailed budget for each event is a bonus.
 
 ● Each event is sponsored by a number of sponsors. Each sponsor’s Sponsor ID (unique identifier), name and amount to be sponsored must be recorded.
 
 ● At the end of the event, feedback is given. Each feedback has an ID (unique identifier)and must be identified by the event it is for


# Database Operations:
Database Creation:

Creates a database named EventManagement.
Selects the EventManagement database for subsequent operations.

Table Definitions:

● Address Table:

Stores address details with fields like Address_id, Street_name, City, and Contact_number.
Address_id is the primary key and is auto-incremented.

● Staff Table:

Stores staff information, including Staff_Id, Staff_Name, Department, Designation, and a foreign key Address_id.
References the Address table to associate each staff member with an address.
Enforces a constraint to limit Department values to Finance, Event Management, or Support Staff.

● Venue Table:

Defines venues with attributes like Venue_Id, Venue_Name, Capacity, Budget, and Address_id.
References the Address table for venue location.
Includes checks to ensure Capacity and Budget are greater than 0.

● Catering Table:

Manages caterer information, including Caterer_id, Caterer_name, Cuisine, Budget, and Address_id.
References the Address table for caterer locations.

# Relationships:
The schema defines relationships using foreign keys, linking entities like Staff, Venue, and Catering to the Address table.
# Checks and Constraints:
The schema uses CHECK constraints to enforce rules like:
Valid Department names in the Staff table.
Positive values for Capacity and Budget in the Venue table.


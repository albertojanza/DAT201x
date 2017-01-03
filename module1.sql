
-- Module 1
/* Challenge 1
-- 1. Retrieve customer details
-- Familiarize yourself with the Customer table by writing a Transact-SQL 
-- query that retrieves all columns for all customers.
*/
SELECT * FROM AdventureWorksLT.SalesLT.Customer;

/*2. Retrieve customer name data
 	 Create a list of all customer contact names that includes the title, first name, middle name (if any), 
 	 last name, and suffix (if any) of all customers.
*/

SELECT ISNULL(Title,'') + ' ' + FirstName + ' ' + ISNULL(MiddleName,'') + ' ' + LastName + ISNULL(Suffix,'') FROM AdventureWorksLT.SalesLT.Customer as product;

/*3. Retrieve customer names and phone numbers
Each customer has an assigned salesperson. You must write a query to create a call sheet that lists:
- The salesperson
- A column named CustomerName that displays how the customer contact should be greeted (for example, “Mr Smith”)
- The customer’s phone number.
*/

SELECT SalesPerson, ISNULL(Title,'') + LastName as CustomerName, "Phone" FROM AdventureWorksLT.SalesLT.Customer as product;

/* Challenge 2
1. Retrieve a list of customer companies
You have been asked to provide a list of all customer companies in the format <Customer ID> :
<Company Name> - for example, 78: Preferred Bikes. 
*/

SELECT CAST(CustomerID AS VARCHAR(5)) + ': ' + ISNULL(CompanyName,'')  FROM AdventureWorksLT.SalesLT.Customer as product;

/*
2. Retrieve a list of sales order revisions
The SalesLT.SalesOrderHeader table contains records of sales orders. You have been asked to retrieve
data for a report that shows:
- The sales order number and revision number in the format <Order Number> (<Revision>) – for
example SO71774 (2).
- The order date converted to ANSI standard format (yyyy.mm.dd – for example 2015.01.31).
*/
SELECT CAST(SalesOrderID AS VARCHAR(5)) + ' ('  + CAST(RevisionNumber AS VARCHAR(5)) + ')', CONVERT(VARCHAR(10), OrderDate, 102)  FROM AdventureWorksLT.SalesLT.SalesOrderHeader;

/*
Challenge 3: Retrieve Customer Contact Details
Some records in the database include missing or unknown values that are returned as NULL. You must
create some queries that handle these NULL fields appropriately.
Tip: Review the documentation for the ISNULL function and Expressions in the Transact-SQL Reference.
1. Retrieve customer contact names with middle names if known
You have been asked to write a query that returns a list of customer names. The list must consist of a
single field in the format <first name> <last name> (for example Keith Harris) if the middle name is
unknown, or <first name> <middle name> <last name> (for example Jane M. Gates) if a middle name is
stored in the database
*/
SELECT  FirstName + ' ' + ISNULL(MiddleName,'') + ' ' + LastName  FROM AdventureWorksLT.SalesLT.Customer as product;

/*
2. Retrieve primary contact details
Customers may provide adventure Works with an email address, a phone number, or both. If an email
address is available, then it should be used as the primary contact method; if not, then the phone
number should be used. You must write a query that returns a list of customer IDs in one column, and a
second column named PrimaryContact that contains the email address if known, and otherwise the
phone number
*/


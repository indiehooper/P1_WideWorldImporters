/*Assignment: WideWorldImporters SQL Project - Task 1
Scenario:
You are a data analyst for WideWorld Importers. 
The sales team has requested actionable insights to improve customer targeting, 
optimize stock levels, and identify sales trends for strategic planning.

Tasks:
Identify Top Customers:

Problem: The sales team needs to prioritize high-value customers for a new loyalty program.
Task: Write a query to find the top 10 customers by total order value.
Deliverable: Include customer name, total value of orders, and number of orders.
Analyze Monthly Sales Trends:

Problem: Management wants to identify seasonal sales trends to allocate marketing budgets effectively.
Task: Create a query to calculate monthly sales for the last 2 years.
Deliverable: Include columns for the month, year, and total sales amount.
Best-Selling Products:

Problem: The warehouse team is planning restocking and needs to know which products drive the most revenue.
Task: Identify the top 5 best-selling products by total units sold.
Deliverable: Include product name, total units sold, and total revenue.
Customer Ranking (Window Function):

Problem: The finance team needs to assess the spending tiers of customers for invoicing.
Task: Use a window function to rank customers by total spending.
Deliverable: Show customer name, total spending, and rank.
Query Optimization:

Problem: Some queries are running slowly, impacting performance for operational dashboards.
Task: Create an index on a frequently queried column in the Sales.Orders table.
Deliverable: Compare execution plans before and after the index to highlight performance improvements.
*/

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


/*
Tasks:
Identify Top Customers:

Problem: The sales team needs to prioritize high-value customers for a new loyalty program.
Task: Write a query to find the top 10 customers by total order value.
Deliverable: Include 
customer name, 
total value of orders, 
and number of orders.*/

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


drop table if exists  [WideWorldImporters].[Sales].[1a_TopCustomerRevenueAnalysis];

select top 10

      c.customerName as 'Customer Name'
	  ,count(i.CustomerPurchaseOrderNumber) as ' Total Orders'
	  ,sum(il.ExtendedPrice) as 'Total Price'

into [WideWorldImporters].[Sales].[1a_TopCustomerRevenueAnalysis]

from [WideWorldImporters].[Sales].[Customers] as c

	join [WideWorldImporters].[Sales].[Invoices] as i
		on c.CustomerID = i.CustomerID 

	join [WideWorldImporters].[Sales].[InvoiceLines] as il 
		on i.InvoiceID = il.InvoiceID 

group by c.CustomerName

order by [Total Price] desc;

select * from [WideWorldImporters].[Sales].[1a_TopCustomerRevenueAnalysis]
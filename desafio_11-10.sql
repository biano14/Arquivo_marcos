SELECT * FROM `products` 
INNER JOIN productlines ON products.productLine = productlines.productLine;

SELECT * FROM `employees` WHERE officeCode = 1 OR officeCode = 2;

SELECT * FROM `employees` WHERE jobTitle = 'Sales Rep' AND officeCode = 3;

SELECT orders.orderNumber, payments.amount FROM `payments` 
INNER JOIN orders ON payments.customerNumber = orders.customerNumber
WHERE payments.amount = 0;
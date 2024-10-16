-- Comando para FULL JOIN
SELECT employees.firstName, custumer.custumername
FROM customers
FULL JOIN employees ON 

-- Select para aumentar o o valor a atrituto 'creditLimit em 20%'
SELECT 
    `customerNumber`, 
    `customerName`, 
    `contactLastName`, 
    `contactFirstName`, 
    `phone`, 
    `addressLine1`, 
    `addressLine2`, 
    `city`, 
    `state`, 
    `postalCode`, 
    `country`, 
    `salesRepEmployeeNumber`, 
    (`creditLimit` * 1.2) AS 'LIMITE ACRESCIDO'
FROM 
    `customers` 
WHERE 
    `country` = 'New Zealand';

-- Select para mostrar a metade do valor do atributo 'amount' 
SELECT customerNumber,
(amount*0.5) AS 'metade do valor',
amount
FROM `payments`
WHERE paymentDate >= '2004-01-01' AND paymentDate <= '2004-12-31';

SELECT * FROM `customers` WHERE country != 'New Zealand';

SELECT * FROM `orders` WHERE status != ('Cancelled','Disputed') AND shippedDate BETWEEN '2004-01-01' AND '2004-12-31'

SELECT * FROM `orders` WHERE status != 'Cancelled' AND status != 'Disputed' AND shippedDate BETWEEN '2004-01-01' AND '2004-12-31';

SELECT * FROM `orders` WHERE  orderDate BETWEEN '2004-01-01' AND '2004-12-31' AND (status = 'Cancelled' OR status = 'Resolved' ) AND shippedDate IS NOT NULL 
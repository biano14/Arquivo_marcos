SELECT orders.orderNumber, orders.status, orders.shippedDate, orders.orderDate, orderdetails.productCode, products.productName, orderdetails.quantityOrdered, orderdetails.priceEach FROM orders
INNER JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber 
INNER JOIN products ON orderdetails.productCode = products.productCode;
SELECT * FROM  orders
INNER JOIN orderdetails ON orderdetails.orderNumber = order.orderNumber 
-- LISTA 1 


USE ecommerce_22b;

-- 1.

SELECT order_id, order_date, CONCAT(first_name, ' ', last_name) as name, email
FROM Orders JOIN Customers
ON Orders.customer_id = Customers.customer_id
;

-- 2.

SELECT product_name, quantity, customer_id
FROM Products JOIN Order_Items
ON Products.product_id = Order_Items.product_id
JOIN Orders
ON Order_Items.order_id = Orders.order_id
WHERE customer_id = 1
;

-- 3.

SELECT CONCAT(first_name, ' ', last_name) as name, SUM(price*quantity)
FROM Customers JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY name
;

-- 4.

SELECT CONCAT(first_name, ' ', last_name) as name
FROM Customers LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE order_id IS null
;

-- 5.

SELECT product_name, SUM(quantity) as total
FROM Order_Items JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY product_name
ORDER BY total DESC


-- LISTA 2 

-- 1.1

use db_ecommerce_exam;

select pedidos.pedido_id, clientes.nome, clientes.email
from clientes
inner join pedidos
on clientes.cliente_id = pedidos.cliente_id;

-- 2.3

use db_crm_exam;

select clientes.cliente_id, clientes.nome
from clientes
left join participacoes_campanha
on clientes.cliente_id = participacoes_campanha.cliente_id;


-- 3.5

use db_financas_exam;

select contas.nome, contas.tipo, transacoes.tipo, transacoes.valor
from contas 
inner join transacoes
on contas.conta_id = transacoes.conta_id;

-- 4.3

use db_prontuario_exam;

select pacientes.paciente_id, pacientes.nome, consultas.motivo
from consultas
inner join pacientes
on consultas.paciente_id = pacientes.paciente_id;

-- 5.5

use db_logistica_exam;

select fornecedores.nome, produtos.nome
from fornecedores
left join produtos
on fornecedores.fornecedor_id = produtos.fornecedor_id
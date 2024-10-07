# Aula sobre Join

## Inner JOIN

O `INNER JOIN` combina linhas de duas ou mais tabelas com base em uma condição relacionada. Apenas os registros que atendem à condição de junção serão retornados.

### Exemplo 1

```sql
SELECT Clientes.Nome, Pedidos.PedidoId
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
```

### Explicação 1

- **Clientes.Nome**: Nome do cliente da tabela `Clientes`.
- **Pedidos.PedidoId**: ID do pedido da tabela `Pedidos`.
- **INNER JOIN**: Retorna apenas os registros com correspondência nas duas tabelas.

---

## Left JOIN

O `LEFT JOIN` retorna todas as linhas da tabela à esquerda e as linhas correspondentes da tabela à direita. Se não houver correspondência, os resultados da tabela à direita serão `NULL`.

### Exemplo 2

```sql
SELECT Clientes.Nome, Pedidos.PedidoId
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
```

### Explicação 2

- Retorna todos os clientes, mesmo aqueles que não têm pedidos. Para esses clientes, o `PedidoId` será `NULL`.

---

## Right JOIN

O `RIGHT JOIN` é o oposto do `LEFT JOIN`; ele retorna todas as linhas da tabela à direita e as linhas correspondentes da tabela à esquerda.

### Exemplo 3

```sql
SELECT Clientes.Nome, Pedidos.PedidoId
FROM Clientes
RIGHT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
```

### Explicação 3

- Retorna todos os pedidos, mesmo aqueles que não têm um cliente associado. Para esses pedidos, o `Nome` do cliente será `NULL`.

---

## Full JOIN

O `FULL JOIN` retorna todas as linhas quando há uma correspondência em uma das tabelas. Se não houver correspondência, os resultados terão `NULL` nos campos da tabela que não têm correspondência.

### Exemplo 4

```sql
SELECT Clientes.Nome, Pedidos.PedidoId
FROM Clientes
FULL JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
```

### Explicação 4

- Retorna todos os clientes e todos os pedidos. Se um cliente não tiver pedidos, o `PedidoId` será `NULL`, e se um pedido não tiver um cliente, o `Nome` será `NULL`.

---

## Conclusão

Os `JOINs` são fundamentais para trabalhar com bancos de dados relacionais, permitindo combinar dados de diferentes tabelas de forma eficaz. Experimente usar diferentes tipos de `JOIN` para entender como eles afetam os resultados das suas consultas!

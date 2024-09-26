# Comandos DML

- Insert

    ```sql
    INSERT INTO <nome-tabela> (<nome-coluna>,<nome-coluna2>)
    VALUES (<valor1>,<valor2>)
    ```

- Update

    ```SQL
    UPDATE <nome-tabela>
    SET <nome-coluna> = <novo_valor>
    WHERE <condição>
    ```

- Delete

    ```SQL
    DELETE FROM <nome-tabela>
    WHERE <condição>
    ```

- Operadores Logicos

    ```SQL
    AND -- 'E' lógico
    OR -- 'OU' lógico
    NOT -- 'NÃO' lógico
    = -- igual
    != -- diferente
    <> -- diferente
    > -- maior
    !> -- não maior
    < -- menor
    !< -- não menor
    >= -- Maior ou igual
    <= -- Menor ou igual
    ```

- Select

    ```SQL
    SELECT * -- (OU <nome-coluna>)
    FROM <nome-tabela>
    WHERE <condição> --se precisar somente de um grupo especifico
    ```

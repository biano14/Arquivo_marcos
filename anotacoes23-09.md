
# Anotações de Aula

+ **Como criar o banco de dados**

    ```sql
    CREATE DATABASE nome_do_banco;
    ```

+ **Selecionar banco de dados**

    ```sql
    USE nome_do_banco;
    ```

+ **Criar tabela**

    ```sql
    CREATE TABLE nome_tabela (
        nome_coluna tipo_dado [NOT NULL],
        ...
    );
    ```

## Observações sobre restrições e propriedades

+ **NOT NULL**:
  + Impede que a coluna aceite valores nulos.
    + Exemplo:
            ```sql
            nome_coluna INT NOT NULL;
            ```

+ **AUTO_INCREMENT**:
  + Usado para gerar um valor único automaticamente em uma coluna (geralmente em chaves primárias).
    + Exemplo:
            ```sql
            id INT AUTO_INCREMENT PRIMARY KEY;
            ```

+ **ON CASCADE**:
  + Usado em chaves estrangeiras para definir o que acontece com as linhas relacionadas quando a linha na tabela referenciada é excluída ou atualizada.
  + Exemplo:

      ```sql
      FOREIGN KEY (nome_chave) REFERENCES nome_tabela_referenciada(nome_chave_referenciada) ON DELETE CASCADE;
      ```

+ **OUTRO TIPO DE CASCADE**:
  + `ON UPDATE CASCADE`: atualiza a chave estrangeira se a chave primária correspondente for alterada.

+ **UNIQUE**:
  + Garante que todos os valores em uma coluna sejam distintos.
  + Exemplo:

      ```sql
      email VARCHAR(100) UNIQUE;
      ```

+ **DEFAULT**:
+ Define um valor padrão para a coluna se nenhum valor for fornecido durante a inserção.
  + Exemplo:

      ```sql
      status VARCHAR(10) DEFAULT 'ativo';
      ```

+ **Declarar chave primária**

    ```sql
    PRIMARY KEY (nome_chave);
    ```

+ **Declarar chave estrangeira**

    ```sql
    FOREIGN KEY (nome_chave) REFERENCES nome_tabela_referenciada(nome_chave_referenciada);
    ```

+ **Criar um índice**

    ```sql
    CREATE INDEX nome_indice ON nome_tabela (coluna);
    ```

+ **Alterar tabela**
  + Para adicionar uma nova coluna:

    ```sql
        ALTER TABLE nome_tabela
        ADD nova_coluna tipo_dado;
    ```

  + Para modificar uma coluna existente:

    ```sql
        ALTER TABLE nome_tabela
        MODIFY nome_coluna novo_tipo [NOVA_RESTRIÇÃO];
    ```

  + Exemplo: alterar tipo de dado e adicionar NOT NULL:

    ```sql
        ALTER TABLE nome_tabela
        MODIFY nome_coluna VARCHAR(255) NOT NULL;
    ```

+ **Excluir tabela**

    ```sql
    DROP TABLE nome_tabela;
    ```

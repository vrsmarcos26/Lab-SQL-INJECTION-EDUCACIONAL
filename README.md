# Laboratório de SQL Injection para Portfólio

![Linguagens](https://img.shields.io/github/languages/top/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL?style=flat-square)

Um ambiente de laboratório simples, construído com PHP e MySQL, para demonstrar e estudar vulnerabilidades de Injeção de SQL. Este projeto foi desenvolvido como uma peça de portfólio para exibir conhecimentos práticos em segurança de aplicações web.

---

### ⚠️ Aviso Importante

**Este projeto é intencionalmente vulnerável.** Ele foi criado para fins estritamente educacionais. **NÃO FAÇA O DEPLOY DESTA APLICAÇÃO EM UM SERVIDOR PÚBLICO OU DE PRODUÇÃO.** Use-o apenas em um ambiente local e controlado.

---

### Funcionalidades do Laboratório

Este não é apenas um bypass de login. É um desafio de Capture The Flag (CTF) com dois estágios:

1.  **Flag 1: Bypass de Autenticação:** O primeiro desafio é conseguir acesso ao sistema através de uma injeção de SQL clássica (`' OR '1'='1'`).
2.  **Flag 2: Exfiltração de Dados:** O segundo e principal desafio é usar uma injeção de SQL baseada em `UNION` para extrair todos os dados (usuários e senhas) da tabela `users`.

---

### Como Rodar o Laboratório

Você precisará ter o **PHP** e o **MySQL** (ou MariaDB) instalados em sua máquina.

1.  **Clone o Repositório**
    ```bash
    git clone [https://github.com/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL.git](https://github.com/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL.git)
    cd Lab-SQL-INJECTION-EDUCACIONAL
    ```

2.  **Configure o Banco de Dados**
    Execute o script `setup.sql` para criar o banco, a tabela, o usuário e inserir os dados. Você precisará da sua senha de `root` do MySQL.
    ```bash
    mysql -u root -p < setup.sql
    ```

3.  **Inicie o Servidor Local**
    Use o servidor embutido do PHP para rodar a aplicação.
    ```bash
    php -S 0.0.0.0:8888
    ```

4.  **Acesse o Laboratório**
    Abra seu navegador e acesse: `http://localhost:8888/index.html`

---

### Objetivos de Aprendizagem Demonstrados

* **Compreensão de Vulnerabilidades:** Demonstração prática da vulnerabilidade de SQL Injection e seu impacto real.
* **Desenvolvimento Backend:** Uso de PHP para processar requisições web e interagir com um banco de dados MySQL.
* **Princípios de Segurança (Pelo Exemplo):** Ilustra a importância crítica de nunca confiar nos dados do usuário e a necessidade de usar **Consultas Parametrizadas (Prepared Statements)** como medida de prevenção.

---

### Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
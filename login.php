<?php
    $servername = "localhost";
    $db_username = "sqlinjection"; // Renomeado para não confundir com o post
    $db_password = "senha@123";
    $dbname = "sqlinjection";

    $conn = new mysqli($servername, $db_username, $db_password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Verifica se os dados foram enviados via POST
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $user = $_POST['username'];
        $pass = $_POST['password'];

        // Consulta SQL vulnerável (como planejado para o laboratório)
        $sql = "SELECT * FROM users WHERE name = '$user' AND password = '$pass'";

        $result = $conn->query($sql);
        
        // Verifica se a consulta retornou algum resultado
        if ($result && $result->num_rows > 0) {

            if ($result->num_rows > 1) {
                // Defina sua primeira flag aqui!
                $flag1 = "FLAG{B4S1C_BYP4SS_1S_D0N3}";
                echo "Parabéns, você realizou o bypass simples! Sua primeira flag é: " . $flag1;
            
            }
            else{
                // Se o usuário for 'FLAG', mostra a mensagem especial
                $row = $result->fetch_assoc();
                if ($row['name'] === 'FLAG') {
                    $exfiltrated_data = $row['password'];
                    echo "Excelente! Você conseguiu extrair dados do banco! Conteúdo: " . htmlspecialchars($exfiltrated_data);
                } else {
                    echo "Login realizado com sucesso para o usuário: " . htmlspecialchars($row['name']);
                }
            }
        } else {
            echo "Login falhou!";
        }
    } else {
        echo "Dados não recebidos.";
    }

    $conn->close();
?>

<?php
/* \connect root@localhost
 \sql 
use sqlinjection;
show tables;

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT,
    name VARCHAR(250),
    password VARCHAR(250),
    PRIMARY KEY (id)
);

INSERT INTO users (id,name,password) VALUE (1,'admin','admin');
INSERT INTO users (id,name,password) VALUE (2,'vrsmarcos26','gostoudoCTF?');
INSERT INTO users (id,name,password) VALUE (3,'FLAG','FLAG{1NJ3T4ND0_C0NH3C1M3NT0}');

CREATE user 'sqlinjection'@'%' IDENTIFIED BY 'senha@123'

GRANT ALL PRIVILEGES ON sqlinjection.* TO 'sqlinjection'@'%';

FLUSH PRIVILEGES;

show tables;
select * from users;

*/
?>
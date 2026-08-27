<?php
    $servername = "db";
    $db_username = "sqlinjection"; 
    $db_password = "senha@123";
    $dbname = "sqlinjection";

    $conn = new mysqli($servername, $db_username, $db_password, $dbname);

    if ($conn->connect_error) {
        die(json_encode(["status" => "error", "message" => "Erro interno de conexão."]));
    }

    if (isset($_POST['username']) && isset($_POST['password'])) {
        $user = $_POST['username'];
        $pass = $_POST['password'];

        $sql = "SELECT * FROM users WHERE name = '$user' AND password = '$pass'";
        $result = $conn->query($sql);
        
        if (!$result) {
             echo json_encode(["status" => "error", "message" => "Erro na sintaxe SQL: " . $conn->error]);
             exit;
        }

        // FLAG 3: Detecção de query bem sucedida sem retorno (INTO OUTFILE)
        if ($result === true) {
            echo json_encode(["status" => "success", "message" => "Comando processado. Arquivo gravado no disco do servidor!"]);
            exit;
        }

        if ($result->num_rows > 0) {
            
            // FLAG 1: Bypass Simples
            if ($result->num_rows > 1 && strpos(strtoupper($user), 'UNION') === false && strpos(strtoupper($pass), 'UNION') === false) {
                echo json_encode(["status" => "success", "flag" => "FLAG{B4S1C_BYP4SS_1S_D0N3}", "message" => "Bypass de Autenticação realizado com sucesso!"]);
            } 
            // FLAG 2: Exfiltração de Dados (UNION)
            else if (strpos(strtoupper($user), 'UNION') !== false || strpos(strtoupper($pass), 'UNION') !== false) {
                $exfiltrated_data = [];
                while($row = $result->fetch_assoc()) {
                    $data = isset($row['password']) ? $row['password'] : implode(" | ", $row);
                    $exfiltrated_data[] = htmlspecialchars($data);
                }
                $dump = implode("<br>", $exfiltrated_data);
                echo json_encode(["status" => "exfiltration", "flag" => $dump, "message" => "Exfiltração detectada! " . count($exfiltrated_data) . " registros extraídos:"]);
            }
            // Login legítimo
            else {
                $row = $result->fetch_assoc();
                echo json_encode(["status" => "success", "message" => "Login realizado com sucesso para: " . htmlspecialchars($row['name'])]);
            }
        } else {
            echo json_encode(["status" => "error", "message" => "Credenciais inválidas."]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Dados não recebidos."]);
    }
    
    $conn->close();
?>
USE sqlinjection;

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT,
    name VARCHAR(250),
    password VARCHAR(250),
    PRIMARY KEY (id)
);

INSERT INTO users (id, name, password) VALUES (4, 'carlos.silva', 'SenhaForte123!');
INSERT INTO users (id, name, password) VALUES (5, 'ana.souza', 'fluxodecaixa2026');
INSERT INTO users (id, name, password) VALUES (6, 'marcelo.lima', 'marcelao#99');
INSERT INTO users (id, name, password) VALUES (7, 'beatriz.costa', 'bia_costa_2025');
INSERT INTO users (id, name, password) VALUES (8, 'joao.pedro', 'jp123456');
INSERT INTO users (id, name, password) VALUES (9, 'mariana.alves', 'mario_e_luigi');
INSERT INTO users (id, name, password) VALUES (10, 'lucas.pereira', 'lucas_p*99');
INSERT INTO users (id, name, password) VALUES (11, 'camila.rocha', 'camilinha#2026');
INSERT INTO users (id, name, password) VALUES (12, 'rafael.gomes', 'rafa_g_db');
INSERT INTO users (id, name, password) VALUES (13, 'juliana.martins', 'juliana_m_bank');
INSERT INTO users (id, name, password) VALUES (14, 'bruno.ferreira', 'bruno_ferreira99');
INSERT INTO users (id, name, password) VALUES (15, 'larissa.ribeiro', 'larissa_sql_inj');
INSERT INTO users (id, name, password) VALUES (16, 'gustavo.cardoso', 'gustavoc123');
INSERT INTO users (id, name, password) VALUES (17, 'patricia.mendes', 'paty_mendes_01');
INSERT INTO users (id, name, password) VALUES (18, 'roberto.santos', 'roberto_sant_pass');
INSERT INTO users (id, name, password) VALUES (19, 'fernanda.lima', 'fe_lima_2026');
INSERT INTO users (id, name, password) VALUES (20, 'diego.araujo', 'diego_araujo_pwd');
INSERT INTO users (id, name, password) VALUES (21, 'amanda.castro', 'amanda_c_bank');
INSERT INTO users (id, name, password) VALUES (22, 'thiago.morais', 'thiago_m_77');
INSERT INTO users (id, name, password) VALUES (23, 'vanessa.duarte', 'vanessa_d_sec');
INSERT INTO users (id, name, password) VALUES (24, 'felipe.barbosa', 'felipe_b_dev');
INSERT INTO users (id, name, password) VALUES (25, 'tatiane.nunes', 'tati_nunes_2026');
INSERT INTO users (id, name, password) VALUES (26, 'eduardo.vieira', 'edu_vieira_99');
INSERT INTO users (id, name, password) VALUES (27, 'renata.macedo', 'renatinha_macedo');
INSERT INTO users (id, name, password) VALUES (28, 'marcio.freitas', 'marcio_freitas_sec');
INSERT INTO users (id, name, password) VALUES (29, 'carolina.pinto', 'carol_pinto_123');
INSERT INTO users (id, name, password) VALUES (30, 'alexandre.cavalcanti', 'alex_c_bank');
INSERT INTO users (id, name, password) VALUES (31, 'daniela.monteiro', 'dani_monteiro_pwd');
INSERT INTO users (id, name, password) VALUES (32, 'vinicius.reis', 'vinicius_r_99');
INSERT INTO users (id, name, password) VALUES (33, 'FLAG', 'FLAG{1NJ3T4ND0_C0NH3C1M3NT0}'); 
INSERT INTO users (id, name, password) VALUES (34, 'monica.teixeira', 'monica_t_2026');
INSERT INTO users (id, name, password) VALUES (35, 'andre.medeiros', 'andre_m_devops');
INSERT INTO users (id, name, password) VALUES (36, 'bianca.cavalcante', 'bianca_c_pass');
INSERT INTO users (id, name, password) VALUES (37, 'leonardo.guedes', 'leo_guedes_123');
INSERT INTO users (id, name, password) VALUES (38, 'sabrina.siqueira', 'sabrina_s_bank');
INSERT INTO users (id, name, password) VALUES (39, 'otavio.mesquita', 'otavio_m_99');
INSERT INTO users (id, name, password) VALUES (40, 'priscila.campos', 'pri_campos_2026');
INSERT INTO users (id, name, password) VALUES (41, 'fabio.borges', 'fabio_borges_sec');
INSERT INTO users (id, name, password) VALUES (42, 'luana.cunha', 'luana_cunha_pwd');
INSERT INTO users (id, name, password) VALUES (43, 'igor.azevedo', 'igor_azevedo_12');
INSERT INTO users (id, name, password) VALUES (44, 'natalia.barros', 'nat_barros_2026');
INSERT INTO users (id, name, password) VALUES (45, 'marcus.vinicius', 'marcus_v_bank');
INSERT INTO users (id, name, password) VALUES (46, 'julio.cesar', 'julio_cesar_impar');
INSERT INTO users (id, name, password) VALUES (47, 'helena.rodrigues', 'helena_r_pwd');
INSERT INTO users (id, name, password) VALUES (48, 'antonio.carlos', 'antonio_c_99');
INSERT INTO users (id, name, password) VALUES (49, 'claudia.moraes', 'claudia_m_2026');
INSERT INTO users (id, name, password) VALUES (50, 'rogerio.furtado', 'rogerio_f_sec');
INSERT INTO users (id, name, password) VALUES (51, 'debora.lima', 'debora_lima_bank');
INSERT INTO users (id, name, password) VALUES (52, 'support.desk', 'senhaTemporaria123!');
INSERT INTO users (id, name, password) VALUES (53, 'auditoria_interna', 'Aud1t0r14_2026_S3cur3');
INSERT INTO users (id, name, password) VALUES (54, 'root', 'to_be_or_not_to_be');

CREATE USER IF NOT EXISTS 'sqlinjection'@'%' IDENTIFIED BY 'senha@123';
GRANT ALL PRIVILEGES ON sqlinjection.* TO 'sqlinjection'@'%';
GRANT FILE ON *.* TO 'sqlinjection'@'%';
FLUSH PRIVILEGES;
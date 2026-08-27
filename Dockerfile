FROM php:8.2-apache

# Instala a extensão do MySQL para o PHP
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# --- A MÁGICA ACONTECE AQUI ---
# Adiciona o Apache ao grupo de permissões do MySQL (GID 999). 
# Isso corrige o erro 403 Forbidden permitindo a leitura da Web Shell!
RUN groupadd -g 999 mysql_group || true
RUN usermod -aG 999 www-data

# Copia a aplicação web
COPY index.html /var/www/html/index.html
COPY login.php /var/www/html/login.php

# Cria a FLAG 3 na raiz do sistema operacional do contêiner Web!
RUN echo "FLAG{3_SQL1_T0_RC3_M4ST3R}" > /flag_03.txt
RUN chmod 444 /flag_03.txt

RUN chown -R www-data:www-data /var/www/html/

# CakePHP 5 - Setup Docker
[![Latest Stable Version](https://badgen.net/packagist/lang/monolog/monolog)](https://badgen.net/packagist/lang/monolog/monolog)
[![PHP Version Require](https://badgen.net/badge/php/%3E8.1/green)](https://badgen.net/badge/php/%3E8.1/green)

Framework CakePHP montado com ambiente docker

## Tecnologias e Ferramentas
<img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" /><img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" /><img src="https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E" /><img src="https://img.shields.io/badge/json-5E5C5C?style=for-the-badge&logo=json&logoColor=white" /><img src="https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D" /><img src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white" /><img src="https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white" /><img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" /><img src="https://img.shields.io/badge/Chart.js-FF6384?style=for-the-badge&logo=chartdotjs&logoColor=white" /><img src="https://img.shields.io/badge/Webpack-8DD6F9?style=for-the-badge&logo=Webpack&logoColor=white" />

### Entendendo a Estrutura do framework
1. CakeBook - https://book.cakephp.org/5/en/index.html
2. Entendendo a estrutura com esse curso - https://www.youtube.com/playlist?list=PLyugqHiq-SKf8m05vApCcvpJQ-uPBDxbN

## Passo a passo para Configuração inicial
Clone Repositório
```sh
git clone -b https://github.com/diegocomis/cakephp5-setup.git
```
- No Terminal do PHPStorm ou VSCode;
4. Execute o comando ```docker-compose up``` (esse comando pode levar tempo já que depende da internet e irá gerar o build do PHP na primeira vez);
5. Após a instalação, renomear o `config/app_local.example.php` para `config/app_local.php` conforme abaixo (seção configurações);

## Acessos

- Para acessar o PHP basta executar no terminal: ```docker exec -it cake-php bash```
- Para acessar o phpMyAdmin, abra o navegador no seguinte endereço: http://localhost:8080/
- Para acessar o servidor de email MailHog, abra o navegador no seguinte endereço: http://localhost:8025/



Suba os containers do projeto
```sh
docker-compose up -d
```
Acesse o container cake-php
```sh
docker-compose exec cake-php bash
```
Instale as dependências do projeto
```sh
composer install
```
Se der algum erro na instalação das dependências
```sh
composer update
```

## Configurações

Todas as configurações refentes ao banco de dados estão em: `config/app_local.php` na seção `'Datasources'` e de email na seção `'EmailTransport'`.

Banco de dados:
- 'host' => 'cake-db',
- 'username' => 'root',
- 'password' => 'secret',
- 'database' => 'cakephp_oficina',

Servidor de email:
- 'host' => 'cake-mailhog',
- 'username' => 'user',
- 'password' => 'secret',
- 'port' => '1025',
- 'className' => 'Smtp',

# Para popular o Banco de Dados
As migrações estão feitas por tabela em tabela.
Para gerar o banco de dados localhost, basta acessar o terminal PHP
do Docker com o comando
```sh
docker exec -it cake-php bash
```
Rode o seguinte comando
```sh
cake migrations migrate
```

Acesse o projeto
[http://localhost:8765](http://localhost:8765)

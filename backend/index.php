<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . './vendor/autoload.php'; //para reconhecer classes automaticamente

$app = AppFactory::create(); //cria a aplicação Slim

/*$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Hello world!");
    return $response;
});*/

$app->get('/', function () {
    echo "Hello World!";
    exit;
});

$app->run();
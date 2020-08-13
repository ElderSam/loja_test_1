<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

use \Classes\Model\Employee;

require __DIR__ . './vendor/autoload.php'; //para reconhecer classes automaticamente

$app = AppFactory::create(); //cria a aplicação Slim

/*$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Hello world!");
    return $response;
});*/

$app->get('/', function () {
    echo "OK, Server is running!";
    exit;
});

/* Listar todos os funcionários */
$app->get('/employees', function (Request $request, Response $response) {
    
    $employee = new Employee;
    $response->getBody()->write($employee->list());
    return $response;
});

/* Listar um funcionário por id */
$app->get('/employees/{id}', function (Request $request, Response $response, $args) {
    
    //print_r($args); //Exige os argumentos que recebeu por POST ou GET

    $employee = new Employee;
    $response->getBody()->write($employee->list($args['id']));
    return $response;
});

/* Cadastrar/inserir novo funcionário */
$app->post('/employees', function (Request $request, Response $response) {

    $employee = new Employee;
    $response->getBody()->write($employee->create($_POST));
    return $response;
});

/* Atualizar funcioário */
$app->post('/employees/{id}', function (Request $request, Response $response, $args) {
      
    //POST or PUT
    $allPostPutVars = $request->getParsedBody();

    $employee = new Employee;
    $response->getBody()->write($employee->update($args['id'], $allPostPutVars));
    return $response;
});

/* Excluir funcionário */
$app->delete('/employees/{id}', function (Request $request, Response $response, $args) {

    $employee = new Employee;
    $response->getBody()->write($employee->delete($args['id']));
    return $response;
});

$app->run();
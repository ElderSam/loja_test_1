<?php

namespace Classes\Model;

use Exception;
use \Classes\DB\Sql;

class Employee
{

    /*atributos --------------------------------------*/
    private $id;
    private $nome;
    private $dtNasc;
    private $dtAdmissao;
    private $cargo; //foreign key

    /* construtor --------------------------------------*/
    public function __construct() {}


    /* getters -------------------------------------- */
    public function getId()
    {
        return $this->id;
    }

    public function getNome()
    {
        return $this->nome;
    }

    public function getDtNasc()
    {
        return $this->dtNasc;
    }

    public function getDtAdmissao()
    {
        return $this->dtAdmissao;
    }

    public function getCargo()
    {
        return $this->cargo;
    }

    /* setters -------------------------------------- */
    public function setId($id)
    {
        $this->$id = $id;
    }

    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    public function setDtNasc($dtNasc)
    {
        $this->dtNasc = $dtNasc;
    }

    public function setDtAdmissao($dtAdmissao)
    {
        $this->dtAdmissao = $dtAdmissao;
    }

    public function setCargo($cargo)
    {
        $this->cargo = $cargo;
    }

    /* métodos -------------------------------------- */

    /* lista funcionários */
    public function list($id = false)
    {
        $query = "SELECT * FROM funcionarios";

        if($id)
        {
            $results = $this->listById($query, $id);

        }else
        {
            $results =$this->listAll($query);
        }

        return json_encode($results);
    }

    public function listAll($query)
    {
        $sql = new Sql();

        return $sql->select($query);

    }

    public function listById($query, $id)
    {
        $sql = new Sql();

        $query .= " WHERE id = :id";

        return $sql->select($query, array(
            ":id"=>$id
        ));
    }



}
<?php

class Db
{
    private $_host = '127.0.0.1';

    /**
     * @param string $host
     */
    public function setHost(string $host)
    {
        $this->_host = $host;
    }

    /**
     * @param string $dbname
     */
    public function setDbname(string $dbname)
    {
        $this->_dbname = $dbname;
    }

    /**
     * @param string $user
     */
    public function setUser(string $user)
    {
        $this->_user = $user;
    }

    /**
     * @param string $password
     */
    public function setPassword(string $password)
    {
        $this->_password = $password;
    }

    /**
     * @param int $port
     */
    public function setPort(int $port)
    {
        $this->_port = $port;
    }

    private $_dbname = 'quiz';
    private $_user = 'root';
    private $_password = '';
    private $_port = 3306;
    private $_link = false;


    public function init()
    {
        try {
            $this->_link = new PDO('mysql:dbname=' . $this->_dbname . ';host=' . $this->_host . ";port=" . $this->_port, $this->_user, $this->_password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        } catch (PDOException $e) {
            die('Connexion échouée : ' . $e->getMessage());
        }

    }

    public function selectAll($table)
    {
        $query = "SELECT * FROM $table ";
        $stmt = $this->_link->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function select($table, $parametres)
    {

        $filtre = $this->_prepareParam1($parametres);

        $query = "SELECT * FROM $table WHERE $filtre";

        return $this->_query($query, $table, $parametres);
    }

    public function delete($table, $parametres)
    {

        $filtre = $this->_prepareParam1($parametres);

        $query = "DELETE FROM $table WHERE $filtre";

        return $this->_query($query, $table, $parametres);
    }

    private function _query($query, $table, $parametres)
    {

        $stmt = $this->_link->prepare($query);

        $this->_prepareParam2($parametres, $stmt);

        $stmt->execute();
        return $stmt->fetchAll();
    }

    private function _prepareParam1($parametres)
    {
        $filtre = " 1 = 1 ";

        foreach ($parametres as $key => $p) {
            $filtre .= " AND " . $key . " =:" . $key;
        }

        return $filtre;
    }

    /**
     * @return bool
     */
    public function isLink()
    {
        return $this->_link;
    }

    /**
     * @param bool $link
     */
    public function setLink($link)
    {
        $this->_link = $link;
    }

    private function _prepareParam2($parametres, $stmt)
    {
        foreach ($parametres as $key => $p) {
            $stmt->bindParam(':' . $key, $p, PDO::PARAM_STR);
        }
    }

}


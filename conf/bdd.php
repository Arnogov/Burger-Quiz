<?php

$host = '127.0.0.1';
$dbname = 'quiz';
$user = 'root';
$password = '';

try {
    $dbh = new PDO('mysql:dbname=' . $dbname . ';host=' . $host . ";port=3306", $user, $password);
} catch (PDOException $e) {
    die('Connexion échouée : ' . $e->getMessage());
}


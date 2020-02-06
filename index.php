<?php
//connect bdd

ini_set("display_errors", 1);
error_reporting(E_ALL);


session_start();

require "class/bdd.php";
$db = new Db();
$db->init();
require "conf/bdd.php";


if (isset($_GET["dec"])) {
    $_SESSION["isConnected"] = false;
    $_SESSION["utilisateurConnected"] = false;
}

if (!isset($_SESSION["isConnected"])) $_SESSION["isConnected"] = false;
require "parts/header.php";



if (isset($_GET["page"])) {

    $page = "pages/" . $_GET["page"] . ".php";

    if (file_exists($page)) {
        require $page;
    } else {
        require "pages/404.php";
    }

} else {
    require "pages/home.php";
}

require "parts/footer.php";

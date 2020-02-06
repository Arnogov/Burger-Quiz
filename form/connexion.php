<?php

session_start();

require "../conf/bdd.php";

if (!empty($_POST["nom"]) && !empty($_POST["prenom"])) {
    $form = true;


    $sql = "SELECT * FROM utilisateurs WHERE nom =:n AND prenom =:p";
    $statement = $dbh->prepare($sql);
    $statement->bindParam(":n", $_POST["nom"]);
    $statement->bindParam(":p", $_POST["prenom"]);
    $resultat = $statement->execute();

    if ($resultat) {
        $data = $statement->fetch();
    } else {
        echo "erreur de serveur";
    }

    if ($data !== false) {
        if (password_verify($_POST["mdp"], $data["password"])) {

            $_SESSION["utilisateurConnected"] = $data;
            $_SESSION["isConnected"] = true;

            header("Location: ../index.php?form=ok");


        } else {
            echo "erreur de mot de passe";
        }


    } else {
        echo "aucun utilisateur qui correspond";
    }
} else {

}
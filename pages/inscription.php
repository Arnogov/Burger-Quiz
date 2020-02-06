<?php

$form = false;


if (!empty($_POST["nom"]) && !empty($_POST["prenom"])) {
    $form = true;
    $passHash = password_hash($_POST["mdp"], PASSWORD_BCRYPT);

    $sql = "INSERT INTO utilisateurs(nom, prenom, password) VALUES(:n, :p, :pwd)";
    $statement = $dbh->prepare($sql);
    $statement->bindParam(":n", $_POST["nom"]);
    $statement->bindParam(":p", $_POST["prenom"]);
    $statement->bindParam(":pwd", $passHash);

    $resultat = $statement->execute();

}
if ($form && $resultat)
{
    include("home.php");
} else {


?>

<section class="page-section portfolio" id="portfolio">
    <div class="container">


        <div class="col-md-12 col-lg-4">

            <?php


            if ($form && !$resultat) echo "nok";



            ?>

            <form action="index.php?page=inscription" method="post">
                <br>
                <label for="c1">Nom :</label>
                <br>
                <input name="nom"/>
                <br>
                <label for="c2">Prénom :</label>
                <br>
                <input name="prenom"/>
                <br>
                <label for="c3">Mot de passe :</label>
                <br>
                <input type="password" name="mdp"/>
                <br>
                <input type="submit"/>

            </form>

        </div>

    </div>


    <?php } ?>

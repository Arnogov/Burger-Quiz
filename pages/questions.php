<?php

if (!$_SESSION["isConnected"]) {
    header("Location: index.php?page=connexion");
    die();
}

?>


<header class="masthead text-center text-white">
    <div class="masthead-content">
        <div class="container">


            <h1>QUESTIONS</h1>

            <form method="POST" action="index.php?page=reponses" name="resultat">
                <ul>
                    <?php foreach ($db->selectAll("questions") as $question) : ?>
                        <li>
                        <br>
                        <?php echo($question["libelle"]); ?>
                        <br>
                        <?php foreach ($db->select("reponses", array("questions_id" => $question["id"])) as $choice)  : ?>
                            <li>
                                <input type="radio" name="choice[<?php echo($question["id"]); ?>]"
                                       value="<?php echo($choice["id"]); ?>">
                                <?php echo($choice["libelle"]); ?>
                            </li>
                        <?php endforeach; ?>
                        </li>
                    <?php endforeach; ?>
                    <br>
                </ul>
                <input type="submit" value="Valider">
            </form>
        </div>
    </div>
</header>
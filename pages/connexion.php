<section class="page-section portfolio" id="portfolio">
    <div class="container">

        <?php

        $form = false;


        ?>

        <div class="col-md-12 col-lg-4">

            <?php

            if ($form && $resultat) echo "ok";
            if ($form && !$resultat) echo "nok";

            ?>

            <form action="form/connexion.php" method="post">
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
</section>
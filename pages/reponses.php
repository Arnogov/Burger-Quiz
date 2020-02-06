<header class="masthead text-center text-white">
    <div class="masthead-content">
        <div class="container">


            <h1>REPONSES</h1>

            <form method="POST">
                <body>

                <p>Les bonnes réponses sont : </p>
                <ul>
                    <?php

                    $score = 0;

                    foreach ($db->selectAll("questions") as $question) : ?>
                        <li>
                            <br>
                            <?php echo($question["libelle"]); ?>
                            <br>
                            <br>

                            <?php

                            $stmt = $dbh->prepare("SELECT * FROM reponses WHERE bonneReponse = :br AND questions_id = :q");
                            $stmt->execute(array("br" => 1, "q" => $question["id"]));
                            $reponses = $stmt->fetchAll();


                            foreach ($reponses as $choice):


                                if (isset($_POST["choice"][$question["id"]]) && $choice["id"] === $_POST["choice"][$question["id"]]) {
                                    $score ++;
                                }

                                echo $choice[1] . '<br>';
                            endforeach;

                            ?>
                        </li>
                    <?php endforeach; ?>
                    <br>

                    Score : <?php echo $score; ?> / 15
                </ul>
            </form>
        </div>


        </body>
        </html>


    </div>
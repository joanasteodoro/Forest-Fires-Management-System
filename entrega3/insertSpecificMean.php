<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $numMeio = $_REQUEST['numMeio'];
    $entidade = $_REQUEST['nomeEntidade'];
    $table = $_REQUEST['table'];
    $nomeMeio = $_REQUEST['nomeMeio'];

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


        $sql3 = "SELECT * FROM meio WHERE (numMeio = :numMeio AND nomeEntidade = :nomeEntidade) ;";
        $sql1 = "INSERT INTO meio values (:numMeio, :nomeMeio, :nomeEntidade);";
        $sql2 = "INSERT INTO $table values (:numMeio, :nomeEntidade);";
        echo("<p>$table</p>");
        //echo("<p>$PS</p>");


        if($result3->rowCount() == 0){
	          $result1 = $db->prepare($sql1);
            $result1->execute([':numMeio' => $numMeio, ':nomeEntidade' => $entidade, ':nomeMeio' => $nomeMeio]);
        }

        $result2 = $db->prepare($sql2);
        $result2->execute([':numMeio' => $numMeio, ':nomeEntidade' => $entidade]);
        echo("<p>$result</p>");

        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>

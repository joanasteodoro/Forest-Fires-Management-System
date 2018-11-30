<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $nomeEntidade = $_REQUEST['nomeEntidade'];
    $numMeio = $_REQUEST['numMeio'];

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	      $db->beginTransaction();

        $sql1 = "DELETE FROM alocado WHERE numMeio = :numMeio AND nomeEntidade = :nomeEntidade;";
        $sql2 = "DELETE FROM transporta WHERE numMeio = :numMeio AND nomeEntidade = :nomeEntidade;";
        $sql3 = "DELETE FROM audita WHERE numMeio = :numMeio AND nomeEntidade = :nomeEntidade;";
        $sql4 = "DELETE FROM acciona WHERE numMeio = :numMeio AND nomeEntidade = :nomeEntidade;";
        $sql5 = "DELETE FROM meio WHERE (numMeio = (:numMeio) AND nomeEntidade = (:nomeEntidade));";


        $result1 = $db->prepare($sql1);
        $result1->execute([':numMeio' => $numMeio, ':nomeEntidade' => $nomeEntidade]);
        $result2 = $db->prepare($sql2);
        $result2->execute([':numMeio' => $numMeio, ':nomeEntidade' => $nomeEntidade]);
        $result3 = $db->prepare($sql3);
        $result3->execute([':numMeio' => $numMeio, ':nomeEntidade' => $nomeEntidade]);
        $result4 = $db->prepare($sql4);
        $result4->execute([':numMeio' => $numMeio, ':nomeEntidade' => $nomeEntidade]);
        $result5 = $db->prepare($sql5);
        $result5->execute([':numMeio' => $numMeio, ':nomeEntidade' => $nomeEntidade]);
        echo("<p>$numMeio</p>");
        echo("<button class=\"option\" onclick = \"location.href = 'index.html';\">Back to home page</button></br></br>");


	      $db->commit();
        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>

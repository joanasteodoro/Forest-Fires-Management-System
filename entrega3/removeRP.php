<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $numProcessoSocorro = $_REQUEST['numProcessoSocorro'];


    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	      $db->beginTransaction();


        $sql1 = "DELETE FROM transporta WHERE numProcessoSocorro = :numProcessoSocorro;";
        $sql2 = "DELETE FROM eventoEmergencia WHERE numProcessoSocorro = :numProcessoSocorro;";
        $sql3 = "DELETE FROM alocado WHERE numProcessoSocorro = :numProcessoSocorro;";
        $sql4 = "DELETE FROM audita WHERE numProcessoSocorro = :numProcessoSocorro;";
        $sql5 = "DELETE FROM acciona WHERE numProcessoSocorro = :numProcessoSocorro;";
        $sql6 = "DELETE FROM processoSocorro WHERE numProcessoSocorro = :numProcessoSocorro;";
        echo("<p>$numProcessoSocorro</p>");
        //echo("<p>$PS</p>");

        $result1 = $db->prepare($sql1);
        $result1->execute([':numProcessoSocorro' => $numProcessoSocorro]);
        $result2 = $db->prepare($sql2);
        $result2->execute([':numProcessoSocorro' => $numProcessoSocorro]);
        $result3 = $db->prepare($sql3);
        $result3->execute([':numProcessoSocorro' => $numProcessoSocorro]);
        $result4 = $db->prepare($sql4);
        $result4->execute([':numProcessoSocorro' => $numProcessoSocorro]);
        $result5 = $db->prepare($sql5);
        $result5->execute([':numProcessoSocorro' => $numProcessoSocorro]);
        $result6 = $db->prepare($sql6);
        $result6->execute([':numProcessoSocorro' => $numProcessoSocorro]);
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

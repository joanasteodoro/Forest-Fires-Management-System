<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $numMeio = $_REQUEST['numMeio'];
    $entidade = $_REQUEST['nomeEntidade'];
    $table = $_REQUEST['table'];
    $oldNumMeio = $_REQUEST['oldNumMeio'];
    $oldNomeEntidade = $_REQUEST['oldNomeEntidade'];

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        //$sql1 = "UPDATE meio SET numMeio = :numMeio, nomeEntidade = :nomeEntidade WHERE (numMeio = :oldNumMeio AND nomeEntidade = :oldNomeEntidade);";
        $sql2 = "UPDATE $table SET numMeio = :numMeio, nomeEntidade = :nomeEntidade WHERE (numMeio = :oldNumMeio AND nomeEntidade = :oldNomeEntidade);";
        echo("<p>$table</p>");
        //echo("<p>$PS</p>");


        //$result1 = $db->prepare($sql1);
        //$result1->execute([':numMeio' => $numMeio, ':nomeEntidade' => $entidade, ':oldNumMeio' => $oldNumMeio, ':oldNomeEntidade' => $oldNomeEntidade]);

        $result2 = $db->prepare($sql2);
        $result2->execute([':numMeio' => $numMeio, ':nomeEntidade' => $entidade, ':oldNumMeio' => $oldNumMeio, ':oldNomeEntidade' => $oldNomeEntidade]);
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

<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $numMeio = $_REQUEST['numMeio'];
    $entidade = $_REQUEST['nomeEntidade'];
    $table = $_REQUEST['table'];
    $oldNumMeio = $_REQUEST['oldNumMeio'];
    $oldNomeEntidade = $_REQUEST['oldNomeEntidade'];
    $nomeMeio = $_REQUEST['nomeMeio'];

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$db->beginTransaction();

        $sql1 = "UPDATE meio SET nomeMeio = :nomeMeio WHERE (numMeio = :oldNumMeio AND nomeEntidade = :oldNomeEntidade);";
        echo("<p>$table</p>");


        $result1 = $db->prepare($sql1);
        $result1->execute([':nomeMeio' => $nomeMeio, ':oldNumMeio' => $oldNumMeio, ':oldNomeEntidade' => $oldNomeEntidade]);

        echo("<p>$result</p>");

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

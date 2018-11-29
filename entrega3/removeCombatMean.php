<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $numMeio = $_REQUEST['numMeio'];
    $nomeEntidade = $_REQUEST['nomeEntidade'];

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $db->beginTransaction();
	
        $sql = "DELETE FROM meioCombate WHERE numMeio = :numMeio AND nomeEntidade = :nomeEntidade;";

        $result = $db->prepare($sql);
        $result->execute([':numMeio' => $numMeio, ':nomeEntidade' => $nomeEntidade]);
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

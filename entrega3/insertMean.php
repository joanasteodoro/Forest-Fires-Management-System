<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $numMeio = $_REQUEST['numMeio'];
    $nomeMeio= $_REQUEST['nomeMeio'];
    $entidade= $_REQUEST['nomeEntidade'];

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "INSERT INTO meio values (:numMeio, :nomeMeio, :nomeEntidade);";
        //echo("<p>$morada</p>");
        //echo("<p>$PS</p>");


        $result = $db->prepare($sql);
        $result->execute([':numMeio' => $numMeio, ':nomeMeio' => $nomeMeio, ':nomeEntidade' => $entidade]);
        echo("<p>$numMeio</p>");

        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>

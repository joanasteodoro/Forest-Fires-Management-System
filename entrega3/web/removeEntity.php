<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $nomeEntidade = $_REQUEST['nomeEntidade'];

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "DELETE FROM entidadeMeio WHERE nomeEntidade = (:nomeEntidade);";
        echo("<p>$nomeEntidade</p>");
        //echo("<p>$PS</p>");


        $result = $db->prepare($sql);
        $result->execute([':nomeEntidade' => $nomeEntidade]);
        echo("<button class=\"option\" onclick = \"location.href = 'index.html';\">Back to home page</button></br></br>");


        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>

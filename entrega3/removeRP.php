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

        $sql = "DELETE FROM processoSocorro WHERE numProcessoSocorro = :numProcessoSocorro;";
        echo("<p>$numProcessoSocorro</p>");
        //echo("<p>$PS</p>");


        $result = $db->prepare($sql);
        $result->execute([':numProcessoSocorro' => $numProcessoSocorro]);
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

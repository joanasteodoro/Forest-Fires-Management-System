<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $nomeEntid = $_REQUEST['nomeEntidade'];
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

        $sql = "DELETE FROM $table WHERE numMeio = (:numMeio);";
        echo("<p>$numMeio</p>");
        //echo("<p>$PS</p>");


        $result = $db->prepare($sql);
        $result->execute([':numMeio' => $numMeio]);
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

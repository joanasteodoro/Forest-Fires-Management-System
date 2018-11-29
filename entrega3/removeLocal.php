<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $morada = $_REQUEST['moradaLocal'];

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql1 = "DELETE FROM vigia WHERE moradaLocal = (:moradaLocal);";
        $sql1 = "DELETE FROM vigia WHERE moradaLocal = (:moradaLocal);";
        $sql2 = "DELETE FROM local WHERE moradaLocal = (:moradaLocal);";
        echo("<p>$morada</p>");
        //echo("<p>$PS</p>");


        $result1 = $db->prepare($sql1);
        $result1->execute([':moradaLocal' => $morada]);

        $result2 = $db->prepare($sql2);
        $result2->execute([':moradaLocal' => $morada]);
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

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
	$db->beginTransaction();

        $sql = "INSERT INTO local values (:moradaLocal);";
        echo("<p>$morada</p>");
        //echo("<p>$PS</p>");


        $result = $db->prepare($sql);
        $result->execute([':moradaLocal' => $morada]);
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

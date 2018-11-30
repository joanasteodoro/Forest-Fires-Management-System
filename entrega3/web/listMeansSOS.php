<html>
    <body>
      <link rel="stylesheet" href="index.css">
    <h3>SOS Means of a Rescue Process at a certain Local</h3><!--ê-->
<?php
    $moradaLocal = $_REQUEST['moradaLocal'];
    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;

        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT numMeio, nomeEntidade FROM acciona NATURAL JOIN meioSocorro NATURAL JOIN eventoEmergencia WHERE moradaLocal = :moradaLocal ;";

        $result = $db->prepare($sql);
        $result->execute([':moradaLocal' => $moradaLocal]);

        echo("<table border=\"0\" cellspacing=\"5\">\n");
        echo("<tr>\n");
        echo("<td>Numero do Meio</td>\n");//ú
        echo("<td>Nome da Entidade</td>\n");
        foreach($result as $row)
        {
            echo("<tr>\n");
            echo("<td>{$row[0]}</td>\n");
            echo("<td>{$row[1]}</td>\n");

            //echo("<td><a href=\"balance.php?account_number={$row['account_number']}\">Change balance</a></td>\n");
            echo("</tr>\n");
        }
        echo("</table>\n");

        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>

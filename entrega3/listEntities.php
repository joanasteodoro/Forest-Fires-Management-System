<html>
    <body>
      <link rel="stylesheet" href="index.css">
    <h3>Entities</h3><!--ê-->
<?php
    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;

        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT * FROM entidadeMeio;";

        $result = $db->prepare($sql);
        $result->execute();

        echo("<table border=\"0\" cellspacing=\"5\">\n");
        echo("<tr>\n");
        echo("<td>nomeEntidade</td>\n");
        echo("<td id='edit'><a href=\"insertEntityRequest.php\">Insert</a></td>\n");
        foreach($result as $row)
        {
            echo("<tr>\n");
            echo("<td>{$row[0]}</td>\n");

            echo("<td id='edit'><a href=\"removeEntity.php?nomeEntidade={$row[0]}\">Remove</a></td>\n");
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

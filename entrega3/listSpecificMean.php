<html>
    <body>
      <link rel="stylesheet" href="index.css">
    <h3>Means</h3><!--ê-->
<?php
    $table = $_REQUEST['table'];
    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;

        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT * FROM $table;";

        $result = $db->prepare($sql);
        $result->execute();

        echo("<table border=\"0\" cellspacing=\"5\">\n");
        echo("<tr>\n");
        echo("<td>Mean Number</td>\n");
        echo("<td>Entity Name</td>\n");
        echo("<td id='edit'><a href=\"insertSpecificMeanRequest.php?table={$table}\">Insert</a></td>\n");
        foreach($result as $row)
        {
            echo("<tr>\n");
            echo("<td>{$row[0]}</td>\n");
            echo("<td>{$row[1]}</td>");

            echo("<td id='edit'><a href=\"editMeanRequest.php?table={$table}&oldNumMeio={$row[0]}&oldNomeEntidade={$row[1]}\">Edit</a></td>\n");
            if($table == "meioSocorro"){
              echo("<td id='edit'><a href=\"removeRescueMean.php?numMeio={$row[0]}&nomeEntidade={$row[1]}\">Remove</a></td>\n");
            }
            elseif ($table == "meioCombate") {
              echo("<td id='edit'><a href=\"removeCombatMean.php?numMeio={$row[0]}&nomeEntidade={$row[1]}\">Remove</a></td>\n");
            }
            elseif ($table == "meioApoio") {
              echo("<td id='edit'><a href=\"removeSupportMean.php?numMeio={$row[0]}&nomeEntidade={$row[1]}\">Remove</a></td>\n");
            }
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

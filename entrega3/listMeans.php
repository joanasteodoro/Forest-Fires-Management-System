<html>
    <body>
      <link rel="stylesheet" href="index.css">
    <h3>Means</h3><!--ê-->
<?php
    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;

        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT * FROM meio;";

        $result = $db->prepare($sql);
        $result->execute();

        echo("<table border=\"0\" cellspacing=\"5\">\n");
        echo("<tr>\n");
        echo("<td>Mean Number</td>\n");
        echo("<td>Mean Name</td>\n");
        echo("<td>Entity Name</td>\n");
        foreach($result as $row)
        {
            echo("<tr>\n");
            echo("<td>{$row[0]}</td>\n");
            echo("<td>{$row[1]}</td>\n");
            echo("<td>{$row[2]}</td>\n");

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

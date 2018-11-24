<html>
    <body>
    <h3>Meios Accionados</h3><!--ê-->
<?php
    $PS = $_REQUEST['numprocessosocorro'];
    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;

        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT numMeio, nomeEntidade FROM acciona WHERE numprocessosocorro = :numprocessosocorro ;";

        $result = $db->prepare($sql);
        $result->execute([':numprocessosocorro' => $PS]);

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

<html>
    <body>
    <h3>Eventos de Emergencia</h3><!--ê-->
<?php
    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;

        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT * FROM eventoEmergencia;";

        $result = $db->prepare($sql);
        $result->execute();

        echo("<table border=\"0\" cellspacing=\"5\">\n");
        echo("<tr>\n");
        echo("<td>Numero de Telefone</td>\n");//ú
        echo("<td>Instante da Chamada</td>\n");
        echo("<td>Nome da Testemunha</td>\n");
        echo("<td>Morada</td>\n");
        echo("<td>Processo de Socorro</td>\n");
        foreach($result as $row)
        {
            echo("<tr>\n");
            echo("<td>{$row[0]}</td>\n");
            echo("<td>{$row[1]}</td>\n");
            echo("<td>{$row[2]}</td>\n");
            echo("<td>{$row[3]}</td>\n");
            echo("<td>{$row[4]}</td>\n");

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

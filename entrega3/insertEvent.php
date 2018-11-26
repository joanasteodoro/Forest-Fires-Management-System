<html>
    <body>
      <link rel="stylesheet" href="index.css">
<?php
    $numTele = $_REQUEST['numTelefone'];
    $instante = $_REQUEST['instanteChamada'];
    $nome = $_REQUEST['nomePessoa'];
    $morada = $_REQUEST['moradaLocal'];
    $PS = $_REQUEST['numProcessoSocorro'];

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186514";
        $password = "916JEPhav";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        //$sql1 = "INSERT INTO processoSocorro values (:numProcessoSocorro);";
        $sql2 = "INSERT INTO eventoEmergencia values (:numTelefone, :instanteChamada, :nomePessoa,	:moradaLocal, :numProcessoSocorro);";
        echo("<p>$numTele</p>");
        echo("<p>$instante</p>");
        echo("<p>$nome</p>");
        echo("<p>$morada</p>");
        //echo("<p>$PS</p>");


        $result = $db->prepare($sql2);
        $result->execute([':numTelefone' => $numTele, ':instanteChamada' => $instante, ':nomePessoa' => $nome, ':moradaLocal' => $morada, ':numProcessoSocorro' => $PS]);
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

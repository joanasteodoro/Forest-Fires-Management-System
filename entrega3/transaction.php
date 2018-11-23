<html>
    <body>
<?php
    $account_number = $_REQUEST['account_number'];
    $account_number2 = $_REQUEST['account_number2'];
    $sum = $_REQUEST['sum'];
    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist186440";
        $password = "vttg5480";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql1 = "UPDATE account SET balance = balance - :sum WHERE account_number = :account_number;";
        $sql2 = "UPDATE account SET balance = balance + :sum WHERE account_number = :account_number2;";
        echo("<p>$sql</p>");

        $result1 = $db->prepare($sql1);
        //$result1 = $db->prepare($sql2);
        $result2 = $db->prepare($sql2);
        $result1->execute([':sum' => $sum, ':account_number' => $account_number]);
        $result2->execute([':sum' => $sum, ':account_number2' => $account_number2]);

        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>

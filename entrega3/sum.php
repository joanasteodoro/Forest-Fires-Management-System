<html>
    <body>
        <h3>Make a transaction from <?=$_REQUEST['account_number']?></h3>
        <form action="transaction.php" method="post">
          <p><input type="hidden" name="account_number" value="<?=$_REQUEST['account_number']?>"/></p>
          <p>Destination account: <input type="text" name="account_number2"/></p>
          <p>Transaction sum: <input type="text" name="sum"/></p>
          <p><input type="submit" value="Submit"/></p>
        </form>
    </body>
</html>

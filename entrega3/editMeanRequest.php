<html>
    <body>
      <link rel="stylesheet" href="index.css">
        <h3>Edit <?=$_REQUEST['table']?></h3>
        <form action="editMean.php" method="post">
            <p><input type="hidden" name="table" value="<?=$_REQUEST['table']?>"/></p>
            <p>Mean Number: <input type="text" name="numMeio"/></p>
            <p>Entity name: <input type="text" name="nomeEntidade"/></p>

            <p><input type="submit" value="Submit"/></p>
        </form>
    </body>
</html>

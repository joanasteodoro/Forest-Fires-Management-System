<html>
    <body>
      <link rel="stylesheet" href="index.css">
        <h3>Edit <?=$_REQUEST['table']; $_REQUEST['oldNumMeio']; $_REQUEST['oldNomeEntidade'];?></h3>
        <form action="editMean.php" method="post">
            <p><input type="hidden" name="table" value="<?=$_REQUEST['table']?>"/></p>
            <p><input type="hidden" name="oldNumMeio" value="<?=$_REQUEST['oldNumMeio']?>"/></p>
            <p><input type="hidden" name="oldNomeEntidade" value="<?=$_REQUEST['oldNomeEntidade']?>"/></p>
            <p>Mean Number: <input type="text" name="numMeio"/></p>
            <p>Entity name: <input type="text" name="nomeEntidade"/></p>

            <p><input type="submit" value="Submit"/></p>
        </form>
    </body>
</html>

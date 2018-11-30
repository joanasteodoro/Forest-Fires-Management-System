<html>
    <body>
      <link rel="stylesheet" href="index.css">
        <h3>Edit <?=$_REQUEST['table']; $_REQUEST['oldNumMeio']; $_REQUEST['oldNomeEntidade'];?></h3>
        <form action="editMean.php" method="post">
            <p><input type="hidden" name="table" value="<?=$_REQUEST['table']?>"/></p>
            <p><input type="hidden" name="oldNumMeio" value="<?=$_REQUEST['oldNumMeio']?>"/></p>
            <p><input type="hidden" name="oldNomeEntidade" value="<?=$_REQUEST['oldNomeEntidade']?>"/></p>
            <p>New Mean Name: <input type="text" name="nomeMeio"/></p>

            <p><input type="submit" value="Submit"/></p>
        </form>
    </body>
</html>

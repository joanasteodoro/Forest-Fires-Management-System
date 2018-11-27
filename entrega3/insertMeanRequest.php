<html>
    <body>
      <link rel="stylesheet" href="index.css">
        <h3>Insert <?=$_REQUEST['table']; $_REQUEST['nomeMeio']?></h3>
        <form action="insertMean.php" method="post">
            <p><input type="hidden" name="table" value="<?=$_REQUEST['table']?>"/></p>
            <p><input type="hidden" name="nomeMeio" value="<?=$_REQUEST['nomeMeio']?>"/></p>
            <p>Mean Number: <input type="text" name="numMeio"/></p>
            <p>Entity name: <input type="text" name="nomeEntidade"/></p>


            <p><input type="submit" value="Submit"/></p>
        </form>
    </body>
</html>

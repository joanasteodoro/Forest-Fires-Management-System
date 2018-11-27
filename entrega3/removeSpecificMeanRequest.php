<html>
    <body>
      <link rel="stylesheet" href="index.css">
        <h3>Remove <?=$_REQUEST['table']?></h3>
        <form action="removeSpecificMean.php" method="post">
            <p><input type="hidden" name="table" value="<?=$_REQUEST['table']?>"/></p>
            <p>Mean Number: <input type="text" name="numMeio"/></p>


            <p><input type="submit" value="Submit"/></p>
        </form>
    </body>
</html>

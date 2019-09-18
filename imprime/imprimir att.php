<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Relatório</title>
</head>
<style>
    /* #imprimir{
        float:right;
        margin-right:24%;        
    }
    body{
        margin:0;
        padding:0;
        
    }
    header{
    background-color: black;
    font-size:24px;
    font-family:sans-serif;
    } */
    h1{
        left: 50%;
        transform: translate(-50%,-50%);
        position: absolute;
    }
    table{
        left: 50%;
        top: 15%;
        transform: translate(-50%,-50%);
        position: absolute;
    }
    .botao{
        float: right;
        position: relative;
        background: transparent;
        border: none;
        outline: none;
        color: #fff;
        background: #03a9f4;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
    }
    
</style>
<body>

    <?php
        $oCon = mysqli_connect('localhost','root','','db_LojaOrangeGeek');
    
        $cSql = "SELECT idcliente, id, nomecliente, formadepagamento, parcelas from Pedidos";
        
        $oDados = mysqli_query($oCon,$cSql);

      ?>
    <form>
        <div>
            <h1 class="titulo">l&l moveis</h1>
        </div>
        <div id="imprimir">
            <table border="1"  >
                <thead>
                    <tr>
                        <th>Código do Cliente </th>
                        <th>Código da Compra</th>
                        <th>Nome do Cliente</th>
                        <th>Tipo de Pagamento</th>
                        <th>Numero de Parcelas</th>
                        <th>Entrada</th>
                        <th>Saída</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    while($vReg=mysqli_fetch_assoc($oDados)){
                        echo '<tr><td>'.$vReg['idcliente'].'</td>';
                        echo '<td>'.$vReg['id'].'</td>';
                        echo '<td>'.$vReg['nomecliente'].'</td>';
                        echo '<td>'.$vReg['formadepagamento'].'</td>';
                        echo '<td>'.$vReg['parcelas'].'</td></tr>';
                    }
                    ?>
                    <tr>
                </tbody>
            </table>
        </div>

                 <input class="botao" type="button" value="Imprimir" onClick="window.print()"/>
        </form>
       <?php
            mysqli_free_result($oDados);
            mysqli_close($oCon);    
         ?>


</body>

</html>
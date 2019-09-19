<?php
    $oCon = mysqli_connect('localhost','root','','db_LojaOrangeGeek');
    mysqli_set_charset($oCon, 'utf8');
    
    $cSql = "SELECT 
	    pedid,
        pedidvendedor,
        fncnome,
        pedidcliente,
        clinome,
        clicpf,
        clicep,
        cliendereco,
        clinumero,
        clicomplemento,
        clibairro,
        clicidade,
        cliuf,
        clitelefone,
        clicelular,
        clioperadora,
        pedidproduto,
        prdnome,
        pedqtde,
        pedvalor,
        peddesconto,
        pedtotal,
        pedformadepagamento,
        pedparcelas,
        peddtvenda
        from Pedidos
        inner join Funcionarios
        on pedidvendedor = Fncid
        inner join Clientes
        on pedidcliente = cliid
        inner join Produtos
        on pedidproduto = prdid
        order by pedid";

    $oDados = mysqli_query($oCon,$cSql);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Relatório</title>
</head>
<style>
    body{
        margin: 0;
        padding: 0;
    }
    table{
        /* border: 2px dotted black; Definindo o estilo da borda */
        background-color: #ebebeb; /*Cor de fundo para melhor visualização do exemplo*/
    }
    label{
        display: block; 
    }
    .bordacortada > th, .bordacortada > td{
        border: 2px dotted black;
    }
    .bordalateral > th:nth-child(1), .bordalateral > th:nth-child(2), .bordalateral > th:nth-child(3), .bordalateral > th:nth-child(4), .bordalateral > th:nth-child(4){
        border-right: 2px dotted black;
    }
</style>
<body>
    <section>
        <form>
            <table>
            <thead>
                <tr class="bordacortada">
                    <th colspan="1">
                        <label>L&L</label>
                        <label>Moveis</label>
                    </th>
                    <th  colspan="2">
                        <label>Loja 1</label>
                        <label>VENDEDOR</label>
                        <?php
                            $vReg = mysqli_fetch_array($oDados);
                            echo'<label>'.$vReg['fncnome'].'</label>';
                        ?>
                    </th>
                    <th  colspan="4">
                        <label>Pedido</label>
                        <label>65465461689</label>
                        <label>DATA</label>
                        <label>11/09/19</label>
                    </th>
                    <th colspan= 5>
                        <label>L&L MOVEIS E COLCHOES LTDA.</label>
                        <label>TELEFONE</label>
                        <label>RUA</label>
                        <label>CIDADE - ESTADO</label>
                    </th>
                </tr>
                </thead>
                <tbody>
                    <tr class="bordacortada">
                        <td colspan="12">
                            <p class="meiolinha">13216546546</p>
                            <?php echo'<p>CODIGO:  '.$vReg['pedid'].' - '.$vReg['clinome'].' CPF: '.$vReg['clicpf']?> NASC: < data de nascimento ></p>
                            <?php echo'<p>ENDEREÇO: '.$vReg['cliendereco'].' - '.$vReg['clibairro']?></p>
                            <?php echo'<p>'.$vReg['clicidade'].' - '.$vReg['cliuf'].' TELEFONE: '.$vReg['clitelefone'].' Celular: '.$vReg['clicelular']?></p>
                            <?php echo'<p>CEP: '.$vReg['clicep']?></p>
                            <p>Ja . via - CONTABILIDADE</p>
                        </td>
                    </tr>
                    <tr colspan ="12"class="bordalateral">
                        <th colspan="1">ORIG</th>
                        <th colspan="1">COD</th>
                        <th colspan="6">PRODUTO</th>
                        <th>QTDE</th>
                        <th>PREÇO</th>
                        <th>TOTAL</th>
                    </tr>
                    <tr colspan="12">
                        <td>123</td>
                        <td>1</td>
                        <td>Produto<td>
                        <td>10<td>
                        <td>15.00<td>
                        <td>150.00<td>
                    </tr>
                <tbody>
            </table>
        </form>
    </section>
</body>

</html>
create database db_LojaOrangeGeek;

use db_LojaOrangeGeek;


create table Clientes -- TABELA DE CLIENTES
(
	cliid int primary key auto_increment, -- CODIGO DO CLIENTE
    clinome varchar(150) not null, -- NOME DO USUARIO
    clicpf varchar(12) not null, -- CPF DO CLIENTE
    clirg varchar(11) not null, -- RG DO CLIENTE
    clicep varchar(9) not null, -- CEP DO CLIENTE
    cliendereco varchar(200) not null, -- ENDEREÇO DO CLIENTE
    clinumero varchar(5) not null, -- NUMERO DO ENDEREÇO DO CLIENTE
    clicomplemento varchar(30) not null, -- COMPLEMENTO DA CASA DO CLIENTE
    clibairro varchar(30) not null, -- BAIRRO DO CLIENTE
    clicidade varchar(30) not null, -- CIDADE DO CLIENTE
    cliuf char(2), -- UF DO CLIENTE
    clitelefone varchar(14) not null, -- TELEFONE DO CLIENTE
    clicelular varchar(15), -- CELULAR DO CLIENTE
    clioperadora varchar(10) -- OPERADORA DO CLIENTE
)default charset utf8;

create table Grupos -- TABELA GRUPO
(
	grpid int primary key auto_increment, -- CODIGO DO GRUPO
    grpnome varchar(150) not null -- GRUPO DO PRODUTO
)default charset utf8;

create table Representantes -- TABELA REPRESENTATE
(
	rptid int primary key auto_increment, -- CODIGO DO REPRESENTANTE
    rptnome varchar(150) not null, -- NOME DO REPRESENTANTE
    rptcpf varchar(12)not null, -- CPF DO REPRENSENTATE
    rptrg varchar(11) not null, -- RG DO REPRESENTANTE
    rptcelular varchar(15) not null, -- CELULAR DO REPRESENTANTE
    rpttelefone varchar(14) not null, -- TELEFONE DO REPRESENTATE
    rptemail varchar(150) -- EMAIL DO REPRESENTATE
)default charset utf8;

create table Fornecedores -- TABELA DO FORNECEDOR
(
	fndid int primary key auto_increment, -- CODIGO DO FORNECEDOR
    fndcnpj varchar(14) not null, -- CNPJ DO FORNECEDOR
    fndnomefatasia varchar(150) not null, -- NOME FANTASIA DO FORNECEDOR
    fndcep varchar(9) not null, -- CEP DO FORNECEDOR
    fndendereco varchar(200) not null, -- ENDERECO DO FORNECEDOR
    fndnumero varchar(5) not null, -- NUMERO DO FORNECEDOR
    fndcomplemento varchar(30) not null, -- COMPLEMTENTO DO ENDEREÇO DO FORNECEDOR
    fndbairro varchar(30) not null, -- BAIRRO DO FORNECEDOR
    fndcidade varchar(30) not null, -- CIDADE DO FORNECEDOR
    fnduf char(2), -- UF DO FORNCEDOR  
    fndtelefone varchar(11) not null, -- TELEFONE DO FORNECEDOR
    fndemail varchar(150) not null, -- EMAIL DO FORNECEDOR
    fndfornrepresent int, -- REPRESENTANTE DO FORNECEDOR
    constraint foreign key(fndfornrepresent) references Representantes(rptid) -- REFERENCIA A O CAMPO fornrepresent AO  CODIGO DO REPRESENTANTE DA TABELA REPRESENTANTE
)default charset utf8;

create table Produtos -- TABELA DOS PRODUTOS
(
	prdid int primary key auto_increment, -- CODIGO DO PRODUTO
    prdnome varchar(150) not null, -- NOME DO PRODUTO
    prdgrupo int, -- GRUPO DO PRODUTO
    prdfornecedor int, -- FORNECEDOR DO PRODUTO
    prdqtdeEstoque int, -- QUATIDADE DE PRODUTOS EM ESTOQUE
    prdvolumes int, -- VOLUMES DO PRODUTO EX: GUARDA ROUPA 4 VOLUMES
    prdcusto decimal (7,2), -- CUSTO QUE VAI SER PAGO AO FORNECEDOR PELO PRODUTO
    prdvalor decimal (7,2), -- VALOR QUE O CLIENTE O VAI PAGAR
    constraint foreign key(prdgrupo) references Grupos(grpid), -- FAZ REFERENCIA DO CAMPO grupo AO CAMPO ID DA TABELA GRUPOS
    constraint foreign key(prdfornecedor) references Fornecedores(fndid) -- FAZ REFERENCIA DO CAMPO fornecedor AO CAMPO ID DA TABELA FORNECEDORES
)default charset utf8;

create table FormPagamento -- TABELA FORMA DE PAGAMENTO
(
	fmpid int primary key auto_increment, -- CODIGO DO TIPO DE PAGAMENTO
    fmpnome varchar(150) not null -- NOME DO TIPO DE PAGAMENTO
)default charset utf8;

create table Pedidos -- TABELA DE PEDIDOS
(
	pedid int primary key auto_increment, -- CODIGO DO PEDIDO
    pedidvendedor int, -- CODIGO DO VENDEDOR
    -- nomevendedor varchar(150) not null, -- NOME DO VENDEDOR
    pedidcliente int, -- CODIGO DO CLIENTE
    -- nomecliente varchar(150) not null, -- NOME DO CLIENTE
    -- cpfcliente varchar(14), -- CPF DO CLIENTE
    -- cep char(9), -- CEP DO CLIENTE
    -- endereco varchar(150), -- ENDEREÇO DO CLIENTE
    -- numero varchar(5), -- NUMERO DA CASA DO CLIENTE
    -- complemento varchar(30), -- COMPLEMENTO DA CASA DO CLIENTE
    -- bairro varchar(30), -- BAIRRO DO CLIENTE
    -- cidade varchar(50), -- CIDADE DO CLIENTE
    -- uf char(2), -- UF DO CLIENTE
    -- celular varchar(14), -- CELULAR DO CLIENTE
    -- operadora varchar(10), -- OPERADORA DO CLIENTE
    pedidproduto int,	-- CODIGO DO PRODUTO
    -- nomeproduto varchar(150), -- NOME DO PRODUTO
    pedqtde tinyint, -- QUANTIDADE DO PRODUTO
    pedvalor decimal(7,2), -- VALOR DO PRODUTO
    peddesconto decimal(7,2), -- DESCONTO QUE O CLIENTE RECEBERA
    pedtotal decimal(7,2), -- PREÇO TOTAL A SE PAGAR
    pedformadepagamento int, -- FORMA DO PAGAMENTO
    pedparcelas int, -- SE O CLIENTE FAZER PARCELAS E QUANTAS PARCELAS ELE DESEJOU
    peddtvenda date, -- DATA DA VENDA DO PRODUTO
    constraint foreign key(pedidvendedor) references Funcionarios(fncid),
    constraint foreign key(pedidcliente) references Clientes(cliid),
    constraint foreign key(pedidproduto) references Produtos(prdid),
	constraint foreign key(pedformadepagamento) references FormPagamento(fmpid)
)default charset utf8;

create table Funcionarios -- TABELA DE FUNCIONARIOS
(
	fncid int primary key auto_increment, -- CODIGO DO FUNCIONARIO
    fncnome varchar(150) not null, -- NOME DO FUNCIONARIO
    fnccargo bit
)default charset utf8;

-- INSERTS DAS TABELAS
INSERT INTO Funcionarios(fncnome,fnccargo) -- INSERT DA TABELA FUNCIONARIO
values
('Humano',1);

INSERT INTO FormPagamento(fmpnome) -- INSERT DA TABELA FORMA DE PAGAMENTO
values
('castao');

INSERT INTO Grupos(grpnome) --  INSERT DA TABELA GRUPOS DE PRODUTOS
values
('Cama');

INSERT INTO Representantes(rptnome,rptcpf,rptrg,rptcelular,rpttelefone,rptemail)
values
('Representante','45246518206','466787547','939468575','(11)38106585','teste@email.com');
INSERT INTO Pedidos(pedidvendedor,pedidcliente,pedidproduto,pedqtde,pedvalor,peddesconto,pedtotal,pedformadepagamento,pedparcelas,peddtvenda) -- INSERT DE TESTE PARA A TABELA FUNCIONARIO
values
(1,1,1,1,2500.00,200.00,2300.00,1,2,'2019-09-09');

INSERT INTO Fornecedores(fndcnpj,fndnomefatasia,fndcep,fndendereco,fndnumero,fndcomplemento,fndbairro,fndcidade,fnduf,fndtelefone,fndemail,fndfornrepresent) -- INSERT DA TABELA FORNCEDOR
values
('15248452784547','batata','05221452','rua teste','768','casa 3','Vila Teste','São Paulo','UF','1139195268','teste@email.com',1);

INSERT INTO Clientes(clinome,clicpf,clirg,clicep,cliendereco,clinumero,clicomplemento,clibairro,clicidade,cliuf,clitelefone,clicelular,clioperadora)-- INSERT DA TABELA CLIENTES
values
('Steve','48542495804','422789845','05668497','Rua das Ruas','158','casa 5','Bairro dos ingleses','São Paulo','SP','(11)45826548','11985475196','VIVO');

INSERT INTO Produtos(prdnome,prdgrupo,prdfornecedor,prdqtdeEstoque,prdvolumes,prdcusto,prdvalor) -- INSERT DA TABELA PRODUTOS
VALUES
('Cama',1,1,15,4,500.00,1000.00);

select * from pedidos;
SELECT pedidcliente, pedid,pedformadepagamento, pedparcelas from Pedidos ;

SELECT 
	id.Pedidos,
    idvendedor.Pedidos,
    nome.Funcionarios,
    idcliente.Pedidos,
    nome.Clientes,
    cpf.Clientes,
    cep.Clientes,
    endereco.Clientes,
    numero.Clientes,
    complemento.Clientes,
    bairro.Clientes,
    cidade.Clientes,
    uf.Clientes,
    celular.Clientes,
    operadora.Clientes,
    idproduto.Pedidos,
    nome.Produtos,
    qtde.Pedidos,
    valor.Pedidos,
    desconto.Pedidos,
    total.Pedidos,
    formadepagamento.Pedidos,
    parcelas.Pedidos,
    dtvenda.Pedido
    from Pedidos
    inner join Funcionarios
    on idvendedor.Pedidos = id.Funcionarios
    inner join Clientes
    on idcliente.Pedidos = id.Clientes
    inner join Produtos
    on idproduto.Pedidos = id.Produtos;
    
    
    
SELECT 
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
    order by pedid;
    
    
    
SELECT
   autor.autor_nome,
   frase.frase_frases
FROM
   autor
INNER JOIN
   frase ON autor.autor_id = frase.autor_id
WHERE
   autor.autor_nome = 'pedr';
   
SELECT id.Pedidos,nomecliente,cpf,endereço,cep,idproduto,nome.Produtos,qtde,preco,total
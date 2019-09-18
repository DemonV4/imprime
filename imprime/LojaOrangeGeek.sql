create database db_LojaOrangeGeek;

use db_LojaOrangeGeek;


create table Clientes -- TABELA DE CLIENTES
(
	id int primary key auto_increment, -- CODIGO DO CLIENTE
    nome varchar(150) not null, -- NOME DO USUARIO
    cpf varchar(12) not null, -- CPF DO CLIENTE
    rg varchar(11) not null, -- RG DO CLIENTE
    cep varchar(9) not null, -- CEP DO CLIENTE
    endereco varchar(200) not null, -- ENDEREÇO DO CLIENTE
    numero varchar(5) not null, -- NUMERO DO ENDEREÇO DO CLIENTE
    complemento varchar(30) not null, -- COMPLEMENTO DA CASA DO CLIENTE
    bairro varchar(30) not null, -- BAIRRO DO CLIENTE
    cidade varchar(30) not null, -- CIDADE DO CLIENTE
    uf char(2), -- UF DO CLIENTE
    telefone varchar(14) not null, -- TELEFONE DO CLIENTE
    celular varchar(15), -- CELULAR DO CLIENTE
    operadora varchar(10) -- OPERADORA DO CLIENTE
)default charset utf8;

create table Grupos -- TABELA GRUPO
(
	id int primary key auto_increment, -- CODIGO DO GRUPO
    nome varchar(150) not null -- GRUPO DO PRODUTO
)default charset utf8;

create table Representantes -- TABELA REPRESENTATE
(
	id int primary key auto_increment, -- CODIGO DO REPRESENTANTE
    nome varchar(150) not null, -- NOME DO REPRESENTANTE
    cpf varchar(12)not null, -- CPF DO REPRENSENTATE
    rg varchar(11) not null, -- RG DO REPRESENTANTE
    celular varchar(15) not null, -- CELULAR DO REPRESENTANTE
    telefone varchar(14) not null, -- TELEFONE DO REPRESENTATE
    email varchar(150) -- EMAIL DO REPRESENTATE
)default charset utf8;

create table Fornecedores -- TABELA DO FORNECEDOR
(
	id int primary key auto_increment, -- CODIGO DO FORNECEDOR
    cnpj varchar(14) not null, -- CNPJ DO FORNECEDOR
    nomefatasia varchar(150) not null, -- NOME FANTASIA DO FORNECEDOR
    cep varchar(9) not null, -- CEP DO FORNECEDOR
    endereco varchar(200) not null, -- ENDERECO DO FORNECEDOR
    numero varchar(5) not null, -- NUMERO DO FORNECEDOR
    complemento varchar(30) not null, -- COMPLEMTENTO DO ENDEREÇO DO FORNECEDOR
    bairro varchar(30) not null, -- BAIRRO DO FORNECEDOR
    cidade varchar(30) not null, -- CIDADE DO FORNECEDOR
    uf char(2), -- UF DO FORNCEDOR  
    telefone varchar(11) not null, -- TELEFONE DO FORNECEDOR
    email varchar(150) not null, -- EMAIL DO FORNECEDOR
    fornrepresent int, -- REPRESENTANTE DO FORNECEDOR
    constraint foreign key(fornrepresent) references Representantes(id) -- REFERENCIA A O CAMPO fornrepresent AO  CODIGO DO REPRESENTANTE DA TABELA REPRESENTANTE
)default charset utf8;

create table Produtos -- TABELA DOS PRODUTOS
(
	id int primary key auto_increment, -- CODIGO DO PRODUTO
    nome varchar(150) not null, -- NOME DO PRODUTO
    grupo int, -- GRUPO DO PRODUTO
    fornecedor int, -- FORNECEDOR DO PRODUTO
    qtde_estoque int, -- QUATIDADE DE PRODUTOS EM ESTOQUE
    volumes int, -- VOLUMES DO PRODUTO EX: GUARDA ROUPA 4 VOLUMES
    custo decimal (7,2), -- CUSTO QUE VAI SER PAGO AO FORNECEDOR PELO PRODUTO
    valor decimal (7,2), -- VALOR QUE O CLIENTE O VAI PAGAR
    constraint foreign key(grupo) references Grupos(id), -- FAZ REFERENCIA DO CAMPO grupo AO CAMPO ID DA TABELA GRUPOS
    constraint foreign key(fornecedor) references Fornecedores(id) -- FAZ REFERENCIA DO CAMPO fornecedor AO CAMPO ID DA TABELA FORNECEDORES
)default charset utf8;

create table FormPagamento -- TABELA FORMA DE PAGAMENTO
(
	id int primary key auto_increment, -- CODIGO DO TIPO DE PAGAMENTO
    nome varchar(150) not null -- NOME DO TIPO DE PAGAMENTO
)default charset utf8;

create table Pedidos -- TABELA DE PEDIDOS
(
	id int primary key auto_increment, -- CODIGO DO PEDIDO
    idvendedor int, -- CODIGO DO VENDEDOR
    -- nomevendedor varchar(150) not null, -- NOME DO VENDEDOR
    idcliente int, -- CODIGO DO CLIENTE
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
    idproduto int,	-- CODIGO DO PRODUTO
    -- nomeproduto varchar(150), -- NOME DO PRODUTO
    qtde tinyint, -- QUANTIDADE DO PRODUTO
    valor decimal(7,2), -- VALOR DO PRODUTO
    desconto decimal(7,2), -- DESCONTO QUE O CLIENTE RECEBERA
    total decimal(7,2), -- PREÇO TOTAL A SE PAGAR
    formadepagamento int, -- FORMA DO PAGAMENTO
    parcelas int, -- SE O CLIENTE FAZER PARCELAS E QUANTAS PARCELAS ELE DESEJOU
    dtvenda date, -- DATA DA VENDA DO PRODUTO
    constraint foreign key(idvendedor) references Funcionario(id),
    constraint foreign key(idcliente) references Clientes(id),
    constraint foreign key(idproduto) references Produtos(id),
	constraint foreign key(formadepagamento) references FormPagamento(id)
)default charset utf8;

create table Funcionarios -- TABELA DE FUNCIONARIOS
(
	idfuncionario int primary key auto_increment, -- CODIGO DO FUNCIONARIO
    nome varchar(150) not null, -- NOME DO FUNCIONARIO
    cargo bit
)default charset utf8;

-- INSERTS DAS TABELAS
INSERT INTO Funcionarios(nome,cargo) -- INSERT DA TABELA FUNCIONARIO
values
('Humano',1);

INSERT INTO FormPagamento(nome) -- INSERT DA TABELA FORMA DE PAGAMENTO
values
('castao');

INSERT INTO Grupos(nome) --  INSERT DA TABELA GRUPOS DE PRODUTOS
values
('Cama');

INSERT INTO Representantes(nome,cpf,rg,celular,telefone,email)
values
('Representante','45246518206','466787547','939468575','(11)38106585','teste@email.com');
INSERT INTO Pedidos(idvendedor,idcliente,idproduto,qtde,valor,desconto,total,formadepagamento,parcelas,dtvenda) -- INSERT DE TESTE PARA A TABELA FUNCIONARIO
values
(1,1,1,1,2500.00,200.00,2300.00,1,2,'2019-09-09');

INSERT INTO Fornecedores(cnpj,nomefatasia,cep,endereco,numero,complemento,bairro,cidade,uf,telefone,email,fornrepresent) -- INSERT DA TABELA FORNCEDOR
values
('15248452784547','batata','05221452','rua teste','768','casa 3','Vila Teste','São Paulo','UF','1139195268','teste@email.com',1);

INSERT INTO Clientes(nome,cpf,rg,cep,endereco,numero,complemento,bairro,cidade,uf,telefone,celular,operadora)-- INSERT DA TABELA CLIENTES
values
('Steve','48542495804','422789845','05668497','Rua das Ruas','158','casa 5','Bairro dos ingleses','São Paulo','SP','(11)45826548','11985475196','VIVO');

INSERT INTO Produtos(nome,grupo,fornecedor,qtde_estoque,volumes,custo,valor) -- INSERT DA TABELA PRODUTOS
VALUES
('Cama',1,1,15,4,500.00,1000.00);

SELECT idcliente, id,formadepagamento, parcelas from Pedidos ;

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
    inner join Produto
    on idproduto.Pedidos = id.Produtos;
    
    
    
SELECT 
	Pedidos.id,
    Pedidos.idvendedor,
    Funcionarios.nome,
    Pedidos.idcliente,
    Clientes.nome,
    Clientes.cpf,
    Clientes.cep,
    Clientes.endereco,
    Clientes.numero,
    Clientes.complemento,
    Clientes.bairro,
    Clientes.cidade,
    Clientes.uf,
    Clientes.celular,
    Clientes.operadora,
    Pedidos.idproduto,
    Produtos.nome,
    Pedidos.qtde,
    Pedidos.valor,
    Pedidos.desconto,
    Pedidos.total,
    Pedidos.formadepagamento,
    Pedidos.parcelas,
    Pedido.dtvenda
    from Pedidos
    inner join Funcionarios
    on Pedidos.idvendedor = Funcionarios.id
    inner join Clientes
    on Pedidos.idcliente = Clientes.id
    inner join Produto
    on Pedidos.idproduto = Produtos.id
    order by Pedidos;
    
    
    
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
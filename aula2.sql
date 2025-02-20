use banco1;

INSERT INTO cliente1 (cliente, endereco, cidade, cep, uf, cpf) 
VALUES
('João Silva', 'Rua A, 123', 'São Paulo', '01000000', 'SP', '11122233344'),
('Maria Souza', 'Rua B, 456', 'Rio de Janeiro', '22000000', 'RJ', '22233344455'),
('Carlos Pereira', 'Rua C, 789', 'Belo Horizonte', '31000000', 'MG', '33344455566'),
('Ana Oliveira', 'Rua D, 101', 'Curitiba', '80000000', 'PR', '44455566677'),
('Pedro Santos', 'Rua E, 202', 'Porto Alegre', '90000000', 'RS', '55566677788');

INSERT INTO vendedor1 (vendedor, salario, comissao) 
VALUES
('Carlos Mendes', 3000.00, 5.00),
('Fernanda Lima', 3500.00, 4.50),
('Ricardo Alves', 2800.00, 6.00),
('Juliana Costa', 4000.00, 5.50),
('Roberto Farias', 3200.00, 4.00);

INSERT INTO pedido1 (id_cliente, id_vendedor, prazo_entrega) 
VALUES
(1, 1, '2025-03-01'),
(2, 2, '2025-03-05'),
(3, 3, '2025-03-10'),
(4, 4, '2025-03-15'),
(5, 5, '2025-03-20');

INSERT INTO produto (unidade, descricao, val_unit) 
VALUES
('UN', 'Camiseta', 50.00),
('UN', 'Calça Jeans', 120.00),
('UN', 'Tênis', 200.00),
('UN', 'Jaqueta', 300.00),
('UN', 'Boné', 40.00);

INSERT INTO item_produto (num_pedido, id_produto, quantidade) 
VALUES
(6, 1, 2),
(7, 2, 1),
(8, 3, 3),
(9, 4, 1),
(10, 5, 2);

ALTER TABLE cliente1 MODIFY uf VARCHAR(45);
ALTER TABLE vendedor1 MODIFY comissao DECIMAL(6,3);
SELECT * FROM pedido1;
SELECT * FROM cliente1;
SELECT * FROM item_produto;
SELECT * FROM produto;

SELECT*FROM cliente1 c cross join produto p where c.cliente="João Silva";
select*from cliente1 c cross join pedido1 p
where c.id_cliente=p.id_cliente;

SELECT * FROM vendedor1 v CROSS JOIN pedido1 p 
WHERE v.id_vendedor = p.id_vendedor;
SELECT * FROM vendedor1 v INNER JOIN pedido1 p ON TRUE

SELECT CL.cliente,PR.cliente FROM cliente1 cl
INNER JOIN pedido1 PE ON CL.id_cliente = PE.id_cliente
INNER JOIN item_produto IP ON IP.id_pedido = PE.id_pedido
INNER JOIN produto PR ON PR.id_produto = IP.id_produto


SELECT c.cliente, pr.descricao AS produto FROM cliente1 c
INNER JOIN pedido1 p ON p.id_cliente = c.id_cliente
INNER JOIN item_produto ip ON ip.num_pedido = p.num_pedido
INNER JOIN produto pr ON pr.id_produto = ip.id_produto;


SELECT*FROM cliente1 INNER JOIN pedido1 USING(id_cliente)

SELECT*FROM cliente1 NATURAL INNER JOIN pedido1

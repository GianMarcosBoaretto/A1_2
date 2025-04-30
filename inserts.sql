-- Povoamento na tabela usuarios
INSERT INTO usuarios (nome, cpf, endereco, email, data_nascimento, usuario, senha, tipo) VALUES
('Gian Marcos Boaretto', '12345678901', 'Rua A, 123', 'gian@email.com', '1995-05-20', 'gianboaretto', 'senha123', 'A'),
('Guilherme Anzollin', '98765432100', 'Av B, 456', 'guilherme@email.com', '1990-07-15', 'guilhermea', 'senha123', 'P'),
('Pedro Legal', '11122233344', 'Rua C, 789', 'pedro@email.com', '1998-02-10', 'plegal', 'senha123', 'A'),
('Jose', '10981233344', 'Rua teste 1', 'jose@email.com', '2005-02-10', 'jose', 'senha123', 'A'),
('Fernando', '15981236944', 'Rua teste 2', 'fernando@email.com', '2009-08-10', 'fernando', 'senha123', 'A'),
('Henrique', '15698745632', 'Rua teste 3', 'henrique@email.com', '2010-08-10', 'henrique', 'senha123', 'A');

-- Povoamento na tabela universidades
INSERT INTO universidades (nome, cnpj, endereco, email) VALUES
('UNOESC', '12345678000199', 'Av. Exemplo, 1000', 'contato@unoesc.edu.br'),
('Instituto Superior de Testes', '98765432000188', 'Rua Teste, 200', 'adm@ist.edu');

-- Povoamento na tabela usuario-universidade
INSERT INTO usuario_universidade (usuario_id, universidade_id) VALUES
(1, 1),
(2, 2),
(3, 1);

-- Povoamento na tabela tipos_postagens
INSERT INTO tipos_postagens (nome) VALUES
('Artigo'),
('Dúvida'),
('Evento'),
('Notícia');

-- Povoamento na tabela postagens
INSERT INTO postagens (usuario_id, conteudo, data_postagem, tipo_id) VALUES
(1, 'Confira meu novo artigo sobre IA!', NOW(), 1),
(2, 'Redes neurais - Novas descobertas?', NOW(), 2),
(3, 'Participe do evento sobre Banco de Dados na UNOESC!', NOW(), 3),
(1, 'Novo Artigo sobre Processamento de Sinais!', NOW(), 1);

-- Povoamento na tabela tipos_reacoes
INSERT INTO tipos_reacoes (nome) VALUES
('Curtir'),
('Amei'),
('Interessante'),
('Confuso');

-- Povoamento na tabela reacoes_postadas
INSERT INTO reacoes_postadas (usuario_id, data_postagem, postagem_id, reacao_id) VALUES
(2, NOW(), 1, 1),
(3, NOW(), 1, 2),
(3, NOW(), 1, 3),
(1, NOW(), 2, 3);

-- Povoamento na tabela comentarios
INSERT INTO comentarios (usuario_id, conteudo, data_postagem, postagem_id) VALUES
(2, 'Muito bom o artigo!', NOW(), 1),
(4, 'Bem Legal!', NOW(), 1),
(1, 'Posso te ajudar com isso.', NOW(), 2)
(1, 'Artigo bem completo.', NOW(), 1)
(1, 'Artigo muito bom.', NOW(), 4);

-- Povoamento na tabela tipos_arquivos
INSERT INTO tipos_arquivo (nome) VALUES
('PDF'),
('Imagem'),
('Vídeo');

-- Povoamento na tabela arquivos
INSERT INTO arquivos (diretorio, data_postagem, tipo_arquivo_id, postagem_id, tamanho) VALUES
('/uploads/artigo_ia.pdf', NOW(), 1, 1, 2048),
('/uploads/evento_bancodedados.jpg', NOW(), 2, 3, 512);

-- Povoamento na tabela seguidores
INSERT INTO seguidores (usuario_seguido, usuario_seguidor) VALUES
(1, 2),
(3, 1),
(2, 3);

-- Povoamento na tabela bloqueados
INSERT INTO bloqueados (usuario_bloqueado, usuario_bloqueador) VALUES
(3, 2);

-- Povoamento na tabela grupos
INSERT INTO grupos (nome, descricao) VALUES
('Grupo de Inteligência Artificial', 'Discussões sobre IA e Machine Learning'),
('Grupo de Bancos de Dados', 'Discussões sobre modelagem e SQL');

-- Povoamento na tabela grupo_usuario
INSERT INTO grupo_usuario (usuario_id, grupo_id) VALUES
(1, 1),
(3, 1),
(2, 1),
(4, 1),
(5, 1),
(6, 1),
(2, 2);

-- Povoamento na tabela notificacoes
INSERT INTO notificacoes (conteudo, postagem_id, usuario_id, visualizada, data_notificacao) VALUES
('Novo comentário na sua postagem!', 1, 1, 0, NOW()),
('Sua postagem recebeu uma nova reação!', 1, 1, 0, NOW());

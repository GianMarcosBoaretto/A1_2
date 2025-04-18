-- Usuários
INSERT INTO usuarios (nome, cpf, endereco, email, data_nascimento, usuario, senha, tipo) VALUES
('Ana Silva', '12345678901', 'Rua A, 123', 'ana@email.com', '1995-05-20', 'anasilva', 'senha123', 'A'),
('Bruno Costa', '98765432100', 'Av B, 456', 'bruno@email.com', '1990-07-15', 'brunoc', 'senha123', 'P'),
('Carlos Souza', '11122233344', 'Rua C, 789', 'carlos@email.com', '1998-02-10', 'csouza', 'senha123', 'A');

-- Universidades
INSERT INTO universidades (nome, cnpj, endereco, email) VALUES
('Universidade Federal do Exemplo', '12345678000199', 'Av. Exemplo, 1000', 'contato@ufe.br'),
('Instituto Superior de Testes', '98765432000188', 'Rua Teste, 200', 'adm@ist.edu');

-- Vínculo usuário-universidade
INSERT INTO usuario_universidade (usuario_id, universidade_id) VALUES
(1, 1),
(2, 2),
(3, 1);

-- Tipos de Postagens
INSERT INTO tipos_postagens (nome) VALUES
('Artigo'),
('Dúvida'),
('Evento'),
('Notícia');

-- Postagens
INSERT INTO postagens (usuario_id, conteudo, data_postagem, tipo_id) VALUES
(1, 'Confira meu novo artigo sobre IA!', NOW(), 1),
(2, 'Alguém sabe onde encontro fontes sobre redes neurais?', NOW(), 2),
(3, 'Participe do evento sobre Big Data na UFE!', NOW(), 3);

-- Tipos de Reações
INSERT INTO tipos_reacoes (nome) VALUES
('Curtir'),
('Amei'),
('Interessante'),
('Confuso');

-- Reações nas Postagens
INSERT INTO reacoes_postadas (usuario_id, data_postagem, postagem_id, reacao_id) VALUES
(2, NOW(), 1, 1),
(3, NOW(), 1, 2),
(1, NOW(), 2, 3);

-- Comentários nas Postagens
INSERT INTO comentarios (usuario_id, conteudo, data_postagem, postagem_id) VALUES
(2, 'Muito bom o artigo!', NOW(), 1),
(1, 'Posso te ajudar com isso.', NOW(), 2);

-- Tipos de Arquivos
INSERT INTO tipos_arquivo (nome) VALUES
('PDF'),
('Imagem'),
('Vídeo');

-- Arquivos vinculados a Postagens
INSERT INTO arquivos (diretorio, data_postagem, tipo_arquivo_id, postagem_id, tamanho) VALUES
('/uploads/artigo_ia.pdf', NOW(), 1, 1, 2048),
('/uploads/evento_bigdata.jpg', NOW(), 2, 3, 512);

-- Seguidores
INSERT INTO seguidores (usuario_seguido, usuario_seguidor) VALUES
(1, 2),
(3, 1),
(2, 3);

-- Bloqueios
INSERT INTO bloqueados (usuario_bloqueado, usuario_bloqueador) VALUES
(3, 2);

-- Grupos
INSERT INTO grupos (nome, descricao) VALUES
('Grupo de Inteligência Artificial', 'Discussões sobre IA e Machine Learning'),
('Grupo de Bancos de Dados', 'Discussões sobre modelagem e SQL');

-- Participação de usuários nos grupos
INSERT INTO grupo_usuario (usuario_id, grupo_id) VALUES
(1, 1),
(2, 2),
(3, 1);

-- Notificações
INSERT INTO notificacoes (conteudo, postagem_id, usuario_id, visualizada, data_notificacao) VALUES
('Novo comentário na sua postagem!', 1, 1, 0, NOW()),
('Sua postagem recebeu uma nova reação!', 1, 1, 0, NOW());

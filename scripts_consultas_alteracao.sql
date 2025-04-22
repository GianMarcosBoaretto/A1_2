-- Alteração de tipo de conta (ex: de aluno para professor)
UPDATE usuarios
SET tipo = 'P'
WHERE id = 1; 

-- Alteração de tipo de conta (ex: de aluno para professor, Geral)
UPDATE usuarios
SET tipo = 'P'
WHERE tipo = 'A'; 

-- Exclusão de comentários de um usuário específico
DELETE FROM comentarios
WHERE usuario_id = 2;

-- Listar todas as postagens de um grupo com nome do autor, número de reações e comentários
SELECT 
    p.id AS postagem_id,
    u.nome AS autor,
    p.conteudo,
    COUNT(DISTINCT r.id) AS total_reacoes,
    COUNT(DISTINCT c.id) AS total_comentarios
FROM grupo_usuario gu
JOIN usuarios u ON u.id = gu.usuario_id
JOIN postagens p ON p.usuario_id = u.id
LEFT JOIN reacoes_postadas r ON r.postagem_id = p.id
LEFT JOIN comentarios c ON c.postagem_id = p.id
WHERE gu.grupo_id = 1 
GROUP BY p.id, u.nome, p.conteudo;

-- Listar os usuários com mais postagens nos últimos 30 dias
SELECT 
    u.nome,
    COUNT(p.id) AS total_postagens
FROM usuarios u
JOIN postagens p ON p.usuario_id = u.id
WHERE p.data_postagem >= CURDATE() - INTERVAL 30 DAY
GROUP BY u.id
ORDER BY total_postagens DESC;

-- Mostrar os usuários que reagiram com curtir em um post específico
SELECT u.nome
FROM reacoes_postadas rp
JOIN usuarios u ON u.id = rp.usuario_id
JOIN tipos_reacoes tr ON tr.id = rp.reacao_id
WHERE tr.nome = 'Curtir'
AND rp.postagem_id = 1; 

-- Mostrar os grupos com mais de 5 membros
SELECT 
    g.nome,
    COUNT(gu.usuario_id) AS total_membros
FROM grupos g
JOIN grupo_usuario gu ON gu.grupo_id = g.id
GROUP BY g.id
HAVING COUNT(gu.usuario_id) > 5;

-- Listar as postagens com mais de 2 tipos diferentes de reação
SELECT 
    p.id,
    p.conteudo,
    COUNT(DISTINCT r.reacao_id) AS tipos_de_reacao
FROM postagens p
JOIN reacoes_postadas r ON r.postagem_id = p.id
GROUP BY p.id
HAVING COUNT(DISTINCT r.reacao_id) > 2;

-- Contar o número de notificações não lidas de cada usuário
SELECT 
    u.nome,
    COUNT(n.id) AS notificacoes_nao_lidas
FROM usuarios u
JOIN notificacoes n ON n.usuario_id = u.id
WHERE n.visualizada = 0
GROUP BY u.id;

-- Agrupar postagens por tipo e mostrar média de comentários por tipo
SELECT 
    tp.nome AS tipo_postagem,
    COUNT(p.id) AS total_postagens,
    IFNULL(ROUND(AVG(com.total_comentarios), 2), 0) AS media_comentarios
FROM tipos_postagens tp
LEFT JOIN postagens p ON p.tipo_id = tp.id
LEFT JOIN (
    SELECT 
        postagem_id,
        COUNT(*) AS total_comentarios
    FROM comentarios
    GROUP BY postagem_id
) com ON com.postagem_id = p.id
GROUP BY tp.id;




create extension if not exists "pgcrypto";

create table public.pesquisa_mercado (
    id uuid primary key default gen_random_uuid(),

    -- Perfil
    nome text not null,
    email text not null,
    faixa text,
    cidade text,
    estado text,
    moradia text,

    -- Relação com flores
    freq text,
    local_compra text[],
    ocasioes text[],

    -- Preferências
    pref text,
    flores_favoritas text,

    -- Assinatura
    interesse text,
    frequencia text,
    diferencial text[],

    -- Preço
    preco text,
    modelo_plano text,

    -- Comunicação
    canal text,
    forma_recebimento text,
    horario text,

    -- Avaliação
    nota_interesse smallint,
    impeditivo text,
    news text,

    created_at timestamptz default now()
);


-- Habilita o Row Level Security
alter table public.pesquisa_mercado
enable row level security;

-- Permite que qualquer usuário utilizando a anon key
-- possa inserir respostas no formulário
create policy "Permitir insercao publica"
on public.pesquisa_mercado
for insert
to anon
with check (true);

--caso queira permitir a leitura pública execute essa parte em uma nova query
/*create policy "Permitir leitura publica"
on public.pesquisa_mercado
for select
to anon
using (true);*/
create table if not exists links (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  url text not null,
  title text,
  notes text,
  tags text[] default '{}',
  tag_suggestions jsonb,
  tag_suggestions_source text,
  tag_suggestions_confidence numeric,
  tag_suggestions_review_status text default 'unreviewed',
  last_visited_at timestamptz,
  created_at timestamptz not null default now()
);

alter table links enable row level security;

drop policy if exists "links_v1_read" on links;
create policy "links_v1_read" on links for select using (true);

drop policy if exists "links_v1_write" on links;
create policy "links_v1_write" on links for all using (true) with check (true);

insert into links (id, url, title, notes, tags, created_at) values
  (gen_random_uuid(), 'https://paulgraham.com/makersschedule.html', 'Maker''s Schedule, Manager''s Schedule', 'Classic essay on protecting deep work time.', array['productivity','essays','paul-graham'], now() - interval '10 days'),
  (gen_random_uuid(), 'https://www.youtube.com/watch?v=733m6qBH-jI', 'Feynman Technique Explained', 'Best method for learning anything fast.', array['learning','video','feynman'], now() - interval '8 days'),
  (gen_random_uuid(), 'https://github.com/sindresorhus/awesome', 'Awesome Lists on GitHub', 'Curated lists of almost every dev topic.', array['dev','reference','github'], now() - interval '6 days'),
  (gen_random_uuid(), 'https://fs.blog/mental-models/', 'Mental Models – Farnam Street', 'Collection of thinking frameworks.', array['thinking','mental-models','reference'], now() - interval '4 days'),
  (gen_random_uuid(), 'https://waitbutwhy.com/2014/05/fermi-estimation.html', 'Fermi Estimation – Wait But Why', 'Fun primer on order-of-magnitude thinking.', array['maths','thinking','essays'], now() - interval '2 days')
on conflict do nothing;
-- Run this ONCE in Supabase: SQL Editor -> New query -> paste -> Run.

create table if not exists public.items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  kind text not null,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists items_user_kind on public.items (user_id, kind);

alter table public.items enable row level security;

create policy "items_select_own" on public.items for select using (auth.uid() = user_id);
create policy "items_insert_own" on public.items for insert with check (auth.uid() = user_id);
create policy "items_update_own" on public.items for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "items_delete_own" on public.items for delete using (auth.uid() = user_id);

-- Private storage for scanned records and attached files
insert into storage.buckets (id, name, public)
values ('records', 'records', false)
on conflict (id) do nothing;

create policy "records_select_own" on storage.objects for select
  using (bucket_id = 'records' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "records_insert_own" on storage.objects for insert
  with check (bucket_id = 'records' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "records_update_own" on storage.objects for update
  using (bucket_id = 'records' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "records_delete_own" on storage.objects for delete
  using (bucket_id = 'records' and (storage.foldername(name))[1] = auth.uid()::text);

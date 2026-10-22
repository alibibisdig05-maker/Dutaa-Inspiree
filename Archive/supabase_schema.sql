-- INSPIRE HUB V2 · jalankan via Supabase SQL Editor pada project kamu.
-- Hanya peserta login yang bisa membaca dan mengubah datanya sendiri.
-- Jangan matikan Row Level Security.
create table if not exists public.app_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.app_state enable row level security;

drop policy if exists "app_state_select_own" on public.app_state;
create policy "app_state_select_own" on public.app_state
  for select to authenticated using (auth.uid() = user_id);
drop policy if exists "app_state_insert_own" on public.app_state;
create policy "app_state_insert_own" on public.app_state
  for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "app_state_update_own" on public.app_state;
create policy "app_state_update_own" on public.app_state
  for update to authenticated using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
drop policy if exists "app_state_delete_own" on public.app_state;
create policy "app_state_delete_own" on public.app_state
  for delete to authenticated using (auth.uid() = user_id);

-- Catatan: satu baris JSON untuk setiap pengguna (MVP sederhana).
-- Sebelum peluncuran publik: audit keamanan, consent mentor dan privacy notice,
-- logging perubahan, persetujuan admin, backup, dan pemisahan tabel saat tumbuh.

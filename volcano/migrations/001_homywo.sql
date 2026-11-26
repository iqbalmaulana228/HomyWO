-- HomyWO schema starter
create table if not exists workout_logs (id uuid primary key default gen_random_uuid(), user_id uuid not null default auth.uid(), title text not null, duration_minutes integer not null default 0 check(duration_minutes >= 0), notes text, performed_at timestamptz not null default now());
create table if not exists cardio_logs (id uuid primary key default gen_random_uuid(), user_id uuid not null default auth.uid(), activity text not null, duration_minutes integer not null default 0 check(duration_minutes >= 0), distance_km numeric, notes text, performed_at timestamptz not null default now());
create table if not exists body_weight_logs (id uuid primary key default gen_random_uuid(), user_id uuid not null default auth.uid(), weight_kg numeric not null check(weight_kg > 0), recorded_on date not null default current_date);
alter table workout_logs enable row level security;
alter table cardio_logs enable row level security;
alter table body_weight_logs enable row level security;

create table if not exists public.user_status
(
	id serial2 not null constraint pk_user_status primary key,
	name text not null constraint uq_user_status__name unique,
	description text not null,
	created_at timestamptz not null
);

create table if not exists public.user
(
	id serial4 not null constraint pk_user primary key,
	username text not null constraint uq_user__username unique,
	password_hash bytea,
	status_id int2 not null constraint fk_user_status_classifies_user foreign key references public.user_status,
	created_at timestamptz not null,
	updated_at timestamptz not null,
	created_by int4 null constraint fk_user__creates__user foreign key references public.user,
	updated_by int4 null constraint fk_user__updates__user foreign key references public.user
);

create table if not exists public.role
(
	id serial2 not null constraint pk_user_type primary key,
	name text not null constraint up_user_type__name unique,
	description text not null,
	created_at timestamptz not null,
	created_by int4 not null
);

create table if not exists public.user_role
(
	user_id int4 not null constraint fk_user_role__user foreign key references public.user,
	role_id int2 not null constraint fk_user_role__role foreign key references public.role,
	created_at timestamptz not null,
	constraint pk_user_role primary key(user_id, role_id)
);

create table if not exists public.resource
(
	id serial2 not null constraint pk_resource primary key,
	name text not null,
	description text not null,
	created_at timestamptz not null,
);

create table if not exists public.base
(
	id serial4 not null constraint pk_base primary key,
	user_id int4 null constraint fk_base__user foreign key references public.user,
	name text not null,
);

create table if not exists public.mine
(
	id serial4 not null constraint pk_mine primary key,
	name text not null,
	description text not null,
	speed numeric(20, 3) not null,
	created_at timestamptz not null
);

create table if not exists public.stockpile
(
	base_id int4 not null constraint fk_stockpile__base foreign key references public.base,
	resource_id int2 not null constraint fk_stockpile__resource foreign key references public.stockpile,
	action text not null,
	qty numeric(20, 3),
	created_at timestamptz not null,
	updated_at timestamptz not null,
	constraint pk_stockpile primary key(base_id, resource_id)
);

create table if not exists public.t_stockpile
(
	id int not null constraint pk_stockpile_transaction primary key,
	transaction_id uuid not null,
	base_id int4 not null constraint fk_stockpile_transaction__base foreign key references public.base,
	resource_id int2 not null constraint fk_stockpile_transaction__resource foreign key references public.resource,
	qty numeric(20, 3),
	created_at timestamptz not null,
	note text null,
	constraint fk_stockpile_transaction__stockpile foreign key (base_id, resource_id) references stockpile,
);

create table if no exists public.inbox
(
	id serial4 not null constraint pk_inbox primary key,
	user_id int4 not null constraint fk_user_owns_inbox foreign key references public.user,
);

create table if not exists public.inbox_message
(
	inbox_id int4 not null constraint pk_inbox_message primary key,
	sender_id int4 not null constraint fk_user_sends_message foreign key references public.user,
	subject text not null,
	body text not null,
	created_at timestamptz not null,
	is_active bit not null
);


create schema if not exists spendthrift;
create or replace function update_timestamp () returns trigger language plpgsql as $$ begin new.updated := now();
return new;
end;
$$;
-- drop table spendthrift.transaction_category;
create table if not exists spendthrift.transaction_category (
    id serial primary key,
    name text not null unique,
    description text null,
    created timestamp with time zone default now(),
    updated timestamp with time zone
);
drop trigger if exists transaction_category_update on spendthrift.transaction_category;
create trigger transaction_category_update before
insert
    or
update on spendthrift.transaction_category for each row execute function update_timestamp();
-- drop table spendthrift.transaction_subcategory;
create table if not exists spendthrift.transaction_subcategory(
    id serial primary key,
    category_id int references spendthrift.transaction_category(id),
    name text not null unique,
    created timestamp with time zone default now()
);
drop trigger if exists transaction_subcategory_update on spendthrift.transaction_subcategory;
create trigger transaction_subcategory_update before
insert
    or
update on spendthrift.transaction_subcategory for each row execute function update_timestamp();
-- drop table spendthrift.account;
create table if not exists spendthrift.account (
    id serial primary key,
    name text not null,
    account_number text null,
    created timestamp with time zone default now()
);
-- drop table spendthrift.transaction;
CREATE TABLE if not exists spendthrift.transaction (
    id SERIAL PRIMARY KEY,
    account_id int null references spendthrift.account(id),
    description text not null,
    date DATE NOT NULL,
    amount integer NOT NULL,
    balance integer null,
    category_id int references spendthrift.transaction_category,
    created timestamp with time zone default now()
);
-- drop table spendthrift.receipt;
create table if not exists spendthrift.receipt (
    id serial primary key,
    company text not null,
    transction_id int references spendthrift.transaction(id),
    subtotal float not null,
    tax float null,
    total float not null,
    created timestamp with time zone
);
-- drop table spendthrift.receipt_item;
create table if not exists spendthrift.receipt_item (
    id serial primary key,
    name text not null,
    amount float null,
    quantity int default 1,
    taxable bool null,
    category_id int references spendthrift.transaction_category(id),
    created timestamp with time zone
);

-- Functions --
create or replace function spendthrift.get_category_id(category_name text) returns int language sql as $$
    select id from spendthrift.transaction_category where name = category_name;
$$;

create or replace function spendthrift.get_subcategory_id(subcategory_name text) returns int language sql as $$
    select id from spendthrift.transaction_subcategory where name = subcategory_name;
$$;
create or replace function spendthrift.get_or_create_category_id(category_name text) returns int language plpgsql as $$
declare
    cat_id int;
begin
    select id into cat_id from spendthrift.transaction_category where name = category_name;
    if cat_id is null then
        insert into spendthrift.transaction_category (name) values (category_name) returning id into cat_id;
    end if;
    return cat_id;
end;
$$;

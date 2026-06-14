create table Users (
  user_id serial primary key,
  full_name varchar(100) not null,
  email varchar(100) unique,
  role varchar(50) check (role in ('Ticket Manager', 'Football Fan')),
  phone_number varchar(20)
);

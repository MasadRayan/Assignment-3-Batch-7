create table Users (
  user_id serial primary key,
  full_name varchar(100) not null,
  email varchar(100) unique,
  role varchar(50) check (role in ('Ticket Manager', 'Football Fan')),
  phone_number varchar(20)
);

create table Matches (
  match_id serial primary key,
  fixture text not null,
  tournament_category varchar(255) not null,
  base_ticket_price decimal(10, 2) not null check (base_ticket_price >= 0),
  match_status varchar(50) not null check (
    match_status in (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  )
);

create table Bookings (
  booking_id serial primary key,
  user_id int not null references Users (user_id),
  match_id int not null references Matches (match_id),
  seat_number varchar(10),
  payment_status varchar(50) check (
    payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
  ),
  total_cost decimal(10, 2) not null check (total_cost >= 0)
);


INSERT INTO
  Matches (
    match_id,
    fixture,
    tournament_category,
    base_ticket_price,
    match_status
  )
VALUES
  (
    101,
    'Real Madrid vs Barcelona',
    'Champions League',
    150.00,
    'Available'
  ),
  (
    102,
    'Man City vs Liverpool',
    'Premier League',
    120.00,
    'Selling Fast'
  ),
  (
    103,
    'Bayern Munich vs PSG',
    'Champions League',
    130.00,
    'Available'
  ),
  (
    104,
    'AC Milan vs Inter Milan',
    'Serie A',
    90.00,
    'Sold Out'
  ),
  (
    105,
    'Juventus vs Roma',
    'Serie A',
    80.00,
    'Available'
  );





















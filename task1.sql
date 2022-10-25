create table "Clients"(
	id			uuid default uuid_generate_v4() constraint clients_pk primary key,
	username	varchar(128) not null,
	firstName 	varchar(128) not null,
	lastName	varchar(128) not null,
	age			int not null,
	email		varchar(128) not null
);


create table "ClientInfo" (
	client_info_id	uuid default uuid_generate_v4() constraint client_info_pk primary key,
	country 		varchar(255) not null,
	city			varchar(255) not null,
	address			varchar(255) not null,
	occupation		varchar(255) not null
);


alter table "Clients"
add column "client_info_id" uuid references "ClientInfo"(client_info_id);


create table "Orders"(
	id			uuid default uuid_generate_v4() constraint order_pk primary key,
	client_id 	uuid references "Clients"(id),
	order_date 	date not null,
	amount		int not null
);


create table "Items" (
	id					uuid default uuid_generate_v4() constraint item_pk primary key,
	item_name			varchar(255) not null,
	item_description	varchar(255)
);


create table "ItemOrders" (
	order_id 	uuid references "Orders"(id),
	item_id	 	uuid references "Items"(id)
);


insert into "Clients" 
("username", "firstname", "lastname", age, "email", "client_info_id")
values
('loool', 'Andrei', 'Boghita', 19, 'boghita@gmail.com', '0f9641b8-eeea-45ce-82c4-3118cb0fe0b1'),
('looll', 'Aurel', 'Broja', 39, 'broja@gmail.com', '2ad746a4-b84d-4388-84b0-7a8bae4ac110'),
('lolol', 'Ana', 'Cucu', 17, 'cucu@gmail.com', 'ae809112-51ee-4055-949b-55f42e331a5a'),
('llool', 'Marin', 'Boghean', 21, 'boghean@gmail.com', '75e45693-b8c4-4d43-ba9c-60e7580279cb'),
('lookl', 'Igor', 'Baton', 19, 'baton@gmail.com', 'f144acd0-d7c6-48e5-bfb8-1ad288925a60'),
('lnmool', 'Nikita', 'Boss', 27, 'boss@gmail.com', '63ac497a-715d-4414-a216-5f98baa2d8ec'),
('lonhl', 'Anton', 'Siocalau', 18, 'siocalau@gmail.com', 'a1dfef34-45ad-4ed5-bd5a-aa3c8b76e1f1'),
('ltfol', 'Andrei', 'Ciubotaru', 49, 'ciubotaru@gmail.com', '4505b1a3-e9bf-487b-a804-9563c8c19b71'),
('lbjfl', 'Elena', 'Bitca', 25, 'bitca@gmail.com', '1bf1bd78-a626-4af0-a663-5cd04bcdb196'),
('lfgrol', 'Alina', 'Vraghie', 32, 'vraghie@gmail.com', 'd7dd120e-25a6-4362-9fcb-14b5906877a6');


insert into "ClientInfo" 
("country", "city", "address", "occupation")
values
('Moldova', 'Chisinau', 'sos.Hancesti', 'somer'),
('Moldova', 'Ungheni', 'str.Muncesti', 'profesor'),
('Moldova', 'Cahul', 'sos.Balcani', 'maturator'),
('Moldova', 'Chisinau', 'str.Bucuresti', 'vanzator'),
('Moldova', 'Cimislia', 'sos.Tundra', 'gamer'),
('Moldova', 'Soroca', 'str.Vinului', 'boss'),
('Moldova', 'Falesti', 'str.Florilor', 'analitic'),
('Moldova', 'Straseni', 'str.Beciului', 'inginer'),
('Moldova', 'Bulboaca', 'str.Butucului', 'contabil'),
('Moldova', 'Terebeuca', 'str.Pufului', 'lodari');



insert into "Orders"
("client_id", "order_date", amount)
values
('a740d471-15ea-4c33-85ac-7022960716c4', '2021-12-03', 5),
('a47fa2d9-9ff9-43db-a2d6-b44c78002c40', '2021-04-13', 24),
('baf44e25-e169-48be-909f-eac0cdb42b42', '2021-03-23', 36),
('eecfac39-8411-43ac-94ae-b3e5feb46885', '2021-11-13', 10),
('ceb71e65-78bf-4e1f-b703-7bcb56b6f23f', '2021-10-12', 2),
('bc132b7c-1baa-4199-a7c7-680b4153b06d', '2021-09-09', 10),
('196e5afd-34dd-4f7c-ba52-0705e796110d', '2021-12-31', 1),
('b3688a6f-8cb5-4d42-ad14-ff45c53dbae0', '2021-11-02', 9),
('450d9b9b-5e7b-4db2-9769-e909613a0623', '2021-08-10', 27),
('3932ad61-10e8-436d-bc7d-4e929cd68ac8', '2021-07-03', 51);


insert into "Items"
("item_name", "item_description")
values
('matura', 'lunga'),
('tigaie', 'tefal'),
('masa', 'din lemn'),
('husa', 'rosie'),
('seif', 'mare'),
('pix', 'albastru'),
('urna', 'verde'),
('casti', 'albe'),
('geanta', 'neagra'),
('album', 'de desen');


insert into "ItemOrders"
("order_id", "item_id")
values
('710d46a8-f8ae-4c86-a0d9-f78fa716a6c0','ab7649b0-460e-44c1-85fd-65c30f861568'),
('928d56cd-6acc-47e7-afda-6e8801c1f570','c8ac8f12-6410-4e76-b9b4-5af4864b2479'),
('3977c9da-9d30-4c84-88b9-ba3bd658a47a','b77947c9-02ca-4ca4-a120-62b66112718a'),
('0c6dff11-e4eb-4bff-bf39-32a9dbc6975b','704eeec0-bdb8-472d-8b58-a795a09e60b0'),
('9a1a6885-71c1-408a-bde9-fe934b5d0fab','6bee3537-28fa-49a0-aef5-5b722c74515e'),
('bb97894e-66bd-4374-a179-67fd8044f1d9','43564398-a5bf-4c93-b780-1c3e7478d7eb'),
('4e1a8bdf-0965-4956-aaab-b27af5bc977f','d9cf342a-159d-4db0-9c44-65277b39b705'),
('c3480dea-2ec6-4a16-9ad4-904bfcf60dd7','b66c980f-2094-41a4-9e05-909e32264200'),
('eee25144-8d94-4dd6-93be-9ece2f8aebd0','73c6c92b-1be2-4a9c-b225-43ec7b384ca7'),
('f62bbf25-4c65-4439-836c-349440b80900','fabe6217-7518-4bda-92ac-02af7a692b56');



select * 
from "Clients"
where age > 25

select * 
from "Clients"
where age between 25 and 40

select *
from "Orders"
where order_date < '2022-12-31'

select *
from "Orders"
where amount in (3, 10, 51, 9, 25, 87)


 select country, city, occupation
 from "ClientInfo" 

  select *
 from "ClientInfo" 
 where city in ('Chisinau', 'Cahul')


 select *
 from "ClientInfo" cli
 inner join "Clients" clt
 on cli.client_info_id = clt.client_info_id  


 select *
 from "Clients" c
 inner join "ClientInfo" ci
 on ci.client_info_id = c.client_info_id 
 where city = 'Chisinau' 


 select *
 from "Clients" c
 inner join "ClientInfo" ci
 on ci.client_info_id = c.client_info_id 
 where occupation in ('boss', 'vanzator', 'profesor')
 order by age


 select o.id, o.order_date, o.amount, c.username 
 from "Orders" o 
 inner join "Clients" c
 on o.client_id = c.id 
 where username in ('loool', 'looll', 'lnmool')
 order by amount

 select "Items".*, "Orders".*
from "Items" 
inner join "ItemOrders" on "Items".id = "ItemOrders".item_id
inner join "Orders" on "Orders".id = "ItemOrders".order_id;


select i.*, o.id, o.order_date, o.amount, c.id, c.username, c.firstname, c.lastname, c.age, c.email
from "Items" i
inner join "ItemOrders" on i.id = "ItemOrders".item_id
inner join "Orders" o on o.id = "ItemOrders".order_id
inner join "Clients" c on c.id = o.client_id



 create table "MyUsers"(
	id			uuid default uuid_generate_v4() constraint myusers_pk primary key,
	username	varchar(128),
	firstName 	varchar(128),
	lastName	varchar(128),
	age			int
);


create table "UsersComments"(
	id			uuid default uuid_generate_v4() constraint userscomments_pk primary key,
	comment_description		varchar(255),
	user_id		uuid references "MyUsers"(id) on delete cascade
);


create table "Posts"(
	id					uuid default uuid_generate_v4() constraint post_pk primary key,
	post_description	varchar(255),
	post_date 			date,
	user_id				uuid references "MyUsers"(id) on delete cascade
);


insert into "Posts"
("post_description", "post_date", "user_id")
values
('hfghfgh', '2022-02-12', '8713e9e0-792b-4591-8a82-4cd85d808726'),
('hfgghfghhdhdhdfhdfhh', '2021-12-18', '1579c10f-a1fc-4aa7-9230-dd9059dc69da'),
('hfghgnogffgfgh', '2021-08-03', '4a9edd50-71c7-4385-9cde-bf9aa2513237'),
('hfghsgsgegdsgagfgh', '2020-04-09', 'f7a3ce1e-49f5-47e1-81e9-161cee43660b'),
('hfghafgafgadgfgh', '2022-10-02', 'c6e34825-85bd-4438-b3bb-5a755683b79c');


insert into "UsersComments" 
("comment_description", "user_id")
values
('ioioioioioioioioioi', '8713e9e0-792b-4591-8a82-4cd85d808726'),
('trtrtrtrtrtrtrtr', '1579c10f-a1fc-4aa7-9230-dd9059dc69da'),
('wewewewewewewe', '4a9edd50-71c7-4385-9cde-bf9aa2513237'),
('sasasasasas', 'f7a3ce1e-49f5-47e1-81e9-161cee43660b'),
('dfdfdfdfdfdf', 'c6e34825-85bd-4438-b3bb-5a755683b79c');

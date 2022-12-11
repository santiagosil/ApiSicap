create table sexual_orientation(
	id int  not null,
	name varchar(100) not null,
	primary key(id),
);

INSERT INTO sexual_orientation(id,name) VALUES 
(0,'Heterosexual'),
(1,'Homosexual'),
(2,'Bisexual'),
(3,'Pansexual'),
(4,'Asexual');


create table educational_level(
	id int not null,
	name varchar(100) not null,
	primary key(id)
);

INSERT INTO educational_level(id,name) VALUES 
	(0,'Básica primaria'),
	(1,'Básica secundaria'),
	(2,'Media'),
	(3,'Técnica y/o tecnológica'),
	(4,'Pregrado (Universidad)'),
	(5,'Postgrado u otros');

create table marital_status(
	id int not null,
	name varchar(100) not null,
	primary key(id)
);

INSERT INTO marital_status(id,name) VALUES
	(0,'Soltero/a'),
	(1,'Casado/a'),
	(2,'Viudo/a'),
	(3,'Unión libre');

create table etnia(
	id int not null,
	name varchar(100) not null,
	primary key(id)
);

INSERT INTO etnia(id,name) VALUES 
	(0,'Ninguno'),
	(1,'Comunidades Negras-Afrocolombianas'),
	(2,'Pueblos Indígenas'),
	(3,'Pueblo Rrom o Gitano'),
	(4,'Raizales y Palenqueras- NARP'),
	(5,'Otro');

create table gender(
	id int not null,
	name varchar(100) not null,
	primary key(id)
);

INSERT INTO gender(id,name) VALUES
	(0,'Hombre'),
	(1,'Mujer'),
	(2,'No binario');

create table occupation(
	id int not null,
	name varchar(100) not null,
	primary key(id)
);

insert into occupation (id,name) VALUES 
	(0,'Desempleado'),
	(1,'Estudiante'),
	(2,'Empleado/a particular (Sector privado)'),
	(3,'Empleado/a del gobierno (Sector público)'),
	(4,'Empleado/a doméstico'),
	(5,'Empleador/a'),
	(6,'Trabajador/a por cuenta propia (Independiente)'),
	(7,'Trabajador/a familiar sin remuneración');
	
	

create table users(
	identification varchar(50) primary key,
	password varchar(100) not null,
	name varchar(100) not null,
	lastname varchar(100) not null,
	gender_id int not null,
	email varchar(100) not null UNIQUE,
	birthdate datetime not null,
	country_code varchar(4) not null,
	phone varchar(15) not null,
	occupation_id int, --opcional
	postal_code varchar(50) not null,
	marital_status_id int, --opcional
	geolocalitation varchar(200) not null,
	lat float not null,
	lng float not null,
	code int not null,
	verification bit not null,
	sexual_orientation_id int, --opcional
	educational_level_id int, --opcional
	etnia_id int, --opcional
	foreign key (gender_id) REFERENCES gender(id),
	foreign key (sexual_orientation_id) REFERENCES sexual_orientation(id),
	foreign key (educational_level_id) REFERENCES educational_level(id),
	foreign key (etnia_id) REFERENCES etnia(id),
	foreign key (occupation_id) REFERENCES occupation(id),
	foreign key (marital_status_id) REFERENCES marital_status(id)
);

INSERT INTO users(
	identification,
	password,
	name,
	lastname,
	gender_id,
	email,
	birthdate ,
	country_code,
	phone,
	occupation_id,
	postal_code,
	marital_status_id,
	geolocalitation,
	lat,
	lng,
	code,
	verification,
	sexual_orientation_id,
	educational_level_id,
	etnia_id
) VALUES (
	'123456789',
	'$2a$10$rhcOK7kXX.4iQ/UrZa3EHOeBIrq1ZPmyufm/rIXRJ0XOSmyikHC1i',
	'Johan',
	'Silva',
	0,
	'jsantiagosilva@ucundinamarca.edu.co',
	'08/02/1997',
	'co',
	'3005865123',
	1,
	'253051',
	0,
	'Universidad de Cundinamarca, Calle 15, Gibraltar, Facatativá, Sabana Occidente, Cundinamarca, 253051, Colombia',
	4.828775804231745,
	-74.35470751087708,
	0911,
	0,
	0,
	4,
	0);

create table violence_type(
	id int not null,
	name varchar(100) not null,
	description varchar(450) not null,
	primary key (id)
);

INSERT INTO violence_type(id,name,description) VALUES 
(0,'Ninguno','No es victima de violencia'),
(1,'Violencia de Infantil','toda forma de perjuicio, castigo, humillación o abuso físico o psicológico, descuido, omisión o trato negligente, malos tratos o explotación sexual, incluidos los actos sexuales abusivos y la violación, y en general toda forma de violencia o agresión sobre el niño, la niña o el adolescente por cualquier persona'),
(2,'Violencia intrafamiliar','Violencia ejercida en el terreno de la convivencia asimilada, por parte de uno de los miembros contra otro, contra algunos de los demás o contra todos ellos'),
(3,'Violencia Adulto Mayor','Cualquier acción u omisión que produce daño, vulnera el respeto a la dignidad y el ejercicio de los derechos de una persona adulta mayor'),
(4,'Violencia de Género','Dirigida a las mujeres por el mero hecho de serlo, es decir, por considerar que el sexo femenino es inferior');

create table organization_type(
	id int,
	name varchar(100) not null,
	description varchar(200) not null,
	primary key (id)
);

insert into organization_type(id,name,description) VALUES
(1,'Policia','Gobierno del Ente Policial');

create table organization(
	nit varchar(50) primary key,
	password varchar(100) not null,
	name varchar(100) not null,
	tel varchar(15) not null,
	phone varchar(15) not null,
	organization_type_id int not null,
	foreign key (organization_type_id) references organization_type(id)
);

INSERT INTO organization(nit,password,name,tel,phone,organization_type_id) VALUES
	('80369852147','thePolice','Policia Nacional', '8524568','3002586932',1);

create table site(
	id varchar(50), 
	nit varchar(50),
	password varchar(50) not null,
	geolocalitation varchar(200) not null,
	lat float not null,
	lng float not null,
	range int not null,
	country_code varchar(4) not null,
	phone varchar(15) not null,
	tel varchar(15) not null,
	primary key (id, nit),
	Foreign Key(nit) References organization(nit)
);

INSERT INTO site(
	id,
	nit,
	password,
	geolocalitation,
	lat,
	lng,
	range,
	country_code,
	phone,
	tel
) VALUES (
	'Sede Facatativá',
	'80369852147',
	'$2a$10$93vplGv2hhn6yQg6XSRwwuO/n.T9XiWZYXvKR4.IZ.iFT.qRThGf.',
	'Estación de Policía de Facatativá, Carrera 5, La Campiña, Facatativá, Sabana Occidente, Cundinamarca, 253051, Colombia',
	4.8097500694777,
	-74.35015683319658,
	200,
	'co',
	'3215468521',
	'8425236'
);

create table violence_types_organization(
	organization_type_id int not null,
	id_violence int not null,
	primary key(organization_type_id, id_violence),
	foreign key (organization_type_id) references organization_type(id),
	foreign key (id_violence) references violence_type(id)
);

INSERT INTO violence_types_organization(organization_type_id,id_violence) VALUES 
(1,1),
(1,2),
(1,3),
(1,4);

create table state(
	id int,
	name varchar(100) not null,
	description varchar(200) not null,
	primary key (id)
);

insert into state(id,name,description) VALUES 

(0,'Activo','Esta alerta esta activa'),
(1,'En Progreso','Esta alerta esta en progreso'),
(2,'Atendido','Esta alerta esta atendida');

create table notify(
	id int identity(1,1) primary key,
	user_id varchar(50) not null,
	date datetime not null,
	title varchar(150) not null,
	state_id int not null,
	description varchar(500) not null,
	violence_type_id int not null,
	Foreign Key(user_id) References users(identification),
	Foreign Key(state_id) References state(id),
	Foreign Key(violence_type_id) References violence_type(id),
);

create table poll(
	id int identity(1,1) primary key,
	user_id varchar(50) NOT NULL,
	date datetime not null,
	--genero int not null, /*0=Hombre, 1=Mujer, 2=No Binario*/
	--orientacion_sexual int not null, /*0=Hetero, 1=Homosexual, 2=Bisexual, 3=Pansexual, 4=Asexual*/
	--edad int not null,
	--municipio int not null, /*0=Bogota, 1=Facatativa, 2=Madrid, 3=Mosquera, 4=Funza, 5=Otro*/
	--postal_code int not null, /*codigo Postal*/
	--nivel_educativo int not null, /*0=Basica primaria, 1=Basica Secundaria, 2=Media, 3=(Tecnica, Tecnologica), 4=Pregrado, 5=Postgrado */
	--estado_civil int not null, /*0=Soltero, 1=Casado, 2=Viudo,3=Union Libre*/
	--etnia int not null, /*0=Ninguno,1=Comunidades Negras-Afrocolombianas, 2=Pueblos Indígenas,3=Pueblo Rrom o Gitano,4=Raizales y Palenqueras- NARP, 5=Otro*/
	income int not null, /*0=No, 1=Si*/ --ingresos
	--ocupacion int not null, /*0=Desempleado, 1=Estudiante, 2=Empleado/a particular (Sector privado), 3=Empleado/a del Gobierno (Sector público)
							  --4=Empleado/a doméstico/a,5=Empleador/a, 6=Trabajador/a por cuenta propia (Independiente), 7=Trabajador/a familiar sin remuneración*/
	q1 int not null, /* ¿Ha observado a esa persona golpear o patear la pared o algún otro mueble? 0=No, 1=Si*/
	q2 int not null, /*¿Le han amenazado con golpearle? */
	q3 int not null, /*¿Se ha sentido presionado a tener relaciones sexuales? */
	q4 int not null, /*¿Le han destruido algunas de sus pertenencias? */
	q5 int not null, /*¿Le han sacudido, zarandeado, jaloneado o empujado? */
	q6 int not null, /*¿Se ha sentido agredido física o psicológicamente? */
	q7 int not null, /*¿Ha sufrido o sido testigo de algún tipo de violencia? ¿Cuál? 0=Ninguna, 1=Violencia Infantil, 2=Violencia intrafamiliar,
						3=Violencia Adulto Mayor, 4=Violencia de Género*/
	FOREIGN KEY (user_id) REFERENCES users(identification)
);
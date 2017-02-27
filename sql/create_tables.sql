CREATE TABLE users (      /* table with username and password */
	user_pk		serial primary key,
	username        varchar(16),
	password        varchar(16),  /* Plaintext password  */
	role_fk		integer REFERENCES roles(role_pk) not null /* role foreign key */
);

CREATE TABLE roles (
	role_pk		serial primary key, 	/* primary key for a role instance*/
	rolename	varchar(16)		/* short textual name for the role*/
);

CREATE TABLE assets (				/*table with assets */
	asset_pk	serial primary key,	
	asset_tag	varchar(16),		/* 16 characters in length */
	description	text			/* arbitrary length */
);

CREATE TABLE facilities (
	facility_pk 	serial primary key,
	fcode 		varchar(6),		/* facility code */
	common_name	varchar(32)		/* 32 characters in length */
);

CREATE TABLE asset_at (
	asset_fk        integer REFERENCES assets (asset_pk) not null, /* asset at a facility  */
	facility_fk     integer REFERENCES facilities (facility_pk) not null, /* facility the asset is at*/
	arrive_dt       timestamp, -- when the asset arrived
	depart_dt       timestamp -- when the asset left
);

BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "migrations" (
	"id"	integer NOT NULL,
	"migration"	varchar NOT NULL,
	"batch"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "users" (
	"id"	integer NOT NULL,
	"name"	varchar NOT NULL,
	"email"	varchar NOT NULL,
	"email_verified_at"	datetime,
	"password"	varchar NOT NULL,
	"remember_token"	varchar,
	"created_at"	datetime,
	"updated_at"	datetime,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "password_resets" (
	"email"	varchar NOT NULL,
	"token"	varchar NOT NULL,
	"created_at"	datetime
);
CREATE TABLE IF NOT EXISTS "failed_jobs" (
	"id"	integer NOT NULL,
	"uuid"	varchar NOT NULL,
	"connection"	text NOT NULL,
	"queue"	text NOT NULL,
	"payload"	text NOT NULL,
	"exception"	text NOT NULL,
	"failed_at"	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "personal_access_tokens" (
	"id"	integer NOT NULL,
	"tokenable_type"	varchar NOT NULL,
	"tokenable_id"	integer NOT NULL,
	"name"	varchar NOT NULL,
	"token"	varchar NOT NULL,
	"abilities"	text,
	"last_used_at"	datetime,
	"created_at"	datetime,
	"updated_at"	datetime,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "surats" (
	"id"	integer NOT NULL,
	"kategori"	varchar NOT NULL,
	"judul"	varchar NOT NULL,
	"nomor_surat"	varchar NOT NULL,
	"file"	varchar NOT NULL,
	"created_at"	datetime,
	"updated_at"	datetime,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "migrations" VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO "migrations" VALUES (2,'2014_10_12_100000_create_password_resets_table',1);
INSERT INTO "migrations" VALUES (3,'2019_08_19_000000_create_failed_jobs_table',1);
INSERT INTO "migrations" VALUES (4,'2019_12_14_000001_create_personal_access_tokens_table',1);
INSERT INTO "migrations" VALUES (5,'2021_10_25_001420_create_surats_table',1);
INSERT INTO "surats" VALUES (5,'Pengumuman','Wisuda D3','10092022','1665238145.pdf','2022-10-08 14:09:05','2022-10-08 14:09:05');
CREATE UNIQUE INDEX IF NOT EXISTS "users_email_unique" ON "users" (
	"email"
);
CREATE INDEX IF NOT EXISTS "password_resets_email_index" ON "password_resets" (
	"email"
);
CREATE UNIQUE INDEX IF NOT EXISTS "failed_jobs_uuid_unique" ON "failed_jobs" (
	"uuid"
);
CREATE INDEX IF NOT EXISTS "personal_access_tokens_tokenable_type_tokenable_id_index" ON "personal_access_tokens" (
	"tokenable_type",
	"tokenable_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "personal_access_tokens_token_unique" ON "personal_access_tokens" (
	"token"
);
COMMIT;

-- Represent Shinobis in the Narutoverse
CREATE TABLE "shinobi" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "dob" NUMERIC,
    "address" TEXT,
    "rank" TEXT,
    "clan_id" INTEGER,
    "father_id" INTEGER,
    "mother_id" INTEGER,
    "village_id" INTEGER,
    "group_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("father_id") REFERENCES "shinobi"("id"),
    FOREIGN KEY("mother_id") REFERENCES "shinobi"("id"),
    FOREIGN KEY("clan_id") REFERENCES "clans"("id"),
    FOREIGN KEY("group_id") REFERENCES "groups"("id"),
    FOREIGN KEY("village_id") REFERENCES "villages"("id")
);


-- Represent Villages in the Naturoverse
CREATE TABLE "villages" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "location" TEXT,
    "households" INTEGER,
    "population" INTEGER,
    "area" NUMERIC,
    "kage_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("kage_id") REFERENCES "shinobi"("id")
);


-- Represent Clans in the Narutoverse
CREATE TABLE "clans" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "leader_id" INTEGER NOT NULL,
    "kekkei_genkai_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("leader_id") REFERENCES "shinobi"("id"),
    FOREIGN KEY("kekkei_genkai_id") REFERENCES "kekkei_genkai"("id")
);


-- Represent Kekkei Genkai that a few Shinobi and Clans have in the Narutoverse
CREATE TABLE "kekkei_genkai" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "ability" TEXT,
    PRIMARY KEY("id")
);


-- Represent Groups which Shinobi have joined in the Narutoverse
CREATE TABLE "groups" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "village_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("village_id") REFERENCES "villages"("id")
);


-- Represent Jutsus user by Shinobi and Clans in the Narutoverse
CREATE TABLE "jutsus" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "nature" TEXT,
    "type" TEXT,
    "class" TEXT,
    "range" NUMERIC,
    "ability" TEXT,
    PRIMARY KEY("id")
);


-- Represent which Shinobi can use which Jutsus
CREATE TABLE "shinobi_jutsus" (
    "id" INTEGER,
    "shinobi_id" INTEGER,
    "jutsu_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("shinobi_id") REFERENCES "shinobi"("id"),
    FOREIGN KEY("jutsu_id") REFERENCES "jutsu"("id")
);



-- Represent the signature Jutsus of certain Clans
CREATE TABLE "clan_jutsus" (
    "id" INTEGER,
    "clan_id" INTEGER,
    "jutsu_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("clan_id") REFERENCES "clans"("id"),
    FOREIGN KEY("jutsu_id") REFERENCES "jutsus"("id")
);



-- Create indexes to speed common searches
CREATE INDEX "shinobi_village_search" ON "shinobi" ("village_id");
CREATE INDEX "shinobi_name_search" ON "shinobi" ("first_name", "last_name");
CREATE INDEX "village_name_search" ON "villages" ("name");
CREATE INDEX "group_name_search" ON "groups" ("name");
CREATE INDEX "clan_name_search" ON "clans" ("name");
CREATE INDEX "clan_jutsu_search" ON "clan_jutsus"("clan_id");
CREATE INDEX "shinobi_jutsu_search" ON "shinobi_jutsus"("shinobi_id");
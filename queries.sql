-- Find all Shinobi beloging to a village
SELECT *
FROM "shinobi"
WHERE "village_id" = (
    SELECT "id"
    FROM "villages"
    WHERE "name" = 'Hidden Leaf Village'
);

-- Find all Jutsus used by a particular Shinobi
SELECT *
FROM "jutsus"
WHERE "id" IN (
    SELECT "jutsu_id"
    FROM "shinobi_jutsus"
    WHERE "shinobi_id" = (
        SELECT "id"
        FROM "shinobi"
        WHERE "first_name" = 'Naruto'
        AND "last_name" = 'Uzumaki'
    )
);

-- Find all signature Jutsus of a Clan
SELECT *
FROM "jutsus"
WHERE "id" IN (
    SELECT "jutsu_id"
    FROM "clan_jutsus"
    WHERE "clan_id" = (
        SELECT "id"
        FROM "clans"
        WHERE "name" = 'Uchiha'
    )
);

-- Find all Shinobi that belong to a particular group
SELECT *
FROM "shinobi"
WHERE "groupe_id" = (
    SELECT "id"
    FROM "groups"
    WHERE "name" = 'Akatsuki'
);

-- Find all clans with a Kekkei Genkai
SELECT *
FROM "shinobi"
WHERE "clan_id" IN (
    SELECT "id"
    FROM "clans"
    WHERE "kekkei_genkai_id" IS NOT NULL;
);

-- Find the Greatest Shinobi of All Time (or any other Shinobi by name)
SELECT *
FROM "shinobi"
WHERE "first_name" = 'Itachi'
AND "last_name" = 'Uchiha';

-- Add a new Shinobi
INSERT INTO "shinobi" ("first_name", "last_name")
VALUES ('Sasuke', 'Uchiha');

-- Add a new Jutsu
INSERT INTO "jutsus" ("name", "nature", "type", "class", "range", "ability")
VALUES ('Amaterasu', 'Fire release', 'Ninjutsu', 'Offensive', '5', 'Produces black flames that dont extinguish till they burn their target');

-- Add a new Village
INSERT INTO "villages" ("name")
VALUES ('Hidden Sound Village');
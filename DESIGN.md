# Design Document

By Muhammad Aleem Ansari

Video overview: https://youtu.be/G2l26SZyhTQ

## Scope

The database for Narutoverse includes entities that would be needed when building a database to feature the elements in the universe of the popular anime series "Naruto". This invlolves tracking "Shinobi" (or ninjas) along with their abilities and affiliations. As such, included in the scope of the database is:

* Shinobi, including basic identifying information
* Villages, including basic identifying information
* Groups, including basic identifying information
* Clans, including basic identifying information
* Jutsus, include the abilities of individual shinobi and clans as a whole
* Kekkei Genkai, or specialized abilities of shinobi or their clans

Out of scope elements include weapons, tailed beasts and fighting prowess of shinobi.

## Functional Requirements

This database supports:

* CRUD operation for Shinobi, Villages, Clans, Groups, Jutsus, and Kekkei Genkai
* Tracking Shinobi and their associations with various Villages, Clans, and Groups.
* Tracking the signature Jutsus of individual clans.
* Tracking all jutsus and abilities of every single Shinobi in the Narutoverse.
* Adding multiple Jutsus to Clans and Shinobi alike.

Beyond the scope of this database is the:
* Ability to incorporate weapons to Shinobi
* Ability to form relationships amongst Shinobi (except parental relationships)

## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

The database includes the following entities:

#### Shinobi

The `shinobi` table includes:

* `id`, which specifies the unique ID assigned to every shinobi as an `INTEGER`. This column also has the `PRIMARY KEY` constraint applied.
* `first_name`, which specifies the shinobi's first name as `TEXT`, given that `TEXT` is the appropriate constraint for this field. Moreover, this field also has the `NOT NULL` constraint to ensure that the database always has a name for its shinobi.
* `last_name`, which specifies the shinobi's last name as `TEXT` with the same justification as above.
* `dob`, which specifies the date of birth of the shinobi. This field is `NUMERIC` as dates can be conveniently stored in SQLite as `NUMERIC`. This field can be left `NULL` as shinobi tend to be secretive and might want to protect such an information.
* `address`, which specifies the residential address of the shinobi as `TEXT`, given that an address can be easily stored as a string of words. This field can be left `NULL` as shinobi tend to be secretive and might want to protect such an information.
* `rank`, which specifies the rank (generally Genin, Chunin and Jonin) of a shinobi. This attribute is represented as `TEXT` and can be left `NULL` as not all shinobi have a rank associated with them.
* `clan_id`, which specifies the id of the clan of the shinobi in question. Clan details are stored in a seperate table, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `clans` table to ensure data integrity. This column can also be left `NULL` as some shinobi might not belong to a clan.
* `father_id`, which specifies the id of the father of the shinobi in question. Parent details are stored in the same table as another row, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `shinobi` table to ensure data integrity. This column can also be left `NULL` as some shinobi might not know their parents.
* `mother_id`, which specifies the id of the mother of the shinobi in question. Parent details are stored in the same table as another row, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `shinobi` table to ensure data integrity. This column can also be left `NULL` as some shinobi might not know their parents.
* `village_id`, which specifies the id of the village of the shinobi in question. Village details are stored in a seperate table, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `villages` table to ensure data integrity. This column can also be left `NULL` as some shinobi might not belong to a village.
* `group_id`, which specifies the id of the group of the shinobi in question. Group details are stored in a seperate table, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `Groups` table to ensure data integrity. This column can also be left `NULL` as some shinobi might not belong to a clan.

#### Villages

The `villages` table includes:

* `id`, which specifies the unique ID assigned to every village as an `INTEGER`. This column also has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the village's name as `TEXT`, given that `TEXT` is the appropriate constraint for this field. Moreover, this field also has the `NOT NULL` constraint to ensure that the database always has a name for its villages.
* `location`, which specifies the locaiton of the village as `TEXT`, given that a location can be easily explained in words.
* `households`, which specifies the number of households in the given village as an `INTEGER`, given that the number of households is going to be a whole number.
* `population`, which specifies the population of a village as an `INTEGER`, given that
the number of people residing in a village can easily be expressed as a whole number.
* `area`, which specifies the area of a village in square kilometers (or any other unit of your choice) as a `NUMERIC` attribute. This attribute has specially been chosen to have the `NUMERIC` constraint as the area of a village would likely be a decimal value.
* `kage_id`, which specifies the unique `id` of the shinobi that is the leader of the village. The details of shinobi are stored in the `shinobi` table, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `villages` table to ensure data integrity. This column cannot be left `NULL` as some every village must have a leader (kage) in the shinobi world.

#### Clans

The `clans` table includes:

* `id`, which specifies the unique ID assigned to every clan as an `INTEGER`. This column also has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the clan's name as `TEXT`, given that `TEXT` is the appropriate constraint for this field. Moreover, this field also has the `NOT NULL` constraint to ensure that the database always has a name for its clans.
* `leader_id`, which specifies the unique `id` of the shinobi that is the leader of the clan. The details of shinobi are stored in the `shinobi` table, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `villages` table to ensure data integrity. This column cannot be left `NULL` as some every village must have a leader (kage) in the shinobi world.
* `kekkei_genkai_id`, which specifies the unique `id` of the kekkei genkai of the shinobi clan. The details of the kekkei genkai are stored in the `kekkei_genkai` table, as such this attribute has the `FOREIGN KEY` constraint applied to it. Moreover, it can be left `NULL` as not all clans have a kekkei genkai.

#### Kekkei Genkai

The `kekkei_genkai` table includes:

* `id`, which specifies the unique ID assigned to every Kekkei Genkai as an `INTEGER`. This column also has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the kekkei genkai's name as `TEXT`, given that `TEXT` is the appropriate constraint for this field. Moreover, this field also has the `NOT NULL` constraint to ensure that the database always has a name for its clans.
* `ability`, which specifies the description of the ability of the kekkei genkai in question. Since the ability has to be explained in words, it has the `TEXT` constraint applied to it.

#### Groups

The `groups` table includes:

* `id`, which specifies the unique ID assigned to every group as an `INTEGER`. This column also has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the group's name as `TEXT`, given that `TEXT` is the appropriate constraint for this field. Moreover, this field also has the `NOT NULL` constraint to ensure that the database always has a name for its clans.
* `village_id`, which specifies the id of the village of the group in question. Village details are stored in a seperate table, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `villages` table to ensure data integrity. This column can also be left `NULL` as some groups might not belong to a village.


#### Jutsus

The `jutsus` table includes:

* `id`, which specifies the unique ID assigned to every Jutsu as an `INTEGER`. This column also has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the group's name as `TEXT`, given that `TEXT` is the appropriate constraint for this field. Moreover, this field also has the `NOT NULL` constraint to ensure that the database always has a name for its clans.
* `nature`, which specifies the nature of the Jutsu in question. Since the nature is a word, it has the `TEXT` constraint applied to it.
* `type`, which specifies the type of the Jutsu in question. Since the type is a word, it has the `TEXT` constraint applied to it.
* `class`, which specifies the class of the Jutsu in question. Since the class is a word, it has the `TEXT` constraint applied to it.
* `range`, which specifies the range of the Jutsu in meters. Since the range can be a decimal number, it has the `NUMERIC` constraint applied to it.
* `ability`, which specifies the ability of the Jutsu in question. Since the ability is explained in words, it has the `TEXT` constraint applied to it.

 #### Shinobi Jutsus Relations

The `shinobi_jutsus` table includes:

* `id`, which specifies the unique ID assigned to every Shinobi-Jutsu relation as an `INTEGER`. This column also has the `PRIMARY KEY` constraint applied.
* `shinobi_id`, which specifies the id of the shinobi in question. Shinobi details are stored in a seperate table, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `shinobi` table to ensure data integrity.
* `jutsu_id`, which specifies the id of the jutsu in question. Jutsu details are stored in a seperate table, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `jutsus` table to ensure data integrity.

All columns are required and hence have the `NOT NULL` constraint applied where a `PRIMARY KEY` or `FOREIGN KEY` constraint is not.

#### Clan Jutsus Relations:

The `clan_jutsus` table includes:

* `id`, which specifies the unique ID assigned to every Clan-Jutsu relation as an `INTEGER`. This column also has the `PRIMARY KEY` constraint applied.
* `clan_id`, which specifies the id of the clan in question. Clan details are stored in a seperate table, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `clans` table to ensure data integrity.
* `jutsu_id`, which specifies the id of the jutsu in question. Jutsu details are stored in a seperate table, as such, this attribute has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `jutsus` table to ensure data integrity.

All columns are required and hence have the `NOT NULL` constraint applied where a `PRIMARY KEY` or `FOREIGN KEY` constraint is not.

### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

![ER Diagram](diagram.png)

As detailed by the diagram:

* Many shinobi can belong to a single village, as such, this is a one to many relation.
* Many shinobi can also belong to a single group. In the shinobi world, all shinobi belong to one group or the other.
* Groups work for village. As such, a village can have multiple groups working for it, but a group will only serve one village at a time.
* Shinobi also belong to different clans. Thus, a single clan can have multiple shinobi, but each shinobi can only belong to one clan.
* A clan may or may not have a kekkei genkai (special ability) associated with it. Thus, a clan can have zero or one kekkei genkai.
* A clan can also use many different jutsus. These jutsus are may not be unique to that particular clan, as such, clans and jutsus have a many to many relationship.
* Shinobi also have the ability to use jutsus. Many different shinobi can use many different jutsus that may not be unique to them. As such, once again, shinobi and jutsus have a many to many relationship.

## Optimizations

According to the typical queries in `queries.sql`, it is common for users to find shinobi by their names or villages. For that reason, indexes are made on `first_name`, `last_name`, `village_id` columns to speed up such queries.

Many typical searches involve sub queries that identify `villages`, `groups` or `clans` by their `name` rather than `ids`. As such, these entities have been indexed by `name` as well to speed up relevant searches.

Finally, some typical searches may involve searching the jutsu of a particular shinobi or a clan. Therefore, the `clan_jutsus` table has been indexed by `clan_id` and the `shinobi_jutsus` table has been indexed by `shinobi_id` for a speedy result.

## Limitations

The current schema ignores a lot of minor elements and themes that are present in the Narutoverse, such as Lands and Kekkei Tota, etc.
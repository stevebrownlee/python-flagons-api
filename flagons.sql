DELETE FROM Teams;
DELETE FROM Players;
DELETE FROM TeamScore;

DROP TABLE IF EXISTS TeamScore;
DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Teams;

CREATE TABLE `Teams` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT NOT NULL
);

CREATE TABLE `Players` (
    `id`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `firstName`    TEXT NOT NULL,
    `lastName`    TEXT NOT NULL,
    `teamId` INTEGER NOT NULL,
    FOREIGN KEY(`teamId`) REFERENCES `Teams`(`id`)
);


CREATE TABLE `TeamScore` (
	`id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `teamId` INTEGER NOT NULL,
	`score`  TEXT NOT NULL,
	`timeStamp` TEXT NOT NULL,
    FOREIGN KEY(`teamId`) REFERENCES `Teams`(`id`)
);


INSERT INTO `Teams` VALUES (null, 'Golden Gryphons');
INSERT INTO `Teams` VALUES (null, 'Shrill Harpies');
INSERT INTO `Teams` VALUES (null, 'Green Wyverns');


INSERT INTO `Players` VALUES (null, "Madi", "Peper", 1);
INSERT INTO `Players` VALUES (null, "Leah", "Gwin", 1);
INSERT INTO `Players` VALUES (null, "Kimmy", "Bird", 1);
INSERT INTO `Players` VALUES (null, "Meg", "Ducharme", 2);
INSERT INTO `Players` VALUES (null, "Emily", "Lemmon", 2);
INSERT INTO `Players` VALUES (null, "Mo", "Silvera", 2);
INSERT INTO `Players` VALUES (null, "Bryan", "Nilsen", 3);
INSERT INTO `Players` VALUES (null, "Jenna", "Solis", 3);
INSERT INTO `Players` VALUES (null, "Ryan", "Tanay", 3);

INSERT INTO `TeamScore` VALUES (null, 1, 3, 1583873462376);
INSERT INTO `TeamScore` VALUES (null, 1, 2, 1583873462376);
INSERT INTO `TeamScore` VALUES (null, 1, 4, 1583873462376);
INSERT INTO `TeamScore` VALUES (null, 2, 1, 1583873462376);
INSERT INTO `TeamScore` VALUES (null, 2, 6, 1583873462376);
INSERT INTO `TeamScore` VALUES (null, 2, 3, 1583873462376);

SELECT
    t.id,
    t.name,
    ts.score
FROM Teams t
LEFT OUTER JOIN TeamScore ts ON ts.teamId = t.id
;

SELECT
    t.id,
    t.name,
    p.firstName,
    p.lastName
FROM Teams t
JOIN Players p ON p.teamId = t.id
;



-- INSERT INTO `Customer` VALUES (null, "Mo Silvera", "201 Created St", "mo@silvera.com", "password");
-- INSERT INTO `Customer` VALUES (null, "Bryan Nilsen", "500 Internal Error Blvd", "bryan@nilsen.com", "password");
-- INSERT INTO `Customer` VALUES (null, "Jenna Solis", "301 Redirect Ave", "jenna@solis.com", "password");
-- INSERT INTO `Customer` VALUES (null, "Emily Lemmon", "454 Mulberry Way", "emily@lemmon.com", "password");



-- INSERT INTO `Animal` VALUES (null, "Snickers", "Dalmation", "Recreation", 4, 1);
-- INSERT INTO `Animal` VALUES (null, "Jax", "Beagle", "Treatment", 1, 1);
-- INSERT INTO `Animal` VALUES (null, "Falafel", "Siamese", "Treatment", 4, 2);
-- INSERT INTO `Animal` VALUES (null, "Doodles", "Poodle", "Kennel", 3, 1);
-- INSERT INTO `Animal` VALUES (null, "Daps", "Boxer", "Kennel", 2, 2);


-- select * from Animal;

-- select
--     a.name,
--     a.breed,
--     a.status,
--     c.name customer_name,
--     l.name location_name
-- from Animal a
-- join Customer c on a.customer_id = c.id
-- join Location l on a.location_id = l.id
-- where a.id = 12
-- ;


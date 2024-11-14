CREATE TABLE `Omanik`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nimi` VARCHAR(255) NOT NULL,
    `Aadress` VARCHAR(255) NOT NULL,
    `Telefon` VARCHAR(255) NOT NULL
);
CREATE TABLE `Töötajad`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nimi` VARCHAR(255) NOT NULL,
    `Telefoni number` VARCHAR(255) NOT NULL,
    `Ajakava` DATE NOT NULL,
    `Palk` VARCHAR(255) NOT NULL
);
CREATE TABLE `Hobune`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Birthdate` DATE NOT NULL,
    `OwnerID` BIGINT UNSIGNED NOT NULL,
    `TallID` BIGINT UNSIGNED NOT NULL,
    `TervislikSeisundiID` BIGINT UNSIGNED NOT NULL,
    `TreeningID` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Treeninggraafik`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Päev` DATE NOT NULL,
    `Kava` VARCHAR(255) NOT NULL
);
CREATE TABLE `Varustus`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Hobuse varustus` VARCHAR(255) NOT NULL
);
CREATE TABLE `Tervislik seisund`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Arsti ajalugu` DATE NOT NULL,
    `Vaktsineerimised` DATE NOT NULL,
    `Ravikuurid` VARCHAR(255) NOT NULL
);
CREATE TABLE `Tall`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Tall` VARCHAR(255) NOT NULL,
    `Talliboksi number` VARCHAR(255) NOT NULL,
    `TöötajaID` BIGINT UNSIGNED NOT NULL,
    `VarustuseID` BIGINT UNSIGNED NOT NULL
);
ALTER TABLE
    `Hobune` ADD CONSTRAINT `hobune_ownerid_foreign` FOREIGN KEY(`OwnerID`) REFERENCES `Omanik`(`id`);
ALTER TABLE
    `Hobune` ADD CONSTRAINT `hobune_treeningid_foreign` FOREIGN KEY(`TreeningID`) REFERENCES `Treeninggraafik`(`id`);
ALTER TABLE
    `Hobune` ADD CONSTRAINT `hobune_tervislikseisundiid_foreign` FOREIGN KEY(`TervislikSeisundiID`) REFERENCES `Tervislik seisund`(`id`);
ALTER TABLE
    `Hobune` ADD CONSTRAINT `hobune_tallid_foreign` FOREIGN KEY(`TallID`) REFERENCES `Tall`(`id`);
ALTER TABLE
    `Tall` ADD CONSTRAINT `tall_varustuseid_foreign` FOREIGN KEY(`VarustuseID`) REFERENCES `Varustus`(`id`);
ALTER TABLE
    `Tall` ADD CONSTRAINT `tall_töötajaid_foreign` FOREIGN KEY(`TöötajaID`) REFERENCES `Töötajad`(`id`);
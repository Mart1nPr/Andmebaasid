CREATE TABLE `Õpetajad`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `birthdate` DATE NOT NULL,
    `KooliID` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Õpilased`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(255) NOT NULL,
    `lastename` VARCHAR(255) NOT NULL,
    `birthdate` DATE NOT NULL,
    `rühm` VARCHAR(255) NOT NULL,
    `kooliID` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Kool`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Kool` VARCHAR(255) NOT NULL,
    `Ajalugu` VARCHAR(255) NOT NULL,
    `Events` VARCHAR(255) NOT NULL,
    `Asukoht` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Õpilased` ADD CONSTRAINT `Õpilased_kooliid_foreign` FOREIGN KEY(`kooliID`) REFERENCES `Kool`(`id`);
ALTER TABLE
    `Õpetajad` ADD CONSTRAINT `Õpetajad_kooliid_foreign` FOREIGN KEY(`KooliID`) REFERENCES `Kool`(`id`);
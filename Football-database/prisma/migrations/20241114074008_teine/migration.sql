-- AlterTable
ALTER TABLE `player` ADD COLUMN `clubId` INTEGER NULL;

-- CreateTable
CREATE TABLE `coach` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `game` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `time` DATETIME(3) NOT NULL,
    `score` VARCHAR(191) NOT NULL,
    `homeClub` INTEGER NOT NULL,
    `foreignClub` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_clubTocoach` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_clubTocoach_AB_unique`(`A`, `B`),
    INDEX `_clubTocoach_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `player` ADD CONSTRAINT `player_clubId_fkey` FOREIGN KEY (`clubId`) REFERENCES `club`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `game` ADD CONSTRAINT `game_homeClub_fkey` FOREIGN KEY (`homeClub`) REFERENCES `club`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `game` ADD CONSTRAINT `game_foreignClub_fkey` FOREIGN KEY (`foreignClub`) REFERENCES `club`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_clubTocoach` ADD CONSTRAINT `_clubTocoach_A_fkey` FOREIGN KEY (`A`) REFERENCES `club`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_clubTocoach` ADD CONSTRAINT `_clubTocoach_B_fkey` FOREIGN KEY (`B`) REFERENCES `coach`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

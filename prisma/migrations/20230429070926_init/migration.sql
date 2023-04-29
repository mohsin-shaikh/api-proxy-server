-- CreateTable
CREATE TABLE `Project` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ApiRoute` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `apiUrl` VARCHAR(191) NOT NULL,
    `method` ENUM('GET', 'POST', 'PUT', 'DELETE') NOT NULL,
    `queryParams` JSON NOT NULL,
    `headers` JSON NOT NULL,
    `projectId` VARCHAR(191) NOT NULL,
    `forwardRequestData` BOOLEAN NOT NULL DEFAULT true,
    `restriction` JSON NOT NULL,
    `rateLimiting` JSON NOT NULL,
    `caching` JSON NOT NULL,
    `successes` INTEGER NOT NULL DEFAULT 0,
    `fails` INTEGER NOT NULL DEFAULT 0,
    `avgResponseMs` INTEGER NOT NULL DEFAULT 0,
    `partialQuery` JSON NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Secret` (
    `secret` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `projectId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Secret_projectId_name_key`(`projectId`, `name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ApiRoute` ADD CONSTRAINT `ApiRoute_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Secret` ADD CONSTRAINT `Secret_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

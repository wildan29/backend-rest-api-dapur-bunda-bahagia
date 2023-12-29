-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_lengkap` VARCHAR(70) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `token` VARCHAR(100) NOT NULL,
    `role` VARCHAR(5) NOT NULL DEFAULT 'user',
    `email` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE InnoDB;
